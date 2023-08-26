#!/usr/bin/env python
import rospy
from std_msgs.msg import Float32
from ros_conveyor.msg import conveyor
import time
import math

sensor_1 = False
sensor_2 = False
sensor_3 = False
current_vel = 0.0


def state_callback(msg):
    global sensor_1, sensor_2, sensor_3, current_vel
    sensor_1 = msg.sensor_1
    sensor_2 = msg.sensor_2
    sensor_3 = msg.sensor_3
    current_vel = msg.current_vel


if __name__ == "__main__":
    rospy.init_node("example_node")
    rospy.loginfo("Starting example_node.")

    command_pub = rospy.Publisher("conveyorB/command", Float32, queue_size=1)
    command_msg = Float32()
    rospy.Subscriber("conveyorB/state", conveyor, state_callback)

    state = 0
    change = 0
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        if state == 0:
            command_msg.data = -0.05
        elif state == 1:
            command_msg.data = 0.05

        if sensor_3 ==1:
            command_msg.data = 0
        # elif sensor_2:
        #     command_msg.data = current_vel
        if sensor_3 and change:
            state = 1
            change = 0
        if sensor_2:
            change = 1
        # else:
        #     command_msg.data = 0.05
	print command_msg.data
        command_pub.publish(command_msg)
        rate.sleep()
