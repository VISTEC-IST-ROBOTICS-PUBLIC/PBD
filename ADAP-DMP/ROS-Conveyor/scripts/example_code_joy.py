#!/usr/bin/env python
import rospy
from std_msgs.msg import Float32
from ros_conveyor.msg import conveyor
from ds4_driver.msg import Status
import time
import math

b_sensor_1 = False
b_sensor_2 = False
b_sensor_3 = False
b_current_vel = 0.0
b_goal_vel = 0.0
a_goal_vel = 0.0


def b_state_callback(msg):
    global b_sensor_1, b_sensor_2, b_sensor_3, b_current_vel
    b_sensor_1 = msg.sensor_1
    b_sensor_2 = msg.sensor_2
    b_sensor_3 = msg.sensor_3
    b_current_vel = msg.current_vel


def st_cb(msg):
    global b_goal_vel, a_goal_vel
    if msg.button_r2:
        a_goal_vel = msg.axis_right_x * -10.0
        b_goal_vel = msg.axis_right_y * 10.0
    else:
        a_goal_vel = 0.0
        b_goal_vel = 0.0
    if msg.button_l2:
        b_goal_vel = 4.0
    elif msg.button_l1:
        b_goal_vel = -4.0
    # rospy.loginfo(goal_vel)


if __name__ == "__main__":
    rospy.init_node("example_node")
    rospy.loginfo("Starting example_node.")

    command_a_pub = rospy.Publisher("conveyorA/command", Float32, queue_size=1)
    command_b_pub = rospy.Publisher("conveyorB/command", Float32, queue_size=1)
    command_msg = Float32()
    rospy.Subscriber("conveyorB/state", conveyor, b_state_callback)
    rospy.Subscriber("status", Status, st_cb)

    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        command_msg.data = a_goal_vel
        command_a_pub.publish(command_msg)

        # if sensor_1:
        #     command_msg.data = 2.0 * math.sin(4*time.time())
        command_msg.data = b_goal_vel
        if b_sensor_2:
            command_msg.data = 0.0
        # elif sensor_3:
        #     command_msg.data = -1.0
        # else:
        #     command_msg.data = 2.0 * \
        #         math.sin(2*time.time()) + 1.5 * math.sin(4*time.time())
        command_b_pub.publish(command_msg)
        rate.sleep()
