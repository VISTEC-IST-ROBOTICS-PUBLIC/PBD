#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState

class Mux:
    def __init__(self):

        rospy.init_node('mux_joint_node', anonymous=True)
        self.joint_pub = rospy.Publisher("/joint_states", JointState, queue_size=10)

        #self.all_joint = JointState()
        self.A_joint = JointState()
        self.B_joint = JointState()

        rospy.Subscriber("/ur_A_/joint_states", JointState, self.ur_A_cb)
        rospy.Subscriber("/ur_B_/joint_states", JointState, self.ur_B_cb)
        rospy.Timer(rospy.Duration(0.002), self.publish_all_joint)
        rospy.spin()

    def ur_A_cb(self, msg):
        self.A_joint.name = msg.name
        self.A_joint.position = msg.position
        self.A_joint.velocity = msg.velocity
        self.A_joint.effort = msg.effort

    def ur_B_cb(self, msg):
        self.B_joint.name = msg.name
        self.B_joint.position = msg.position
        self.B_joint.velocity = msg.velocity
        self.B_joint.effort = msg.effort

    def publish_all_joint(self, event):
        all_joint = JointState()
        all_joint.header.stamp = rospy.Time.now()
        joint_name = list(self.A_joint.name)
        joint_pos = list(self.A_joint.position)
        joint_vel = list(self.A_joint.velocity)
        joint_eff = list(self.A_joint.effort)
        for i in self.B_joint.name:
                joint_name.append(i)
        for i in self.B_joint.position:
                joint_pos.append(i)
        for i in self.B_joint.velocity:
                joint_vel.append(i)
        for i in self.B_joint.effort:
                joint_eff.append(i)

        all_joint.name = joint_name
        all_joint.position = joint_pos
        all_joint.velocity = joint_vel
        all_joint.effort = joint_eff

        self.joint_pub.publish(all_joint)
Mux()
    
