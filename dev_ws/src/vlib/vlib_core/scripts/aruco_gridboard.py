#!/usr/bin/env -S HOME=${HOME} ${HOME}/.virtualenvs/cv/bin/python
import rclpy
from rclpy.node import Node
from cv_bridge import CvBridge
from sensor_msgs.msg import Image, CameraInfo, PointCloud2
from geometry_msgs.msg import PoseStamped
from scipy.spatial.transform import Rotation as R
from std_msgs.msg import UInt32MultiArray, UInt8MultiArray
from ament_index_python.packages import get_package_share_directory
import cv2
import numpy as np
import math
from scipy.spatial.transform import Rotation    # convert euler angles to rotation matrix


ARUCO_DICT = {
    "DICT_4X4_50": cv2.aruco.DICT_4X4_50,
    "DICT_4X4_100": cv2.aruco.DICT_4X4_100,
    "DICT_4X4_250": cv2.aruco.DICT_4X4_250,
    "DICT_4X4_1000": cv2.aruco.DICT_4X4_1000,
    "DICT_5X5_50": cv2.aruco.DICT_5X5_50,
    "DICT_5X5_100": cv2.aruco.DICT_5X5_100,
    "DICT_5X5_250": cv2.aruco.DICT_5X5_250,
    "DICT_5X5_1000": cv2.aruco.DICT_5X5_1000,
    "DICT_6X6_50": cv2.aruco.DICT_6X6_50,
    "DICT_6X6_100": cv2.aruco.DICT_6X6_100,
    "DICT_6X6_250": cv2.aruco.DICT_6X6_250,
    "DICT_6X6_1000": cv2.aruco.DICT_6X6_1000,
    "DICT_7X7_50": cv2.aruco.DICT_7X7_50,
    "DICT_7X7_100": cv2.aruco.DICT_7X7_100,
    "DICT_7X7_250": cv2.aruco.DICT_7X7_250,
    "DICT_7X7_1000": cv2.aruco.DICT_7X7_1000,
    "DICT_ARUCO_ORIGINAL": cv2.aruco.DICT_ARUCO_ORIGINAL,
    "DICT_APRILTAG_16h5": cv2.aruco.DICT_APRILTAG_16h5,
    "DICT_APRILTAG_25h9": cv2.aruco.DICT_APRILTAG_25h9,
    "DICT_APRILTAG_36h10": cv2.aruco.DICT_APRILTAG_36h10,
    "DICT_APRILTAG_36h11": cv2.aruco.DICT_APRILTAG_36h11
}

