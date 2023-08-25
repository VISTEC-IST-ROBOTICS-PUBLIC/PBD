./setup_nav2.sh
cd ~/dev_ws/src
git clone -b ros2 https://github.com/SteveMacenski/spatio_temporal_voxel_layer
cd ~/dev_ws
rosdep install --from-paths src --ignore-src -r -y
