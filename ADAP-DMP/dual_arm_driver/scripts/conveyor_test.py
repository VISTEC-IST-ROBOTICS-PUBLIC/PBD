#!/usr/bin/env python
from ConveyorInterface import Automation
import rospy
import time
if __name__ == "__main__":
    conveyor_control = Automation()
    rate = rospy.Rate(50)
    # Waiting for subscribe topic
    time.sleep(2)
    while not rospy.is_shutdown():
        # Set conveyor speed
        conveyor_state = conveyor_control.setSpeed_B(0.015)
        conveyor_control.debug_conveyor()

        rate.sleep()
    
