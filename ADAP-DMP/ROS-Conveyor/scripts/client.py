#! /usr/bin/env python
# remember to make this file executable (`chmod +x`) before trying to run it

import rospy
from std_srvs.srv import Trigger, TriggerRequest

# init a node as usual
rospy.init_node('sos_service_client')

# wait for this service to be running
# Ideally, this service should run 24/7, but remember it's fake :) 
#rospy.wait_for_service('/fake_911')

# Create the connection to the service. Remeber it's a Trigger service
sos_service = rospy.ServiceProxy('/fake_911', Trigger)

# Create an object of type TriggerRequest. We need a TriggerRequest for a Trigger service
# We don't need to pass any argument because it doesn't take any
sos = TriggerRequest()
rate = rospy.Rate(10)
# Now send the request through the connection
while not rospy.is_shutdown():
    
    
    if sos_service != "":
        result = sos_service(sos)

        # Done, let's see the result!
        print result.success
    else:
        print("No message")
        break
rate.sleep()
