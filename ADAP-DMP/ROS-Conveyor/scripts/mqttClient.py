#!/usr/bin/env python
import paho.mqtt.client as mqtt
import time
import os

# Define state
state_dict = {
  "WAITING_STATE" : 0,
  "START_DRONE_OP": 1,
  "START_MIR_OP": 2,
  "START_UR_OP": 3
}

class MQTTClient: 
  
    # Initializing  
    def __init__(self, name, broker_address, topic_name ): 
        
        self.broker_address = broker_address
        self.name = name
        self.topic_name = topic_name

        # Create new instance
        self.client = mqtt.Client( self.name ) 
        print( "Connecting to server" )
        self.client.connect( self.broker_address ) # connect to broker

        # Attach callback function
        self.client.on_message = self.callback
        self.client.on_publish = self.on_publish

        self.client.subscribe( self.topic_name, qos = 0 )
        print( "Subscribing to topic : " + self.topic_name )
        # start the loop
        self.client.loop_start()

        # declare state variable
        self.current_demo_state = 0
        self.sent_status = False
  
    # Calling destructor 
    def __del__(self): 
        self.client.loop_stop() 
        print("Disconnection from server") 


    def callback( self, client, userdata, message ):

        data = int(message.payload.decode("utf-8"))
        topicName = message.topic
        qos = message.qos
        retain_flag = message.retain
        
        if retain_flag == 0:
            self.current_demo_state = data

    # create function for callback
    def on_publish( self, client, userdata, result ): 
        self.sent_status = True

    def publish( self, data ):
        self.client.publish( self.topic_name , data, qos = 0 )
        time.sleep(0.01)

        if self.sent_status:
            self.sent_status = False # reset flag
            return True
        else:
            return False

    def get_state( self ):
        return self.current_demo_state

if __name__ == '__main__':

    mqttClient = MQTTClient( name = "Robot_1", broker_address = "192.168.1.21", topic_name = "/Demo/state" )
    try:
         print mqttClient.get_state()
         while True:
             ret =  mqttClient.publish(state_dict["START_DRONE_OP"])
             if ret:
                 break

         print mqttClient.get_state()



    except KeyboardInterrupt:
        pass






