cmake_minimum_required(VERSION 3.5)
project(vlib_description)

find_package(ament_cmake REQUIRED)

# Install files
install(DIRECTORY 
        launch
        config
        meshes
        models
        rviz
        urdf
        DESTINATION share/${PROJECT_NAME})

ament_package()
