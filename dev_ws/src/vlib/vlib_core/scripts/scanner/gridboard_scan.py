#!/usr/bin/env -S HOME=${HOME} ${HOME}/.virtualenvs/cv/bin/python
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2
import open3d as o3d
import numpy as np

def pc2_to_o3d(pointcloud: PointCloud2):
    pcd_as_numpy_array = np.asarray(pointcloud.data).reshape((-1, pointcloud.point_step))
    # Decode XYZ coordinate (4 bytes for each axis)
    x = pcd_as_numpy_array[:, :4].view('<f4').reshape(-1)  # < = little-endian (LSB first)
    y = pcd_as_numpy_array[:, 4:8].view('<f4').reshape(-1)  # > = big-endian (MSB first)
    z = pcd_as_numpy_array[:, 8:12].view('<f4').reshape(-1)
    points = np.stack([x, y, z], axis=1)

    o3d_pcd = o3d.geometry.PointCloud(o3d.utility.Vector3dVector(points))

    # Decode RGB color (4 bytes for both 3 channel)
    pack = pcd_as_numpy_array[:, 16:].view(dtype=np.uint32).reshape(-1)
    r = (pack & 0x00FF0000) >> 16
    g = (pack & 0x0000FF00) >> 8
    b = (pack & 0x000000FF)
    rgb = np.stack([r, g, b], axis=1)
    normalized_color = np.array(rgb, dtype=np.float64) / 255.0  # Open3D need float64 array of shape (num_points, 3), range [0, 1]

    o3d_pcd.colors = o3d.utility.Vector3dVector(normalized_color)
    return o3d_pcd
class GridBoardReconstruct(Node):
    def __init__(self):
        super().__init__('gridboard_reconstruct')
        self.declare_parameters(
            namespace='',
            parameters=[
                ('gridboard_pointcloud_topic', '/camera/depth/color/filtered_points'),
                        ]
        )
        # Node Parameters
        self.voxel_size = 0.005
        # Subscriber
        gridboard_pointcloud_topic_name = self.get_parameter('gridboard_pointcloud_topic').value
        self.gridboard_pointcloud_sub = self.create_subscription(PointCloud2, gridboard_pointcloud_topic_name, self.gridboard_pointcloud_sub_callback, 10)

        # States & Buffers
        self.down_sample_batch_count = 0
        self.down_sample_batch_limit = 5

        ## This is for visualization of the received point cloud.
        self.vis = o3d.visualization.Visualizer()
        self.vis.create_window()
        self.o3d_pcd = o3d.geometry.PointCloud()
    def gridboard_pointcloud_sub_callback(self, gridboard_pointcloud):
        # Merge new PointCloud with the existing
        new_pcd = pc2_to_o3d(gridboard_pointcloud)
        self.o3d_pcd += new_pcd
        if self.down_sample_batch_count >= self.down_sample_batch_limit:
            self.o3d_pcd = self.o3d_pcd.voxel_down_sample(self.voxel_size)
        # The rest here is for visualization.
        self.vis.remove_geometry(self.o3d_pcd)  # Clear old pointcloud
        self.vis.add_geometry(self.o3d_pcd)
        self.vis.poll_events()
        self.vis.update_renderer()

        self.down_sample_batch_count += 1

def main():
    rclpy.init()
    gridboard_reconstruct = GridBoardReconstruct()
    rclpy.spin(gridboard_reconstruct)
    gridboard_reconstruct.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()