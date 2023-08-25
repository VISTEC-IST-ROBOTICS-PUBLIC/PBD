import numpy as np
from scipy.spatial.transform import Rotation as R
from pyquaternion import Quaternion as Q
import matplotlib.pyplot as plt

file_path = "/home/teera/dev_ws/poses.npz"
load = np.load(file_path)
print(load)
aruco_cube_pose_list = load['aruco_cube_pose']
tcp_pose_list = load['tcp_pose']

H_aruco_tcp = np.array([[1, 0, 0, 0],
                        [0, 1, 0, 0],
                        [0, 0, 1, 0.0175],
                        [0, 0, 0, 1]])
position_list, rotation_list = [], []
for i in range(len(aruco_cube_pose_list)):
    H_aruco_cam = np.eye(4)
    H_aruco_cam[:3, 3] = aruco_cube_pose_list[i][:3].T
    H_aruco_cam[:3, :3] = R.from_quat(aruco_cube_pose_list[i][3:]).as_matrix()
    H_tcp_robot = np.eye(4)
    H_tcp_robot[:3, 3] = tcp_pose_list[i][:3].T
    H_tcp_robot[:3, :3] = R.from_quat(tcp_pose_list[i][3:]).as_matrix()
    H_cam_robot = H_tcp_robot @ H_aruco_tcp @ np.linalg.inv(H_aruco_cam)
    position_list.append(H_cam_robot[:3, 3].T)
    rotation_list.append(H_cam_robot[:3, :3])
position_list = np.array(position_list)
rotation_list = np.array(rotation_list)

average_position = np.mean(position_list, axis=0)
print(average_position)
average_orientation = R.from_matrix(rotation_list).mean().as_matrix()
# print(average_orientation)
average_pose = np.eye(4)
average_pose[:3, :3] = average_orientation
average_pose[:3, 3] = average_position
print(average_pose)

fig = plt.figure()
ax = fig.add_subplot(projection='3d')
# Position plot
ax.scatter(position_list[:, 0],
           position_list[:, 1],
           position_list[:, 2],
           s=1,
           marker='o')
# Orientation arrow
arrow_length = 0.01
for i in range(1000):
    position = position_list[i].T
    rotM = rotation_list[i]
    x_arrow = rotM @ np.array([arrow_length, 0, 0])
    y_arrow = rotM @ np.array([0, arrow_length, 0])
    z_arrow = rotM @ np.array([0, 0, arrow_length])
    x, y, z = position
    dx, dy, dz = x_arrow
    ax.quiver(x, y, z, x_arrow[0], x_arrow[1], x_arrow[2], color='red', arrow_length_ratio=0.2)
    ax.quiver(x, y, z, y_arrow[0], y_arrow[1], y_arrow[2], color='green', arrow_length_ratio=0.2)
    ax.quiver(x, y, z, z_arrow[0], z_arrow[1], z_arrow[2], color='blue', arrow_length_ratio=0.2)



ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')
ax.set_xlim3d(-2, 2)
ax.set_ylim3d(-2, 2)
ax.set_zlim3d(-0, 2)

plt.show()