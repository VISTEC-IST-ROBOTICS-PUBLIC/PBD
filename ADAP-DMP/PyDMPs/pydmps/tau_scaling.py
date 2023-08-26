import numpy as np
import matplotlib.pyplot as plt


class TauScaling:

    def __init__(self, tau_desire, pos_init_d ,goal_init_d ,dt, Kt=100.0):
        self.tau_d  = tau_desire
        self.tau = self.tau_d
        self.dtau_g = 0
        self.g_init = goal_init_d
        self.pos_init = pos_init_d
        self.pos_init_d = pos_init_d
        self.dt = dt
        self.Kt = Kt
        
        self.tau_g = tau_desire
        self.prev_tau_g = self.tau_g
        self.prev_e = 0

    def rollout_test(self, run_time):
        """Generate goal for open loop movements.
        """
        num_step = int(run_time / dt)
        tau_track = np.zeros(num_step)
        dtau_track = np.zeros(num_step)

        self.reset_state()
        goal_mock = 1
        for t in range(num_step):
            if (t <= 60) and (t>=20):
                tau_track[t], dtau_track[t] = self.step(goal = goal_mock)
                goal_mock += (2 - goal_mock) * 0.18
            else:
                tau_track[t], dtau_track[t] = self.step(goal = goal_mock)
        print(goal_mock)
        return tau_track, dtau_track

    def reset_state(self):
        """Reset the system state"""
        pass

    def set_pos_start(self, pos, start_tau):
        # self.dtau_g = 0
        self.pos_init = pos
        self.tau = start_tau
        self.prev_e = 0


    def step(self, goal, error, K_pe = 100, leash_max = 10, leash_min = 0.1 ):
        # temporal scaling by goal
        norm_distance = np.linalg.norm(goal -  self.pos_init)
        norm_distance = np.clip(norm_distance, leash_min, leash_max)

        self.tau_g =  ( norm_distance / np.linalg.norm(self.g_init -  self.pos_init_d) )
        self.tau_g *= self.tau_d
       
        # visualize data fix error plot
        error_retention = 0.02 * np.linalg.norm(error) + 0.98 *self.prev_e
        self.tau_g += np.linalg.norm(error_retention) * K_pe

        # self.dtau_g = (self.tau_g - self.prev_tau_g) / self.dt

        tau_error = (self.tau_g - self.tau)

        # tau controller
        dtau = self.Kt* tau_error #+ self.dtau_g

        # add temporal scaling
        self.tau += dtau * self.dt
        self.prev_tau_g = self.tau_g

        self.prev_e = error_retention


        return np.copy(self.tau), np.copy(self.tau_g)


# ==============================
# Test code
# ==============================
if __name__ == "__main__":
    dt = 0.01
    tau_d = 3.0
    pos_init = 0
    goal_init = 1
    TS = TauScaling( tau_d, pos_init, pos_init, goal_init ,dt, Kt=100.0)
    # test normal rollout
    tau, dtau = TS.rollout_test(run_time = 1)


    fig, ax1 = plt.subplots(figsize=(6, 3))
    ax1.plot(tau, lw=2)
    ax1.plot(dtau, lw=2)
   
    plt.grid()
    plt.legend(["tau","dtau"])
    plt.xlabel("time (s)")
    plt.ylabel("tau")
    plt.title("tau scaling system")


    plt.show()
