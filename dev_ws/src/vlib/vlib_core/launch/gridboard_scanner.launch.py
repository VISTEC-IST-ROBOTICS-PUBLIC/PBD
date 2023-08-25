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

    # Aruco gridboard scanner
    gridboard_scan = Node(
        package='vlib_core',
        executable='aruco_gridboard.py',
        name='gridboard_pose_finder',
        parameters=[{
            'aruco_dict': 'DICT_4X4_250',
            'image_topic': '/RS_D435/color/image_raw',
            'camera_info_topic': '/RS_D435/color/camera_info',
            'pointcloud_topic': '/RS_D435/depth/color/points',
            'gridboard_pose_topic': '/RS_D435/color/gridboard_pose',
            'coordinate_frame_id': 'RS_D435_color_optical_frame',
        }],
    )

    # Filter and transform PointCloud2 with Aruco GridBoard frame
    gridboard_pointcloud = Node(
        package='vlib_core',
        executable='aruco_frame_pointcloud.py',
        name='gridboard_pointcloud',
        parameters=[{
            'pointcloud_topic': '/RS_D435/depth/color/points',
            'gridboard_pose_topic': '/RS_D435/color/gridboard_pose',
            'gridboard_pointcloud_topic':'/RS_D435/depth/color/filtered_points',
            'scan_radius': 0.09,            # (m.)
            'scan_height': 0.3,             # (m.) Z-axis point toward GridBoard
            'scan_ground_suppress': 0.005,  # (m.) Remove point clouds closed to GridBoard (might be GridBoard itself)
        }],
    )

    gridboard_scanner = Node(
        package='vlib_core',
        executable='gridboard_scan.py',
        name='gridboard_scan',
        parameters=[{
            'gridboard_pointcloud_topic': '/RS_D435/depth/color/filtered_points',
        }],
    )

    ld = LaunchDescription()
    ld.add_action(start_camera)
    ld.add_action(gridboard_scan)
    ld.add_action(gridboard_pointcloud)
    ld.add_action(gridboard_scanner)
    # ld.add_action(TimerAction(period=5.0, # delay 5 second
    #                           actions=[gridboard_scan, gridboard_pointcloud])
    #               )
    return ld