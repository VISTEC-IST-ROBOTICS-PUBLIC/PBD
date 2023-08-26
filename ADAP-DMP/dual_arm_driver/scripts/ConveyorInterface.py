#!/usr/bin/env python
import rospy
from std_srvs.srv import Trigger, TriggerResponse
from std_msgs.msg import Float32,Bool
from ros_conveyor.msg import conveyor
import time
from mqttClient import MQTTClient,state_dict
import Tkinter as tk
import tkMessageBox 
import tkFont

def trigger_response(request):
    return TriggerResponse(
        success=True,
        message="Hey, Run UR now!!!"
    )

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

        # rospy.Subscriber("commandA", Float32,self.getComA)  # unit [m/s]
        # rospy.Subscriber("commandB", Float32,self.getComB)  # unit [m/s]

        rospy.Subscriber("conveyorA/state", conveyor, self.ConveyorA_state)
        rospy.Subscriber("conveyorB/state", conveyor, self.ConveyorB_state)

        #rospy.wait_for_service('/call_robot')

        #result = sos_service(sos)

        
        self.pubA = rospy.Publisher("conveyorA/command", Float32, queue_size=10)
        self.pubB = rospy.Publisher("conveyorB/command", Float32, queue_size=10)

        self.main = tk.Tk()
        self.main.geometry('1500x300')
        button = tk.Button(self.main, 
                        text = 'Warning, Could not start service', 
                        command=self.quit)
        #tkMessageBox.showwarning("Warning","Could not start service")
        button.pack()
        button['font'] = tkFont.Font(size=30)


    def ConveyorA_state(self,msg):
        self.sensor_a_1 = msg.sensor_1
        self.sensor_a_2 = msg.sensor_2
        self.sensor_a_3 = msg.sensor_3
        self.current_a_vel = msg.current_vel
        self.target_a_vel = msg.target_vel

    def ConveyorB_state(self,msg):
        self.sensor_b_1 = msg.sensor_1
        self.sensor_b_2 = msg.sensor_2
        self.sensor_b_3 = msg.sensor_3
        self.current_b_vel = msg.current_vel
        self.target_b_vel = msg.target_vel

    def debug_conveyor(self):
        if abs(self.current_a_vel - self.target_a_vel) >= 0.1  :
            self.main.mainloop()
        if abs(self.current_b_vel - self.target_b_vel) >= 0.1  :
            self.main.mainloop()

        else:
            pass

    def quit(self):
                self.main.destroy()

    # def getComA(self,msg):
    #     self.dataA = msg.data
    #     self.timeoutA = time.time()

    # def getComB(self,msg):
    #     self.dataB = msg.data
    #     self.timeoutB = time.time()

    # def state(self):
    #     if self.sensor_a_2 == True:
    #         state = 1
    #     elif self.sensor_a_2 == False:
    #         state = 0
    #         self.dataA = -0.1
    #     return state

    def setSpeed_A(self,speed):
        
        if speed > self.current_a_vel:
            conveyorA = self.target_a_vel + 0.001
            self.pubA.publish(conveyorA)
        if speed < self.current_a_vel:
            conveyorA = self.target_a_vel - 0.001
            self.pubA.publish(conveyorA)
        if abs(speed - self.current_a_vel) <= 0.001:
            conveyorA = self.target_a_vel
            self.pubA.publish(conveyorA)

    def setSpeed_B(self,speed):
        
        if speed > self.current_b_vel:
            conveyorB = self.target_b_vel + 0.001
            self.pubB.publish(conveyorB)
        if speed < self.current_b_vel:
            conveyorB = self.target_b_vel - 0.001
            self.pubB.publish(conveyorB)
        if abs(speed - self.current_b_vel) <= 0.001:
            conveyorB = self.target_b_vel
            self.pubB.publish(conveyorB)
        


        """
        if time.time() - self.timeoutB > 1.0:
            conveyorB = 0
        else :
            conveyorB = 0
            if self.dataB > conveyorB:
                conveyorB = conveyorB + 0.01
                #self.pubB.publish(conveyorB)
            if self.dataB < conveyorB:
                conveyorB = conveyorB - 0.01
                #self.pubB.publish(conveyorB)
        #pubA.publish(conveyorA)
        #pubB.publish(conveyorB)
        #print(dataA)
        #print(conveyorA) 
        """




if __name__ == "__main__":

    """

    a = Automation()
    run = True
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        state = mqttClient.get_state()
        print state
        if state == state_dict["START_UR_OP"]:
            print("I LOVE THE KING T'CHALLA")
            
            while run == True:
                conveyor_state = a.state()
                if conveyor_state == 0:
                    a.pushCommand(conveyor_state)
                elif conveyor_state == 1:
                    a.pushCommand(conveyor_state)
                    
                    break
            push = raw_input("a : run,s : stop\n")
            if push == "a":
                run = True
            else:
                run = False
                break
    """
    #rate.sleep()
