#!/usr/bin/env -S HOME=${HOME} ${HOME}/.virtualenvs/cv/bin/python
import rclpy
from rclpy.node import Node
from cv_bridge import CvBridge
from sensor_msgs.msg import Image, CameraInfo
from std_msgs.msg import UInt32MultiArray, UInt8MultiArray
from ament_index_python.packages import get_package_share_directory
import cv2
import numpy as np
from vlib_msgs.msg import ArucoData

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
class ArucoScanner(Node):
    def __init__(self):
        super().__init__('aruco_scanner')
        self.declare_parameters(
            namespace='',
            parameters=[('image_topic', '/camera/color/image_raw'),
                        ('aruco_dict', 'DICT_4X4_100'),
                        ('aruco_data_topic', '/camera/aruco/data')]
        )
        # CV Bridge
        self.cv_bridge = CvBridge()
        # Node Parameters
        self.aruco_dict = self.get_parameter('aruco_dict').value
        # Subscriber
        image_topic_name = self.get_parameter('image_topic').value
        self.image_subscriber = self.create_subscription(Image, image_topic_name, self.image_sub_callback, 10)
        # Publisher
        aruco_data_topic_name = self.get_parameter('aruco_data_topic').value
        self.aruco_data_topic_pub = self.create_publisher(ArucoData, aruco_data_topic_name, 10)
    def image_sub_callback(self, encoded_frame):
        frame = self.cv_bridge.imgmsg_to_cv2(encoded_frame, 'bgr8')
        # arucoDict = cv2.aruco.ArucoDetector(ARUCO_DICT[self.aruco_dict])
        dictionary = cv2.aruco.getPredefinedDictionary(ARUCO_DICT[self.aruco_dict])
        parameters = cv2.aruco.DetectorParameters()
        detector = cv2.aruco.ArucoDetector(dictionary, parameters)

        # arucoParams = cv2.aruco.DetectorParameters_create()
        (corners, ids, rejected) = detector.detectMarkers(frame)
        # Prepare message to publish
        aruco_data = ArucoData()
        aruco_data.header.stamp = self.get_clock().now().to_msg()
        aruco_data.corners = UInt32MultiArray()
        aruco_data.corners.data = [int(item) for item in np.array(corners).reshape(-1)]
        aruco_data.ids = UInt8MultiArray()
        aruco_data.ids.data = [] if ids is None else [int(item) for item in np.array(ids).reshape(-1)]
        self.aruco_data_topic_pub.publish(aruco_data)

def main():
    rclpy.init()
    aruco_scan = ArucoScanner()
    rclpy.spin(aruco_scan)
    aruco_scan.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()