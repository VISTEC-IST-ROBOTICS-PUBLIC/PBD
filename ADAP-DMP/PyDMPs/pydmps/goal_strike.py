import numpy as np
import matplotlib.pyplot as plt


class GoalStrikeSystem:

    def __init__(self, goal, v_target, tau ,dt, ax=4.6052):


        self.tau = tau
        self.dt = dt
        self.ax = ax
        self.reset_state(goal, v_target)


    def reset_state(self,goal, v_target):
        """Reset the system state"""
        self.goal = goal
        self.v_target = v_target
        self.g0 = goal - (self.tau * self.v_target)

    def step(self, cs):
        g = self.g0 - (self.v_target * np.log(cs) * self.tau) / self.ax

        return np.copy(g)



# ==============================
# Test code
# ==============================
# if __name__ == "__main__":
    # pass
