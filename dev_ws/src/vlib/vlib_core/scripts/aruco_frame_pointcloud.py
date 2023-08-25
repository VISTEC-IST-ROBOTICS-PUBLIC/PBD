#!/usr/bin/env -S HOME=${HOME} ${HOME}/.virtualenvs/cv/bin/python
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2
from geometry_msgs.msg import PoseStamped
from tf2_msgs.msg import TFMessage
import tf2_ros
import open3d as o3d
import numpy as np
from scipy.spatial.transform import Rotation

class GridBoardPointCloud(Node):
    def __init__(self):
        super().__init__('gridboard_pointcloud')
        self.declare_parameters(
            namespace='',
            parameters=[('pointcloud_topic', '/camera/depth/color/points'),
                        ('gridboard_pose_topic', '/camera/color/gridboard_pose'),
                        ('gridboard_pointcloud_topic', '/camera/depth/color/filtered_points'),
                        ('scan_radius', 0.09),              # (m.)
                        ('scan_height', 0.2),               # (m.) Z-axis point toward GridBoard
                        ('scan_ground_suppress', 0.005),    # (m.) Remove point clouds closed to GridBoard (might be GridBoard itself)
                        ]
        )
        # Node Parameters
        self.min_bound = [-self.get_parameter('scan_radius').value,
                          -self.get_parameter('scan_radius').value,
                          self.get_parameter('scan_ground_suppress').value]
        self.max_bound = [self.get_parameter('scan_radius').value,
                          self.get_parameter('scan_radius').value,
                          self.get_parameter('scan_height').value]
        # Read TF tree
        self.tf_buffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer, self)
        # Subscriber
        pointcloud_topic_name = self.get_parameter('pointcloud_topic').value
        self.pointcloud_sub = self.create_subscription(PointCloud2, pointcloud_topic_name, self.pointcloud_sub_callback, 10)
        gridboard_pose_topic_name = self.get_parameter('gridboard_pose_topic').value
        self.gridboard_pose_sub = self.create_subscription(PoseStamped, gridboard_pose_topic_name, self.gridboard_pose_sub_callback, 10)
        # Publisher
        gridboard_pointcloud_topic_name =self.get_parameter('gridboard_pointcloud_topic').value
        self.filtered_pointcloud_pub = self.create_publisher(PointCloud2, gridboard_pointcloud_topic_name, 10)
        # States & Buffers
        self.pointcloud_buffer, self.pointcloud_timestamp = None, None
        self.H_gridboard2depth, self.gridboard_pose_timestamp = None, None
        self.filtered_pointcloud_buffer = []

        ## This is for visualization of the received point cloud.
        # self.vis = o3d.visualization.Visualizer()
        # self.vis.create_window()
        # self.o3d_pcd = o3d.geometry.PointCloud()
    def get_tf_color2depth(self):
        transform = self.tf_buffer.lookup_transform(
            "RS_D435_color_optical_frame",
            "RS_D435_depth_optical_frame",
            rclpy.time.Time(),
            timeout=rclpy.duration.Duration(seconds=1)
        )
        transform = transform.transform # transform = [position=(x, y, z), rotation=(x, y, z, w)]
        H_color2depth = np.eye(4, dtype=np.float32)
        rotM = Rotation.from_quat([transform.rotation.x,
                                   transform.rotation.y,
                                   transform.rotation.z,
                                   transform.rotation.w]).as_matrix()
        H_color2depth[:3, :3] = rotM
        H_color2depth[:3, 3] = [transform.translation.x, transform.translation.y, transform.translation.z]
        return H_color2depth

    def pointcloud_sub_callback(self, pointcloud):
        self.pointcloud_buffer = pointcloud
        self.pointcloud_timestamp = pointcloud.header.stamp
        self.filter_pointcloud_msg()
    def gridboard_pose_sub_callback(self, gridboard_pose):
        gridboard_pose_color_optical_frame = gridboard_pose.pose
        # Gridboard pose in color_optical_frame
        H_gridboard2color = np.eye(4, dtype=np.float32)
        rotM = Rotation.from_quat([gridboard_pose.pose.orientation.x,
                                   gridboard_pose.pose.orientation.y,
                                   gridboard_pose.pose.orientation.z,
                                   gridboard_pose.pose.orientation.w]).as_matrix()
        H_gridboard2color[:3, :3] = rotM.T
        H_gridboard2color[:3, 3] = -rotM.T @ np.array([gridboard_pose.pose.position.x,
                                                       gridboard_pose.pose.position.y,
                                                       gridboard_pose.pose.position.z]).T
        # GridBoard pose were in "color_optical_frame" --> Need to transform to "depth_optical_frame"
        tf_color2depth = self.get_tf_color2depth()  # Transformation from "color_optical_frame" to "depth_optical_frame"
        self.H_gridboard2depth = H_gridboard2color @ tf_color2depth # Transformation from GridBoard to depth_optical_frame
        self.gridboard_pose_timestamp = gridboard_pose.header.stamp
        self.filter_pointcloud_msg()
    def filter_pointcloud_msg(self):
        if self.pointcloud_timestamp is not None and self.gridboard_pose_timestamp is not None:
            if self.pointcloud_timestamp == self.gridboard_pose_timestamp:  # Match pointcloud with pose of gridboard
                '''
                Decode PointCloud2 from Realsense Camera to NumPy Array
                - sensor_msgs.msg.PointField(name='x', offset=0, datatype=7, count=1),
                - sensor_msgs.msg.PointField(name='y', offset=4, datatype=7, count=1),
                - sensor_msgs.msg.PointField(name='z', offset=8, datatype=7, count=1),
                - sensor_msgs.msg.PointField(name='rgb', offset=16, datatype=7, count=1)
                point_step = 20
                datatype 7 --> float32
                '''
                pcd_as_numpy_array = np.asarray(self.pointcloud_buffer.data).reshape((-1, self.pointcloud_buffer.point_step))
                # Decode XYZ coordinate (4 bytes for each axis)
                x = pcd_as_numpy_array[:, :4].view('<f4').reshape(-1)   # < = little-endian (LSB first)
                y = pcd_as_numpy_array[:, 4:8].view('<f4').reshape(-1)  # > = big-endian (MSB first)
                z = pcd_as_numpy_array[:, 8:12].view('<f4').reshape(-1)
                points = np.stack([x, y, z], axis=1)

                # self.get_logger().info("Point count before filter: %d"%len(points))
                # Transform PointCloud with general transformation from GridBoard to depth_optical_frame
                homogeneous_points = np.hstack((points, np.ones((points.shape[0], 1)))) # Add extra 1 to make them homogeneous
                xyz_local = (self.H_gridboard2depth @ homogeneous_points.T).T
                # self.get_logger().info(str(xyz_local.shape))

                mask_x = np.logical_and(xyz_local[:, 0] >= self.min_bound[0], xyz_local[:, 0] <= self.max_bound[0])
                mask_y = np.logical_and(xyz_local[:, 1] >= self.min_bound[1], xyz_local[:, 1] <= self.max_bound[1])
                mask_z = np.logical_and(xyz_local[:, 2] >= self.min_bound[2], xyz_local[:, 2] <= self.max_bound[2])
                mask = np.logical_and(mask_x, np.logical_and(mask_y, mask_z))
                xyz_local_filtered = xyz_local[mask][:, :3].astype(dtype=np.float32)

                # self.get_logger().info("Point count after filter: %d" % len(xyz_local_filtered))

                # Decode RGB color (4 bytes for both 3 channel)
                # pack = pcd_as_numpy_array[:, 16:].view(dtype=np.uint32).reshape(-1)
                pack = pcd_as_numpy_array[mask][:, 16:].view(dtype=np.uint32).reshape(-1)   # Decode color only for points that pass filter
                r = (pack & 0x00FF0000) >> 16
                g = (pack & 0x0000FF00) >> 8
                b = (pack & 0x000000FF)
                rgb = np.stack([r, g, b], axis=1)
                normalized_color = np.array(rgb, dtype=np.float64) / 255.0  # Open3D need float64 array of shape (num_points, 3), range [0, 1]

                ## Publish filtered PointCloud
                filtered_points_msg = PointCloud2()
                n_filtered_points = xyz_local_filtered.shape[0]
                # Copy timestamp & general info from original PointCloud2
                filtered_points_msg.header = self.pointcloud_buffer.header
                filtered_points_msg.height = 1
                filtered_points_msg.width = n_filtered_points
                filtered_points_msg.fields = self.pointcloud_buffer.fields
                filtered_points_msg.is_bigendian = self.pointcloud_buffer.is_bigendian
                filtered_points_msg.point_step = 20
                filtered_points_msg.row_step = n_filtered_points * 20
                filtered_points_msg.is_dense = self.pointcloud_buffer.is_dense
                unflattened_data = np.zeros((n_filtered_points, self.pointcloud_buffer.point_step), dtype=np.uint8)
                # Prepare data section
                unflattened_data[:, :12] = xyz_local_filtered[:, :3].view('B')  # Prepare encoded local coordinate of passed PointCloud (unsigned byte)
                unflattened_data[:, 16:] = pcd_as_numpy_array[mask][:, 16:]     # Prepare encoded color of passed PointCloud (unsigned byte)

                filtered_points_msg.data = np.asarray(unflattened_data).ravel().astype(np.uint8).tolist()
                self.filtered_pointcloud_pub.publish(filtered_points_msg)

                # The rest here is for visualization.
                # self.vis.remove_geometry(self.o3d_pcd)  # Clear old pointcloud
                # self.o3d_pcd = o3d.geometry.PointCloud(o3d.utility.Vector3dVector(xyz_local_filtered))
                # self.o3d_pcd.colors = o3d.utility.Vector3dVector(normalized_color)
                #
                # self.vis.add_geometry(self.o3d_pcd)
                # self.vis.poll_events()
                # self.vis.update_renderer()

def main():
    rclpy.init()
    gridboard_pointcloud = GridBoardPointCloud()
    rclpy.spin(gridboard_pointcloud)
    gridboard_pointcloud.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()