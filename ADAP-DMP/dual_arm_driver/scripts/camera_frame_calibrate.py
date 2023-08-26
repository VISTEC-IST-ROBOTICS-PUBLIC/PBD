#!/usr/bin/env python
from logging import shutdown
import math
import sys
from ur_msgs.srv import SetIO, SetIORequest
import geometry_msgs.msg
from std_msgs.msg import UInt8
from geometry_msgs.msg import PoseStamped, Pose
from dual_arm_msgs.srv import MoveRobotToNextPose, MoveRobotToNextPoseResponse
import moveit_commander
from moveit_msgs.msg import DisplayTrajectory
import rospy
from optitrack_to_robot import optitrackToUR
import numpy as np
from numpy import genfromtxt
import time
import tf
import struct

X_RANGE = np.array([0.35, 0.70])
Y_RANGE = np.array([-0.20, 0.50])
Z_RANGE = np.array([1.20, 1.35])

class RobotControlNode:
    def generate_position(self):
        x = np.random.uniform(X_RANGE[0], X_RANGE[1])
        y = np.random.uniform(Y_RANGE[0], Y_RANGE[1])
        z = np.random.uniform(Z_RANGE[0], Z_RANGE[1])
        return [x, y, z]
    def generate_quaternion(self):
        self.orientation = self.getOrientation()
        # generate random angles for each of the three axes
        angle_x = np.random.uniform(low=-self.angle_limit_deg, high=self.angle_limit_deg)
        angle_y = np.random.uniform(low=-self.angle_limit_deg, high=self.angle_limit_deg)
        angle_z = np.random.uniform(low=-self.angle_limit_deg, high=self.angle_limit_deg)
        # create quaternions representing rotations about each of the three axes by the generated angles
        qx = np.array([math.cos(math.radians(angle_x/2)), math.sin(math.radians(angle_x/2)), 0, 0])
        qy = np.array([math.cos(math.radians(angle_y/2)), 0, math.sin(math.radians(angle_y/2)), 0])
        qz = np.array([math.cos(math.radians(angle_z/2)), 0, 0, math.sin(math.radians(angle_z/2))])
        # multiply the current orientation by the three delta quaternions to get the new orientation
        delta_quat = self.multiply_quaternions(qz, self.multiply_quaternions(qy, qx))
        new_orientation = self.multiply_quaternions(delta_quat, self.orientation)
        # normalize the quaternion to ensure it has unit length
        new_orientation /= np.linalg.norm(new_orientation)
        # update the current orientation
        self.orientation = new_orientation
        # return the new orientation
        return new_orientation
    # def generate_quaternion(self,num):
    #     orientations = []
    #     for i in range(num):
    #         q = np.random.randn(4)
    #         q /= np.linalg.norm(q)
    #         orientations.append([q[0],q[1],q[2],q[3]])
    #     return orientations
    def multiply_quaternions(self, q1, q2):
        w1, x1, y1, z1 = q1
        w2, x2, y2, z2 = q2
        w = w1 * w2 - x1 * x2 - y1 * y2 - z1 * z2
        x = w1 * x2 + x1 * w2 + y1 * z2 - z1 * y2
        y = w1 * y2 - x1 * z2 + y1 * w2 + z1 * x2
        z = w1 * z2 + x1 * y2 - y1 * x2 + z1 * w2
        return np.array([w, x, y, z])

    def goHome(self):
        pose_goal = self.move_group_A.get_current_pose()
        print("-----------CURRENT POSE-----------")
        # print(pose_goal)
        pose_goal.pose.orientation.x = -2.07676007893e-05
        pose_goal.pose.orientation.y = -1.4329232147e-05
        pose_goal.pose.orientation.z = 0.561867745329
        pose_goal.pose.orientation.w = 0.827227076517
        pose_goal.pose.position.x = 0.41783532548
        pose_goal.pose.position.y = 0.607822626969
        pose_goal.pose.position.z = 1.25519821783
        planA = self.move_group_A.plan(pose_goal)
        self.move_group_A.execute(planA, wait=True)
        self.move_group_A.stop()

    def goToQuat(self,quat):
        pose_goal = self.move_group_A.get_current_pose()
        # print(pose_goal)
        pose_goal.pose.orientation.x = quat[0]
        pose_goal.pose.orientation.y = quat[1]
        pose_goal.pose.orientation.z = quat[2]
        pose_goal.pose.orientation.w = quat[3]
        planA = self.move_group_A.plan(pose_goal)
        self.move_group_A.execute(planA, wait=True)
        self.move_group_A.stop()


    def goToXYZ(self,pos):
        pose_goal = self.move_group_A.get_current_pose()
        pose_goal.pose.position.x = pos[0]
        pose_goal.pose.position.y = pos[1]
        pose_goal.pose.position.z = pos[2]
        planA = self.move_group_A.plan(pose_goal)
        self.move_group_A.execute(planA, wait=True)
        self.move_group_A.stop()
    def getOrientation(self):
        pose_goal = self.move_group_A.get_current_pose()
        return pose_goal.pose.orientation.x,pose_goal.pose.orientation.y,pose_goal.pose.orientation.z,pose_goal.pose.orientation.w

    def getPosition(self):
        pose_goal = self.move_group_A.get_current_pose()
        return pose_goal.pose.position.x,pose_goal.pose.position.y,pose_goal.pose.position.z

    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node("robot_control_node")
        rospy.loginfo("Starting RobotControlNode as robot_control_node.")
        self.set_io = rospy.ServiceProxy('ur_A_/ur_hardware_interface/set_io', SetIO)
        self.obj_pose_robot = None
        self.robot_A = moveit_commander.RobotCommander(robot_description="/robot_description",ns="")
        self.scene_A = moveit_commander.PlanningSceneInterface(ns="")
        self.move_group_A = moveit_commander.MoveGroupCommander("ur_A",robot_description="/robot_description",ns="")
        self.move_group_B = moveit_commander.MoveGroupCommander("ur_B",robot_description="/robot_description",ns="")
        self.display_trajectory_publisher_A = rospy.Publisher('/move_group/display_planned_path',DisplayTrajectory,queue_size=20)
        self.orientation = np.array([1, 0, 0, 0])
        # angle_limit_deg should be a scalar representing the maximum angle change allowed
        self.angle_limit_deg = 15
        ## Publisher ##
        self.pub_tcp = rospy.Publisher("/tcp_pose", PoseStamped, queue_size=10)
        self.robot_moving_pub = rospy.Publisher("/robot_moving", UInt8, queue_size=10)
        ## Subscriber ##
        self.listener = tf.TransformListener()
        ## Service ##
        self.robot_move_service = rospy.Service('move_robot', MoveRobotToNextPose, self.handle_move_robot)
        ## States ##
        self.robot_pos = None
        self.robot_moving = False
        self.robot_orientation = None
        self.pos_counter, self.rot_counter = 0, 0

    def pub_state(self, event=None):
        self.pub_tcp.publish(self.move_group_A.get_current_pose())  # publish TCP Pose
        self.robot_moving_pub.publish(UInt8(rcn.robot_moving))      # publish moving state
        pass

    def state_handler(self, event=None):
        if self.pos_counter == 0 and self.rot_counter == 0: # Init Robot Pose
            print("GO HOME")
            self.robot_moving = True
            rcn.goHome()
            print("ARRIVE HOME")
            self.robot_moving = False
            self.pos_counter += 1
        else:   # Working
            pass

    def handle_move_robot(self, req):
        if self.robot_moving:
            return MoveRobotToNextPoseResponse(1)   # Error (1): Robot not ready (still moving)
        print(req)
        command = req.command.data
        if command == 0:    # MOVE TO NEXT POSE
            print("MOVE TO NEXT POSE")
            self.robot_moving = True
            if self.rot_counter < 3:    # only rotate
                self.rot_counter += 1   # count rotation move
                MoveRobotToNextPoseResponse(0)  # Success: Robot starting to move
                random_quaternion = rcn.generate_quaternion()
                rcn.goToQuat(random_quaternion)
            else:
                MoveRobotToNextPoseResponse(0)  # Success: Robot starting to move
                self.pos_counter += 1   # count position move
                self.rot_counter = 0    # reset rotation count
                random_position = rcn.generate_position()
                rcn.goToXYZ(random_position)
                random_quaternion = rcn.generate_quaternion()
                rcn.goToQuat(random_quaternion)

            self.robot_moving = False
        elif command == 1:    # MOVE TO SPECIFIED POSE
            print("MOVE TO SPECIFIED POSE")
            pose = req.target_pose.data
        elif command == 2:    # GO HOME
            print("GO HOME")
            self.robot_moving = True
            MoveRobotToNextPoseResponse(0)
            rcn.goHome()
            self.robot_moving = False
        elif command == 3:    # STOP
            print("STOP")
            self.robot_moving = True
            MoveRobotToNextPoseResponse(0)
            rcn.goHome()
            rcn.move_group_A.stop()
            self.robot_moving = False
        else:
            print("INVALID COMMAND")
            MoveRobotToNextPoseResponse(2)  # Error (1): Invalid command
if __name__ == "__main__":
    rcn = RobotControlNode()
    # Timer
    rospy.Timer(rospy.Duration(1.0/100), rcn.pub_state)
    rospy.Timer(rospy.Duration(1.0/100), rcn.state_handler)

    rospy.spin()
