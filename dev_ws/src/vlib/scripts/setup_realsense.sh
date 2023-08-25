pip install empy catkin_pkg lark
# Register the server's public key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
# Add the server to the list of repositories
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
# Install the libraries
sudo apt-get install -y librealsense2-dkms librealsense2-utils
# Optionally install the developer and debug packages
sudo apt-get install -y librealsense2-dev librealsense2-dbg
# With dev package installed, you can compile an application with librealsense using 
# g++ -std=c++11 filename.cpp -lrealsense2 
# or an IDE of your choice.
cd ~/dev_ws/src
git clone https://github.com/IntelRealSense/realsense-ros.git -b ros2-development
cd ~/dev_ws

sudo apt install ros-humble-control-msgs
sudo apt install ros-humble-realsense2-camera