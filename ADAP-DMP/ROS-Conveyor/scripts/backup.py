#!/usr/bin/env python
import rospy
from std_msgs.msg import Float32
from ros_conveyor.msg import conveyor

from pyModbusTCP import utils
from pyModbusTCP.client import ModbusClient
import time
import math


class ConveyorNode(object):
    __reg_A_servo_on = 0
    __reg_A_command = 1
    __reg_A_velocity = 2
    __reg_B_servo_on = 3
    __reg_B_command = 4
    __reg_B_velocity = 5

    def __init__(self):
        rospy.init_node("conveyor_node")
        rospy.loginfo("Starting ConveyorNode as conveyor_node.")
        host = rospy.get_param("~host", default="192.168.1.21")
        port = rospy.get_param("~port", default=502)
        publish_rate = rospy.get_param("~rate", default=20)
        self.ratio_vel_A = rospy.get_param("~ratio_vel_A", default="1")
        self.ratio_vel_B = rospy.get_param("~ratio_vel_B", default="1")
        self.ratio_cmd_A = rospy.get_param("~ratio_cmd_A", default="1")
        self.ratio_cmd_B = rospy.get_param("~ratio_cmd_B", default="1")
        self.min_vel = rospy.get_param("~min_vel", default="-0.2")
        self.max_vel = rospy.get_param("~max_vel", default="0.2")

        self.rate = rospy.Rate(publish_rate)

        rospy.Subscriber("conveyorA/command", Float32,
                         self.set_velocityA)  # unit [m/s]
        self.stateA_pub = rospy.Publisher(
            "conveyorA/state", conveyor, queue_size=1)  # state of conveyor
        rospy.Subscriber("conveyorB/command", Float32,
                         self.set_velocityB)  # unit [m/s]
        self.stateB_pub = rospy.Publisher(
            "conveyorB/state", conveyor, queue_size=1)  # state of conveyor

        self.stateA_msg = conveyor()
        self.stateA_msg.target_vel = 0.0
        self.stateA_msg.current_vel = 0.0
        self.stateB_msg = conveyor()
        self.stateB_msg.target_vel = 0.0
        self.stateB_msg.current_vel = 0.0

        self.__timeout_timeA = time.time()
        self.__timeout_timeB = time.time()

        try:
            self.client = ModbusClient(host, port, auto_open=True)
            rospy.loginfo("Setup complete")
        except ValueError:
            rospy.logerr("Error with conveyor Host or Port params")

        self.__register_data = None
        self.__input_data = None

    @staticmethod
    def clamp(n, minn, maxn):
        return max(min(maxn, n), minn)

    @staticmethod
    def map_velocity_to_value(velocity):
        # value = (velocity/0.05*100*2*math.pi*60)/500
        velocity = (velocity*60)/(0.052*2*math.pi*4)
        value = int(velocity/10.0*27648.0)
        return utils.get_2comp(value) & 0xFFFF

    @staticmethod
    def map_value_to_velocity(value):
        voltage = float(utils.get_2comp(value))/27648.0*10.0
        velocity = voltage*4.0*2.0*math.pi*0.052/60.0
        return velocity

    def set_velocityA(self, msg):
        # for loop +0.01
        i = 0
        while i < msg.data :
            i = i + 0.01
            self.stateA_msg.target_vel = self.clamp(
                i, self.min_vel, self.max_vel)  # [m/s]
            self.__timeout_timeA = time.time()

    def set_velocityB(self, msg):
        self.stateB_msg.target_vel = self.clamp(
            msg.data, self.min_vel, self.max_vel)  # [m/s]
        self.__timeout_timeB = time.time()

    def run(self):
        while not rospy.is_shutdown():
            try:
                self.__input_data = self.client.read_discrete_inputs(0, 6)
		#print self.__input_data                
		self.stateA_msg.sensor_1 = self.__input_data[0]
                self.stateA_msg.sensor_2 = self.__input_data[1]
                self.stateA_msg.sensor_3 = self.__input_data[2]

                self.stateB_msg.sensor_1 = self.__input_data[3]
                self.stateB_msg.sensor_2 = self.__input_data[4]
                self.stateB_msg.sensor_3 = self.__input_data[5]

                self.__register_data = self.client.read_holding_registers(
                    0, 6)
		print self.__register_data

                if time.time() - self.__timeout_timeA > 1.0:
                    self.stateA_msg.target_vel = 0
                    self.client.write_single_register(self.__reg_A_servo_on, 0)
                else:
                    value = self.map_velocity_to_value(
                        self.stateA_msg.target_vel)*self.ratio_cmd_A
                    self.client.write_single_register(self.__reg_A_servo_on, 1)
                    self.client.write_single_register(
                        self.__reg_A_command, value)

                if time.time() - self.__timeout_timeB > 1.0:
                    self.stateB_msg.target_vel = 0
                    self.client.write_single_register(self.__reg_B_servo_on, 0)
                else:
                    value = self.map_velocity_to_value(
                        self.stateB_msg.target_vel)*self.ratio_cmd_B
                    self.client.write_single_register(self.__reg_B_servo_on, 1)
                    self.client.write_single_register(
                        self.__reg_B_command, value)

                velocity = self.map_value_to_velocity(
                    self.__register_data[self.__reg_A_velocity])
                self.stateA_msg.current_vel = velocity*self.ratio_vel_A
                velocity = self.map_value_to_velocity(
                    self.__register_data[self.__reg_B_velocity])
                self.stateB_msg.current_vel = velocity*self.ratio_vel_B
                self.stateA_pub.publish(self.stateA_msg)
                self.stateB_pub.publish(self.stateB_msg)

            except Exception as e:
                rospy.logerr(e)

            self.rate.sleep()

            # rospy.loginfo(self.client.read_discrete_inputs(0, 14)) ## Read input bits
            # self.client.write_multiple_coils(
            #     0, [0]*10)  # Write output coils
            # rospy.loginfo(self.client.read_coils(0, 10))  # Read output coil
            # self.client.write_multiple_registers(reg, value)


if __name__ == "__main__":

    conveyor_node = ConveyorNode()
    conveyor_node.run()
