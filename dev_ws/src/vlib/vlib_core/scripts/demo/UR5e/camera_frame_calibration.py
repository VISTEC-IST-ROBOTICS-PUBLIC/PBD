#!/usr/bin/env -S HOME=${HOME} ${HOME}/.virtualenvs/cv/bin/python
import rclpy
from rclpy.node import Node
from rclpy.time import Time
from rclpy.duration import Duration
from cv_bridge import CvBridge
from std_msgs.msg import UInt8
from geometry_msgs.msg import PoseArray, PoseStamped, Point, Quaternion
from vlib_msgs.srv import MoveRobotToNextPose
from sensor_msgs.msg import Image, CameraInfo
from ament_index_python.packages import get_package_share_directory
import numpy as np

_wait_time = Duration(seconds=5, nanoseconds=0)  # Time to wait before move robot to next pose

class CameraFrameCalibrator(Node):
    def __init__(self):
        super().__init__('camera_frame_calibrator')
        self.declare_parameters(
            namespace='',
            parameters=[
                            ('aruco_cube_pose_topic', '/RS_D435/aruco/poses'),
                            ('tcp_pose_topic', '/tcp_pose'),
                            ('calibration_rounds', 25),
                        ]
        )

        # Subscriber
        aruco_cube_pose_topic_name = self.get_parameter('aruco_cube_pose_topic').value
        self.aruco_cube_pose_sub = self.create_subscription(PoseArray, aruco_cube_pose_topic_name, self.aruco_cube_pose_sub_callback, 10)
        self.robot_moving_sub = self.create_subscription(UInt8, '/robot_moving', self.robot_moving_sub_callback, 10)
        tcp_pose_topic_name = self.get_parameter('tcp_pose_topic').value
        self.tcp_pose_sub = self.create_subscription(PoseStamped, tcp_pose_topic_name, self.tcp_pose_sub_callback, 10)
        # Client
        self.move_robot_client = self.create_client(MoveRobotToNextPose, 'move_robot')
        self.move_robot_request = MoveRobotToNextPose.Request()
        # Timer
        timer_period = 1/100
        self.timer1 = self.create_timer(timer_period, self.timer_callback)
        # Variables
        self.aruco_cube_pose = None
        self.tcp_pose = None
        self.calibration_round_max = self.get_parameter('calibration_rounds').value
        self.calibration_round_count = 0
        self.save_buffer = {'tcp_pose':[], 'aruco_cube_pose':[]}
        # States
        self.robot_moving = True
        self.last_time_command_sent = self.get_clock().now()
        self.last_time_that_robot_move = self.get_clock().now()
        print("OPERATION START")
    def timer_callback(self):
        if not self.robot_moving:
            time_since_previous_command = self.get_clock().now() - self.last_time_command_sent
            time_since_previous_move = self.get_clock().now() - self.last_time_that_robot_move
            # print(time_since_previous_command.nanoseconds/1000000000, time_since_previous_move.nanoseconds/1000000000)
            if time_since_previous_command > _wait_time and time_since_previous_move > _wait_time:   # Cooldown after robot finish previous move
                ## Send robot_move request ##
                print("SEND REQUEST")
                self.future = self.move_robot_client.call_async(self.move_robot_request)
                self.last_time_command_sent = self.get_clock().now()
                # rclpy.spin_until_future_complete(self, self.future)
                # return self.future.result()
                ## Clear poses buffer ##
                self.aruco_cube_pose = None
                self.tcp_pose = None

                self.calibration_round_count += 1
            else:   # Robot is still (ready to capture calibration data)
                if self.aruco_cube_pose is not None and self.tcp_pose is not None:  # both poses are valid (TCP related to Robot, Aruco related to Camera)
                    self.save_buffer['aruco_cube_pose'].append([self.aruco_cube_pose.position.x,self.aruco_cube_pose.position.y, self.aruco_cube_pose.position.z, self.aruco_cube_pose.orientation.x, self.aruco_cube_pose.orientation.y, self.aruco_cube_pose.orientation.z, self.aruco_cube_pose.orientation.w])
                    self.save_buffer['tcp_pose'].append([self.tcp_pose.position.x,self.tcp_pose.position.y, self.tcp_pose.position.z, self.tcp_pose.orientation.x, self.tcp_pose.orientation.y, self.tcp_pose.orientation.z, self.tcp_pose.orientation.w])

        if self.calibration_round_count >= self.calibration_round_max:
            np.savez("poses", aruco_cube_pose=self.save_buffer['aruco_cube_pose'], tcp_pose=self.save_buffer['tcp_pose'])
            print("TERMINATED")
            self.destroy_node()
            exit(0)

    def aruco_cube_pose_sub_callback(self, cube_pose):
        self.aruco_cube_pose = cube_pose.poses[0]
    def robot_moving_sub_callback(self, moving):
        self.robot_moving = moving.data
        if self.robot_moving:   # Track last time we see robot move
            self.last_time_that_robot_move = self.get_clock().now()

    def tcp_pose_sub_callback(self, tcp_pose):
        # print(self.get_clock().now() - Time.from_msg(tcp_pose.header.stamp))
        self.tcp_pose = tcp_pose.pose
def main():
    rclpy.init()
    frame_calibrator = CameraFrameCalibrator()
    rclpy.spin(frame_calibrator)
    frame_calibrator.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
