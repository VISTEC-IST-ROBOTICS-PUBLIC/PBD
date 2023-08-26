#!/usr/bin/env python
import rospy
from std_msgs.msg import Float32
from ros_conveyor.msg import conveyor
import time
import math

if __name__ == "__main__":
    rospy.init_node("loop_node")
    rospy.loginfo("Starting Loop.")

    command_pub = rospy.Publisher("commandA", Float32, queue_size=1)
    command_msg = Float32()
    count = 0
    state = True
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        count = count + 1
        if state:
            command_msg.data = -0.12
            command_pub.publish(command_msg)
        else:
            command_msg.data = 0.0
        if count >= 100 :
            state = not state
            count = 0

        print command_msg.data
        print count
        
        rate.sleep()
