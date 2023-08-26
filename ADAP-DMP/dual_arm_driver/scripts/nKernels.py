#!/usr/bin/env python

import numpy as np
import pydmps
from pandas import read_csv
import matplotlib.pyplot as plt

def calculate_nKernel(df_filename, dft_filename):
    dt = 0.01
    run_time = 1

    df = read_csv(df_filename)
    data = df.values

    dft = read_csv(dft_filename)
    time_data = dft.values

    pos_path = data

    x = 0
    while x < 100:
        nKernel = 10 + (x * 10)
        dmp = pydmps.dmp_discrete.DMPs_discrete(n_dmps=3, n_bfs=nKernel, dt=dt, ax=4.6)
        pos = dmp.imitate_path(y_des=np.array([pos_path[:, 0], pos_path[:, 1], pos_path[:, 2]]), plot=False)

        tau = 1
        timesteps = int(tau / dt)
        n_dim = 3
        y_track = np.zeros((n_dim, timesteps))
        dy_track = np.zeros((n_dim, timesteps))
        ddy_track = np.zeros((n_dim, timesteps))
        cs_track = np.zeros(timesteps)
        cs_normal = np.zeros(timesteps)
        tau_track = np.zeros(timesteps)
        goals = np.zeros((n_dim, timesteps))
        pe = np.zeros((n_dim, timesteps))

        sp = pos[:, 0]
        gp = pos[:, -1]

        start_point1 = np.array(sp)
        initial_goal_point1 = np.array(gp)

        dmp.reset_state(y0=start_point1)
        dmp.goal = initial_goal_point1

        for t in range(timesteps):
            y, dy, ddy, cs = dmp.step(tau=tau, error=0)
            y_track[:, t] = np.copy(y)
            dy_track[:, t] = np.copy(dy)
            ddy_track[:, t] = np.copy(ddy)
            cs_track[t] = np.copy(cs)
            goals[:, t] = np.copy(dmp.goal)
            path_error = abs(y - pos[:, t])
            pe[:, t] = np.copy(path_error)


        mean_error = np.mean(pe, axis=1)
        if all(error <= 0.02 for error in mean_error):
            print("Mean Error")
            print(mean_error)
            break

        x += 1
    
    return nKernel, y_track, pos

def plot_results(y_track, pos):
    plt.figure(figsize=(10, 9))

    plt.subplot(3, 1, 1)
    plt.plot(y_track[0, :], 'b', label="latest dmp")
    plt.plot(pos[0, :], 'r', label="recorded path")
    plt.title("X Position")
    plt.ylabel('Position (m)')
    plt.legend()

    plt.subplot(3, 1, 2)
    plt.plot(y_track[1, :], 'b', label="latest dmp")
    plt.plot(pos[1, :], 'r', label="recorded path")
    plt.title("Y Position")
    plt.ylabel('Position (m)')
    plt.legend()

    plt.subplot(3, 1, 3)
    plt.plot(y_track[2, :], 'b', label="latest dmp")
    plt.plot(pos[2, :], 'r', label="recorded path")
    plt.title("Z Position")
    plt.xlabel('Timestep')
    plt.ylabel('Position (m)')
    plt.legend()

    plt.tight_layout()
    plt.show()
if __name__ == "__main__":
    df_filename = "zigzag_01_path.csv"
    dft_filename = "zigzag_01_time.csv"
    
    calculated_nKernel,y_track, pos = calculate_nKernel(df_filename, dft_filename)
    plot_results(y_track, pos)
    print("Calculated nKernel:", calculated_nKernel)
