## Middleware Setup
This setup designed for the **PC-B** machine to be middleware between ROS1 for robot control tasks on **PC-A** and ROS2 for computer vision tasks on **PC-B**.

#### Install dependencies
```sh
sudo apt install -y cmake build-essential libyaml-cpp-dev libboost-program-options-dev libssl-dev libwebsocketpp-dev python3-colcon-common-extensions git
```

#### Create new workspace & clone neccessary packages
- [eProsima](https://www.eprosima.com/) Integration Service Core
- ROS 1 System Handle
- ROS 2 System Handle
```sh
mkdir -p ~/is-workspace/src && cd ~/is-workspace
git clone https://github.com/eProsima/Integration-Service.git src/Integration-Service --recursive
git clone  https://github.com/eProsima/ROS2-SH src/ROS2-SH
git clone  https://github.com/eProsima/ROS1-SH src/ROS1-SH
```

#### Prepare ROS1 and ROS2 packages for custom message & service
- [ROS1 custom msgs workspace](../middleware/ros1_ws)
- [ROS2 custom msgs workspace](../middleware/ros2_ws)
```sh
# Just copy both of them from this repo to your home folder
cp $(PBD_path)/middleware/ros1_ws ~/
cp $(PBD_path)/middleware/ros2_ws ~/
```

#### Build ROS1 msgs package
```sh
# Open new session
cd ~/ros1_ws                                                # Enter the workspace
source /opt/ros/noetic/setup.bash                           # Source ROS1 installtion
catkin_make -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic install  # Build & install packages
```
#### Build ROS2 msgs package
```sh
# Open new session
cd ~/ros2_ws                    # Enter the workspace
source /opt/ros/foxy/setup.bash # Source ROS2 installation
colcon build                    # Build & install packages
```
#### Generate .mix for target message(*.msg)/service(*.srv)
```sh
# Open new session
cd ~/is-workspace                   # Enter the workspace
source /opt/ros/foxy/setup.bash     # Source ROS2 installation
source ~/ros2_ws/install/setup.bash # Source ROS2 workspace
# Build only ROS2 packages (vlib_msgs)
colcon build --packages-skip-regex is-ros1 --cmake-args -DMIX_ROS_PACKAGES="geometry_msgs" -DMIX_ROS2_PACKAGES="vlib_msgs"
source /opt/ros/noetic/setup.bash   # Source ROS1 installation
source ~/ros1_ws/devel/setup.bash   # Source ROS1 workspace
# Build remaining packages (dual_arm_msgs)
colcon build --cmake-args -DMIX_ROS_PACKAGES="geometry_msgs" -DMIX_ROS1_PACKAGES="dual_arm_msgs"
```
Now you can launch the integration-service to bridge the communication between **ROS1 &harr; ROS2**.

##### Content inside [camera_calibration.yaml](../middleware/ros2_ws/src/vlib_msgs/is/UR5e_demo/camera_calibration.yaml)
```yaml
types:
    idls:
        - >
            #include "geometry_msgs/Pose.idl"
            #include "std_msgs/UInt8.idl"
            struct MoveRobotToNextPose_Request
            {
            	UInt8 command;
            	Pose terget_pose;
            };
            
            struct MoveRobotToNextPose_Response
            {
            	UInt8 error;
            };
            
systems:
    ros1: { type: ros1 }
    ros2: { type: ros2 }

routes:
    ros1_to_ros2: { from: ros1, to: ros2 }
    ros2_to_ros1: { from: ros2, to: ros1 }
    ros1_server:
        server: ros1
        clients: [ros2]

topics:
    tcp_pose: { type: "geometry_msgs/PoseStamped", route: ros1_to_ros2 }
    robot_moving: { type: "std_msgs/UInt8", route: ros1_to_ros2 }
    obstacle_position: { type: "geometry_msgs/Vector3Stamped", route: ros2_to_ros1 }

services:
    move_robot: {
        request_type: MoveRobotToNextPose_Request,
        reply_type: MoveRobotToNextPose_Response,
        route: ros1_server,
        remap: {
            ros1: {
                request_type: "dual_arm_msgs/MoveRobotToNextPose:request",
                reply_type: "dual_arm_msgs/MoveRobotToNextPose:response"
            },
            ros2: {
                request_type: "vlib_msgs/MoveRobotToNextPose:request",
                reply_type: "vlib_msgs/MoveRobotToNextPose:response"
            }
        }
    }

```