import pydmps
import numpy as np
import matplotlib.pyplot as plt

def path_generator(dt):
    return np.sin(np.arange(0, 2*np.pi, dt) * 2)



if __name__ == "__main__":


    # initial Periodic DMP
    dt_generator = 0.01
    dt_dmp = 0.01
    n_bfs = 100 # number of kernel
    dmp = pydmps.dmp_rhythmic.DMPs_rhythmic(n_dmps=1, n_bfs = n_bfs, dt=dt_dmp)

    # get path for imitate
    path = path_generator(dt_generator)

    dmp.imitate_path(y_des=np.array(path),plot= True)


    tau = 1.0 # time scaling factor
    timestep = dmp.timesteps

    y_track = []
    dmp.reset_state()
    for t in range(timestep+1):
        y_track.append(np.copy(dmp.y))
        y, dy, ddy, cs = dmp.step(tau = tau)
        # y_track.append(np.copy(y))
    y_track = np.array(y_track)

    time_ms = np.arange(0, 2 * np.pi, dt_generator)
    plt.figure(1)
    a = plt.plot(path, "r--", lw=2)
    b = plt.plot(y_track,"b", lw=2)
    plt.title("DMP imitate path")
    plt.xlabel("time (ms)")
    plt.ylabel("system trajectory")
    plt.legend([a[0],b[0]], ["desired path","dmp path"], loc="upper right")
    plt.show()