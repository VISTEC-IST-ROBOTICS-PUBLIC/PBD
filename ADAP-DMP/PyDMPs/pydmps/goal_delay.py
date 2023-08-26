import numpy as np
import matplotlib.pyplot as plt


class GoalDelaySystem:

    def __init__(self, goal_init ,dt, ag=10.0):

        self.g = goal_init
        self.run_time = 1.0
        self.dt = dt
        self.timesteps = int(self.run_time / self.dt)
        self.ag = ag

        self.reset_state()

    def rollout(self, **kwargs):
        """Generate goal for open loop movements.
        """
        if "tau" in kwargs:
            timesteps = int(self.timesteps * kwargs["tau"])
        else:
            timesteps = self.timesteps
        self.g_track = np.zeros(timesteps)

        self.reset_state()
        for t in range(timesteps):
            self.g_track[t] = self.r
            self.step(**kwargs)

        return self.g_track

    def reset_state(self, r_start = 0.0):
        """Reset the system state"""
        self.r = r_start

    def set_new_goal(self, g):
        self.g = g

    def step(self, tau=1.0):

        r_dot =  (self.ag * (self.g - self.r) ) / tau
        self.r += r_dot * self.dt

    
        return np.copy(self.r)



# ==============================
# Test code
# ==============================
if __name__ == "__main__":
    dt = 0.01
    tau = 1.0
    gd = GoalDelaySystem(goal_init = 1.0 ,dt = dt, ag=10.0)
    # test normal rollout
    x_track1 = gd.rollout(tau = tau)


    fig, ax1 = plt.subplots(figsize=(6, 3))
    ax1.plot(x_track1, lw=2)
   
    plt.grid()
    plt.legend(["normal rollout"])
    plt.xlabel("time (s)")
    plt.ylabel("goal")
    plt.title("Goal delay system")


    plt.show()
