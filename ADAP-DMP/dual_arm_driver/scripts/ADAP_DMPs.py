#!/usr/bin/env python
from ast import Or
import math
import sys
from ur_msgs.srv import SetIO, SetIORequest
from geometry_msgs.msg import Vector3Stamped
from std_msgs.msg import Float32MultiArray
import moveit_commander
from moveit_msgs.msg import DisplayTrajectory
import rospy
import numpy as np
from pydmps.tau_scaling import TauScaling
from controller_manager_msgs.srv import SwitchController
import time
import pydmps
import tf
from pandas import read_csv
import matplotlib.pyplot as plt
from ros_conveyor.msg import conveyor
from nKernels import calculate_nKernel

class RobotControlNode:

    ################################## ROBOT FUNCTION SECTION START #####################################

    def suction(self,state):
        if state:
            state = SetIORequest.STATE_ON
            resp = self.set_io(SetIORequest.FUN_SET_DIGITAL_OUT, 2, state)
            time.sleep(2)
        else:
            state = SetIORequest.STATE_OFF
            resp = self.set_io(SetIORequest.FUN_SET_DIGITAL_OUT, 2, state)
            time.sleep(2)

    # Set robot to HOME position
    def goHome(self):
        pose_goal = self.move_group_A.get_current_pose()   
        pose_goal.pose.orientation.x = 0.501957593314
        pose_goal.pose.orientation.y = -0.864892232328
        pose_goal.pose.orientation.z = -2.95784997997e-05
        pose_goal.pose.orientation.w = 9.87880339902e-06
        pose_goal.pose.position.x = 0.270404582152
        pose_goal.pose.position.y = 0.737394709746
        pose_goal.pose.position.z = 1.14905726052 
        planA = self.move_group_A.plan(pose_goal)
        self.move_group_A.execute(planA, wait=True)
        self.move_group_A.stop()

    # Set robot to Go up side from current position
    def goUp(self,m):
        pose_goal = self.move_group_A.get_current_pose()
        pose_goal.pose.position.z += m
        planA = self.move_group_A.plan(pose_goal)
        self.move_group_A.execute(planA, wait=True)
        self.move_group_A.stop()

    ################################## ROBOT FUNCTION SECTION END #####################################

    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node("robot_control_node")
        rospy.loginfo("Starting RobotControlNode as robot_control_node.")
        self.set_io = rospy.ServiceProxy('ur_A_/ur_hardware_interface/set_io', SetIO)
        rospy.Subscriber("conveyorA/state", conveyor, self.ConveyorA_state)
        rospy.Subscriber("conveyorB/state", conveyor, self.ConveyorB_state)
        rospy.Subscriber("/obstacle_position", Vector3Stamped, self.Obstacle_callback)
        self.obj_pose_robot = None
        self.box_pose_robot = None
        self.current_a_vel = 0.0
        self.current_b_vel = 0.0
        self.obstacle_position = None
        self.obstacle_x = 0.0
        self.obstacle_y = 0.0
        self.obstacle_z = 0.0

        self.robot_A = moveit_commander.RobotCommander(robot_description="/robot_description",ns="")
        self.scene_A = moveit_commander.PlanningSceneInterface(ns="")
        self.move_group_A = moveit_commander.MoveGroupCommander("ur_A",robot_description="/robot_description",ns="")
        self.move_group_B = moveit_commander.MoveGroupCommander("ur_B",robot_description="/robot_description",ns="")
        self.display_trajectory_publisher_A = rospy.Publisher('/move_group/display_planned_path',DisplayTrajectory,queue_size=20)

        self.sos_service = rospy.ServiceProxy('/ur_A_/controller_manager/switch_controller', SwitchController)
        self.vel_A = rospy.Publisher("/dmp_A/vel", Float32MultiArray, queue_size=10)
        self.velocity = Float32MultiArray()
        self.plot_pub = rospy.Publisher("/plot", Float32MultiArray, queue_size=10)
        rospy.Timer(rospy.Duration(0.01), self.timer_callback)
        self.robot_pos = None
        self.robot_orientation = None
        self.is_got_robot_position = False
        self.listener = tf.TransformListener()
        self.plot(y=np.zeros(3),dy=np.zeros(3),robot_pos = np.zeros(3))

        
    def timer_callback(self,event):
        # Create a timer tp update robot position
        try:
            (robot_pos,rot) = self.listener.lookupTransform('/base_link', '/ur_A_tool0', rospy.Time(0))
            self.robot_pos = np.array(robot_pos)
            self.robot_orientation = np.array(rot)
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            pass
        
        if self.robot_pos is not None:
            self.is_got_robot_position = True

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

    def Obstacle_callback(self,msg):
        self.obstacle_x = msg.vector.x
        self.obstacle_y = msg.vector.y
        self.obstacle_z = msg.vector.z
        self.obstacle_matrix = np.array([self.obstacle_x,self.obstacle_y,self.obstacle_z,1])

    def range_filter(self, data,RANGE):
        if(data < RANGE[0]):
            data = RANGE[0]
        if(data > RANGE[1]):
            data = RANGE[1]

        return data

    # Transform camera to robot (Position)
    def Trans_c2r(self):
        # camera to robot homogeneous matrix
        CtoR = np.array([[ 0.08813732, -0.84460896,  0.52807908,  0.18370735],
                [-0.99572551, -0.06000721, 0.07021289, 0.03618754],
                [-0.02761388, -0.53201018, -0.84628756, 1.74743496],
                [ 0, 0, 0, 1]])
        
        trans = np.dot(CtoR,self.obstacle_matrix)

        return trans

    # Transform camera to robot (Path)
    def Camera2Robot_trajectory(self):
        # Homogeneous matrix from camera calibration #camera_frame_calibrate.py
        CtoR = np.array([[ 0.08813732, -0.84460896,  0.52807908,  0.18370735],
                [-0.99572551, -0.06000721, 0.07021289, 0.03618754],
                [-0.02761388, -0.53201018, -0.84628756, 1.74743496],
                [ 0, 0, 0, 1]])

        # Load path file
        df = read_csv('hand_path_3.csv', usecols = ['X','Y','Z'])
        dft = read_csv('hand_path_3.csv',usecols = ['timestamp'])
        data = df.values
        pos = []
        for i in range(len(data)):
            obj_camera = np.append(data[i] ,1)
            trans = np.dot(CtoR,obj_camera)
            pos.append(trans)

        pos = np.array(pos)
        data = pos[:,0:3]
        time_data = dft.values
        latest_time = time_data[-1]
        X_RANGE = np.array([0.35, 0.70])
        Y_RANGE = np.array([-0.20, 0.80])
        Z_RANGE = np.array([1.15, 1.35])

        # limit path
        limited_path = np.zeros(data.shape)
        for i in range(len(pos)):
            limited_path[i][0] = self.range_filter(pos[i][0],X_RANGE) 
            limited_path[i][1] = self.range_filter(pos[i][1],Y_RANGE) 
            limited_path[i][2] = self.range_filter(pos[i][2],Z_RANGE) 
        return limited_path,latest_time

    

    # Publish velocity comand to robot
    def vel(self,data):
        self.velocity.data = data 
        self.vel_A.publish(self.velocity)

    # Publish data to plotjuggler
    def plot(self,y,dy,robot_pos):
        msg = Float32MultiArray()
        msg.data = [y[0], y[1], y[2],dy[0],dy[1],dy[2],robot_pos[0],robot_pos[1],robot_pos[2]]
        self.plot_pub.publish(msg)

    def vel2pos(self):
        self.sos_service(['scaled_pos_joint_traj_controller'],['twist_controller'],2,False,0.0)

    def pos2vel(self):
        self.sos_service(['twist_controller'],['scaled_pos_joint_traj_controller'],2,False,0.0)

    def calculate_circle_edge(self,obstacles):
        self.circle_points = []
        
        for obstacle in obstacles:
            x, y, radius = obstacle
            obstacle_points = []
            
            for angle in range(100):
                # Convert angle to radians
                angle_rad = math.radians(angle)
                
                # Calculate point coordinates on the edge of the circle
                point_x = x + radius * math.cos(angle_rad)
                point_y = y + radius * math.sin(angle_rad)
                
                # Add the point to the obstacle points list
                obstacle_points.append((point_x, point_y, radius))
            
            # Add the obstacle points to the circle points list
            self.circle_points.extend(obstacle_points)
        
        return self.circle_points


    def avoid_obstacles(self, y, dy, goal, obstacle_pos):
        # Accept only 2D array x and y axis
        beta = 20 / np.pi
        gamma_low = 0
        gamma_high = 100
        R_halfpi = np.array(
            [
                [np.cos(np.pi / 2.0), -np.sin(np.pi / 2.0)],
                [np.sin(np.pi / 2.0), np.cos(np.pi / 2.0)]
            ]
        )

        obstacles = [[obstacle_pos[0], obstacle_pos[1],0.001]] # x,y,r
        obstacles = self.calculate_circle_edge(obstacles)
        p = np.zeros_like(goal)
        gamma = gamma_low
        for obstacle in obstacles:
            # if we're moving
            if np.linalg.norm(dy) > 1e-5:
                
                # calculate vector to object relative to body
                obj_vec = obstacle[:2] - y 

                if np.linalg.norm(obj_vec) >= obstacle[2] + 0.3:
                    gamma = gamma_low
                else:
                    gamma = gamma_high

                dot_product = np.dot(obj_vec/np.linalg.norm(obj_vec), dy/np.linalg.norm(dy))

                phi = np.arccos(dot_product)

                dphi = gamma * phi * np.exp(-beta * abs(phi))
                R = np.dot(R_halfpi, np.outer(obstacle[:2] - y, dy))
                pval = -np.nan_to_num(np.dot(R, dy) * dphi)


                p[:2] += pval
                
        return p
    