class GridBoard(Node):
    def __init__(self):
        super().__init__('aruco_cube_locator')
        self.declare_parameters(
            namespace='',
            parameters=[('aruco_dict', 'DICT_4X4_250'),
                        ('image_topic', '/camera/color/image_raw'),
                        ('camera_info_topic', '/camera/color/camera_info'),
                        ('pointcloud_topic', '/camera/depth/color/points'),
                        ('gridboard_pose_topic', '/camera/color/gridboard_pose'),
                        ('nX', 8),
                        ('nY', 8),
                        ('markerLength', 0.04),     # meter
                        ('markerSeparation', 0.01), # meter
                        ('coordinate_frame_id', 'RS_D435_color_optical_frame')]
        )
        # CV Bridge
        self.cv_bridge = CvBridge()
        # Node Parameters
        self.arucoDict = cv2.aruco.Dictionary_get(ARUCO_DICT[self.get_parameter('aruco_dict').value])
        self.nX = self.get_parameter('nX').value
        self.nY = self.get_parameter('nY').value
        self.markerLength = self.get_parameter('markerLength').value
        self.markerSeparation = self.get_parameter('markerSeparation').value
        self.coordinate_frame_id = self.get_parameter('coordinate_frame_id').value
        # Subscriber
        image_topic_name = self.get_parameter('image_topic').value
        self.image_subscriber = self.create_subscription(Image, image_topic_name, self.image_sub_callback, 10)
        camera_info_topic_name = self.get_parameter('camera_info_topic').value
        self.camera_info_sub = self.create_subscription(CameraInfo, camera_info_topic_name, self.camera_info_sub_callback, 10)
        # Publisher
        gridboard_pose_topic_name = self.get_parameter('gridboard_pose_topic').value
        self.grid_pose_topic_pub = self.create_publisher(PoseStamped, gridboard_pose_topic_name, 10)
        # Aruco Board Variables
        self.board = cv2.aruco_GridBoard.create(markersX=self.nX,
                                                markersY=self.nY,
                                                markerLength=self.markerLength,
                                                markerSeparation=self.markerSeparation,
                                                dictionary=self.arucoDict)
        self.arucoParams = cv2.aruco.DetectorParameters_create()
        self.center_transform = np.eye(4)
        self.center_transform[: 3, :3] = Rotation.from_rotvec([math.pi, 0, 0]).as_matrix()
        self.center_transform[: 3, 3] = [-(self.nX * self.markerLength / 2 + (self.nX / 2 - 0.5) * self.markerSeparation), self.nY / 2 * self.markerLength + (self.nY / 2 - 0.5) * self.markerSeparation, 0]
        self.tvec, self.rvec = np.zeros(3, dtype=np.float32), np.zeros(3, dtype=np.float32)
        self.camera_info, self.camera_matrix, self.dist = None, None, None
    def camera_info_sub_callback(self, camera_info):
        self.camera_info = camera_info
        self.camera_matrix = np.array(self.camera_info.k, dtype=np.float32).reshape((3, 3))
        self.dist = np.array(self.camera_info.d, dtype=np.float32)
        self.destroy_subscription(self.camera_info_sub) # terminate subscription (nothing changed in camera_info)

    def image_sub_callback(self, encoded_frame):
        if self.camera_info is None: return  # Check if camera info is avaliable
        frame = self.cv_bridge.imgmsg_to_cv2(encoded_frame, 'bgr8')
        (corners, ids, rejected) = cv2.aruco.detectMarkers(frame, self.arucoDict, parameters=self.arucoParams)
        if len(corners) > 0:
            ids = ids.flatten()
            count, rvec, tvec = cv2.aruco.estimatePoseBoard(corners=corners,
                                                            ids=ids,
                                                            board=self.board,
                                                            cameraMatrix=self.camera_matrix,
                                                            distCoeffs=self.dist,
                                                            rvec=self.rvec, tvec=self.tvec)

            inverse_gridboard_transform = np.linalg.inv(self.center_transform)
            ## Find Origin Pose ##
            rotM = np.zeros(shape=(3, 3))
            rotM, _ = cv2.Rodrigues(rvec, rotM, jacobian=0)
            marker_pose = np.eye(4)
            marker_pose[:3, :3] = rotM
            marker_pose[:3, 3] = tvec.T
            gridboard_pose = marker_pose @ inverse_gridboard_transform
            rot_quat = R.from_matrix(gridboard_pose[:3, :3]).as_quat()

            grid_pose_msg = PoseStamped()
            grid_pose_msg.header = encoded_frame.header
            grid_pose_msg.header.frame_id = self.coordinate_frame_id    # Set Frame ID as Color Optical Frame of camera
            grid_pose_msg.pose.position.x = gridboard_pose[0, 3]/2.2
            grid_pose_msg.pose.position.y = gridboard_pose[1, 3]/2.2
            grid_pose_msg.pose.position.z = gridboard_pose[2, 3]/2.2
            grid_pose_msg.pose.orientation.x = rot_quat[0]
            grid_pose_msg.pose.orientation.y = rot_quat[1]
            grid_pose_msg.pose.orientation.z = rot_quat[2]
            grid_pose_msg.pose.orientation.w = rot_quat[3]
            self.grid_pose_topic_pub.publish(grid_pose_msg)
            # self.get_logger().info(str(grid_pose_msg))

            canvas = frame.copy()
            # cv2.aruco.drawDetectedMarkers(canvas, corners, ids)
            cv2.drawFrameAxes(canvas,
                              self.camera_matrix,
                              self.dist,
                              gridboard_pose[:3, :3],
                              gridboard_pose[:3, 3].T,
                              0.2)
            cv2.imshow("Grid Plane", canvas)
            cv2.waitKey(1)
def main():
    rclpy.init()
    grid_board_locator = GridBoard()
    rclpy.spin(grid_board_locator)
    grid_board_locator.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()