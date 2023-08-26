import rospy
from std_msgs.msg import Float32
import time


dataA = 0
dataB = 0
rospy.init_node("command_conveyor")
timeoutA = time.time()
timeoutB = time.time()
def getComA(msg):
    global dataA, timeoutA
    dataA = msg.data
    timeoutA = time.time()

def getComB(msg):
    global dataB, timeoutB
    dataB = msg.data
    timeoutB = time.time()

def listener():
    rospy.Subscriber("commandA", Float32,getComA)  # unit [m/s]
    rospy.Subscriber("commandB", Float32,getComB)  # unit [m/s]
	
def talker():
    global dataA, dataB, timeoutA, timeoutB
    conveyorA = 0
    conveyorB = 0
    pubA = rospy.Publisher("conveyorA/command", Float32, queue_size=10)
    pubB = rospy.Publisher("conveyorB/command", Float32, queue_size=10)
    rate = rospy.Rate(5) # 10hz
    while not rospy.is_shutdown():
        if time.time() - timeoutA > 1.0:
            conveyorA = 0 #if pub now servo will on 
        else :
            if dataA > conveyorA:
                conveyorA = conveyorA + 0.005
                pubA.publish(conveyorA)
            if dataA < conveyorA:
                conveyorA = conveyorA - 0.005
                pubA.publish(conveyorA)
        if time.time() - timeoutB > 1.0:
            conveyorB = 0
        else :
            if dataB > conveyorB:
                conveyorB = conveyorB + 0.005
                pubB.publish(conveyorB)
            if dataB < conveyorB:
                conveyorB = conveyorB - 0.005
                pubB.publish(conveyorB)

        #pubA.publish(conveyorA)
        #pubB.publish(conveyorB)
        # print(dataA)
        # print(conveyorA)
        rate.sleep()
    


if __name__ == "__main__":

    listener()
    talker()

    rospy.spin()
