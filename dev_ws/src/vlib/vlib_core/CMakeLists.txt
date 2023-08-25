cmake_minimum_required(VERSION 3.10)
project(vlib_core)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(image_transport REQUIRED)
find_package(cv_bridge REQUIRED)
find_package(std_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(realsense2_camera_msgs REQUIRED)
find_package(nav_msgs REQUIRED)
find_package(vlib_msgs REQUIRED)
find_package(ament_cmake_auto REQUIRED)
find_package(OpenCV REQUIRED)
find_package(tf2_ros REQUIRED)
find_package(tf2 REQUIRED)
find_package(diagnostic_updater REQUIRED)

# copy launch file
install(DIRECTORY
  launch
  DESTINATION share/${PROJECT_NAME}/
)

include_directories("/usr/local/include")
link_directories("/usr/lib")
add_definitions(${OpenCV_DEFINITIONS})

#including GStreamer header files directory
include_directories(
        ${GLIB_INCLUDE_DIRS}
        ${GSTREAMER_INCLUDE_DIRS}
)

link_directories(
        ${GLIB_LIBRARY_DIRS}
        ${GSTREAMER_LIBRARY_DIRS}
)

# include_directories(${PCL_INCLUDE_DIRS})
# link_directories(${PCL_LIBRARY_DIRS})
# add_definitions(${PCL_DEFINITIONS})

# Simple non robust way to find the librealsense library
find_library(REALSENSE2_FOUND realsense2 HINTS ${LIBRARY_DIR} REQUIRED)
if(NOT REALSENSE2_FOUND)
    SET(REALSENSE2_FOUND "realsense2")
    message(WARN "Failed to find_library(realsense2)")
endif()


add_executable(test_dice_counter src/test/opencv/dice_counter.cpp)
add_executable(test_cap_v4l2 src/test/opencv/cap_v4l2.cpp)
add_executable(test_cap_gstreamer src/test/opencv/cap_gstreamer.cpp)
# tell it to link the executable target against OpenCV
target_link_libraries(test_dice_counter ${OpenCV_LIBS} )
target_link_libraries(test_cap_v4l2 ${OpenCV_LIBS} )

target_link_libraries(test_cap_gstreamer ${OpenCV_LIBS} ${GSTREAMER_LIBRARIES})

# target_include_directories(camera_realsense PUBLIC
#   $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
#   $<INSTALL_INTERFACE:include>)

# Install Cpp executables
install(TARGETS test_dice_counter test_cap_v4l2 test_cap_gstreamer
  DESTINATION lib/${PROJECT_NAME})


# Install Python modules
#ament_python_install_package(${PROJECT_NAME})
# Install Python executables
install(PROGRAMS
  scripts/camera.py
  scripts/aruco_scan.py
  scripts/aruco_cube.py
  scripts/aruco_gridboard.py
  scripts/aruco_frame_pointcloud.py
  scripts/scanner/gridboard_scan.py
  scripts/demo/UR5e/camera_frame_calibration.py
  scripts/demo/UR5e/cup_detector.py
  DESTINATION lib/${PROJECT_NAME}
)


if(BUILD_TESTING)
  find_package(ament_cmake_gtest REQUIRED)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

#ament_package()
ament_auto_package(INSTALL_TO_SHARE)
