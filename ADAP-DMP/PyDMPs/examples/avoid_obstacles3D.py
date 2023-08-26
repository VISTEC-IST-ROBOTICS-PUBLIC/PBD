"""
Copyright (C) 2016 Travis DeWolf

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""

import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm

import pydmps.dmp_discrete

beta = 20 / np.pi
gamma_low = 10
gamma_high = 1000
R_halfpi = np.array(
    [
        [np.cos(np.pi / 2.0), -np.sin(np.pi / 2.0)],
        [np.sin(np.pi / 2.0), np.cos(np.pi / 2.0)]
    ]
)

obstacles = [[0.6,0.1,0.05],[0.8,0.6,0.05],[0.2,0.3,0.1]] # x,y,r

def avoid_obstacles(y, dy,goal):
    # Accept only 2D array x and y axis
    p = np.zeros_like(goal)
    gamma = gamma_low
    for obstacle in obstacles:
        # if we're moving
        if np.linalg.norm(dy) > 1e-5:
            
            # calculate vector to object relative to body
            obj_vec = obstacle[:2] - y + np.random.random(2) *0.001

            if np.linalg.norm(obj_vec) >= obstacle[2] + 0.1:
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

def avoid_obstacles_APF(y, dy,goal):
    # Accept only 2D array x and y axis
    p = np.zeros_like(goal)
    gamma = gamma_low
    for obstacle in obstacles:
        # if we're moving
        if np.linalg.norm(dy) > 1e-5:
            
            # calculate vector to object relative to body
            obj_vec = obstacle[:2] - y + np.random.random(2) *0.001

            if np.linalg.norm(obj_vec) >= obstacle[2] + 0.1:
                gamma = gamma_low
            else:
                gamma = gamma_high

            dot_product = np.dot(obj_vec.T/np.linalg.norm(obj_vec), dy/np.linalg.norm(dy))

            phi = np.arccos(dot_product)

            dphi = gamma * phi * np.exp(-beta * abs(phi))
            R = np.dot(R_halfpi, np.outer(obstacle[:2] - y, dy))
            pval = -np.nan_to_num(np.dot(R, dy) * dphi)


            p[:2] += pval
            
    return p

def data_for_cylinder_along_z(center_x,center_y,radius,height_z):
    z = np.linspace(0, height_z, 50)
    theta = np.linspace(0, 2*np.pi, 50)
    theta_grid, z_grid=np.meshgrid(theta, z)
    x_grid = radius*np.cos(theta_grid) + center_x
    y_grid = radius*np.sin(theta_grid) + center_y
    return x_grid,y_grid,z_grid

# test normal run
dmp = pydmps.dmp_discrete.DMPs_discrete(n_dmps=3, n_bfs=10, w=np.zeros((3, 10)))
y_track = np.zeros((dmp.timesteps, dmp.n_dmps))
dy_track = np.zeros((dmp.timesteps, dmp.n_dmps))
ddy_track = np.zeros((dmp.timesteps, dmp.n_dmps))

# goals = [[np.cos(theta), np.sin(theta)] for theta in np.linspace(0, 2 * np.pi, 20)[:-1]]
goals = [[1.0,1.0,0.5]]
for goal in goals:
    dmp.goal = goal
    dmp.reset_state()
    for t in range(dmp.timesteps):
        y_track[t], dy_track[t], ddy_track[t],_ = dmp.step(
            external_force=avoid_obstacles(dmp.y[:2], dmp.dy[:2],goal)
        )

    fig = plt.figure()
    ax = plt.axes(projection='3d')
    ax.plot3D(y_track[:, 0], y_track[:, 1], y_track[:, 2], 'b')

    for obstacle in obstacles:
        Xc,Yc,Zc = data_for_cylinder_along_z(obstacle[0],obstacle[1],obstacle[2],1.0)
        ax.plot_surface(Xc, Yc, Zc, alpha=0.5)
   


plt.show()
