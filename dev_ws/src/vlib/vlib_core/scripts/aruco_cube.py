#!/usr/bin/env -S HOME=${HOME} ${HOME}/.virtualenvs/cv/bin/python
import rclpy
from rclpy.node import Node
from cv_bridge import CvBridge
from geometry_msgs.msg import PoseArray, Pose, Point, Quaternion
from sensor_msgs.msg import Image, CameraInfo
from std_msgs.msg import UInt32MultiArray, UInt8MultiArray
from ament_index_python.packages import get_package_share_directory
from vlib_msgs.msg import ArucoData, ArucoCubeData
import os
from pyquaternion import Quaternion as Q
from scipy.spatial.transform import Rotation as R
import cv2
import numpy as np
import json

class ArucoCubeLocator(Node):
    def __init__(self):
        super().__init__('aruco_cube_locator')
        self.declare_parameters(
            namespace='',
            parameters=[('cube_info_path', 'config/aruco_cube/demo.json'),
                        ('aruco_data_topic', '/camera/aruco/data'),
                        ('camera_info_topic', '/camera/color/camera_info'),
                        ('aruco_cube_pose_topic', '/camera/aruco/poses'),
                        ('color_camera_optical_frame', 'RS_D435_color_optical_frame')]
        )
        # Read cube config
        cube_config_path = os.path.join(get_package_share_directory('vlib_description'), self.get_parameter('cube_info_path').value)
        self.cube_config = json.load(open(cube_config_path))
        # Subscriber
        aruco_data_topic_name = self.get_parameter('aruco_data_topic').value
        self.aruco_data_sub = self.create_subscription(ArucoData, aruco_data_topic_name, self.aruco_data_sub_callback, 10)
        camera_info_topic_name = self.get_parameter('camera_info_topic').value
        self.camera_info_sub = self.create_subscription(CameraInfo, camera_info_topic_name, self.camera_info_callback, 10)
        # Publisher
        aruco_cube_pose_topic_name = self.get_parameter('aruco_cube_pose_topic').value
        self.aruco_cube_pose_pub = self.create_publisher(PoseArray, aruco_cube_pose_topic_name, 10)

        self.camera_info = None
    def camera_info_callback(self, camera_info):
        self.camera_info = camera_info
        self.destroy_subscription(self.camera_info_sub) # terminate subscription (nothing changed in camera_info)
    def aruco_data_sub_callback(self, aruco_data):
        if self.camera_info is None: return # Check if camera info is avaliable
        camera_matrix = np.array(self.camera_info.k, dtype=np.float32).reshape((3, 3))
        dist = np.array(self.camera_info.d, dtype=np.float32)
        ids = np.array(aruco_data.ids.data)
        all_corners = np.array(aruco_data.corners.data).reshape((-1, 4, 2))
        marker_size = self.cube_config['size']
        valid_ids, poses = [], []
        for i in range(len(ids)):
            id = int(ids[i])
            corners = np.array(all_corners[i], dtype=np.double)
            if str(id) not in self.cube_config.keys():
                self.get_logger().info("ID: " + str(id)+ " is not valid.")
                continue
            valid_ids.append(id)
            marker_transform = np.array(self.cube_config[str(id)], dtype=np.double).reshape((4, 4))
            inverse_marker_transform = np.linalg.inv(marker_transform)
            # inverse_marker_transform = np.eye(4)
            # inverse_marker_transform[:3, :3] = marker_transform[:3, :3].T
            # inverse_marker_transform[:3, 3] = -(marker_transform[:3, :3].T) @ marker_transform[:3, 3]
            # self.get_logger().info(str(np.linalg.inv(marker_transform)))
            # self.get_logger().info(str(inverse_marker_transform))

            # Corner start from top-left clock-wise
            corners_ref_local = np.array([[-marker_size/2, marker_size/2, 0],
                                          [marker_size/2, marker_size/2, 0],
                                          [marker_size/2, -marker_size/2, 0],
                                          [-marker_size/2, -marker_size/2, 0]])

            ret, rvec, tvec = cv2.solvePnP(objectPoints=corners_ref_local,
                                           imagePoints=corners,
                                           cameraMatrix=camera_matrix,
                                           distCoeffs=dist,
                                           flags=0)
            rotM = np.zeros(shape=(3, 3))
            rotM, _ = cv2.Rodrigues(rvec, rotM, jacobian=0)
            marker_pose = np.eye(4)
            marker_pose[:3, :3] = rotM
            marker_pose[:3, 3] = tvec.T
            cube_pose = marker_pose @ inverse_marker_transform # Transform marker to cube base
            # pose_msg = Pose()
            # pose_msg.position.x = cube_pose[0, 3]
            # pose_msg.position.y = cube_pose[1, 3]
            # pose_msg.position.z = cube_pose[2, 3]
            # q = Q(matrix=cube_pose[:3, :3]) # Convert rotation matrix to quaternion
            # pose_msg.orientation.x = q.x
            # pose_msg.orientation.y = q.y
            # pose_msg.orientation.z = q.z
            # pose_msg.orientation.w = q.w
            poses.append(cube_pose)
        # self.aruco_cube_pose_pub.publish(pose_array_msg)
        poses = np.array(poses)
        if len(poses):  # At least one valid marker detected
            aruco_cube_data = ArucoCubeData()
            rotations = R.from_matrix(poses[:, :3, :3])
            positions = poses[:, :3, 3]
            average_rotation = rotations.mean().as_quat()
            average_position = np.mean(positions, axis=0)
            center_pose_array_msg = PoseArray()
            center_pose_array_msg.header.frame_id = self.get_parameter('color_camera_optical_frame').value
            center_pose_array_msg.header.stamp = aruco_data.header.stamp
            center_pose_msg = Pose()
            center_pose_msg.position.x = average_position[0]
            center_pose_msg.position.y = average_position[1]
            center_pose_msg.position.z = average_position[2]
            center_pose_msg.orientation.x = average_rotation[0]
            center_pose_msg.orientation.y = average_rotation[1]
            center_pose_msg.orientation.z = average_rotation[2]
            center_pose_msg.orientation.w = average_rotation[3]
            center_pose_array_msg.poses.append(center_pose_msg)
            self.aruco_cube_pose_pub.publish(center_pose_array_msg)

def main():
    rclpy.init()
    aruco_cube_locator = ArucoCubeLocator()
    rclpy.spin(aruco_cube_locator)
    aruco_cube_locator.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()