if __name__ == "__main__":

    robot_control_node = RobotControlNode()
    time.sleep(1)
    pos,time_recorded = robot_control_node.Camera2Robot_trajectory()
    robot_control_node.vel2pos()  

    # Init TauScaling variable
    dt = 0.01
    tau_d = time_recorded # + 5.0s For safety
    pos_init = pos[0]
    goal_init = pos[-1]
    TS = TauScaling( tau_d, pos_init, goal_init ,dt, Kt=10.0)
    print("Pos_d:",pos_init)
    print("Goal_d:",goal_init)
    print("Tau_d:",tau_d)

    # ROS rate frequency 
    hz = 100
    rate = rospy.Rate(hz)
    df_filename = "hand_path_3.csv"
    dft_filename = "hand_time_3.csv"
    calculated_nKernel, dmp_track, recorded_path = calculate_nKernel(df_filename, dft_filename)
    print("Calculated nKernel:", calculated_nKernel)

    n_bfs_calculated = calculated_nKernel

    ################################### DMP INITIALIZE SECTION START #####################################

    # Initial DMP instance for 3 axis
    dmp = pydmps.dmp_discrete.DMPs_discrete(n_dmps=3, n_bfs=n_bfs_calculated, dt=dt, ax = 4.6052)
    dmp.imitate_path(y_des= np.array([pos[:,0], pos[:,1], pos[:,2]]), plot =False)

    # Move robot to pick object by pre-program(+ get object from session above)
    robot_control_node.goHome()
    robot_control_node.goUp(0.15)

    # Waiting for get box_pose_robot and obj_pose_robot
    initial_goal_point = None
    initial_start_point = None
    while (initial_start_point is None):
        initial_start_point = robot_control_node.robot_pos

    # Wait until we get the robot position from tf
    while not robot_control_node.is_got_robot_position:
        pass
    
    # Start_point is tf robot_pos
    start_point = robot_control_node.robot_pos
    print("initial start point shape",initial_start_point.shape,initial_start_point)
    print("pos_init shape",pos_init.shape,pos_init)

    # Reset state of DMPs and set Start, Goal point
    dmp.reset_state( y0 = start_point )
    dmp.goal = goal_init

    # Checking goal position
    print("init goal position",goal_init)

    ################################### DMP INITIALIZE SECTION END #####################################

    # Switch contoller from joint Position To twist Velocity
    robot_control_node.pos2vel()

    # Initial Kp for PID
    Kp = np.array([0.6,0.6,0.6])
    time.sleep(3)

    # Record path setup
    path = []
    goals = []
    pf = [] #potential_field
    y_track = []

    # SET STATE HERE
    ef = 0 # ef = 0 : external_force is None

    goal = goal_init

    while not rospy.is_shutdown():
        tau, tau_g = TS.step(goal=goal, error = 0, K_pe = 100, leash_max = 10, leash_min = 0.1 )

        # DMP generate y, dy, ddy, cs
        # External_force is None
        if ef == 0:        
            y, dy, ddy, cs = dmp.step_Kober(tau=tau, error=0.0, external_force = None, goal = goal, goal_vel = np.array([ 0, 0, 0]))

        # External_force is Potential Field
        elif ef == 1:
            obstacle = robot_control_node.Trans_c2r()
            print(obstacle[0:3])
            y, dy, ddy, cs = dmp.step_Kober(tau=tau, error=0.0, 
            external_force = robot_control_node.avoid_obstacles(dmp.y[:2], dmp.dy[:2],goal,obstacle_pos=obstacle), 
            goal = goal, goal_vel = np.array([ robot_control_node.current_a_vel, robot_control_node.current_b_vel*-1, 0]))

        error_robot = np.copy(y - robot_control_node.robot_pos)
        vel = Kp*error_robot
        vel = vel + dy
        
        # publisher (dy) to twist controller
        robot_control_node.vel(vel)
        robot_control_node.plot(y,dy,robot_control_node.robot_pos)

        # Record path
        path.append(robot_control_node.robot_pos)
        goals.append(np.copy(dmp.goal))
        y_track.append(np.copy(y))

        # robot stop
        if cs<=0.01:
            print("robot position desire:", y)
            print("goal position:",goal)
            print("robot reached destination")
            print("Tau :",tau)
            print("Tau d:",tau_d)
            robot_control_node.vel(np.zeros(3))
            robot_control_node.suction(False)
            robot_control_node.vel2pos()
            robot_control_node.goHome()
            break
        rate.sleep()

    # command to stop robot
    robot_control_node.move_group_A.stop()

    ################################### PLOTING SECTION START #####################################

    path = np.array(path)
    goals = np.array(goals)
    y_track = np.array(y_track)
    pos = np.array(pos)
    
    fig = plt.figure(1)
    ax = plt.axes(projection="3d")
    ax.plot3D(path[:, 0], path[:, 1], path[:, 2], '.-b')
    ax.plot3D(goals[:, 0], goals[:, 1], goals[:, 2], 'purple')  
    ax.plot3D(pos[:, 0], pos[:, 1], pos[:, 2], '.-r')  # Red
    ax.plot3D(y_track[:, 0], y_track[:, 1], y_track[:, 2], '.-g')  
    if ef == 1:
        pf = np.array(robot_control_node.circle_points)
        ax.plot3D(pf[:, 0], pf[:, 1], pf[:, 2], '-g')
    plt.title("planing path")
    ax.set_xlabel('x (m)')
    ax.set_ylabel('y (m)')
    ax.set_zlabel('z (m)')
    plt.show()

    ################################### PLOTING SECTION END #####################################



    print("exit")
    sys.exit()
