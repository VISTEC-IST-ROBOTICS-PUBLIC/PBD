#!/usr/bin/env python
import rospy
from std_srvs.srv import Trigger, TriggerResponse
from std_msgs.msg import Float32,Bool,Float32MultiArray
from ros_conveyor.msg import conveyor
import time

import tf
from tf.transformations import euler_from_quaternion, quaternion_from_euler
import geometry_msgs.msg
from geometry_msgs.msg import Twist
import numpy as np
import math as m


class RobotVelnode:

    def __init__(self):
        rospy.init_node("command_robot")

        rospy.Subscriber("dmp_A/vel", Float32MultiArray, self.callback_A)
        rospy.Subscriber("dmp_B/vel", Float32MultiArray, self.callback_B)
        
        self.pub_A_vel = rospy.Publisher("/ur_A_/twist_controller/command", Twist, queue_size=1)
        self.pub_B_vel = rospy.Publisher("/ur_B_/twist_controller/command", Twist, queue_size=1)
        self.move_A_vel = np.zeros(3)
        self.move_B_vel = [0.0,0.0,0.0]
        self.timeoutA = time.time()
        self.timeoutB = time.time()
        self.rate = rospy.Rate(50)
        self.max_vel = 0.3
        self.min_vel = -0.3

    def limit_vel(self,vel):
        return max(min(self.max_vel,vel),self.min_vel)

    def callback_A(self,msg):
        self.move_A_vel[0] = msg.data[0]
        self.move_A_vel[1] = msg.data[1]
        self.move_A_vel[2] = msg.data[2]
        self.timeoutA = time.time()
        # print("callback "+ str(self.move_A_vel))

    def callback_B(self,msg):
        self.move_B_vel[0] = msg.data[0]
        self.move_B_vel[1] = msg.data[1]
        self.move_B_vel[2] = msg.data[2]
        self.timeoutB = time.time()
        # print("callback "+ str(self.move_B_vel))

    def move_A(self,t):
        move = Twist()
        move.linear.x = t[0]
        move.linear.y = t[1]
        move.linear.z = t[2]
        self.pub_A_vel.publish(move)

    def move_B(self,t):
        move = Twist()
        move.linear.x = t[0]
        move.linear.y = t[1]
        move.linear.z = t[2]
        self.pub_B_vel.publish(move)


    def debug_conveyor(self):
        if abs(self.current_a_vel - self.target_a_vel) >= 0.1  :
            self.main.mainloop()

        else:
            pass

    def quit(self):
                self.main.destroy()

    def Rx(self,theta):
        return np.matrix([[ 1, 0           , 0           ],
                        [ 0, m.cos(theta),-m.sin(theta)],
                        [ 0, m.sin(theta), m.cos(theta)]])

    def eulerAnglesToRotationMatrix(self,roll, pitch, yaw):
        Rx = np.array([[1 , 0, 0 ],
                      [0, m.cos(roll), -m.sin(roll)],
                      [0, m.sin(roll), m.cos(roll) ]],dtype="float64").reshape(3,3)

        Ry = np.array([[ m.cos(pitch) , 0, m.sin(pitch) ],
                      [0, 1, 0],
                      [-m.sin(pitch), 0, m.cos(pitch) ]],dtype="float64").reshape(3,3)

        Rz = np.array([[m.cos(yaw) , -m.sin(yaw), 0, ],
                      [m.sin(yaw), m.cos(yaw), 0],
                      [0, 0, 1 ]],dtype="float64").reshape(3,3)

        R = np.dot(Rz,np.dot(Ry,Rx))

        return R


    def run(self):
        listener = tf.TransformListener()
        rot_A = np.array([0,0,0,0])
        rot_B = np.array([0,0,0,0])
        while not rospy.is_shutdown():
            try:
                (start_pos,rot_A) = listener.lookupTransform('/ur_A_base_link_inertia','/base_link', rospy.Time(0))
                (start_pos,rot_B) = listener.lookupTransform('/ur_B_base_link_inertia','/base_link', rospy.Time(0))
            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                pass
            Rotation_A = np.array(tf.transformations.euler_from_quaternion(rot_A))
            Rx_A = self.eulerAnglesToRotationMatrix(Rotation_A[0],Rotation_A[2],Rotation_A[2])
            Rotation_B = np.array(tf.transformations.euler_from_quaternion(rot_B))
            Rx_B = self.eulerAnglesToRotationMatrix(Rotation_B[0],Rotation_B[1],Rotation_B[2])

            if time.time() - self.timeoutA > 0.5:
                self.move_A_vel[0] = 0.0
                self.move_A_vel[1] = 0.0
                self.move_A_vel[2] = 0.0
                self.move_A_vel = self.move_A_vel.reshape((3,1))
                # self.move_A(self.move_A_vel)
            else:
                self.move_A_vel = self.move_A_vel.reshape((3,1))
                move_A_vel = np.dot(Rx_A,self.move_A_vel)
                # print(move_A_vel)
                
                self.move_A(move_A_vel)

            if time.time() - self.timeoutB > 0.5:
                self.move_B_vel[0] = 0.0
                self.move_B_vel[1] = 0.0
                self.move_B_vel[2] = 0.0
                self.move_B_vel = np.array(self.move_B_vel).reshape((3,1))
                self.move_B(self.move_B_vel)
            else:
                self.move_B_vel_command = np.array(self.move_B_vel).reshape((3,1))
                self.move_B_vel_command = np.dot(np.copy(Rx_B),self.move_B_vel_command)
                self.move_B(self.move_B_vel_command)
            print(self.move_B_vel)

            self.rate.sleep()



if __name__ == "__main__":

    Vel = RobotVelnode()
    Vel.run()

