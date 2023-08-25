from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource

from launch.actions import TimerAction
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import ComposableNodeContainer
from launch_ros.descriptions import ComposableNode
import os

def generate_launch_description():
    pkg_realsense = get_package_share_directory('realsense2_camera')
    start_camera = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(os.path.join(pkg_realsense, 'launch', 'rs_launch.py')),
        launch_arguments = {
            'camera_name': "RS_D435",
            'publish_tf': 'true',
            'pointcloud.enable': 'true',
            'pointcloud.stream_filter': '2',
            'pointcloud.stream_index_filter': '0'
        }.items()
    )

    aruco_scan = Node(
        package='vlib_core',
        executable='aruco_scan.py',
        name='aruco_scan',
        parameters=[{
            'image_topic': '/RS_D435/color/image_raw',
            'aruco_dict': 'DICT_4X4_100',
            'aruco_data_topic': '/RS_D435/aruco/data',
        }],
    )

    aruco_cube = Node(
        package='vlib_core',
        executable='aruco_cube.py',
        name='aruco_cube',
        parameters=[{
            'cube_info_path': 'config/aruco_cube/demo.json',
            'aruco_data_topic': '/RS_D435/aruco/data',
            'camera_info_topic': '/RS_D435/color/camera_info',
            'aruco_cube_pose_topic': '/RS_D435/aruco/poses',
            'color_camera_optical_frame': 'RS_D435_color_optical_frame',
        }],
    )
    # Camera calibration controller (use Socket to communicate with UR5e)
    camera_frame_calibration = Node(
        package='vlib_core',
        executable='camera_frame_calibration.py',
        name='camera_calibrator',
        parameters=[{
            'aruco_cube_pose_topic': '/RS_D435/aruco/poses',    # Aruco cube pose topic name
        }],
    )

    return LaunchDescription([
        start_camera,
        aruco_scan,
        aruco_cube
    ])