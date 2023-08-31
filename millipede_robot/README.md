# Millipede robot

## 1. Setting up your controller (.lua files)

In **/millipede_robot/controllers** , you will find the controllers for the three types of turning strategies.

- Local leg and body coordination at the segment level (LCS)
- Simultaneous leg amplitude reduction (SAR)
- Global leg phase reversion (GPR)

These will be marked in separate directories with their respective name.

Each file contains different *ws* weights, from 2.0 to 4.0.

Upon opening a .lua file, Lines 4 - 7 are **Optional**. They only serve to create .txt files for variables stated on Line 7.

- If you choose to INCLUDE these lines, make sure you specify your machine's directory on Line 4.

- If you choose to EXCLUDE these lines, make sure you comment out all variables that are indexed in Line 7.


## 2. Launch the robot in CoppeliaSims (aka V-REP)

**IMPORTANT:** All scenes were created using *CoppeliaSims version 4.4.0*. However, you should be able to run them on any other versions.

In **/millipede_robot/scenes** , you will find the scenes (environments) for testing and running the robot.

To open them in CoppeliaSims, launch the application and open the scene you want inside Coppelia Sims.

The millipede robot is always located inside the scene.

To use specific controller, paste your desired code from **/millipede_robot/controllers** in the code editor on the left side menu of CoppeliaSim.

Press RUN to launch the experiment.
