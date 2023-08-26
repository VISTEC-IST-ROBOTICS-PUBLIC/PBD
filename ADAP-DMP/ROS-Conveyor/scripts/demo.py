#!/usr/bin/env python
import rospy
from std_srvs.srv import Trigger, TriggerResponse
from std_msgs.msg import Float32,Bool
from ros_conveyor.msg import conveyor
import time
from mqttClient import MQTTClient,state_dict
sub_state = 0

class Automation:

    dataA = 0
    dataB = 0
    timeoutA = time.time()
    timeoutB = time.time()
    sensor_a_1 = False
    sensor_a_2 = False
    sensor_a_3 = False
    sensor_b_1 = False
    sensor_b_2 = False
    sensor_b_3 = False
    current_a_vel = 0.0

    def __init__(self):
        rospy.init_node("command_conveyor")
        rospy.Subscriber("commandA", Float32,self.getComA)  # unit [m/s]
        rospy.Subscriber("commandB", Float32,self.getComB)  # unit [m/s]
        rospy.Subscriber("conveyorA/state", conveyor, self.sensorA)
        rospy.Subscriber("conveyorB/state", conveyor, self.sensorB)
        rospy.Subscriber("conveyorB/start", Float32, self.startB)

        #rospy.wait_for_service('/call_robot')

        #result = sos_service(sos)

        
        self.pubA = rospy.Publisher("conveyorA/command", Float32, queue_size=10)
        self.pubB = rospy.Publisher("conveyorB/command", Float32, queue_size=10)


    def sensorA(self,msg):
        self.sensor_a_1 = msg.sensor_1
        self.sensor_a_2 = msg.sensor_2
        self.sensor_a_3 = msg.sensor_3
        self.current_a_vel = msg.current_vel

    def sensorB(self,msg):
        self.sensor_b_1 = msg.sensor_1
        self.sensor_b_2 = msg.sensor_2
        self.sensor_b_3 = msg.sensor_3

    def startB(self,msg):
        self.start_b = msg.data

    def getComA(self,msg):
        self.dataA = msg.data
        self.timeoutA = time.time()

    def getComB(self,msg):
        self.dataB = msg.data
        self.timeoutB = time.time()

    def state(self):
        if self.sensor_a_2 == True:
            state = 1
        elif self.sensor_a_2 == False:
            state = 0
            self.dataA = -0.1
        return state

    def pushCommand(self,order):
        if order == 0:
            if self.dataA > self.current_a_vel:
                conveyorA = self.current_a_vel + 0.01
                self.pubA.publish(conveyorA)
            if self.dataA < self.current_a_vel:
                conveyorA = self.current_a_vel - 0.01
                self.pubA.publish(conveyorA)
        
        elif order == 1:
            conveyorA = 0






if __name__ == "__main__":

    a = Automation()
    rate = rospy.Rate(10)
    sub_state = 0
    while not rospy.is_shutdown():
        while a.startB == None:
            print("asdfsadf")
        #print sub_state
        if sub_state == 1:
            a.pushCommand(0)
        if sub_state == 2:
            a.pushCommand(1)
            break

            
    rate.sleep()
