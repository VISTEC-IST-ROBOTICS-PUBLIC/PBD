function sysCall_init()

    --Save information about neurons and joints into a text file in your specified file path.
    file = io.open( "/home/nopparada-m/Desktop/millipede_sim/raw_data/reduce/ws2/wall2/ws2_wall_0", "w+" )
    
    --Determine what parameters to be saved in your above text file
    file:write('Output_C0\t Output_C1\t IR0_signal\t IR1_signal\t IR0_signal\t IR1_signal\t Output_I0\t Output_I1\t Output_I3b\t Output_I4b\t Output_J0\t Output_J1\t Output_J2\t Output_J3\t Output_J4\t Output_J5\t Output_J6\t Output_J7\t Output_I13\t Output_I14\t tr_0_2_control\t tr_1_2_control\t tr_2_2_control\t tr_3_2_control\t tr_4_2_control\t tr_5_2_control\t tr_6_2_control\t tr_17_2_control\t tr_18_2_control\t tr_19_2_control\t tr_20_2_control\t tr_21_2_control\t tr_22_2_control\t tr_23_2_control\t tr_24_2_control\t pf_0_2_control\t pf_1_2_control\t pf_2_2_control\t pf_3_2_control\t pf_4_2_control\t pf_5_2_control\t pf_6_2_control\t pf_17_2_control\t pf_18_2_control\t pf_19_2_control\t pf_20_2_control\t pf_21_2_control\t pf_22_2_control\t pf_23_2_control\t pf_24_2_control\t tr_7_2_control\t tr_8_2_control\t tr_9_2_control\t tr_10_2_control\t tr_11_2_control\t tr_12_2_control\t tr_13_2_control\t tr_15_2_control\t tr_14_2_control\t tr_16_2_control\t tr_25_2_control\t tr_26_2_control\t tr_27_2_control\t tr_28_2_control\t tr_29_2_control\t pf_7_2_control\t pf_8_2_control\t pf_9_2_control\t pf_10_2_control\t pf_11_2_control\t pf_12_2_control\t pf_13_2_control\t pf_15_2_control\t pf_14_2_control\t pf_16_2_control\t pf_25_2_control\t pf_26_2_control\t pf_27_2_control\t pf_28_2_control\t pf_29_2_control\t tt_0_motor\t tt_1_motor\t tt_2_motor\t tt_3_motor\t tt_4_motor\t tt_5_motor\t tt_6_motor\t tt_17_motor\t tt_18_motor\t tt_19_motor\t tt_20_motor\t tt_21_motor\t tt_22_motor\t tt_23_motor\t tt_24_motor\t tt_7_motor\t tt_8_motor\t tt_9_motor\t tt_10_motor\t tt_11_motor\t tt_12_motor\t tt_13_motor\t tt_15_motor\t tt_14_motor\t tt_16_motor\t tt_25_motor\t tt_26_motor\t tt_27_motor\t tt_28_motor\t tt_29_motor\t a\t b\t cx0_joint_pos\t cx1_joint_pos\t cx2_joint_pos\t cx3_joint_pos\t cx4_joint_pos\t cx5_joint_pos\t cx6_joint_pos\t cx17_joint_pos\t cx18_joint_pos\t cx19_joint_pos\t cx20_joint_pos\t cx21_joint_pos\t cx22_joint_pos\t cx23_joint_pos\t cx24_joint_pos\t pf_0_pos\t pf_1_pos\t pf_2_pos\t pf_3_pos\t pf_4_pos\t pf_5_pos\t pf_6_pos\t pf_17_pos\t pf_18_pos\t pf_19_pos\t pf_20_pos\t pf_21_pos\t pf_22_pos\t pf_23_pos\t pf_24_pos\t cx7_joint_pos\t cx8_joint_pos\t cx9_joint_pos\t cx10_joint_pos\t cx11_joint_pos\t cx12_joint_pos\t cx13_joint_pos\t cx15_joint_pos\t cx14_joint_pos\t cx16_joint_pos\t cx25_joint_pos\t cx26_joint_pos\t cx27_joint_pos\t cx28_joint_pos\t cx29_joint_pos\t pf_7_pos\t pf_8_pos\t pf_9_pos\t pf_10_pos\t pf_11_pos\t pf_12_pos\t pf_13_pos\t pf_15_pos\t pf_14_pos\t pf_16_pos\t pf_25_pos\t pf_26_pos\t pf_27_pos\t pf_28_pos\t pf_29_pos\t bj0_control\t bj1_control\t bj2_control\t bj3_control\t bj4_control\t bj5_control\t bj6_control\t bj7_control\t bj8_control\t bj9_control\t bj10_control\t bj11_control\t bj12_control\t bj13_control\t bod_orient0\t bod_orient1\t bod_orient2\t bod_orient3\t bod_orient4\t bod_orient5\t bod_orient6\t bod_orient7\t bod_orient8\t bod_orient9\t bod_orient10\t bod_orient11\t bod_orient12\t bod_orient13\t bod_orient14\t bj0_position\t  bj1_position\t bj2_position\t bj3_position\t bj4_position\t bj5_position\t bj6_position\t bj7_position\t bj8_position\t bj9_position\t bj10_position\t bj11_position\t bj12_position\t bj13_position\t  bj14_position\t tr_0_motor_pos\t tr_1_motor_pos\t  tr_2_motor_pos\t  tr_3_motor_pos\t  tr_4_motor_pos\t  tr_5_motor_pos\t  tr_6_motor_pos\t  tr_17_motor_pos\t  tr_18_motor_pos\t  tr_19_motor_pos\t  tr_20_motor_pos\t  tr_21_motor_pos\t  tr_22_motor_pos\t  tr_23_motor_pos\t  tr_24_motor_pos\t  tr_7_motor_pos\t  tr_8_motor_pos\t  tr_9_motor_pos\t  tr_10_motor_pos\t  tr_11_motor_pos\t  tr_12_motor_pos\t  tr_13_motor_pos\t  tr_15_motor_pos\t  tr_14_motor_pos\t  tr_16_motor_pos\t  tr_25_motor_pos\t  tr_26_motor_pos\t  tr_27_motor_pos\t  tr_28_motor_pos\t  tr_29_motor_pos\t  force_0\t force_7\t force_1\t force_8\t force_2\t force_9\t force_3\t force_10\t force_4\t force_11\t force_5\t force_12\t force_6\t force_13\t force_17\t force_15\t force_18\t force_14\t force_19\t force_16\t force_20\t force_25\t force_21\t force_26\t force_22\t force_27\t force_23\t force_28\t force_24\t force_29\t foot_orient\t sysTime\t timeStep\t time\t\n')
    -- Foot_0_contact\t Foot_1_contact\t Foot_2_contact\t Foot_3_contact\t Foot_4_contact\t Foot_5_contact\t Foot_6_contact\t Foot_17_contact\t Foot_18_contact\t Foot_19_contact\t Foot_20_contact\t Foot_21_contact\t Foot_22_contact\t Foot_23_contact\t Foot_24_contact\t Foot_7_contact\t Foot_8_contact\t Foot_9_contact\t Foot_10_contact\t Foot_11_contact\t Foot_12_contact\t Foot_13_contact\t Foot_15_contact\t Foot_14_contact\t Foot_16_contact\t Foot_25_contact\t Foot_0_contac26\t Foot_27_contact\t Foot_28_contact\t Foot_29_contact\t
   
    --Oscillator signal for the pre-processing CPG
    im_movement_factor = -0.3
    leg_movement_factor = 14.5
    bias_im = -1
    MI = 0.2
    
    --Sensors
    Sensor_joint0 = sim.getObjectHandle("Sensor_joint0")
    Antenna_0 = sim.getObjectHandle("Antenna_0")
    Sensor_joint1 = sim.getObjectHandle("Sensor_joint1")
    Antenna_1 = sim.getObjectHandle("Antenna_1")

    Dummy_foot = sim.getObjectHandle("Dummy_foot")

    --Segments
    Seg_0 = sim.getObjectHandle("Seg_0")
    Seg_1 = sim.getObjectHandle("Seg_1")
    Seg_2 = sim.getObjectHandle("Seg_2")
    Seg_3 = sim.getObjectHandle("Seg_3")
    Seg_4 = sim.getObjectHandle("Seg_4")
    Seg_5 = sim.getObjectHandle("Seg_5")
    Seg_6 = sim.getObjectHandle("Seg_6")
    Seg_7 = sim.getObjectHandle("Seg_7")
    Seg_8 = sim.getObjectHandle("Seg_8")
    Seg_9 = sim.getObjectHandle("Seg_9")
    Seg_10 = sim.getObjectHandle("Seg_10")
    Seg_11 = sim.getObjectHandle("Seg_11")
    Seg_12 = sim.getObjectHandle("Seg_12")
    Seg_13 = sim.getObjectHandle("Seg_13")
    Seg_14 = sim.getObjectHandle("Seg_14")


    --Verticle body joints
    Seg0_vertbend = sim.getObjectHandle("Seg0_vertbend")
    Seg1_vertbend = sim.getObjectHandle("Seg1_vertbend")
    Seg2_vertbend = sim.getObjectHandle("Seg2_vertbend")
    Seg3_vertbend = sim.getObjectHandle("Seg3_vertbend")
    Seg4_vertbend = sim.getObjectHandle("Seg4_vertbend")
    Seg5_vertbend = sim.getObjectHandle("Seg5_vertbend")
    Seg6_vertbend = sim.getObjectHandle("Seg6_vertbend")
    Seg7_vertbend = sim.getObjectHandle("Seg7_vertbend")
    Seg8_vertbend = sim.getObjectHandle("Seg8_vertbend")
    Seg9_vertbend = sim.getObjectHandle("Seg9_vertbend")
    Seg10_vertbend = sim.getObjectHandle("Seg10_vertbend")
    Seg11_vertbend = sim.getObjectHandle("Seg11_vertbend")
    Seg12_vertbend = sim.getObjectHandle("Seg12_vertbend")
    Seg13_vertbend = sim.getObjectHandle("Seg13_vertbend")

    --cx
    cx_0 = sim.getObjectHandle("cx_0")
    cx_1 = sim.getObjectHandle("cx_1")
    cx_2 = sim.getObjectHandle("cx_2")
    cx_3 = sim.getObjectHandle("cx_3")
    cx_4 = sim.getObjectHandle("cx_4")
    cx_5 = sim.getObjectHandle("cx_5")
    cx_6 = sim.getObjectHandle("cx_6")
    cx_7 = sim.getObjectHandle("cx_7")
    cx_8 = sim.getObjectHandle("cx_8")
    cx_9 = sim.getObjectHandle("cx_9")
    cx_10 = sim.getObjectHandle("cx_10")
    cx_11 = sim.getObjectHandle("cx_11")
    cx_12 = sim.getObjectHandle("cx_12")
    cx_13 = sim.getObjectHandle("cx_13")
    cx_14 = sim.getObjectHandle("cx_14")
    cx_15 = sim.getObjectHandle("cx_15")
    cx_16 = sim.getObjectHandle("cx_16")
    cx_17 = sim.getObjectHandle("cx_17")
    cx_18 = sim.getObjectHandle("cx_18")
    cx_19 = sim.getObjectHandle("cx_19")
    cx_20 = sim.getObjectHandle("cx_20")
    cx_21 = sim.getObjectHandle("cx_21")
    cx_22 = sim.getObjectHandle("cx_22")
    cx_23 = sim.getObjectHandle("cx_23")
    cx_24 = sim.getObjectHandle("cx_24")
    cx_25 = sim.getObjectHandle("cx_25")
    cx_26 = sim.getObjectHandle("cx_26")
    cx_27 = sim.getObjectHandle("cx_27")
    cx_28 = sim.getObjectHandle("cx_28")
    cx_29 = sim.getObjectHandle("cx_29")

    --cx body joints
    
    bodjoint_0 = sim.getObjectHandle("bodjoint_0")
    bodjoint_1 = sim.getObjectHandle("bodjoint_1")
    bodjoint_2 = sim.getObjectHandle("bodjoint_2")
    bodjoint_3 = sim.getObjectHandle("bodjoint_3")
    bodjoint_4 = sim.getObjectHandle("bodjoint_4")
    bodjoint_5 = sim.getObjectHandle("bodjoint_5")
    bodjoint_6 = sim.getObjectHandle("bodjoint_6")
    bodjoint_7 = sim.getObjectHandle("bodjoint_7")
    bodjoint_8 = sim.getObjectHandle("bodjoint_8")
    bodjoint_9 = sim.getObjectHandle("bodjoint_9")
    bodjoint_10 = sim.getObjectHandle("bodjoint_10")
    bodjoint_11 = sim.getObjectHandle("bodjoint_11")
    bodjoint_12 = sim.getObjectHandle("bodjoint_12")
    bodjoint_13 = sim.getObjectHandle("bodjoint_13")
    bodjoint_14 = sim.getObjectHandle("bodjoint_14")
    bodjoint_15 = sim.getObjectHandle("bodjoint_15")
    bodjoint_16 = sim.getObjectHandle("bodjoint_16")
    bodjoint_17 = sim.getObjectHandle("bodjoint_17")
    bodjoint_18 = sim.getObjectHandle("bodjoint_18")
    bodjoint_19 = sim.getObjectHandle("bodjoint_19")
    bodjoint_20 = sim.getObjectHandle("bodjoint_20")
    bodjoint_21 = sim.getObjectHandle("bodjoint_21")
    bodjoint_22 = sim.getObjectHandle("bodjoint_22")
    bodjoint_23 = sim.getObjectHandle("bodjoint_23")
    bodjoint_24 = sim.getObjectHandle("bodjoint_24")
    bodjoint_25 = sim.getObjectHandle("bodjoint_25")
    bodjoint_26 = sim.getObjectHandle("bodjoint_26")
    bodjoint_27 = sim.getObjectHandle("bodjoint_27")
    bodjoint_28 = sim.getObjectHandle("bodjoint_28")
    bodjoint_29 = sim.getObjectHandle("bodjoint_29")

    --cx joints
    cx0_joint = sim.getObjectHandle("cx0_joint")
    cx1_joint = sim.getObjectHandle("cx1_joint")
    cx2_joint = sim.getObjectHandle("cx2_joint")
    cx3_joint = sim.getObjectHandle("cx3_joint")
    cx4_joint = sim.getObjectHandle("cx4_joint")
    cx5_joint = sim.getObjectHandle("cx5_joint")
    cx6_joint = sim.getObjectHandle("cx6_joint")
    cx7_joint = sim.getObjectHandle("cx7_joint")
    cx8_joint = sim.getObjectHandle("cx8_joint")
    cx9_joint = sim.getObjectHandle("cx9_joint")
    cx10_joint = sim.getObjectHandle("cx10_joint")
    cx11_joint = sim.getObjectHandle("cx11_joint")
    cx12_joint = sim.getObjectHandle("cx12_joint")
    cx13_joint = sim.getObjectHandle("cx13_joint")
    cx14_joint = sim.getObjectHandle("cx14_joint")
    cx15_joint = sim.getObjectHandle("cx15_joint")
    cx16_joint = sim.getObjectHandle("cx16_joint")
    cx17_joint = sim.getObjectHandle("cx17_joint")
    cx18_joint = sim.getObjectHandle("cx18_joint")
    cx19_joint = sim.getObjectHandle("cx19_joint")
    cx20_joint = sim.getObjectHandle("cx20_joint")
    cx21_joint = sim.getObjectHandle("cx21_joint")
    cx22_joint = sim.getObjectHandle("cx22_joint")
    cx23_joint = sim.getObjectHandle("cx23_joint")
    cx24_joint = sim.getObjectHandle("cx24_joint")
    cx25_joint = sim.getObjectHandle("cx25_joint")
    cx26_joint = sim.getObjectHandle("cx26_joint")
    cx27_joint = sim.getObjectHandle("cx27_joint")
    cx28_joint = sim.getObjectHandle("cx28_joint")
    cx29_joint = sim.getObjectHandle("cx29_joint")

    --Prefemur
    prefemur_0 = sim.getObjectHandle("prefemur_0")
    prefemur_1 = sim.getObjectHandle("prefemur_1")
    prefemur_2 = sim.getObjectHandle("prefemur_2")
    prefemur_3 = sim.getObjectHandle("prefemur_3")
    prefemur_4 = sim.getObjectHandle("prefemur_4")
    prefemur_5 = sim.getObjectHandle("prefemur_5")
    prefemur_6 = sim.getObjectHandle("prefemur_6")
    prefemur_7 = sim.getObjectHandle("prefemur_7")
    prefemur_8 = sim.getObjectHandle("prefemur_8")
    prefemur_9 = sim.getObjectHandle("prefemur_9")
    prefemur_10 = sim.getObjectHandle("prefemur_10")
    prefemur_11 = sim.getObjectHandle("prefemur_11")
    prefemur_12 = sim.getObjectHandle("prefemur_12")
    prefemur_13 = sim.getObjectHandle("prefemur_13")
    prefemur_14 = sim.getObjectHandle("prefemur_14")
    prefemur_15 = sim.getObjectHandle("prefemur_15")
    prefemur_16 = sim.getObjectHandle("prefemur_16")
    prefemur_17 = sim.getObjectHandle("prefemur_17")
    prefemur_18 = sim.getObjectHandle("prefemur_18")
    prefemur_19 = sim.getObjectHandle("prefemur_19")
    prefemur_20 = sim.getObjectHandle("prefemur_20")
    prefemur_21 = sim.getObjectHandle("prefemur_21")
    prefemur_22 = sim.getObjectHandle("prefemur_22")
    prefemur_23 = sim.getObjectHandle("prefemur_23")
    prefemur_24 = sim.getObjectHandle("prefemur_24")
    prefemur_25 = sim.getObjectHandle("prefemur_25")
    prefemur_26 = sim.getObjectHandle("prefemur_26")
    prefemur_27 = sim.getObjectHandle("prefemur_27")
    prefemur_28 = sim.getObjectHandle("prefemur_28")
    prefemur_29 = sim.getObjectHandle("prefemur_29")

    --Femur
    femur_0 = sim.getObjectHandle("femur_0")
    femur_1 = sim.getObjectHandle("femur_1")
    femur_2 = sim.getObjectHandle("femur_2")
    femur_3 = sim.getObjectHandle("femur_3")
    femur_4 = sim.getObjectHandle("femur_4")
    femur_5 = sim.getObjectHandle("femur_5")
    femur_6 = sim.getObjectHandle("femur_6")
    femur_7 = sim.getObjectHandle("femur_7")
    femur_8 = sim.getObjectHandle("femur_8")
    femur_9 = sim.getObjectHandle("femur_9")
    femur_10 = sim.getObjectHandle("femur_10")
    femur_11 = sim.getObjectHandle("femur_11")
    femur_12 = sim.getObjectHandle("femur_12")
    femur_13 = sim.getObjectHandle("femur_13")
    femur_14 = sim.getObjectHandle("femur_14")
    femur_15 = sim.getObjectHandle("femur_15")
    femur_16 = sim.getObjectHandle("femur_16")
    femur_17 = sim.getObjectHandle("femur_17")
    femur_18 = sim.getObjectHandle("femur_18")
    femur_19 = sim.getObjectHandle("femur_19")
    femur_20 = sim.getObjectHandle("femur_20")
    femur_21 = sim.getObjectHandle("femur_21")
    femur_22 = sim.getObjectHandle("femur_22")
    femur_23 = sim.getObjectHandle("femur_23")
    femur_24 = sim.getObjectHandle("femur_24")
    femur_25 = sim.getObjectHandle("femur_25")
    femur_26 = sim.getObjectHandle("femur_26")
    femur_27 = sim.getObjectHandle("femur_27")
    femur_28 = sim.getObjectHandle("femur_28")
    femur_29 = sim.getObjectHandle("femur_29")

    --Tibia
    tibia_0 = sim.getObjectHandle("tibia_0")
    tibia_1 = sim.getObjectHandle("tibia_1")
    tibia_2 = sim.getObjectHandle("tibia_2")
    tibia_3 = sim.getObjectHandle("tibia_3")
    tibia_4 = sim.getObjectHandle("tibia_4")
    tibia_5 = sim.getObjectHandle("tibia_5")
    tibia_6 = sim.getObjectHandle("tibia_6")
    tibia_7 = sim.getObjectHandle("tibia_7")
    tibia_8 = sim.getObjectHandle("tibia_8")
    tibia_9 = sim.getObjectHandle("tibia_9")
    tibia_10 = sim.getObjectHandle("tibia_10")
    tibia_11 = sim.getObjectHandle("tibia_11")
    tibia_12 = sim.getObjectHandle("tibia_12")
    tibia_13 = sim.getObjectHandle("tibia_13")
    tibia_14 = sim.getObjectHandle("tibia_14")
    tibia_15 = sim.getObjectHandle("tibia_15")
    tibia_16 = sim.getObjectHandle("tibia_16")
    tibia_17 = sim.getObjectHandle("tibia_17")
    tibia_18 = sim.getObjectHandle("tibia_18")
    tibia_19 = sim.getObjectHandle("tibia_19")
    tibia_20 = sim.getObjectHandle("tibia_20")
    tibia_21 = sim.getObjectHandle("tibia_21")
    tibia_22 = sim.getObjectHandle("tibia_22")
    tibia_23 = sim.getObjectHandle("tibia_23")
    tibia_24 = sim.getObjectHandle("tibia_24")
    tibia_25 = sim.getObjectHandle("tibia_25")
    tibia_26 = sim.getObjectHandle("tibia_26")
    tibia_27 = sim.getObjectHandle("tibia_27")
    tibia_28 = sim.getObjectHandle("tibia_28")
    tibia_29 = sim.getObjectHandle("tibia_29")

    --Tarsus
    tarsus_0 = sim.getObjectHandle("tarsus_0")
    tarsus_1 = sim.getObjectHandle("tarsus_1")
    tarsus_2 = sim.getObjectHandle("tarsus_2")
    tarsus_3 = sim.getObjectHandle("tarsus_3")
    tarsus_4 = sim.getObjectHandle("tarsus_4")
    tarsus_5 = sim.getObjectHandle("tarsus_5")
    tarsus_6 = sim.getObjectHandle("tarsus_6")
    tarsus_7 = sim.getObjectHandle("tarsus_7")
    tarsus_8 = sim.getObjectHandle("tarsus_8")
    tarsus_9 = sim.getObjectHandle("tarsus_9")
    tarsus_10 = sim.getObjectHandle("tarsus_10")
    tarsus_11 = sim.getObjectHandle("tarsus_11")
    tarsus_12 = sim.getObjectHandle("tarsus_12")
    tarsus_13 = sim.getObjectHandle("tarsus_13")
    tarsus_14 = sim.getObjectHandle("tarsus_14")
    tarsus_15 = sim.getObjectHandle("tarsus_15")
    tarsus_16 = sim.getObjectHandle("tarsus_16")
    tarsus_17 = sim.getObjectHandle("tarsus_17")
    tarsus_18 = sim.getObjectHandle("tarsus_18")
    tarsus_19 = sim.getObjectHandle("tarsus_19")
    tarsus_20 = sim.getObjectHandle("tarsus_20")
    tarsus_21 = sim.getObjectHandle("tarsus_21")
    tarsus_22 = sim.getObjectHandle("tarsus_22")
    tarsus_23 = sim.getObjectHandle("tarsus_23")
    tarsus_24 = sim.getObjectHandle("tarsus_24")
    tarsus_25 = sim.getObjectHandle("tarsus_25")
    tarsus_26 = sim.getObjectHandle("tarsus_26")
    tarsus_27 = sim.getObjectHandle("tarsus_27")
    tarsus_28 = sim.getObjectHandle("tarsus_28")
    tarsus_29 = sim.getObjectHandle("tarsus_29")

    --Foot
    Foot_0 = sim.getObjectHandle("Foot_0")
    Foot_1 = sim.getObjectHandle("Foot_1")
    Foot_2 = sim.getObjectHandle("Foot_2")
    Foot_3 = sim.getObjectHandle("Foot_3")
    Foot_4 = sim.getObjectHandle("Foot_4")   
    Foot_5 = sim.getObjectHandle("Foot_5")
    Foot_6 = sim.getObjectHandle("Foot_6")
    Foot_7 = sim.getObjectHandle("Foot_7")
    Foot_8 = sim.getObjectHandle("Foot_8")
    Foot_9 = sim.getObjectHandle("Foot_9")
    Foot_10 = sim.getObjectHandle("Foot_10")
    Foot_11 = sim.getObjectHandle("Foot_11")
    Foot_12 = sim.getObjectHandle("Foot_12")
    Foot_13 = sim.getObjectHandle("Foot_13")
    Foot_14 = sim.getObjectHandle("Foot_14")
    Foot_15 = sim.getObjectHandle("Foot_15")
    Foot_16 = sim.getObjectHandle("Foot_16")
    Foot_17 = sim.getObjectHandle("Foot_17")
    Foot_18 = sim.getObjectHandle("Foot_18")
    Foot_19 = sim.getObjectHandle("Foot_19")
    Foot_20 = sim.getObjectHandle("Foot_20")
    Foot_21 = sim.getObjectHandle("Foot_21")
    Foot_22 = sim.getObjectHandle("Foot_22")
    Foot_23 = sim.getObjectHandle("Foot_23")
    Foot_24 = sim.getObjectHandle("Foot_24")
    Foot_25 = sim.getObjectHandle("Foot_25")
    Foot_26 = sim.getObjectHandle("Foot_26")
    Foot_27 = sim.getObjectHandle("Foot_27")
    Foot_28 = sim.getObjectHandle("Foot_28")
    Foot_29 = sim.getObjectHandle("Foot_29")

    --Force sensor attached to the propodus
    P0_force = sim.getObjectHandle("P0_force")
    P1_force = sim.getObjectHandle("P1_force")
    P2_force = sim.getObjectHandle("P2_force")
    P3_force = sim.getObjectHandle("P3_force")
    P4_force = sim.getObjectHandle("./P4_force*")
    P5_force = sim.getObjectHandle("P5_force")
    P6_force = sim.getObjectHandle("P6_force")
    P7_force = sim.getObjectHandle("P7_force")
    P8_force = sim.getObjectHandle("P8_force")
    P9_force = sim.getObjectHandle("P9_force")
    P10_force = sim.getObjectHandle("P10_force")
    P11_force = sim.getObjectHandle("P11_force")
    P12_force = sim.getObjectHandle("P12_force")
    P13_force = sim.getObjectHandle("P13_force")
    P14_force = sim.getObjectHandle("P14_force")
    P15_force = sim.getObjectHandle("P15_force")
    P16_force = sim.getObjectHandle("P16_force")
    P17_force = sim.getObjectHandle("P17_force")
    P18_force = sim.getObjectHandle("P18_force")
    P19_force = sim.getObjectHandle("P19_force")
    P20_force = sim.getObjectHandle("P20_force")
    P21_force = sim.getObjectHandle("P21_force")
    P22_force = sim.getObjectHandle("P22_force")
    P23_force = sim.getObjectHandle("P23_force")
    P24_force = sim.getObjectHandle("./P24_force*")
    P25_force = sim.getObjectHandle("P25_force")
    P26_force = sim.getObjectHandle("P26_force")
    P27_force = sim.getObjectHandle("P27_force")
    P28_force = sim.getObjectHandle("P28_force")
    P29_force = sim.getObjectHandle("./P29_force*")

    --prefemur to femur
    pf_0 = sim.getObjectHandle("pf_0")
    pf_1 = sim.getObjectHandle("pf_1")
    pf_2 = sim.getObjectHandle("pf_2")
    pf_3 = sim.getObjectHandle("pf_3")
    pf_4 = sim.getObjectHandle("pf_4")
    pf_5 = sim.getObjectHandle("pf_5")
    pf_6 = sim.getObjectHandle("pf_6")
    pf_7 = sim.getObjectHandle("pf_7")
    pf_8 = sim.getObjectHandle("pf_8")
    pf_9 = sim.getObjectHandle("pf_9")
    pf_10 = sim.getObjectHandle("pf_10")
    pf_11 = sim.getObjectHandle("pf_11")
    pf_12 = sim.getObjectHandle("pf_12")
    pf_13 = sim.getObjectHandle("pf_13")
    pf_14 = sim.getObjectHandle("pf_14")
    pf_15 = sim.getObjectHandle("pf_15")
    pf_16 = sim.getObjectHandle("pf_16")
    pf_17 = sim.getObjectHandle("pf_17")
    pf_18 = sim.getObjectHandle("pf_18")
    pf_19 = sim.getObjectHandle("pf_19")
    pf_20 = sim.getObjectHandle("pf_20")
    pf_21 = sim.getObjectHandle("pf_21")
    pf_22 = sim.getObjectHandle("pf_22")
    pf_23 = sim.getObjectHandle("pf_23")
    pf_24 = sim.getObjectHandle("pf_24")
    pf_25 = sim.getObjectHandle("pf_25")
    pf_26 = sim.getObjectHandle("pf_26")
    pf_27 = sim.getObjectHandle("pf_27")
    pf_28 = sim.getObjectHandle("pf_28")
    pf_29 = sim.getObjectHandle("pf_29")

    --femur to tibia
    ft_0 = sim.getObjectHandle("ft_0")
    ft_1 = sim.getObjectHandle("ft_1")
    ft_2 = sim.getObjectHandle("ft_2")
    ft_3 = sim.getObjectHandle("ft_3")
    ft_4 = sim.getObjectHandle("ft_4")
    ft_5 = sim.getObjectHandle("ft_5")
    ft_6 = sim.getObjectHandle("ft_6")
    ft_7 = sim.getObjectHandle("ft_7")
    ft_8 = sim.getObjectHandle("ft_8")
    ft_9 = sim.getObjectHandle("ft_9")
    ft_10 = sim.getObjectHandle("ft_10")
    ft_11 = sim.getObjectHandle("ft_11")
    ft_12 = sim.getObjectHandle("ft_12")
    ft_13 = sim.getObjectHandle("ft_13")
    ft_14 = sim.getObjectHandle("ft_14")
    ft_15 = sim.getObjectHandle("ft_15")
    ft_16 = sim.getObjectHandle("ft_16")
    ft_17 = sim.getObjectHandle("ft_17")
    ft_18 = sim.getObjectHandle("ft_18")
    ft_19 = sim.getObjectHandle("ft_19")
    ft_20 = sim.getObjectHandle("ft_20")
    ft_21 = sim.getObjectHandle("ft_21")
    ft_22 = sim.getObjectHandle("ft_22")
    ft_23 = sim.getObjectHandle("ft_23")
    ft_24 = sim.getObjectHandle("ft_24")
    ft_25 = sim.getObjectHandle("ft_25")
    ft_26 = sim.getObjectHandle("ft_26")
    ft_27 = sim.getObjectHandle("ft_27")
    ft_28 = sim.getObjectHandle("ft_28")
    ft_29 = sim.getObjectHandle("ft_29")

    --tibia to tarsus
    tt_0 = sim.getObjectHandle("tt_0")
    tt_1 = sim.getObjectHandle("tt_1")
    tt_2 = sim.getObjectHandle("tt_2")
    tt_3 = sim.getObjectHandle("tt_3")
    tt_4 = sim.getObjectHandle("tt_4")
    tt_5 = sim.getObjectHandle("tt_5")
    tt_6 = sim.getObjectHandle("tt_6")
    tt_7 = sim.getObjectHandle("tt_7")
    tt_8 = sim.getObjectHandle("tt_8")
    tt_9 = sim.getObjectHandle("tt_9")
    tt_10 = sim.getObjectHandle("tt_10")
    tt_11 = sim.getObjectHandle("tt_11")
    tt_12 = sim.getObjectHandle("tt_12")
    tt_13 = sim.getObjectHandle("tt_13")
    tt_14 = sim.getObjectHandle("tt_14")
    tt_15 = sim.getObjectHandle("tt_15")
    tt_16 = sim.getObjectHandle("tt_16")
    tt_17 = sim.getObjectHandle("tt_17")
    tt_18 = sim.getObjectHandle("tt_18")
    tt_19 = sim.getObjectHandle("tt_19")
    tt_20 = sim.getObjectHandle("tt_20")
    tt_21 = sim.getObjectHandle("tt_21")
    tt_22 = sim.getObjectHandle("tt_22")
    tt_23 = sim.getObjectHandle("tt_23")
    tt_24 = sim.getObjectHandle("tt_24")
    tt_25 = sim.getObjectHandle("tt_25")
    tt_26 = sim.getObjectHandle("tt_26")
    tt_27 = sim.getObjectHandle("tt_27")
    tt_28 = sim.getObjectHandle("tt_28")
    tt_29 = sim.getObjectHandle("tt_29")

    Dummy_seg0 = sim.getObjectHandle("Dummy_seg0")
    Dummy_seg1 = sim.getObjectHandle("Dummy_seg1")
    Dummy_seg2 = sim.getObjectHandle("Dummy_seg2")
    Dummy_seg3 = sim.getObjectHandle("Dummy_seg3")
    Dummy_seg4 = sim.getObjectHandle("Dummy_seg4")
    Dummy_seg5 = sim.getObjectHandle("Dummy_seg5")
    Dummy_seg6 = sim.getObjectHandle("Dummy_seg6")
    Dummy_seg7 = sim.getObjectHandle("Dummy_seg7")
    Dummy_seg8 = sim.getObjectHandle("Dummy_seg8")
    Dummy_seg9 = sim.getObjectHandle("Dummy_seg9")
    Dummy_seg10 = sim.getObjectHandle("Dummy_seg10")
    Dummy_seg11 = sim.getObjectHandle("Dummy_seg11")
    Dummy_seg12 = sim.getObjectHandle("Dummy_seg12")
    Dummy_seg13 = sim.getObjectHandle("Dummy_seg13")
    Dummy_seg14 = sim.getObjectHandle("Dummy_seg14")
    
    
    --Pre-processing network
    Output_C0 = 0.1
    Output_C1 = 0.1
    Activity_C0 = 0.01
    Activity_C1 = 0.01
    
    -- Output (initial values for the subsequent VRN and MRC)
    Output_I0 = 0.001
    Output_I1 = 0.001
    Output_I9 = 0.001
    Output_I10 = 0.001
    Output_I11 = 0.001
    Output_I12 = 0.001
    Output_I5 = 0.001
    Output_I6 = 0.001
    Output_I7 = 0.001
    Output_I8 = 0.001
    I0_output = 1.0
    I1_output = 1.0
    Output_I3 = 0.1
    Output_I4 = 0.1
    Output_I3b = 0.1
    Output_I4b = 0.1

    --Summation (direction controller)
    Output_J0 = 0.001
    Output_J1 = 0.001
    Output_J2 = 0.001
    Output_J3 = 0.001
    Output_J4 = 0.001 --summation for J0 and J2
    Output_J5 = 0.001 --summation for J1 and J3
    Output_J6 = 0.001
    Output_J7 = 0.001

    WeightJ00 = 3.0 --recurrent
    WeightJ11 = 3.0 --recurrent
    WeightJ22 = 2.0 --recurrent
    WeightJ33 = 2.0 --recurrent

    WeightJ04 = 1.0 --summation connection
    WeightJ24 = 1.0 --summation connection
    WeightJ15 = 1.0 --summation connection
    WeightJ35 = 1.0 --summation connection

    WeightJ02 = 1.0 --layer connection
    WeightJ13 = 1.0 --layer connection
    WeightJ47 = -1.0 --direction control
    WeightJ56 = -1.0 --direction control 

    --Pre-processing CPG function
    Weight_C00 = 1.4
    Weight_C01 = MI + 0.18
    Weight_C10 = - (MI + 0.18)
    Weight_C11 = 1.4 


    --VRN left 
    --Neuronal connections for the multiplicative network
    WeightI9_I4 = 1.7246
    WeightI10_I4 = -1.7246
    WeightI11_I4 = -1.7246
    WeightI12_I4 = 1.7246
    WeightI14_I9 = 0.5
    WeightI14_I10 = 0.5
    WeightI14_I11 = -0.5
    WeightI14_I12 = -0.5
    WeightI9_C1 = 1.7246
    WeightI10_C1 = -1.7246
    WeightI11_C1 = 1.7246
    WeightI12_C1 = -1.7246
    Bias_I9 = -2.48285
    Bias_I10 = -2.48285
    Bias_I11 = -2.48285
    Bias_I12 = -2.48285

    --VRN right 
    --Neuronal connections for the multiplicative network
    WeightI5_I3 = 1.7246
    WeightI6_I3 = -1.7246
    WeightI7_I3 = -1.7246
    WeightI8_I3 = 1.7246
    WeightI5_C1 = 1.7246
    WeightI6_C1 = -1.7246
    WeightI7_C1 = 1.7246
    WeightI8_C1 = -1.7246
    WeightI13_I5 = 0.5
    WeightI13_I6 = 0.5
    WeightI13_I7 = -0.5
    WeightI13_I8 = -0.5
    Bias_I5 = -2.48285
    Bias_I6 = -2.48285
    Bias_I7 = -2.48285
    Bias_I8 = -2.48285

    ---Left motors
    
    --Associated parameters

    --Connections between the VRN final neuron to the inner joint motors of the legs

    Weighttr_I14 = {{Weighttr0_I14}, {Weighttr1_I14}, {Weighttr2_I14}, {Weighttr3_I14}, {Weighttr4_I14}, {Weighttr5_I14}, {Weighttr6_I14}, {Weighttr17_I14}, {Weighttr18_I14}, {Weighttr19_I14}, {Weighttr20_I14}, {Weighttr21_I14}, {Weighttr22_I14}, {Weighttr23_I14}, {Weighttr24_I14}}

    for a = 1, 15 do
    
        Weighttr_I14[a] = -3.0

    end 
    
    Weightpfl_C0 = {{Weightpf0_C0}, {Weightpf1_C0}, {Weightpf2_C0}, {Weightpf3_C0}, {Weightpf4_C0}, {Weightpf5_C0}, {Weightpf6_C0}, {Weightpf17_C0}, {Weightpf18_C0}, {Weightpf19_C0}, {Weightpf20_C0}, {Weightpf21_C0}, {Weightpf22_C0}, {Weightpf23_C0}, {Weightpf24_C0}}

    for b = 1, 15 do
    
        Weightpfl_C0[b] = -2.0

    end

    ---Right motors
    
    --Associated parameters
    --Connections between the VRN final neuron to the inner joint motors of the legs
    Weighttr_I13 = {{Weighttr7_I13}, {Weighttr8_I13}, {Weighttr9_I13}, {Weighttr10_I13}, {Weighttr11_I13}, {Weighttr12_I13}, {Weighttr13_I13}, {Weighttr15_I13}, {Weighttr16_I13}, {Weighttr25_I13}, {Weighttr26_I13}, {Weighttr27_I13}, {Weighttr28_I13}, {Weighttr29_I13}}

    for c = 1, 15 do
    
        Weighttr_I13[c] = -3.0

    end

    Weightpfr_C0 = {{Weightpf7_C0}, {Weightpf8_C0}, {Weightpf9_C0}, {Weightpf10_C0}, {Weightpf11_C0}, {Weightpf12_C0}, {Weightpf13_C0}, {Weightpf15_C0}, {Weightpf14_C0}, {Weightpf16_C0}, {Weightpf25_C0}, {Weightpf26_C0}, {Weightpf27_C0}, {Weightpf28_C0}, {Weightpf29_C0}}
    
    for d = 1, 15 do 

        Weightpfr_C0[d] = -2.0

    end

    Bias_tr_Joint = 2.0
    Bias_pf_Joint = 0.1
    Bias_ft_Joint = 0.1


    --wave gait variables
    --LEFT 
    recurrent_left_tr = {{"recurrent_left_tr_0"}, {"recurrent_left_tr_1"},{"recurrent_left_tr_2"}, {"recurrent_left_tr_3"}, {"recurrent_left_tr_4"},{"recurrent_left_tr_5"}, {"recurrent_left_tr_6"}, {"recurrent_left_tr_7"}, {"recurrent_left_tr_8"}, {"recurrent_left_tr_9"}, {"recurrent_left_tr_10"}, {"recurrent_left_tr_11"}, {"recurrent_left_tr_12"}, {"recurrent_left_tr_13"}, {"recurrent_left_tr_14"}, {"recurrent_left_tr_15"}, {"recurrent_left_tr_16"}, {"recurrent_left_tr_17"}, {"recurrent_left_tr_18"}, {"recurrent_left_tr_19"}, {"recurrent_left_tr_20"}, {"recurrent_left_tr_21"}, {"recurrent_left_tr_22"}, {"recurrent_left_tr_23"}, {"recurrent_left_tr_24"}, {"recurrent_left_tr_25"}, {"recurrent_left_tr_26"}, {"recurrent_left_tr_27"}, {"recurrent_left_tr_28"}, {"recurrent_left_tr_29"}, {"recurrent_left_tr_30"}, {"recurrent_left_tr_31"}, {"recurrent_left_tr_32"}, {"recurrent_left_tr_33"}, {"recurrent_left_tr_34"}, {"recurrent_left_tr_35"}, {"recurrent_left_tr_36"}, {"recurrent_left_tr_37"}, {"recurrent_left_tr_38"}, {"recurrent_left_tr_39"}, {"recurrent_left_tr_40"}, {"recurrent_left_tr_41"}, {"recurrent_left_tr_42"}, {"recurrent_left_tr_43"}, {"recurrent_left_tr_44"}, {"recurrent_left_tr_45"}, {"recurrent_left_tr_46"}, {"recurrent_left_tr_47"}, {"recurrent_left_tr_48"}, {"recurrent_left_tr_49"}, {"recurrent_left_tr_50"}, {"recurrent_left_tr_51"}, {"recurrent_left_tr_52"}, {"recurrent_left_tr_53"}, {"recurrent_left_tr_54"}, {"recurrent_left_tr_55"}, {"recurrent_left_tr_56"}, {"recurrent_left_tr_57"}, {"recurrent_left_tr_58"}, {"recurrent_left_tr_59"}, {"recurrent_left_tr_60"}, {"recurrent_left_tr_61"}, {"recurrent_left_tr_62"}, {"recurrent_left_tr_63"}, {"recurrent_left_tr_64"}, {"recurrent_left_tr_65"}, {"recurrent_left_tr_66"}, {"recurrent_left_tr_67"}, {"recurrent_left_tr_68"}, {"recurrent_left_tr_69"}, {"recurrent_left_tr_70"}, {"recurrent_left_tr_71"}, {"recurrent_left_tr_72"}, {"recurrent_left_tr_73"}, {"recurrent_left_tr_74"}, {"recurrent_left_tr_75"}, {"recurrent_left_tr_76"}, {"recurrent_left_tr_77"}, {"recurrent_left_tr_78"}, {"recurrent_left_tr_79"}, {"recurrent_left_tr_80"}, {"recurrent_left_tr_81"}, {"recurrent_left_tr_82"}, {"recurrent_left_tr_83"}, {"recurrent_left_tr_84"}, {"recurrent_left_tr_85"}, {"recurrent_left_tr_86"}, {"recurrent_left_tr_87"}, {"recurrent_left_tr_88"}, {"recurrent_left_tr_89"}, {"recurrent_left_tr_90"}, {"recurrent_left_tr_91"}, {"recurrent_left_tr_92"}, {"recurrent_left_tr_93"}, {"recurrent_left_tr_94"}, {"recurrent_left_tr_95"}, {"recurrent_left_tr_96"}, {"recurrent_left_tr_97"}, {"recurrent_left_tr_98"}, {"recurrent_left_tr_99"}, {"recurrent_left_tr_100"}, {"recurrent_left_tr_101"}, {"recurrent_left_tr_102"}, {"recurrent_left_tr_103"}, {"recurrent_left_tr_104"}, {"recurrent_left_tr_105"}, {"recurrent_left_tr_106"}, {"recurrent_left_tr_107"}, {"recurrent_left_tr_108"}, {"recurrent_left_tr_109"}, {"recurrent_left_tr_110"}, {"recurrent_left_tr_111"}, {"recurrent_left_tr_112"}, {"recurrent_left_tr_113"}, {"recurrent_left_tr_114"}, {"recurrent_left_tr_115"}, {"recurrent_left_tr_116"}, {"recurrent_left_tr_117"}, {"recurrent_left_tr_118"}, {"recurrent_left_tr_119"}, {"recurrent_left_tr_120"}, {"recurrent_left_tr_121"}, {"recurrent_left_tr_122"}, {"recurrent_left_tr_123"}, {"recurrent_left_tr_124"}, {"recurrent_left_tr_125"}, {"recurrent_left_tr_126"}, {"recurrent_left_tr_127"}, {"recurrent_left_tr_128"}, {"recurrent_left_tr_129"}, {"recurrent_left_tr_130"}, {"recurrent_left_tr_131"}, {"recurrent_left_tr_132"}, {"recurrent_left_tr_133"}, {"recurrent_left_tr_134"}, {"recurrent_left_tr_135"}, {"recurrent_left_tr_136"}, {"recurrent_left_tr_137"}, {"recurrent_left_tr_138"}, {"recurrent_left_tr_139"}, {"recurrent_left_tr_140"}, {"recurrent_left_tr_141"}, {"recurrent_left_tr_142"}, {"recurrent_left_tr_143"}, {"recurrent_left_tr_144"}, {"recurrent_left_tr_145"}, {"recurrent_left_tr_146"}, {"recurrent_left_tr_147"}, {"recurrent_left_tr_148"}, {"recurrent_left_tr_149"}, {"recurrent_left_tr_150"}, {"recurrent_left_tr_151"}, {"recurrent_left_tr_152"}, {"recurrent_left_tr_153"}, {"recurrent_left_tr_154"}, {"recurrent_left_tr_155"}, {"recurrent_left_tr_156"}}

    for i = 1, 157 do
        recurrent_left_tr[i] = 1.5
    end

    tr1_I14 = 0.0
    
    trx_interneuron = {{"tr0_tr1"}, {"tr1_tr2"}, {"tr2_tr3"}, {"tr3_tr4"}, {"tr4_tr5"}, {"tr5_tr6"}, {"tr6_tr7"}, {"tr7_tr8"}, {"tr8_tr9"}, {"tr9_tr10"}, {"tr10_tr11"}, {"tr11_tr12"}, {"tr12_tr13"}, {"tr13_tr14"}, {"tr14_tr15"}, {"tr15_tr16"}, {"tr16_tr17"}, {"tr17_tr18"}, {"tr18_tr19"}, {"tr19_tr20"}, {"tr20_tr21"}, {"tr21_tr22"}, {"tr22_tr23"}, {"tr23_tr24"}, {"tr24_tr25"}, {"tr25_tr26"}, {"tr26_tr27"}, {"tr27_tr28"}, {"tr28_tr29"}, {"tr29_tr30"}, {"tr30_tr31"}, {"tr31_tr32"}, {"tr32_tr33"}, {"tr33_tr34"}, {"tr34_tr35"}, {"tr35_tr36"}, {"tr36_tr37"}, {"tr37_tr38"}, {"tr38_tr39"}, {"tr39_tr40"}, {"tr40_tr41"}, {"tr41_tr42"}, {"tr42_tr43"}, {"tr43_tr44"}, {"tr44_tr45"}, {"tr45_tr46"}, {"tr46_tr47"}, {"tr47_tr48"}, {"tr48_tr49"}, {"tr49_tr50"}, {"tr50_tr51"}, {"tr51_tr52"}, {"tr52_tr53"}, {"tr53_tr54"}, {"tr54_tr55"}, {"tr55_tr56"}, {"tr56_tr57"}, {"tr57_tr58"}, {"tr58_tr59"}, {"tr59_tr60"}, {"tr60_tr61"}, {"tr61_tr62"}, {"tr62_tr63"}, {"tr63_tr64"}, {"tr64_tr65"}, {"tr65_tr66"}, {"tr66_tr67"}, {"tr67_tr68"}, {"tr68_tr69"}, {"tr69_tr70"}, {"tr70_tr71"}, {"tr71_tr72"}, {"tr72_tr73"}, {"tr73_tr74"}, {"tr74_tr75"}, {"tr75_tr76"}, {"tr76_tr77"}, {"tr77_tr78"}, {"tr78_tr79"}, {"tr79_tr80"}, {"tr80_tr81"}, {"tr81_tr82"}, {"tr82_tr83"}, {"tr83_tr84"}, {"tr84_tr85"}, {"tr85_tr86"}, {"tr86_tr87"}, {"tr87_tr88"}, {"tr88_tr89"}, {"tr89_tr90"}, {"tr90_tr91"}, {"tr91_tr92"}, {"tr92_tr93"}, {"tr93_tr94"}, {"tr94_tr95"}, {"tr95_tr96"}, {"tr96_tr97"}, {"tr97_tr98"}, {"tr98_tr99"}, {"tr99_tr100"}, {"tr100_tr101"}, {"tr101_tr102"}, {"tr102_tr103"}, {"tr103_tr104"}, {"tr104_tr105"}, {"tr105_tr106"}, {"tr106_tr107"}, {"tr107_tr108"}, {"tr108_tr109"}, {"tr109_tr110"}, {"tr110_tr111"}, {"tr111_tr112"}, {"tr112_tr113"}, {"tr113_tr114"}, {"tr114_tr115"}, {"tr115_tr116"}, {"tr116_tr117"}, {"tr117_tr118"}, {"tr118_tr119"}, {"tr119_tr120"}, {"tr120_tr121"}, {"tr121_tr122"}, {"tr122_tr123"}, {"tr123_tr124"}, {"tr124_tr125"}, {"tr125_tr126"}, {"tr126_tr127"}, {"tr127_tr128"}, {"tr128_tr129"}, {"tr129_tr130"}, {"tr130_tr131"}, {"tr131_tr132"}, {"tr132_tr133"}, {"tr133_tr134"}, {"tr134_tr135"}, {"tr135_tr136"}, {"tr136_tr137"}, {"tr137_tr138"}, {"tr138_tr139"}, {"tr139_tr140"}, {"tr140_tr141"}, {"tr141_tr142"}, {"tr142_tr143"}, {"tr143_tr144"}, {"tr144_tr145"}, {"tr145_tr146"}, {"tr146_tr147"}, {"tr147_tr148"}, {"tr148_tr149"}, {"tr149_tr150"}, {"tr150_tr151"}, {"tr151_tr152"}, {"tr152_tr153"}, {"tr153_tr154"}, {"tr154_tr155"}, {"tr155_tr156"}}

    for j = 1, 156 do
        trx_interneuron[j] = 2.5
    end

    pfx_interneuron = {{"pf0_pf1"}, {"pf1_pf2"}, {"pf2_pf3"}, {"pf3_pf4"}, {"pf4_pf5"}, {"pf5_pf6"}, {"pf6_pf7"}, {"pf7_pf8"}, {"pf8_pf9"}, {"pf9_pf10"}, {"pf10_pf11"}, {"pf11_pf12"}, {"pf12_pf13"}, {"pf13_pf14"}, {"pf14_pf15"}, {"pf15_pf16"}, {"pf16_pf17"}, {"pf17_pf18"}, {"pf18_pf19"}, {"pf19_pf20"}, {"pf20_pf21"}, {"pf21_pf22"}, {"pf22_pf23"}, {"pf23_pf24"}, {"pf24_pf25"}, {"pf25_pf26"}, {"pf26_pf27"}, {"pf27_pf28"}, {"pf28_pf29"}, {"pf29_pf30"}, {"pf30_pf31"}, {"pf31_pf32"}, {"pf32_pf33"}, {"pf33_pf34"}, {"pf34_pf35"}, {"pf35_pf36"}, {"pf36_pf37"}, {"pf37_pf38"}, {"pf38_pf39"}, {"pf39_pf40"}, {"pf40_pf41"}, {"pf41_pf42"}, {"pf42_pf43"}, {"pf43_pf44"}, {"pf44_pf45"}, {"pf45_pf46"}, {"pf46_pf47"}, {"pf47_pf48"}, {"pf48_pf49"}, {"pf49_pf50"}, {"pf50_pf51"}, {"pf51_pf52"}, {"pf52_pf53"}, {"pf53_pf54"}, {"pf54_pf55"}, {"pf55_pf56"}, {"pf56_pf57"}, {"pf57_pf58"}, {"pf58_pf59"}, {"pf59_pf60"}, {"pf60_pf61"}, {"pf61_pf62"}, {"pf62_pf63"}, {"pf63_pf64"}, {"pf64_pf65"}, {"pf65_pf66"}, {"pf66_pf67"}, {"pf67_pf68"}, {"pf68_pf69"}, {"pf69_pf70"}, {"pf70_pf71"}, {"pf71_pf72"}, {"pf72_pf73"}, {"pf73_pf74"}, {"pf74_pf75"}, {"pf75_pf76"}, {"pf76_pf77"}, {"pf77_pf78"}, {"pf78_pf79"}, {"pf79_pf80"}, {"pf80_pf81"}, {"pf81_pf82"}, {"pf82_pf83"}, {"pf83_pf84"}, {"pf84_pf85"}, {"pf85_pf86"}, {"pf86_pf87"}, {"pf87_pf88"}, {"pf88_pf89"}, {"pf89_pf90"}, {"pf90_pf91"}, {"pf91_pf92"}, {"pf92_pf93"}, {"pf93_pf94"}, {"pf94_pf95"}, {"pf95_pf96"}, {"pf96_pf97"}, {"pf97_pf98"}, {"pf98_pf99"}, {"pf99_pf100"}, {"pf100_pf101"}, {"pf101_pf102"}, {"pf102_pf103"}, {"pf103_pf104"}, {"pf104_pf105"}, {"pf105_pf106"}, {"pf106_pf107"}, {"pf107_pf108"}, {"pf108_pf109"}, {"pf109_pf110"}, {"pf110_pf111"}, {"pf111_pf112"}, {"pf112_pf113"}, {"pf113_pf114"}, {"pf114_pf115"}, {"pf115_pf116"}, {"pf116_pf117"}, {"pf117_pf118"}, {"pf118_pf119"}, {"pf119_pf120"}, {"pf120_pf121"}, {"pf121_pf122"}, {"pf122_pf123"}, {"pf123_pf124"}, {"pf124_pf125"}, {"pf125_pf126"}, {"pf126_pf127"}, {"pf127_pf128"}, {"pf128_pf129"}, {"pf129_pf130"}, {"pf130_pf131"}, {"pf131_pf132"}, {"pf132_pf133"}, {"pf133_pf134"}, {"pf134_pf135"}, {"pf135_pf136"}, {"pf136_pf137"}, {"pf137_pf138"}, {"pf138_pf139"}, {"pf139_pf140"}, {"pf140_pf141"}, {"pf141_pf142"}, {"pf142_pf143"}, {"pf143_pf144"}, {"pf144_pf145"}, {"pf145_pf146"}, {"pf146_pf147"}, {"pf147_pf148"}, {"pf148_pf149"}, {"pf149_pf150"}, {"pf150_pf151"}, {"pf151_pf152"}, {"pf152_pf153"}, {"pf153_pf154"}, {"pf154_pf155"}, {"pf155_pf156"}, {"pf156_pf157"}, {"pf157_pf158"}, {"pf158_pf159"}, {"pf159_pf160"}, {"pf160_pf161"}}

    for m = 1, 161 do
        pfx_interneuron[m] = 2.5
    end

    recurrent_left_pf = {{"recurrent_left_pf_0"}, {"recurrent_left_pf_1"},{"recurrent_left_pf_2"}, {"recurrent_left_pf_3"}, {"recurrent_left_pf_4"},{"recurrent_left_pf_5"}, {"recurrent_left_pf_6"}, {"recurrent_left_pf_7"}, {"recurrent_left_pf_8"}, {"recurrent_left_pf_9"}, {"recurrent_left_pf_10"}, {"recurrent_left_pf_11"}, {"recurrent_left_pf_12"}, {"recurrent_left_pf_13"}, {"recurrent_left_pf_14"}, {"recurrent_left_pf_15"}, {"recurrent_left_pf_16"}, {"recurrent_left_pf_17"}, {"recurrent_left_pf_18"}, {"recurrent_left_pf_19"}, {"recurrent_left_pf_20"}, {"recurrent_left_pf_21"}, {"recurrent_left_pf_22"}, {"recurrent_left_pf_23"}, {"recurrent_left_pf_24"}, {"recurrent_left_pf_25"}, {"recurrent_left_pf_26"}, {"recurrent_left_pf_27"}, {"recurrent_left_pf_28"}, {"recurrent_left_pf_29"}, {"recurrent_left_pf_30"}, {"recurrent_left_pf_31"}, {"recurrent_left_pf_32"}, {"recurrent_left_pf_33"}, {"recurrent_left_pf_34"}, {"recurrent_left_pf_35"}, {"recurrent_left_pf_36"}, {"recurrent_left_pf_37"}, {"recurrent_left_pf_38"}, {"recurrent_left_pf_39"}, {"recurrent_left_pf_40"}, {"recurrent_left_pf_41"}, {"recurrent_left_pf_42"}, {"recurrent_left_pf_43"}, {"recurrent_left_pf_44"}, {"recurrent_left_pf_45"}, {"recurrent_left_pf_46"}, {"recurrent_left_pf_47"}, {"recurrent_left_pf_48"}, {"recurrent_left_pf_49"}, {"recurrent_left_pf_50"}, {"recurrent_left_pf_51"}, {"recurrent_left_pf_52"}, {"recurrent_left_pf_53"}, {"recurrent_left_pf_54"}, {"recurrent_left_pf_55"}, {"recurrent_left_pf_56"}, {"recurrent_left_pf_57"}, {"recurrent_left_pf_58"}, {"recurrent_left_pf_59"}, {"recurrent_left_pf_60"}, {"recurrent_left_pf_61"}, {"recurrent_left_pf_62"}, {"recurrent_left_pf_63"}, {"recurrent_left_pf_64"}, {"recurrent_left_pf_65"}, {"recurrent_left_pf_66"}, {"recurrent_left_pf_67"}, {"recurrent_left_pf_68"}, {"recurrent_left_pf_69"}, {"recurrent_left_pf_70"}, {"recurrent_left_pf_71"}, {"recurrent_left_pf_72"}, {"recurrent_left_pf_73"}, {"recurrent_left_pf_74"}, {"recurrent_left_pf_75"}, {"recurrent_left_pf_76"}, {"recurrent_left_pf_77"}, {"recurrent_left_pf_78"}, {"recurrent_left_pf_79"}, {"recurrent_left_pf_80"}, {"recurrent_left_pf_81"}, {"recurrent_left_pf_82"}, {"recurrent_left_pf_83"}, {"recurrent_left_pf_84"}, {"recurrent_left_pf_85"}, {"recurrent_left_pf_86"}, {"recurrent_left_pf_87"}, {"recurrent_left_pf_88"}, {"recurrent_left_pf_89"}, {"recurrent_left_pf_90"}, {"recurrent_left_pf_91"}, {"recurrent_left_pf_92"}, {"recurrent_left_pf_93"}, {"recurrent_left_pf_94"}, {"recurrent_left_pf_95"}, {"recurrent_left_pf_96"}, {"recurrent_left_pf_97"}, {"recurrent_left_pf_98"}, {"recurrent_left_pf_99"}, {"recurrent_left_pf_100"}, {"recurrent_left_pf_101"}, {"recurrent_left_pf_102"}, {"recurrent_left_pf_103"}, {"recurrent_left_pf_104"}, {"recurrent_left_pf_105"}, {"recurrent_left_pf_106"}, {"recurrent_left_pf_107"}, {"recurrent_left_pf_108"}, {"recurrent_left_pf_109"}, {"recurrent_left_pf_110"}, {"recurrent_left_pf_111"}, {"recurrent_left_pf_112"}, {"recurrent_left_pf_113"}, {"recurrent_left_pf_114"}, {"recurrent_left_pf_115"}, {"recurrent_left_pf_116"}, {"recurrent_left_pf_117"}, {"recurrent_left_pf_118"}, {"recurrent_left_pf_119"}, {"recurrent_left_pf_120"}, {"recurrent_left_pf_121"}, {"recurrent_left_pf_122"}, {"recurrent_left_pf_123"}, {"recurrent_left_pf_124"}, {"recurrent_left_pf_125"}, {"recurrent_left_pf_126"}, {"recurrent_left_pf_127"}, {"recurrent_left_pf_128"}, {"recurrent_left_pf_129"}, {"recurrent_left_pf_130"}, {"recurrent_left_pf_131"}, {"recurrent_left_pf_132"}, {"recurrent_left_pf_133"}, {"recurrent_left_pf_134"}, {"recurrent_left_pf_135"}, {"recurrent_left_pf_136"}, {"recurrent_left_pf_137"}, {"recurrent_left_pf_138"}, {"recurrent_left_pf_139"}, {"recurrent_left_pf_140"}, {"recurrent_left_pf_141"}, {"recurrent_left_pf_142"}, {"recurrent_left_pf_143"}, {"recurrent_left_pf_144"}, {"recurrent_left_pf_145"}, {"recurrent_left_pf_146"}, {"recurrent_left_pf_147"}, {"recurrent_left_pf_148"}, {"recurrent_left_pf_149"}, {"recurrent_left_pf_150"}, {"recurrent_left_pf_151"}, {"recurrent_left_pf_152"}, {"recurrent_left_pf_153"}, {"recurrent_left_pf_154"}, {"recurrent_left_pf_155"}, {"recurrent_left_pf_156"}, {"recurrent_left_pf_157"}, {"recurrent_left_pf_158"}, {"recurrent_left_pf_159"}, {"recurrent_left_pf_160"}, {"recurrent_left_pf_161"}}

    for o = 1, 162 do
        recurrent_left_pf[o] = 1.5
    end

    --RIGHT

    recurrent_right_tr = {{"recurrent_right_tr_0"}, {"recurrent_right_tr_1"},{"recurrent_right_tr_2"}, {"recurrent_right_tr_3"}, {"recurrent_right_tr_4"},{"recurrent_right_tr_5"}, {"recurrent_right_tr_6"}, {"recurrent_right_tr_7"}, {"recurrent_right_tr_8"}, {"recurrent_right_tr_9"}, {"recurrent_right_tr_10"}, {"recurrent_right_tr_11"}, {"recurrent_right_tr_12"}, {"recurrent_right_tr_13"}, {"recurrent_right_tr_14"}, {"recurrent_right_tr_15"}, {"recurrent_right_tr_16"}, {"recurrent_right_tr_17"}, {"recurrent_right_tr_18"}, {"recurrent_right_tr_19"}, {"recurrent_right_tr_20"}, {"recurrent_right_tr_21"}, {"recurrent_right_tr_22"}, {"recurrent_right_tr_23"}, {"recurrent_right_tr_24"}, {"recurrent_right_tr_25"}, {"recurrent_right_tr_26"}, {"recurrent_right_tr_27"}, {"recurrent_right_tr_28"}, {"recurrent_right_tr_29"}, {"recurrent_right_tr_30"}, {"recurrent_right_tr_31"}, {"recurrent_right_tr_32"}, {"recurrent_right_tr_33"}, {"recurrent_right_tr_34"}, {"recurrent_right_tr_35"}, {"recurrent_right_tr_36"}, {"recurrent_right_tr_37"}, {"recurrent_right_tr_38"}, {"recurrent_right_tr_39"}, {"recurrent_right_tr_40"}, {"recurrent_right_tr_41"}, {"recurrent_right_tr_42"}, {"recurrent_right_tr_43"}, {"recurrent_right_tr_44"}, {"recurrent_right_tr_45"}, {"recurrent_right_tr_46"}, {"recurrent_right_tr_47"}, {"recurrent_right_tr_48"}, {"recurrent_right_tr_49"}, {"recurrent_right_tr_50"}, {"recurrent_right_tr_51"}, {"recurrent_right_tr_52"}, {"recurrent_right_tr_53"}, {"recurrent_right_tr_54"}, {"recurrent_right_tr_55"}, {"recurrent_right_tr_56"}, {"recurrent_right_tr_57"}, {"recurrent_right_tr_58"}, {"recurrent_right_tr_59"}, {"recurrent_right_tr_60"}, {"recurrent_right_tr_61"}, {"recurrent_right_tr_62"}, {"recurrent_right_tr_63"}, {"recurrent_right_tr_64"}, {"recurrent_right_tr_65"}, {"recurrent_right_tr_66"}, {"recurrent_right_tr_67"}, {"recurrent_right_tr_68"}, {"recurrent_right_tr_69"}, {"recurrent_right_tr_70"}, {"recurrent_right_tr_71"}, {"recurrent_right_tr_72"}, {"recurrent_right_tr_73"}, {"recurrent_right_tr_74"}, {"recurrent_right_tr_75"}, {"recurrent_right_tr_76"}, {"recurrent_right_tr_77"}, {"recurrent_right_tr_78"}, {"recurrent_right_tr_79"}, {"recurrent_right_tr_80"}, {"recurrent_right_tr_81"}, {"recurrent_right_tr_82"}, {"recurrent_right_tr_83"}, {"recurrent_right_tr_84"}, {"recurrent_right_tr_85"}, {"recurrent_right_tr_86"}, {"recurrent_right_tr_87"}, {"recurrent_right_tr_88"}, {"recurrent_right_tr_89"}, {"recurrent_right_tr_90"}, {"recurrent_right_tr_91"}, {"recurrent_right_tr_92"}, {"recurrent_right_tr_93"}, {"recurrent_right_tr_94"}, {"recurrent_right_tr_95"}, {"recurrent_right_tr_96"}, {"recurrent_right_tr_97"}, {"recurrent_right_tr_98"}, {"recurrent_right_tr_99"}, {"recurrent_right_tr_100"}, {"recurrent_right_tr_101"}, {"recurrent_right_tr_102"}, {"recurrent_right_tr_103"}, {"recurrent_right_tr_104"}, {"recurrent_right_tr_105"}, {"recurrent_right_tr_106"}, {"recurrent_right_tr_107"}, {"recurrent_right_tr_108"}, {"recurrent_right_tr_109"}, {"recurrent_right_tr_110"}, {"recurrent_right_tr_111"}, {"recurrent_right_tr_112"}, {"recurrent_right_tr_113"}, {"recurrent_right_tr_114"}, {"recurrent_right_tr_115"}, {"recurrent_right_tr_116"}, {"recurrent_right_tr_117"}, {"recurrent_right_tr_118"}, {"recurrent_right_tr_119"}, {"recurrent_right_tr_120"}, {"recurrent_right_tr_121"}, {"recurrent_right_tr_122"}, {"recurrent_right_tr_123"}, {"recurrent_right_tr_124"}, {"recurrent_right_tr_125"}, {"recurrent_right_tr_126"}, {"recurrent_right_tr_127"}, {"recurrent_right_tr_128"}, {"recurrent_right_tr_129"}, {"recurrent_right_tr_130"}, {"recurrent_right_tr_131"}, {"recurrent_right_tr_132"}, {"recurrent_right_tr_133"}, {"recurrent_right_tr_134"}, {"recurrent_right_tr_135"}, {"recurrent_right_tr_136"}, {"recurrent_right_tr_137"}, {"recurrent_right_tr_138"}, {"recurrent_right_tr_139"}, {"recurrent_right_tr_140"}, {"recurrent_right_tr_141"}, {"recurrent_right_tr_142"}, {"recurrent_right_tr_143"}, {"recurrent_right_tr_144"}, {"recurrent_right_tr_145"}, {"recurrent_right_tr_146"}, {"recurrent_right_tr_147"}, {"recurrent_right_tr_148"}, {"recurrent_right_tr_149"}, {"recurrent_right_tr_150"}, {"recurrent_right_tr_151"}, {"recurrent_right_tr_152"}, {"recurrent_right_tr_153"}, {"recurrent_right_tr_154"}, {"recurrent_right_tr_155"}, {"recurrent_right_tr_156"}}

    for k = 1, 157 do
        recurrent_right_tr[k] = 1.5
    end

    tr1_I14 = 0.0
    
    trx_interneuron_right = {{"tr0_tr1R"}, {"tr1_tr2R"}, {"tr2_tr3R"}, {"tr3_tr4R"}, {"tr4_tr5R"}, {"tr5_tr6R"}, {"tr6_tr7R"}, {"tr7_tr8R"}, {"tr8_tr9R"}, {"tr9_tr10R"}, {"tr10_tr11R"}, {"tr11_tr12R"}, {"tr12_tr13R"}, {"tr13_tr14R"}, {"tr14_tr15R"}, {"tr15_tr16R"}, {"tr16_tr17R"}, {"tr17_tr18R"}, {"tr18_tr19R"}, {"tr19_tr20R"}, {"tr20_tr21R"}, {"tr21_tr22R"}, {"tr22_tr23R"}, {"tr23_tr24R"}, {"tr24_tr25R"}, {"tr25_tr26R"}, {"tr26_tr27R"}, {"tr27_tr28R"}, {"tr28_tr29R"}, {"tr29_tr30R"}, {"tr30_tr31R"}, {"tr31_tr32R"}, {"tr32_tr33R"}, {"tr33_tr34R"}, {"tr34_tr35R"}, {"tr35_tr36R"}, {"tr36_tr37R"}, {"tr37_tr38R"}, {"tr38_tr39R"}, {"tr39_tr40R"}, {"tr40_tr41R"}, {"tr41_tr42R"}, {"tr42_tr43R"}, {"tr43_tr44R"}, {"tr44_tr45R"}, {"tr45_tr46R"}, {"tr46_tr47R"}, {"tr47_tr48R"}, {"tr48_tr49R"}, {"tr49_tr50R"}, {"tr50_tr51R"}, {"tr51_tr52R"}, {"tr52_tr53R"}, {"tr53_tr54R"}, {"tr54_tr55R"}, {"tr55_tr56R"}, {"tr56_tr57R"}, {"tr57_tr58R"}, {"tr58_tr59R"}, {"tr59_tr60R"}, {"tr60_tr61R"}, {"tr61_tr62R"}, {"tr62_tr63R"}, {"tr63_tr64R"}, {"tr64_tr65R"}, {"tr65_tr66R"}, {"tr66_tr67R"}, {"tr67_tr68R"}, {"tr68_tr69R"}, {"tr69_tr70R"}, {"tr70_tr71R"}, {"tr71_tr72R"}, {"tr72_tr73R"}, {"tr73_tr74R"}, {"tr74_tr75R"}, {"tr75_tr76R"}, {"tr76_tr77R"}, {"tr77_tr78R"}, {"tr78_tr79R"}, {"tr79_tr80R"}, {"tr80_tr81R"}, {"tr81_tr82R"}, {"tr82_tr83R"}, {"tr83_tr84R"}, {"tr84_tr85R"}, {"tr85_tr86R"}, {"tr86_tr87R"}, {"tr87_tr88R"}, {"tr88_tr89R"}, {"tr89_tr90R"}, {"tr90_tr91R"}, {"tr91_tr92R"}, {"tr92_tr93R"}, {"tr93_tr94R"}, {"tr94_tr95R"}, {"tr95_tr96R"}, {"tr96_tr97R"}, {"tr97_tr98R"}, {"tr98_tr99R"}, {"tr99_tr100R"}, {"tr100_tr101R"}, {"tr101_tr102R"}, {"tr102_tr103R"}, {"tr103_tr104R"}, {"tr104_tr105R"}, {"tr105_tr106R"}, {"tr106_tr107R"}, {"tr107_tr108R"}, {"tr108_tr109R"}, {"tr109_tr110R"}, {"tr110_tr111R"}, {"tr111_tr112R"}, {"tr112_tr113R"}, {"tr113_tr114R"}, {"tr114_tr115R"}, {"tr115_tr116R"}, {"tr116_tr117R"}, {"tr117_tr118R"}, {"tr118_tr119R"}, {"tr119_tr120R"}, {"tr120_tr121R"}, {"tr121_tr122R"}, {"tr122_tr123R"}, {"tr123_tr124R"}, {"tr124_tr125R"}, {"tr125_tr126R"}, {"tr126_tr127R"}, {"tr127_tr128R"}, {"tr128_tr129R"}, {"tr129_tr130R"}, {"tr130_tr131R"}, {"tr131_tr132R"}, {"tr132_tr133R"}, {"tr133_tr134R"}, {"tr134_tr135R"}, {"tr135_tr136R"}, {"tr136_tr137R"}, {"tr137_tr138R"}, {"tr138_tr139R"}, {"tr139_tr140R"}, {"tr140_tr141R"}, {"tr141_tr142R"}, {"tr142_tr143R"}, {"tr143_tr144R"}, {"tr144_tr145R"}, {"tr145_tr146R"}, {"tr146_tr147R"}, {"tr147_tr148R"}, {"tr148_tr149R"}, {"tr149_tr150R"}, {"tr150_tr151R"}, {"tr151_tr152R"}, {"tr152_tr153R"}, {"tr153_tr154R"}, {"tr154_tr155R"}, {"tr155_tr156R"}}

    for l = 1, 156 do
        trx_interneuron_right[l] = 2.5
    end

    pfx_interneuron_right = {{"pf0_pf1R"}, {"pf1_pf2R"}, {"pf2_pf3R"}, {"pf3_pf4R"}, {"pf4_pf5R"}, {"pf5_pf6R"}, {"pf6_pf7R"}, {"pf7_pf8R"}, {"pf8_pf9R"}, {"pf9_pf10R"}, {"pf10_pf11R"}, {"pf11_pf12R"}, {"pf12_pf13R"}, {"pf13_pf14R"}, {"pf14_pf15R"}, {"pf15_pf16R"}, {"pf16_pf17R"}, {"pf17_pf18R"}, {"pf18_pf19R"}, {"pf19_pf20R"}, {"pf20_pf21R"}, {"pf21_pf22R"}, {"pf22_pf23R"}, {"pf23_pf24R"}, {"pf24_pf25R"}, {"pf25_pf26R"}, {"pf26_pf27R"}, {"pf27_pf28R"}, {"pf28_pf29R"}, {"pf29_pf30R"}, {"pf30_pf31R"}, {"pf31_pf32R"}, {"pf32_pf33R"}, {"pf33_pf34R"}, {"pf34_pf35R"}, {"pf35_pf36R"}, {"pf36_pf37R"}, {"pf37_pf38R"}, {"pf38_pf39R"}, {"pf39_pf40R"}, {"pf40_pf41R"}, {"pf41_pf42R"}, {"pf42_pf43R"}, {"pf43_pf44R"}, {"pf44_pf45R"}, {"pf45_pf46R"}, {"pf46_pf47R"}, {"pf47_pf48R"}, {"pf48_pf49R"}, {"pf49_pf50R"}, {"pf50_pf51R"}, {"pf51_pf52R"}, {"pf52_pf53R"}, {"pf53_pf54R"}, {"pf54_pf55R"}, {"pf55_pf56R"}, {"pf56_pf57R"}, {"pf57_pf58R"}, {"pf58_pf59R"}, {"pf59_pf60R"}, {"pf60_pf61R"}, {"pf61_pf62R"}, {"pf62_pf63R"}, {"pf63_pf64R"}, {"pf64_pf65R"}, {"pf65_pf66R"}, {"pf66_pf67R"}, {"pf67_pf68R"}, {"pf68_pf69R"}, {"pf69_pf70R"}, {"pf70_pf71R"}, {"pf71_pf72R"}, {"pf72_pf73R"}, {"pf73_pf74R"}, {"pf74_pf75R"}, {"pf75_pf76R"}, {"pf76_pf77R"}, {"pf77_pf78R"}, {"pf78_pf79R"}, {"pf79_pf80R"}, {"pf80_pf81R"}, {"pf81_pf82R"}, {"pf82_pf83R"}, {"pf83_pf84R"}, {"pf84_pf85R"}, {"pf85_pf86R"}, {"pf86_pf87R"}, {"pf87_pf88R"}, {"pf88_pf89R"}, {"pf89_pf90R"}, {"pf90_pf91R"}, {"pf91_pf92R"}, {"pf92_pf93R"}, {"pf93_pf94R"}, {"pf94_pf95R"}, {"pf95_pf96R"}, {"pf96_pf97R"}, {"pf97_pf98R"}, {"pf98_pf99R"}, {"pf99_pf100R"}, {"pf100_pf101R"}, {"pf101_pf102R"}, {"pf102_pf103R"}, {"pf103_pf104R"}, {"pf104_pf105R"}, {"pf105_pf106R"}, {"pf106_pf107R"}, {"pf107_pf108R"}, {"pf108_pf109R"}, {"pf109_pf110R"}, {"pf110_pf111R"}, {"pf111_pf112R"}, {"pf112_pf113R"}, {"pf113_pf114R"}, {"pf114_pf115R"}, {"pf115_pf116R"}, {"pf116_pf117R"}, {"pf117_pf118R"}, {"pf118_pf119R"}, {"pf119_pf120R"}, {"pf120_pf121R"}, {"pf121_pf122R"}, {"pf122_pf123R"}, {"pf123_pf124R"}, {"pf124_pf125R"}, {"pf125_pf126R"}, {"pf126_pf127R"}, {"pf127_pf128R"}, {"pf128_pf129R"}, {"pf129_pf130R"}, {"pf130_pf131R"}, {"pf131_pf132R"}, {"pf132_pf133R"}, {"pf133_pf134R"}, {"pf134_pf135R"}, {"pf135_pf136R"}, {"pf136_pf137R"}, {"pf137_pf138R"}, {"pf138_pf139R"}, {"pf139_pf140R"}, {"pf140_pf141R"}, {"pf141_pf142R"}, {"pf142_pf143R"}, {"pf143_pf144R"}, {"pf144_pf145R"}, {"pf145_pf146R"}, {"pf146_pf147R"}, {"pf147_pf148R"}, {"pf148_pf149R"}, {"pf149_pf150R"}, {"pf150_pf151R"}, {"pf151_pf152R"}, {"pf152_pf153R"}, {"pf153_pf154R"}, {"pf154_pf155R"}, {"pf155_pf156R"}, {"pf156_pf157R"}, {"pf157_pf158R"}, {"pf158_pf159R"}, {"pf159_pf160R"}, {"pf160_pf161R"}}

    for n = 1, 161 do
        pfx_interneuron_right[n] = 2.5
    end

    recurrent_right_pf = {{"recurrent_right_pf_0"}, {"recurrent_right_pf_1"},{"recurrent_right_pf_2"}, {"recurrent_right_pf_3"}, {"recurrent_right_pf_4"},{"recurrent_right_pf_5"}, {"recurrent_right_pf_6"}, {"recurrent_right_pf_7"}, {"recurrent_right_pf_8"}, {"recurrent_right_pf_9"}, {"recurrent_right_pf_10"}, {"recurrent_right_pf_11"}, {"recurrent_right_pf_12"}, {"recurrent_right_pf_13"}, {"recurrent_right_pf_14"}, {"recurrent_right_pf_15"}, {"recurrent_right_pf_16"}, {"recurrent_right_pf_17"}, {"recurrent_right_pf_18"}, {"recurrent_right_pf_19"}, {"recurrent_right_pf_20"}, {"recurrent_right_pf_21"}, {"recurrent_right_pf_22"}, {"recurrent_right_pf_23"}, {"recurrent_right_pf_24"}, {"recurrent_right_pf_25"}, {"recurrent_right_pf_26"}, {"recurrent_right_pf_27"}, {"recurrent_right_pf_28"}, {"recurrent_right_pf_29"}, {"recurrent_right_pf_30"}, {"recurrent_right_pf_31"}, {"recurrent_right_pf_32"}, {"recurrent_right_pf_33"}, {"recurrent_right_pf_34"}, {"recurrent_right_pf_35"}, {"recurrent_right_pf_36"}, {"recurrent_right_pf_37"}, {"recurrent_right_pf_38"}, {"recurrent_right_pf_39"}, {"recurrent_right_pf_40"}, {"recurrent_right_pf_41"}, {"recurrent_right_pf_42"}, {"recurrent_right_pf_43"}, {"recurrent_right_pf_44"}, {"recurrent_right_pf_45"}, {"recurrent_right_pf_46"}, {"recurrent_right_pf_47"}, {"recurrent_right_pf_48"}, {"recurrent_right_pf_49"}, {"recurrent_right_pf_50"}, {"recurrent_right_pf_51"}, {"recurrent_right_pf_52"}, {"recurrent_right_pf_53"}, {"recurrent_right_pf_54"}, {"recurrent_right_pf_55"}, {"recurrent_right_pf_56"}, {"recurrent_right_pf_57"}, {"recurrent_right_pf_58"}, {"recurrent_right_pf_59"}, {"recurrent_right_pf_60"}, {"recurrent_right_pf_61"}, {"recurrent_right_pf_62"}, {"recurrent_right_pf_63"}, {"recurrent_right_pf_64"}, {"recurrent_right_pf_65"}, {"recurrent_right_pf_66"}, {"recurrent_right_pf_67"}, {"recurrent_right_pf_68"}, {"recurrent_right_pf_69"}, {"recurrent_right_pf_70"}, {"recurrent_right_pf_71"}, {"recurrent_right_pf_72"}, {"recurrent_right_pf_73"}, {"recurrent_right_pf_74"}, {"recurrent_right_pf_75"}, {"recurrent_right_pf_76"}, {"recurrent_right_pf_77"}, {"recurrent_right_pf_78"}, {"recurrent_right_pf_79"}, {"recurrent_right_pf_80"}, {"recurrent_right_pf_81"}, {"recurrent_right_pf_82"}, {"recurrent_right_pf_83"}, {"recurrent_right_pf_84"}, {"recurrent_right_pf_85"}, {"recurrent_right_pf_86"}, {"recurrent_right_pf_87"}, {"recurrent_right_pf_88"}, {"recurrent_right_pf_89"}, {"recurrent_right_pf_90"}, {"recurrent_right_pf_91"}, {"recurrent_right_pf_92"}, {"recurrent_right_pf_93"}, {"recurrent_right_pf_94"}, {"recurrent_right_pf_95"}, {"recurrent_right_pf_96"}, {"recurrent_right_pf_97"}, {"recurrent_right_pf_98"}, {"recurrent_right_pf_99"}, {"recurrent_right_pf_100"}, {"recurrent_right_pf_101"}, {"recurrent_right_pf_102"}, {"recurrent_right_pf_103"}, {"recurrent_right_pf_104"}, {"recurrent_right_pf_105"}, {"recurrent_right_pf_106"}, {"recurrent_right_pf_107"}, {"recurrent_right_pf_108"}, {"recurrent_right_pf_109"}, {"recurrent_right_pf_110"}, {"recurrent_right_pf_111"}, {"recurrent_right_pf_112"}, {"recurrent_right_pf_113"}, {"recurrent_right_pf_114"}, {"recurrent_right_pf_115"}, {"recurrent_right_pf_116"}, {"recurrent_right_pf_117"}, {"recurrent_right_pf_118"}, {"recurrent_right_pf_119"}, {"recurrent_right_pf_120"}, {"recurrent_right_pf_121"}, {"recurrent_right_pf_122"}, {"recurrent_right_pf_123"}, {"recurrent_right_pf_124"}, {"recurrent_right_pf_125"}, {"recurrent_right_pf_126"}, {"recurrent_right_pf_127"}, {"recurrent_right_pf_128"}, {"recurrent_right_pf_129"}, {"recurrent_right_pf_130"}, {"recurrent_right_pf_131"}, {"recurrent_right_pf_132"}, {"recurrent_right_pf_133"}, {"recurrent_right_pf_134"}, {"recurrent_right_pf_135"}, {"recurrent_right_pf_136"}, {"recurrent_right_pf_137"}, {"recurrent_right_pf_138"}, {"recurrent_right_pf_139"}, {"recurrent_right_pf_140"}, {"recurrent_right_pf_141"}, {"recurrent_right_pf_142"}, {"recurrent_right_pf_143"}, {"recurrent_right_pf_144"}, {"recurrent_right_pf_145"}, {"recurrent_right_pf_146"}, {"recurrent_right_pf_147"}, {"recurrent_right_pf_148"}, {"recurrent_right_pf_149"}, {"recurrent_right_pf_150"}, {"recurrent_right_pf_151"}, {"recurrent_right_pf_152"}, {"recurrent_right_pf_153"}, {"recurrent_right_pf_154"}, {"recurrent_right_pf_155"}, {"recurrent_right_pf_156"}, {"recurrent_right_pf_157"}, {"recurrent_right_pf_158"}, {"recurrent_right_pf_159"}, {"recurrent_right_pf_160"}, {"recurrent_right_pf_161"}}

    for p = 1, 162 do
        recurrent_right_pf[p] = 1.5
    end

    --Outputs
    Output_left_tr0 = 0.001
    Output_left_tr1 = 0.001
    Output_left_tr2 = 0.001
    Output_left_tr3 = 0.001
    Output_left_tr4 = 0.001
    Output_left_tr5 = 0.001
    Output_left_tr6 = 0.001
    Output_left_tr7 = 0.001
    Output_left_tr8 = 0.001
    Output_left_tr9 = 0.001
    Output_left_tr10 = 0.001
    Output_left_tr11 = 0.001
    Output_left_tr12 = 0.001
    Output_left_tr13 = 0.001
    Output_left_tr14 = 0.001
    Output_left_tr15 = 0.001
    Output_left_tr16 = 0.001
    Output_left_tr17 = 0.001
    Output_left_tr18 = 0.001
    Output_left_tr19 = 0.001
    Output_left_tr20 = 0.001
    Output_left_tr21 = 0.001
    Output_left_tr22 = 0.001
    Output_left_tr23 = 0.001
    Output_left_tr24 = 0.001
    Output_left_tr25 = 0.001
    Output_left_tr26 = 0.001
    Output_left_tr27 = 0.001
    Output_left_tr28 = 0.001
    Output_left_tr29 = 0.001
    Output_left_tr30 = 0.001
    Output_left_tr31 = 0.001
    Output_left_tr32 = 0.001
    Output_left_tr33 = 0.001
    Output_left_tr34 = 0.001
    Output_left_tr35 = 0.001
    Output_left_tr36 = 0.001
    Output_left_tr37 = 0.001
    Output_left_tr38 = 0.001
    Output_left_tr39 = 0.001
    Output_left_tr40 = 0.001
    Output_left_tr41 = 0.001
    Output_left_tr42 = 0.001
    Output_left_tr43 = 0.001
    Output_left_tr44 = 0.001
    Output_left_tr45 = 0.001
    Output_left_tr46 = 0.001
    Output_left_tr47 = 0.001
    Output_left_tr48 = 0.001
    Output_left_tr49 = 0.001
    Output_left_tr50 = 0.001
    Output_left_tr51 = 0.001
    Output_left_tr52 = 0.001
    Output_left_tr53 = 0.001
    Output_left_tr54 = 0.001
    Output_left_tr55 = 0.001
    Output_left_tr56 = 0.001
    Output_left_tr57 = 0.001
    Output_left_tr58 = 0.001
    Output_left_tr59 = 0.001
    Output_left_tr60 = 0.001
    Output_left_tr61 = 0.001
    Output_left_tr62 = 0.001
    Output_left_tr63 = 0.001
    Output_left_tr64 = 0.001
    Output_left_tr65 = 0.001
    Output_left_tr66 = 0.001
    Output_left_tr67 = 0.001
    Output_left_tr68 = 0.001
    Output_left_tr69 = 0.001
    Output_left_tr70 = 0.001
    Output_left_tr71 = 0.001
    Output_left_tr72 = 0.001
    Output_left_tr73 = 0.001
    Output_left_tr74 = 0.001
    Output_left_tr75 = 0.001
    Output_left_tr76 = 0.001
    Output_left_tr77 = 0.001
    Output_left_tr78 = 0.001
    Output_left_tr79 = 0.001
    Output_left_tr80 = 0.001
    Output_left_tr81 = 0.001
    Output_left_tr82 = 0.001
    Output_left_tr83 = 0.001
    Output_left_tr84 = 0.001
    Output_left_tr85 = 0.001
    Output_left_tr86 = 0.001
    Output_left_tr87 = 0.001
    Output_left_tr88 = 0.001
    Output_left_tr89 = 0.001
    Output_left_tr90 = 0.001
    Output_left_tr91 = 0.001
    Output_left_tr92 = 0.001
    Output_left_tr93 = 0.001
    Output_left_tr94 = 0.001
    Output_left_tr95 = 0.001
    Output_left_tr96 = 0.001
    Output_left_tr97 = 0.001
    Output_left_tr98 = 0.001
    Output_left_tr99 = 0.001
    Output_left_tr100 = 0.001
    Output_left_tr101 = 0.001
    Output_left_tr102 = 0.001
    Output_left_tr103 = 0.001
    Output_left_tr104 = 0.001
    Output_left_tr105 = 0.001
    Output_left_tr106 = 0.001
    Output_left_tr107 = 0.001
    Output_left_tr108 = 0.001
    Output_left_tr109 = 0.001
    Output_left_tr110 = 0.001
    Output_left_tr111 = 0.001
    Output_left_tr112 = 0.001
    Output_left_tr113 = 0.001
    Output_left_tr114 = 0.001
    Output_left_tr115 = 0.001
    Output_left_tr116 = 0.001
    Output_left_tr117 = 0.001
    Output_left_tr118 = 0.001
    Output_left_tr119 = 0.001
    Output_left_tr120 = 0.001
    Output_left_tr121 = 0.001
    Output_left_tr122 = 0.001
    Output_left_tr123 = 0.001
    Output_left_tr124 = 0.001
    Output_left_tr125 = 0.001
    Output_left_tr126 = 0.001
    Output_left_tr127 = 0.001
    Output_left_tr128 = 0.001
    Output_left_tr129 = 0.001
    Output_left_tr130 = 0.001
    Output_left_tr131 = 0.001
    Output_left_tr132 = 0.001
    Output_left_tr133 = 0.001
    Output_left_tr134 = 0.001
    Output_left_tr135 = 0.001
    Output_left_tr136 = 0.001
    Output_left_tr137 = 0.001
    Output_left_tr138 = 0.001
    Output_left_tr139 = 0.001
    Output_left_tr140 = 0.001
    Output_left_tr141 = 0.001
    Output_left_tr142 = 0.001
    Output_left_tr143 = 0.001
    Output_left_tr144 = 0.001
    Output_left_tr145 = 0.001
    Output_left_tr146 = 0.001
    Output_left_tr147 = 0.001
    Output_left_tr148 = 0.001
    Output_left_tr149 = 0.001
    Output_left_tr150 = 0.001
    Output_left_tr151 = 0.001
    Output_left_tr152 = 0.001
    Output_left_tr153 = 0.001
    Output_left_tr154 = 0.001
    Output_left_tr155 = 0.001
    Output_left_tr156 = 0.001

    Output_right_tr0 = 0.001
    Output_right_tr1 = 0.001
    Output_right_tr2 = 0.001
    Output_right_tr3 = 0.001
    Output_right_tr4 = 0.001
    Output_right_tr5 = 0.001
    Output_right_tr6 = 0.001
    Output_right_tr7 = 0.001
    Output_right_tr8 = 0.001
    Output_right_tr9 = 0.001
    Output_right_tr10 = 0.001
    Output_right_tr11 = 0.001
    Output_right_tr12 = 0.001
    Output_right_tr13 = 0.001
    Output_right_tr14 = 0.001
    Output_right_tr15 = 0.001
    Output_right_tr16 = 0.001
    Output_right_tr17 = 0.001
    Output_right_tr18 = 0.001
    Output_right_tr19 = 0.001
    Output_right_tr20 = 0.001
    Output_right_tr21 = 0.001
    Output_right_tr22 = 0.001
    Output_right_tr23 = 0.001
    Output_right_tr24 = 0.001
    Output_right_tr25 = 0.001
    Output_right_tr26 = 0.001
    Output_right_tr27 = 0.001
    Output_right_tr28 = 0.001
    Output_right_tr29 = 0.001
    Output_right_tr30 = 0.001
    Output_right_tr31 = 0.001
    Output_right_tr32 = 0.001
    Output_right_tr33 = 0.001
    Output_right_tr34 = 0.001
    Output_right_tr35 = 0.001
    Output_right_tr36 = 0.001
    Output_right_tr37 = 0.001
    Output_right_tr38 = 0.001
    Output_right_tr39 = 0.001
    Output_right_tr40 = 0.001
    Output_right_tr41 = 0.001
    Output_right_tr42 = 0.001
    Output_right_tr43 = 0.001
    Output_right_tr44 = 0.001
    Output_right_tr45 = 0.001
    Output_right_tr46 = 0.001
    Output_right_tr47 = 0.001
    Output_right_tr48 = 0.001
    Output_right_tr49 = 0.001
    Output_right_tr50 = 0.001
    Output_right_tr51 = 0.001
    Output_right_tr52 = 0.001
    Output_right_tr53 = 0.001
    Output_right_tr54 = 0.001
    Output_right_tr55 = 0.001
    Output_right_tr56 = 0.001
    Output_right_tr57 = 0.001
    Output_right_tr58 = 0.001
    Output_right_tr59 = 0.001
    Output_right_tr60 = 0.001
    Output_right_tr61 = 0.001
    Output_right_tr62 = 0.001
    Output_right_tr63 = 0.001
    Output_right_tr64 = 0.001
    Output_right_tr65 = 0.001
    Output_right_tr66 = 0.001
    Output_right_tr67 = 0.001
    Output_right_tr68 = 0.001
    Output_right_tr69 = 0.001
    Output_right_tr70 = 0.001
    Output_right_tr71 = 0.001
    Output_right_tr72 = 0.001
    Output_right_tr73 = 0.001
    Output_right_tr74 = 0.001
    Output_right_tr75 = 0.001
    Output_right_tr76 = 0.001
    Output_right_tr77 = 0.001
    Output_right_tr78 = 0.001
    Output_right_tr79 = 0.001
    Output_right_tr80 = 0.001
    Output_right_tr81 = 0.001
    Output_right_tr82 = 0.001
    Output_right_tr83 = 0.001
    Output_right_tr84 = 0.001
    Output_right_tr85 = 0.001
    Output_right_tr86 = 0.001
    Output_right_tr87 = 0.001
    Output_right_tr88 = 0.001
    Output_right_tr89 = 0.001
    Output_right_tr90 = 0.001
    Output_right_tr91 = 0.001
    Output_right_tr92 = 0.001
    Output_right_tr93 = 0.001
    Output_right_tr94 = 0.001
    Output_right_tr95 = 0.001
    Output_right_tr96 = 0.001
    Output_right_tr97 = 0.001
    Output_right_tr98 = 0.001
    Output_right_tr99 = 0.001
    Output_right_tr100 = 0.001
    Output_right_tr101 = 0.001
    Output_right_tr102 = 0.001
    Output_right_tr103 = 0.001
    Output_right_tr104 = 0.001
    Output_right_tr105 = 0.001
    Output_right_tr106 = 0.001
    Output_right_tr107 = 0.001
    Output_right_tr108 = 0.001
    Output_right_tr109 = 0.001
    Output_right_tr110 = 0.001
    Output_right_tr111 = 0.001
    Output_right_tr112 = 0.001
    Output_right_tr113 = 0.001
    Output_right_tr114 = 0.001
    Output_right_tr115 = 0.001
    Output_right_tr116 = 0.001
    Output_right_tr117 = 0.001
    Output_right_tr118 = 0.001
    Output_right_tr119 = 0.001
    Output_right_tr120 = 0.001
    Output_right_tr121 = 0.001
    Output_right_tr122 = 0.001
    Output_right_tr123 = 0.001
    Output_right_tr124 = 0.001
    Output_right_tr125 = 0.001
    Output_right_tr126 = 0.001
    Output_right_tr127 = 0.001
    Output_right_tr128 = 0.001
    Output_right_tr129 = 0.001
    Output_right_tr130 = 0.001
    Output_right_tr131 = 0.001
    Output_right_tr132 = 0.001
    Output_right_tr133 = 0.001
    Output_right_tr134 = 0.001
    Output_right_tr135 = 0.001
    Output_right_tr136 = 0.001
    Output_right_tr137 = 0.001
    Output_right_tr138 = 0.001
    Output_right_tr139 = 0.001
    Output_right_tr140 = 0.001
    Output_right_tr141 = 0.001
    Output_right_tr142 = 0.001
    Output_right_tr143 = 0.001
    Output_right_tr144 = 0.001
    Output_right_tr145 = 0.001
    Output_right_tr146 = 0.001
    Output_right_tr147 = 0.001
    Output_right_tr148 = 0.001
    Output_right_tr149 = 0.001
    Output_right_tr150 = 0.001
    Output_right_tr151 = 0.001
    Output_right_tr152 = 0.001
    Output_right_tr153 = 0.001
    Output_right_tr154 = 0.001
    Output_right_tr155 = 0.001
    Output_right_tr156 = 0.001

    Output_left_pf0 = 0.001
    Output_left_pf1 = 0.001
    Output_left_pf2 = 0.001
    Output_left_pf3 = 0.001
    Output_left_pf4 = 0.001
    Output_left_pf5 = 0.001
    Output_left_pf6 = 0.001
    Output_left_pf7 = 0.001
    Output_left_pf8 = 0.001
    Output_left_pf9 = 0.001
    Output_left_pf10 = 0.001
    Output_left_pf11 = 0.001
    Output_left_pf12 = 0.001
    Output_left_pf13 = 0.001
    Output_left_pf14 = 0.001
    Output_left_pf15 = 0.001
    Output_left_pf16 = 0.001
    Output_left_pf17 = 0.001
    Output_left_pf18 = 0.001
    Output_left_pf19 = 0.001
    Output_left_pf20 = 0.001
    Output_left_pf21 = 0.001
    Output_left_pf22 = 0.001
    Output_left_pf23 = 0.001
    Output_left_pf24 = 0.001
    Output_left_pf25 = 0.001
    Output_left_pf26 = 0.001
    Output_left_pf27 = 0.001
    Output_left_pf28 = 0.001
    Output_left_pf29 = 0.001
    Output_left_pf30 = 0.001
    Output_left_pf31 = 0.001
    Output_left_pf32 = 0.001
    Output_left_pf33 = 0.001
    Output_left_pf34 = 0.001
    Output_left_pf35 = 0.001
    Output_left_pf36 = 0.001
    Output_left_pf37 = 0.001
    Output_left_pf38 = 0.001
    Output_left_pf39 = 0.001
    Output_left_pf40 = 0.001
    Output_left_pf41 = 0.001
    Output_left_pf42 = 0.001
    Output_left_pf43 = 0.001
    Output_left_pf44 = 0.001
    Output_left_pf45 = 0.001
    Output_left_pf46 = 0.001
    Output_left_pf47 = 0.001
    Output_left_pf48 = 0.001
    Output_left_pf49 = 0.001
    Output_left_pf50 = 0.001
    Output_left_pf51 = 0.001
    Output_left_pf52 = 0.001
    Output_left_pf53 = 0.001
    Output_left_pf54 = 0.001
    Output_left_pf55 = 0.001
    Output_left_pf56 = 0.001
    Output_left_pf57 = 0.001
    Output_left_pf58 = 0.001
    Output_left_pf59 = 0.001
    Output_left_pf60 = 0.001
    Output_left_pf61 = 0.001
    Output_left_pf62 = 0.001
    Output_left_pf63 = 0.001
    Output_left_pf64 = 0.001
    Output_left_pf65 = 0.001
    Output_left_pf66 = 0.001
    Output_left_pf67 = 0.001
    Output_left_pf68 = 0.001
    Output_left_pf69 = 0.001
    Output_left_pf70 = 0.001
    Output_left_pf71 = 0.001
    Output_left_pf72 = 0.001
    Output_left_pf73 = 0.001
    Output_left_pf74 = 0.001
    Output_left_pf75 = 0.001
    Output_left_pf76 = 0.001
    Output_left_pf77 = 0.001
    Output_left_pf78 = 0.001
    Output_left_pf79 = 0.001
    Output_left_pf80 = 0.001
    Output_left_pf81 = 0.001
    Output_left_pf82 = 0.001
    Output_left_pf83 = 0.001
    Output_left_pf84 = 0.001
    Output_left_pf85 = 0.001
    Output_left_pf86 = 0.001
    Output_left_pf87 = 0.001
    Output_left_pf88 = 0.001
    Output_left_pf89 = 0.001
    Output_left_pf90 = 0.001
    Output_left_pf91 = 0.001
    Output_left_pf92 = 0.001
    Output_left_pf93 = 0.001
    Output_left_pf94 = 0.001
    Output_left_pf95 = 0.001
    Output_left_pf96 = 0.001
    Output_left_pf97 = 0.001
    Output_left_pf98 = 0.001
    Output_left_pf99 = 0.001
    Output_left_pf100 = 0.001
    Output_left_pf101 = 0.001
    Output_left_pf102 = 0.001
    Output_left_pf103 = 0.001
    Output_left_pf104 = 0.001
    Output_left_pf105 = 0.001
    Output_left_pf106 = 0.001
    Output_left_pf107 = 0.001
    Output_left_pf108 = 0.001
    Output_left_pf109 = 0.001
    Output_left_pf110 = 0.001
    Output_left_pf111 = 0.001
    Output_left_pf112 = 0.001
    Output_left_pf113 = 0.001
    Output_left_pf114 = 0.001
    Output_left_pf115 = 0.001
    Output_left_pf116 = 0.001
    Output_left_pf117 = 0.001
    Output_left_pf118 = 0.001
    Output_left_pf119 = 0.001
    Output_left_pf120 = 0.001
    Output_left_pf121 = 0.001
    Output_left_pf122 = 0.001
    Output_left_pf123 = 0.001
    Output_left_pf124 = 0.001
    Output_left_pf125 = 0.001
    Output_left_pf126 = 0.001
    Output_left_pf127 = 0.001
    Output_left_pf128 = 0.001
    Output_left_pf129 = 0.001
    Output_left_pf130 = 0.001
    Output_left_pf131 = 0.001
    Output_left_pf132 = 0.001
    Output_left_pf133 = 0.001
    Output_left_pf134 = 0.001
    Output_left_pf135 = 0.001
    Output_left_pf136 = 0.001
    Output_left_pf137 = 0.001
    Output_left_pf138 = 0.001
    Output_left_pf139 = 0.001
    Output_left_pf140 = 0.001
    Output_left_pf141 = 0.001
    Output_left_pf142 = 0.001
    Output_left_pf143 = 0.001
    Output_left_pf144 = 0.001
    Output_left_pf145 = 0.001
    Output_left_pf146 = 0.001
    Output_left_pf147 = 0.001
    Output_left_pf148 = 0.001
    Output_left_pf149 = 0.001
    Output_left_pf150 = 0.001
    Output_left_pf151 = 0.001
    Output_left_pf152 = 0.001
    Output_left_pf153 = 0.001
    Output_left_pf154 = 0.001
    Output_left_pf155 = 0.001
    Output_left_pf156 = 0.001
    Output_left_pf157 = 0.001
    Output_left_pf158 = 0.001
    Output_left_pf159 = 0.001
    Output_left_pf160 = 0.001
    Output_left_pf161 = 0.001

    Output_right_pf0 = 0.001
    Output_right_pf1 = 0.001
    Output_right_pf2 = 0.001
    Output_right_pf3 = 0.001
    Output_right_pf4 = 0.001
    Output_right_pf5 = 0.001
    Output_right_pf6 = 0.001
    Output_right_pf7 = 0.001
    Output_right_pf8 = 0.001
    Output_right_pf9 = 0.001
    Output_right_pf10 = 0.001
    Output_right_pf11 = 0.001
    Output_right_pf12 = 0.001
    Output_right_pf13 = 0.001
    Output_right_pf14 = 0.001
    Output_right_pf15 = 0.001
    Output_right_pf16 = 0.001
    Output_right_pf17 = 0.001
    Output_right_pf18 = 0.001
    Output_right_pf19 = 0.001
    Output_right_pf20 = 0.001
    Output_right_pf21 = 0.001
    Output_right_pf22 = 0.001
    Output_right_pf23 = 0.001
    Output_right_pf24 = 0.001
    Output_right_pf25 = 0.001
    Output_right_pf26 = 0.001
    Output_right_pf27 = 0.001
    Output_right_pf28 = 0.001
    Output_right_pf29 = 0.001
    Output_right_pf30 = 0.001
    Output_right_pf31 = 0.001
    Output_right_pf32 = 0.001
    Output_right_pf33 = 0.001
    Output_right_pf34 = 0.001
    Output_right_pf35 = 0.001
    Output_right_pf36 = 0.001
    Output_right_pf37 = 0.001
    Output_right_pf38 = 0.001
    Output_right_pf39 = 0.001
    Output_right_pf40 = 0.001
    Output_right_pf41 = 0.001
    Output_right_pf42 = 0.001
    Output_right_pf43 = 0.001
    Output_right_pf44 = 0.001
    Output_right_pf45 = 0.001
    Output_right_pf46 = 0.001
    Output_right_pf47 = 0.001
    Output_right_pf48 = 0.001
    Output_right_pf49 = 0.001
    Output_right_pf50 = 0.001
    Output_right_pf51 = 0.001
    Output_right_pf52 = 0.001
    Output_right_pf53 = 0.001
    Output_right_pf54 = 0.001
    Output_right_pf55 = 0.001
    Output_right_pf56 = 0.001
    Output_right_pf57 = 0.001
    Output_right_pf58 = 0.001
    Output_right_pf59 = 0.001
    Output_right_pf60 = 0.001
    Output_right_pf61 = 0.001
    Output_right_pf62 = 0.001
    Output_right_pf63 = 0.001
    Output_right_pf64 = 0.001
    Output_right_pf65 = 0.001
    Output_right_pf66 = 0.001
    Output_right_pf67 = 0.001
    Output_right_pf68 = 0.001
    Output_right_pf69 = 0.001
    Output_right_pf70 = 0.001
    Output_right_pf71 = 0.001
    Output_right_pf72 = 0.001
    Output_right_pf73 = 0.001
    Output_right_pf74 = 0.001
    Output_right_pf75 = 0.001
    Output_right_pf76 = 0.001
    Output_right_pf77 = 0.001
    Output_right_pf78 = 0.001
    Output_right_pf79 = 0.001
    Output_right_pf80 = 0.001
    Output_right_pf81 = 0.001
    Output_right_pf82 = 0.001
    Output_right_pf83 = 0.001
    Output_right_pf84 = 0.001
    Output_right_pf85 = 0.001
    Output_right_pf86 = 0.001
    Output_right_pf87 = 0.001
    Output_right_pf88 = 0.001
    Output_right_pf89 = 0.001
    Output_right_pf90 = 0.001
    Output_right_pf91 = 0.001
    Output_right_pf92 = 0.001
    Output_right_pf93 = 0.001
    Output_right_pf94 = 0.001
    Output_right_pf95 = 0.001
    Output_right_pf96 = 0.001
    Output_right_pf97 = 0.001
    Output_right_pf98 = 0.001
    Output_right_pf99 = 0.001
    Output_right_pf100 = 0.001
    Output_right_pf101 = 0.001
    Output_right_pf102 = 0.001
    Output_right_pf103 = 0.001
    Output_right_pf104 = 0.001
    Output_right_pf105 = 0.001
    Output_right_pf106 = 0.001
    Output_right_pf107 = 0.001
    Output_right_pf108 = 0.001
    Output_right_pf109 = 0.001
    Output_right_pf110 = 0.001
    Output_right_pf111 = 0.001
    Output_right_pf112 = 0.001
    Output_right_pf113 = 0.001
    Output_right_pf114 = 0.001
    Output_right_pf115 = 0.001
    Output_right_pf116 = 0.001
    Output_right_pf117 = 0.001
    Output_right_pf118 = 0.001
    Output_right_pf119 = 0.001
    Output_right_pf120 = 0.001
    Output_right_pf121 = 0.001
    Output_right_pf122 = 0.001
    Output_right_pf123 = 0.001
    Output_right_pf124 = 0.001
    Output_right_pf125 = 0.001
    Output_right_pf126 = 0.001
    Output_right_pf127 = 0.001
    Output_right_pf128 = 0.001
    Output_right_pf129 = 0.001
    Output_right_pf130 = 0.001
    Output_right_pf131 = 0.001
    Output_right_pf132 = 0.001
    Output_right_pf133 = 0.001
    Output_right_pf134 = 0.001
    Output_right_pf135 = 0.001
    Output_right_pf136 = 0.001
    Output_right_pf137 = 0.001
    Output_right_pf138 = 0.001
    Output_right_pf139 = 0.001
    Output_right_pf140 = 0.001
    Output_right_pf141 = 0.001
    Output_right_pf142 = 0.001
    Output_right_pf143 = 0.001
    Output_right_pf144 = 0.001
    Output_right_pf145 = 0.001
    Output_right_pf146 = 0.001
    Output_right_pf147 = 0.001
    Output_right_pf148 = 0.001
    Output_right_pf149 = 0.001
    Output_right_pf150 = 0.001
    Output_right_pf151 = 0.001
    Output_right_pf152 = 0.001
    Output_right_pf153 = 0.001
    Output_right_pf154 = 0.001
    Output_right_pf155 = 0.001
    Output_right_pf156 = 0.001
    Output_right_pf157 = 0.001
    Output_right_pf158 = 0.001
    Output_right_pf159 = 0.001
    Output_right_pf160 = 0.001
    Output_right_pf161 = 0.001
    
    --elimate phase shift

    --Body undulation controls
    --Project the neuronal signals every 10th neuron to each vertbend joint to create a delay line for body undulation
    --Left side control
    --Seg 0
    WeightI4_1 = 3.0
    Weight1_1 = 0.0
    Output_1 = 0.001

    Weight1_2 = 3.0
    Weight2_2 = 2.0
    Output_2 = 0.001

    Weight2_3 = 3.0
    Weight3_3 = 2.0
    Output_3 = 0.001

    Weight3_4 = 3.0
    Weight4_4 = 2.0
    Output_4 = 0.001

    Weight4_5 = 3.0
    Weight5_5 = 2.0
    Output_5 = 0.001

    Weight5_6 = 3.0
    Weight6_6 = 2.0
    Output_6 = 0.001

    Weight6_7 = 3.0
    Weight7_7 = 2.0
    Output_7 = 0.001

    Weight7_8 = 3.0
    Weight8_8 = 2.0
    Output_8 = 0.001

    Weight8_9 = 3.0
    Weight9_9 = 2.0
    Output_9 = 0.001

    Weight9_10 = 3.0
    Weight10_10 = 2.0
    Output_10 = 0.001

    Weight10_11 = 3.0
    Weight11_11 = 2.0
    Output_11 = 0.001

    Weight11_12 = 3.0
    Weight12_12 = 2.0
    Output_12 = 0.001

    Weight12_13 = 3.0
    Weight13_13 = 2.0
    Output_13 = 0.001

    Weight13_14 = 3.0
    Weight14_14 = 2.0
    Output_14 = 0.001

    Weight14_15 = 3.0
    Weight15_15 = 2.0
    Output_15 = 0.001

    Weight15_16 = 3.0
    Weight16_16 = 2.0
    Output_16 = 0.001

    Weight16_17 = 3.0
    Weight17_17 = 2.0
    Output_17 = 0.001
    
    Weight17_18 = 3.0
    Weight18_18 = 2.0
    Output_18 = 0.001
    
    Weight18_19 = 3.0
    Weight19_19 = 2.0
    Output_19 = 0.001
    
    Weight19_20 = 3.0
    Weight20_20 = 2.0
    Output_20 = 0.001
    
    Weight20_21 = 3.0
    Weight21_21 = 2.0
    Output_21 = 0.001
    
    Weight21_22 = 3.0
    Weight22_22 = 2.0
    Output_22 = 0.001
    
    Weight22_23 = 3.0
    Weight23_23 = 2.0
    Output_23 = 0.001
    
    Weight23_24 = 3.0
    Weight24_24 = 2.0
    Output_24 = 0.001
    
    Weight24_25 = 3.0
    Weight25_25 = 2.0
    Output_25 = 0.001
    
    Weight25_26 = 3.0
    Weight26_26 = 2.0
    Output_26 = 0.001
    
    Weight26_27 = 3.0
    Weight27_27 = 2.0
    Output_27 = 0.001
    
    Weight27_28 = 3.0
    Weight28_28 = 2.0
    Output_28 = 0.001
    
    Weight28_29 = 3.0
    Weight29_29 = 2.0
    Output_29 = 0.001
    
    Weight29_30 = 3.0
    Weight30_30 = 2.0
    Output_30 = 0.001
    
    Weight30_31 = 3.0
    Weight31_31 = 2.0
    Output_31 = 0.001
    
    Weight31_32 = 3.0
    Weight32_32 = 2.0
    Output_32 = 0.001
    
    Weight32_33 = 3.0
    Weight33_33 = 2.0
    Output_33 = 0.001
    
    Weight33_34 = 3.0
    Weight34_34 = 2.0
    Output_34 = 0.001
    
    Weight34_35 = 3.0
    Weight35_35 = 2.0
    Output_35 = 0.001
    
    Weight35_36 = 3.0
    Weight36_36 = 2.0
    Output_36 = 0.001
    
    Weight36_37 = 3.0
    Weight37_37 = 2.0
    Output_37 = 0.001
    
    Weight37_38 = 3.0
    Weight38_38 = 2.0
    Output_38 = 0.001
    
    Weight38_39 = 3.0
    Weight39_39 = 2.0
    Output_39 = 0.001
    
    Weight39_40 = 3.0
    Weight40_40 = 2.0
    Output_40 = 0.001
    
    Weight40_41 = 3.0
    Weight41_41 = 2.0
    Output_41 = 0.001
    
    Weight41_42 = 3.0
    Weight42_42 = 2.0
    Output_42 = 0.001
    
    Weight42_43 = 3.0
    Weight43_43 = 2.0
    Output_43 = 0.001
    
    Weight43_44 = 3.0
    Weight44_44 = 2.0
    Output_44 = 0.001
    
    Weight44_45 = 3.0
    Weight45_45 = 2.0
    Output_45 = 0.001
    
    Weight45_46 = 3.0
    Weight46_46 = 2.0
    Output_46 = 0.001
    
    Weight46_47 = 3.0
    Weight47_47 = 2.0
    Output_47 = 0.001
    
    Weight47_48 = 3.0
    Weight48_48 = 2.0
    Output_48 = 0.001
    
    Weight48_49 = 3.0
    Weight49_49 = 2.0
    Output_49 = 0.001
    
    Weight49_50 = 3.0
    Weight50_50 = 2.0
    Output_50 = 0.001
    
    Weight50_51 = 3.0
    Weight51_51 = 2.0
    Output_51 = 0.001
    
    Weight51_52 = 3.0
    Weight52_52 = 2.0
    Output_52 = 0.001
    
    Weight52_53 = 3.0
    Weight53_53 = 2.0
    Output_53 = 0.001
    
    Weight53_54 = 3.0
    Weight54_54 = 2.0
    Output_54 = 0.001
    
    Weight54_55 = 3.0
    Weight55_55 = 2.0
    Output_55 = 0.001
    
    Weight55_56 = 3.0
    Weight56_56 = 2.0
    Output_56 = 0.001
    
    Weight56_57 = 3.0
    Weight57_57 = 2.0
    Output_57 = 0.001
    
    Weight57_58 = 3.0
    Weight58_58 = 2.0
    Output_58 = 0.001
    
    Weight58_59 = 3.0
    Weight59_59 = 2.0
    Output_59 = 0.001
    
    Weight59_60 = 3.0
    Weight60_60 = 2.0
    Output_60 = 0.001
    
    Weight60_61 = 3.0
    Weight61_61 = 2.0
    Output_61 = 0.001
    
    Weight61_62 = 3.0
    Weight62_62 = 2.0
    Output_62 = 0.001
    
    Weight62_63 = 3.0
    Weight63_63 = 2.0
    Output_63 = 0.001
    
    Weight63_64 = 3.0
    Weight64_64 = 2.0
    Output_64 = 0.001
    
    Weight64_65 = 3.0
    Weight65_65 = 2.0
    Output_65 = 0.001
    
    Weight65_66 = 3.0
    Weight66_66 = 2.0
    Output_66 = 0.001
    
    Weight66_67 = 3.0
    Weight67_67 = 2.0
    Output_67 = 0.001
    
    Weight67_68 = 3.0
    Weight68_68 = 2.0
    Output_68 = 0.001
    
    Weight68_69 = 3.0
    Weight69_69 = 2.0
    Output_69 = 0.001
    
    Weight69_70 = 3.0
    Weight70_70 = 2.0
    Output_70 = 0.001
    
    Weight70_71 = 3.0
    Weight71_71 = 2.0
    Output_71 = 0.001
    
    Weight71_72 = 3.0
    Weight72_72 = 2.0
    Output_72 = 0.001
    
    Weight72_73 = 3.0
    Weight73_73 = 2.0
    Output_73 = 0.001
    
    Weight73_74 = 3.0
    Weight74_74 = 2.0
    Output_74 = 0.001
    
    Weight74_75 = 3.0
    Weight75_75 = 2.0
    Output_75 = 0.001
    
    Weight75_76 = 3.0
    Weight76_76 = 2.0
    Output_76 = 0.001
    
    Weight76_77 = 3.0
    Weight77_77 = 2.0
    Output_77 = 0.001
    
    Weight77_78 = 3.0
    Weight78_78 = 2.0
    Output_78 = 0.001
    
    Weight78_79 = 3.0
    Weight79_79 = 2.0
    Output_79 = 0.001
    
    Weight79_80 = 3.0
    Weight80_80 = 2.0
    Output_80 = 0.001

    Weight80_81 = 3.0
    Weight81_81 = 2.0
    Output_81 = 0.001
    
    Weight81_82 = 3.0
    Weight82_82 = 2.0
    Output_82 = 0.001
    
    Weight82_83 = 3.0
    Weight83_83 = 2.0
    Output_83 = 0.001
    
    Weight83_84 = 3.0
    Weight84_84 = 2.0
    Output_84 = 0.001
    
    Weight84_85 = 3.0
    Weight85_85 = 2.0
    Output_85 = 0.001
    
    Weight85_86 = 3.0
    Weight86_86 = 2.0
    Output_86 = 0.001
    
    Weight86_87 = 3.0
    Weight87_87 = 2.0
    Output_87 = 0.001
    
    Weight87_88 = 3.0
    Weight88_88 = 2.0
    Output_88 = 0.001
    
    Weight88_89 = 3.0
    Weight89_89 = 2.0
    Output_89 = 0.001
    
    Weight89_90 = 3.0
    Weight90_90 = 2.0
    Output_90 = 0.001
    
    Weight90_91 = 3.0
    Weight91_91 = 2.0
    Output_91 = 0.001
    
    Weight91_92 = 3.0
    Weight92_92 = 2.0
    Output_92 = 0.001
    
    Weight92_93 = 3.0
    Weight93_93 = 2.0
    Output_93 = 0.001
    
    Weight93_94 = 3.0
    Weight94_94 = 2.0
    Output_94 = 0.001
    
    Weight94_95 = 3.0
    Weight95_95 = 2.0
    Output_95 = 0.001
    
    Weight95_96 = 3.0
    Weight96_96 = 2.0
    Output_96 = 0.001
    
    Weight96_97 = 3.0
    Weight97_97 = 2.0
    Output_97 = 0.001
    
    Weight97_98 = 3.0
    Weight98_98 = 2.0
    Output_98 = 0.001
    
    Weight98_99 = 3.0
    Weight99_99 = 2.0
    Output_99 = 0.001
    
    Weight99_100 = 3.0
    Weight100_100 = 2.0
    Output_100 = 0.001
    
    Weight100_101 = 3.0
    Weight101_101 = 2.0
    Output_101 = 0.001
    
    Weight101_102 = 3.0
    Weight102_102 = 2.0
    Output_102 = 0.001
    
    Weight102_103 = 3.0
    Weight103_103 = 2.0
    Output_103 = 0.001
    
    Weight103_104 = 3.0
    Weight104_104 = 2.0
    Output_104 = 0.001
    
    Weight104_105 = 3.0
    Weight105_105 = 2.0
    Output_105 = 0.001
    
    Weight105_106 = 3.0
    Weight106_106 = 2.0
    Output_106 = 0.001
    
    Weight106_107 = 3.0
    Weight107_107 = 2.0
    Output_107 = 0.001
    
    Weight107_108 = 3.0
    Weight108_108 = 2.0
    Output_108 = 0.001
    
    Weight108_109 = 3.0
    Weight109_109 = 2.0
    Output_109 = 0.001
    
    Weight109_110 = 3.0
    Weight110_110 = 2.0
    Output_110 = 0.001
    
    Weight110_111 = 3.0
    Weight111_111 = 2.0
    Output_111 = 0.001
    
    Weight111_112 = 3.0
    Weight112_112 = 2.0
    Output_112 = 0.001
    
    Weight112_113 = 3.0
    Weight113_113 = 2.0
    Output_113 = 0.001
    
    Weight113_114 = 3.0
    Weight114_114 = 2.0
    Output_114 = 0.001
    
    Weight114_115 = 3.0
    Weight115_115 = 2.0
    Output_115 = 0.001
    
    Weight115_116 = 3.0
    Weight116_116 = 2.0
    Output_116 = 0.001
    
    Weight116_117 = 3.0
    Weight117_117 = 2.0
    Output_117 = 0.001
    
    Weight117_118 = 3.0
    Weight118_118 = 2.0
    Output_118 = 0.001
    
    Weight118_119 = 3.0
    Weight119_119 = 2.0
    Output_119 = 0.001
    
    Weight119_120 = 3.0
    Weight120_120 = 2.0
    Output_120 = 0.001
    
    Weight120_121 = 3.0
    Weight121_121 = 2.0
    Output_121 = 0.001
    
    Weight121_122 = 3.0
    Weight122_122 = 2.0
    Output_122 = 0.001
    
    Weight122_123 = 3.0
    Weight123_123 = 2.0
    Output_123 = 0.001
    
    Weight123_124 = 3.0
    Weight124_124 = 2.0
    Output_124 = 0.001
    
    Weight124_125 = 3.0
    Weight125_125 = 2.0
    Output_125 = 0.001
    
    Weight125_126 = 3.0
    Weight126_126 = 2.0
    Output_126 = 0.001
    
    Weight126_127 = 3.0
    Weight127_127 = 2.0
    Output_127 = 0.001
    
    Weight127_128 = 3.0
    Weight128_128 = 2.0
    Output_128 = 0.001
    
    Weight128_129 = 3.0
    Weight129_129 = 2.0
    Output_129 = 0.001
    
    Weight129_130 = 3.0
    Weight130_130 = 2.0
    Output_130 = 0.001
    
    Weight130_131 = 3.0
    Weight131_131 = 2.0
    Output_131 = 0.001
    
    Weight131_132 = 3.0
    Weight132_132 = 2.0
    Output_132 = 0.001


    --Right side control
    --Seg 0
    WeightI3_1R = 3.0
    Weight1R_1R = 0.0
    Output_1R = 0.001

    Weight1R_2R = 3.0
    Weight2R_2R = 2.0
    Output_2R = 0.001

    Weight2R_3R = 3.0
    Weight3R_3R = 2.0
    Output_3R = 0.001

    Weight3R_4R = 3.0
    Weight4R_4R = 2.0
    Output_4R = 0.001

    Weight4R_5R = 3.0
    Weight5R_5R = 2.0
    Output_5R = 0.001

    Weight5R_6R = 3.0
    Weight6R_6R = 2.0
    Output_6R = 0.001

    Weight6R_7R = 3.0
    Weight7R_7R = 2.0
    Output_7R = 0.001

    Weight7R_8R = 3.0
    Weight8R_8R = 2.0
    Output_8R = 0.001

    Weight8R_9R = 3.0
    Weight9R_9R = 2.0
    Output_9R = 0.001

    Weight9R_10R = 3.0
    Weight10R_10R = 2.0
    Output_10R = 0.001

    Weight10R_11R = 3.0
    Weight11R_11R = 2.0
    Output_11R = 0.001

    Weight11R_12R = 3.0
    Weight12R_12R = 2.0
    Output_12R = 0.001

    Weight12R_13R = 3.0
    Weight13R_13R = 2.0
    Output_13R = 0.001

    Weight13R_14R = 3.0
    Weight14R_14R = 2.0
    Output_14R = 0.001

    Weight14R_15R = 3.0
    Weight15R_15R = 2.0
    Output_15R = 0.001

    Weight15R_16R = 3.0
    Weight16R_16R = 2.0
    Output_16R = 0.001

    Weight16R_17R = 3.0
    Weight17R_17R = 2.0
    Output_17R = 0.001
    
    Weight17R_18R = 3.0
    Weight18R_18R = 2.0
    Output_18R = 0.001
    
    Weight18R_19R = 3.0
    Weight19R_19R = 2.0
    Output_19R = 0.001
    
    Weight19R_20R = 3.0
    Weight20R_20R = 2.0
    Output_20R = 0.001
    
    Weight20R_21R = 3.0
    Weight21R_21R = 2.0
    Output_21R = 0.001
    
    Weight21R_22R = 3.0
    Weight22R_22R = 2.0
    Output_22R = 0.001
    
    Weight22R_23R = 3.0
    Weight23R_23R = 2.0
    Output_23R = 0.001
    
    Weight23R_24R = 3.0
    Weight24R_24R = 2.0
    Output_24R = 0.001
    
    Weight24R_25R = 3.0
    Weight25R_25R = 2.0
    Output_25R = 0.001
    
    Weight25R_26R = 3.0
    Weight26R_26R = 2.0
    Output_26R = 0.001
    
    Weight26R_27R = 3.0
    Weight27R_27R = 2.0
    Output_27R = 0.001
    
    Weight27R_28R = 3.0
    Weight28R_28R = 2.0
    Output_28R = 0.001
    
    Weight28R_29R = 3.0
    Weight29R_29R = 2.0
    Output_29R = 0.001
    
    Weight29R_30R = 3.0
    Weight30R_30R = 2.0
    Output_30R = 0.001
    
    Weight30R_31R = 3.0
    Weight31R_31R = 2.0
    Output_31R = 0.001
    
    Weight31R_32R = 3.0
    Weight32R_32R = 2.0
    Output_32R = 0.001
    
    Weight32R_33R = 3.0
    Weight33R_33R = 2.0
    Output_33R = 0.001
    
    Weight33R_34R = 3.0
    Weight34R_34R = 2.0
    Output_34R = 0.001
    
    Weight34R_35R = 3.0
    Weight35R_35R = 2.0
    Output_35R = 0.001
    
    Weight35R_36R = 3.0
    Weight36R_36R = 2.0
    Output_36R = 0.001
    
    Weight36R_37R = 3.0
    Weight37R_37R = 2.0
    Output_37R = 0.001
    
    Weight37R_38R = 3.0
    Weight38R_38R = 2.0
    Output_38R = 0.001
    
    Weight38R_39R = 3.0
    Weight39R_39R = 2.0
    Output_39R = 0.001
    
    Weight39R_40R = 3.0
    Weight40R_40R = 2.0
    Output_40R = 0.001
    
    Weight40R_41R = 3.0
    Weight41R_41R = 2.0
    Output_41R = 0.001
    
    Weight41R_42R = 3.0
    Weight42R_42R = 2.0
    Output_42R = 0.001
    
    Weight42R_43R = 3.0
    Weight43R_43R = 2.0
    Output_43R = 0.001
    
    Weight43R_44R = 3.0
    Weight44R_44R = 2.0
    Output_44R = 0.001
    
    Weight44R_45R = 3.0
    Weight45R_45R = 2.0
    Output_45R = 0.001
    
    Weight45R_46R = 3.0
    Weight46R_46R = 2.0
    Output_46R = 0.001
    
    Weight46R_47R = 3.0
    Weight47R_47R = 2.0
    Output_47R = 0.001
    
    Weight47R_48R = 3.0
    Weight48R_48R = 2.0
    Output_48R = 0.001
    
    Weight48R_49R = 3.0
    Weight49R_49R = 2.0
    Output_49R = 0.001
    
    Weight49R_50R = 3.0
    Weight50R_50R = 2.0
    Output_50R = 0.001
    
    Weight50R_51R = 3.0
    Weight51R_51R = 2.0
    Output_51R = 0.001
    
    Weight51R_52R = 3.0
    Weight52R_52R = 2.0
    Output_52R = 0.001
    
    Weight52R_53R = 3.0
    Weight53R_53R = 2.0
    Output_53R = 0.001
    
    Weight53R_54R = 3.0
    Weight54R_54R = 2.0
    Output_54R = 0.001
    
    Weight54R_55R = 3.0
    Weight55R_55R = 2.0
    Output_55R = 0.001
    
    Weight55R_56R = 3.0
    Weight56R_56R = 2.0
    Output_56R = 0.001
    
    Weight56R_57R = 3.0
    Weight57R_57R = 2.0
    Output_57R = 0.001
    
    Weight57R_58R = 3.0
    Weight58R_58R = 2.0
    Output_58R = 0.001
    
    Weight58R_59R = 3.0
    Weight59R_59R = 2.0
    Output_59R = 0.001
    
    Weight59R_60R = 3.0
    Weight60R_60R = 2.0
    Output_60R = 0.001
    
    Weight60R_61R = 3.0
    Weight61R_61R = 2.0
    Output_61R = 0.001
    
    Weight61R_62R = 3.0
    Weight62R_62R = 2.0
    Output_62R = 0.001
    
    Weight62R_63R = 3.0
    Weight63R_63R = 2.0
    Output_63R = 0.001
    
    Weight63R_64R = 3.0
    Weight64R_64R = 2.0
    Output_64R = 0.001
    
    Weight64R_65R = 3.0
    Weight65R_65R = 2.0
    Output_65R = 0.001
    
    Weight65R_66R = 3.0
    Weight66R_66R = 2.0
    Output_66R = 0.001
    
    Weight66R_67R = 3.0
    Weight67R_67R = 2.0
    Output_67R = 0.001
    
    Weight67R_68R = 3.0
    Weight68R_68R = 2.0
    Output_68R = 0.001
    
    Weight68R_69R = 3.0
    Weight69R_69R = 2.0
    Output_69R = 0.001
    
    Weight69R_70R = 3.0
    Weight70R_70R = 2.0
    Output_70R = 0.001
    
    Weight70R_71R = 3.0
    Weight71R_71R = 2.0
    Output_71R = 0.001
    
    Weight71R_72R = 3.0
    Weight72R_72R = 2.0
    Output_72R = 0.001
    
    Weight72R_73R = 3.0
    Weight73R_73R = 2.0
    Output_73R = 0.001
    
    Weight73R_74R = 3.0
    Weight74R_74R = 2.0
    Output_74R = 0.001
    
    Weight74R_75R = 3.0
    Weight75R_75R = 2.0
    Output_75R = 0.001
    
    Weight75R_76R = 3.0
    Weight76R_76R = 2.0
    Output_76R = 0.001
    
    Weight76R_77R = 3.0
    Weight77R_77R = 2.0
    Output_77R = 0.001
    
    Weight77R_78R = 3.0
    Weight78R_78R = 2.0
    Output_78R = 0.001
    
    Weight78R_79R = 3.0
    Weight79R_79R = 2.0
    Output_79R = 0.001
    
    Weight79R_80R = 3.0
    Weight80R_80R = 2.0
    Output_80R = 0.001
    
    Weight80R_81R = 3.0
    Weight81R_81R = 2.0
    Output_81R = 0.001
    
    Weight81R_82R = 3.0
    Weight82R_82R = 2.0
    Output_82R = 0.001
    
    Weight82R_83R = 3.0
    Weight83R_83R = 2.0
    Output_83R = 0.001
    
    Weight83R_84R = 3.0
    Weight84R_84R = 2.0
    Output_84R = 0.001
    
    Weight84R_85R = 3.0
    Weight85R_85R = 2.0
    Output_85R = 0.001
    
    Weight85R_86R = 3.0
    Weight86R_86R = 2.0
    Output_86R = 0.001
    
    Weight86R_87R = 3.0
    Weight87R_87R = 2.0
    Output_87R = 0.001
    
    Weight87R_88R = 3.0
    Weight88R_88R = 2.0
    Output_88R = 0.001
    
    Weight88R_89R = 3.0
    Weight89R_89R = 2.0
    Output_89R = 0.001
    
    Weight89R_90R = 3.0
    Weight90R_90R = 2.0
    Output_90R = 0.001
    
    Weight90R_91R = 3.0
    Weight91R_91R = 2.0
    Output_91R = 0.001
    
    Weight91R_92R = 3.0
    Weight92R_92R = 2.0
    Output_92R = 0.001
    
    Weight92R_93R = 3.0
    Weight93R_93R = 2.0
    Output_93R = 0.001
    
    Weight93R_94R = 3.0
    Weight94R_94R = 2.0
    Output_94R = 0.001
    
    Weight94R_95R = 3.0
    Weight95R_95R = 2.0
    Output_95R = 0.001
    
    Weight95R_96R = 3.0
    Weight96R_96R = 2.0
    Output_96R = 0.001
    
    Weight96R_97R = 3.0
    Weight97R_97R = 2.0
    Output_97R = 0.001
    
    Weight97R_98R = 3.0
    Weight98R_98R = 2.0
    Output_98R = 0.001
    
    Weight98R_99R = 3.0
    Weight99R_99R = 2.0
    Output_99R = 0.001
    
    Weight99R_100R = 3.0
    Weight100R_100R = 2.0
    Output_100R = 0.001

    Weight100R_101R = 3.0
    Weight101R_101R = 2.0
    Output_101R = 0.001
    
    Weight101R_102R = 3.0
    Weight102R_102R = 2.0
    Output_102R = 0.001
    
    Weight102R_103R = 3.0
    Weight103R_103R = 2.0
    Output_103R = 0.001
    
    Weight103R_104R = 3.0
    Weight104R_104R = 2.0
    Output_104R = 0.001
    
    Weight104R_105R = 3.0
    Weight105R_105R = 2.0
    Output_105R = 0.001
    
    Weight105R_106R = 3.0
    Weight106R_106R = 2.0
    Output_106R = 0.001
    
    Weight106R_107R = 3.0
    Weight107R_107R = 2.0
    Output_107R = 0.001
    
    Weight107R_108R = 3.0
    Weight108R_108R = 2.0
    Output_108R = 0.001
    
    Weight108R_109R = 3.0
    Weight109R_109R = 2.0
    Output_109R = 0.001
    
    Weight109R_110R = 3.0
    Weight110R_110R = 2.0
    Output_110R = 0.001
    
    Weight110R_111R = 3.0
    Weight111R_111R = 2.0
    Output_111R = 0.001
    
    Weight111R_112R = 3.0
    Weight112R_112R = 2.0
    Output_112R = 0.001
    
    Weight112R_113R = 3.0
    Weight113R_113R = 2.0
    Output_113R = 0.001
    
    Weight113R_114R = 3.0
    Weight114R_114R = 2.0
    Output_114R = 0.001
    
    Weight114R_115R = 3.0
    Weight115R_115R = 2.0
    Output_115R = 0.001
    
    Weight115R_116R = 3.0
    Weight116R_116R = 2.0
    Output_116R = 0.001
    
    Weight116R_117R = 3.0
    Weight117R_117R = 2.0
    Output_117R = 0.001
    
    Weight117R_118R = 3.0
    Weight118R_118R = 2.0
    Output_118R = 0.001
    
    Weight118R_119R = 3.0
    Weight119R_119R = 2.0
    Output_119R = 0.001
    
    Weight119R_120R = 3.0
    Weight120R_120R = 2.0
    Output_120R = 0.001
    
    Weight120R_121R = 3.0
    Weight121R_121R = 2.0
    Output_121R = 0.001
    
    Weight121R_122R = 3.0
    Weight122R_122R = 2.0
    Output_122R = 0.001
    
    Weight122R_123R = 3.0
    Weight123R_123R = 2.0
    Output_123R = 0.001
    
    Weight123R_124R = 3.0
    Weight124R_124R = 2.0
    Output_124R = 0.001
    
    Weight124R_125R = 3.0
    Weight125R_125R = 2.0
    Output_125R = 0.001
    
    Weight125R_126R = 3.0
    Weight126R_126R = 2.0
    Output_126R = 0.001
    
    Weight126R_127R = 3.0
    Weight127R_127R = 2.0
    Output_127R = 0.001
    
    Weight127R_128R = 3.0
    Weight128R_128R = 2.0
    Output_128R = 0.001
    
    Weight128R_129R = 3.0
    Weight129R_129R = 2.0
    Output_129R = 0.001
    
    Weight129R_130R = 3.0
    Weight130R_130R = 2.0
    Output_130R = 0.001
    
    Weight130R_131R = 3.0
    Weight131R_131R = 2.0
    Output_131R = 0.001
    
    Weight131R_132R = 3.0
    Weight132R_132R = 2.0
    Output_132R = 0.001

    
    --IR sensors
    IR_0 = sim.getObjectHandle("IR_0")
    IR_1 = sim.getObjectHandle("IR_1")
    IR0_signal = 0.1
    IR1_signal = 0.1

    --Drawing joint positions (can be commented out)
    --left and right tr (first)
    --graph = sim.getObjectHandle('graph')
    --tr0_left = sim.addGraphStream(graph, 'tr0 velo', 'deg/s', 0, {1, 0, 0})
    --tr0_right = sim.addGraphStream(graph, 'tr7 velo', 'deg/s', 0, {0, 1, 0})

    --left tr and pf (first)
    --graphTwo = sim.getObjectHandle('graphTwo')
    --tr0_left = sim.addGraphStream(graphTwo, 'tr0 velo', 'deg/s', 0, {1, 0, 0})
    --pf0_left = sim.addGraphStream(graphTwo, 'pf0 velo', 'deg/s', 0, {0, 1, 0})

    --right tr and pf (first)
    --graphThree = sim.getObjectHandle('graphThree')
    --tr0_right = sim.addGraphStream(graphThree, 'tr7 velo', 'deg/s', 0, {1, 0, 0})
    --pf0_right = sim.addGraphStream(graphThree, 'pf7 velo', 'deg/s', 0, {0, 1, 0})

    --left and right pf (first)
    --graphFour = sim.getObjectHandle('graphFour')
    --pf0_left = sim.addGraphStream(graphFour, 'pf0 velo', 'deg/s', 0, {1, 0, 0})
    --pf0_right = sim.addGraphStream(graphFour, 'pf7 velo', 'deg/s', 0, {0, 1, 0})

    --left and right tr (new)    
    -- graphFive = sim.getObjectHandle('graphFive')
    -- tr0_left = sim.addGraphStream(graphFive, 'tr0 velo', 'deg/s', 0, {1, 0, 0})
    -- tr0_right = sim.addGraphStream(graphFive, 'tr7 velo', 'deg/s', 0, {0, 1, 0})
    
end

function sysCall_actuation()
    --Neural calculation (oscillator equations)
    Activity_C0 = Weight_C00 * Output_C0 + Weight_C01 * Output_C1 
    Activity_C1 = Weight_C11 * Output_C1 + Weight_C10 * Output_C0 
    Output_C0 = (math.exp(2*Activity_C0)-1)/(math.exp(2*Activity_C0)+1) --tanh
    Output_C1 = (math.exp(2*Activity_C1)-1)/(math.exp(2*Activity_C1)+1)
    file:write( string.format("%f\t",Output_C0) )
    file:write( string.format("%f\t",Output_C1) )
    
    ----Non-adaptive synapses
    sim.handleProximitySensor(IR_0)
    sim.handleProximitySensor(IR_1)
    IR0_signal = sim.readProximitySensor(IR_0)
    IR1_signal = sim.readProximitySensor(IR_1)
    --Check the range of these two: IR0_signal and IR1_signal 
    result0, IR0_signal = sim.readProximitySensor(IR_0)
    result1, IR1_signal = sim.readProximitySensor(IR_1)

    if result0 < 1 then
        IR0_signal = 0.0
    end
    if result1 < 1 then
        IR1_signal = 0.0
    end
    file:write( string.format("%f\t",IR0_signal) )
    file:write( string.format("%f\t",IR1_signal) )

    
    --Change the sensor signal from discrete to continuous
    if IR0_signal > 0.0 then --obstacle detected on the left
        IR0_signal = (IR0_signal * (-2)) + 1.02
    else 
        IR0_signal = -1 --no detection
    end
    if IR1_signal > 0.0 then  --obstacle detected on the right
        IR1_signal = (IR1_signal * (-2)) + 1.02
    else
        IR1_signal = -1 --no detection
    end

    result,distance,point = sim.checkProximitySensor(IR_1, sim.handle_all)
    
    file:write( string.format("%f\t",IR0_signal) )
    file:write( string.format("%f\t",IR1_signal) )
    WeightI0_IR0 = 7.0 --IR sensor 0
    WeightI1_IR1 = 7.0 --IR sensor 1
    Weight_I00 = 5.4 
    Weight_I01 = -3.55 
    Weight_I10 = -3.55 
    Weight_I11 = 5.4

    Activity_I0 = Weight_I00 * Output_I0 + Weight_I01 * Output_I1 + WeightI0_IR0 * IR0_signal 
    Activity_I1 = Weight_I11 * Output_I1 + Weight_I10 * Output_I0 + WeightI1_IR1 * IR1_signal
    Output_I0 = (math.exp(2*Activity_I0)-1)/(math.exp(2*Activity_I0)+1) 
    Output_I1 = (math.exp(2*Activity_I1)-1)/(math.exp(2*Activity_I1)+1)

    file:write( string.format("%f\t",Output_I0) )
    file:write( string.format("%f\t",Output_I1) )
    
    Activity_I4 = 1--Output_I1 * IR_0
    Output_I4 = Activity_I4
    Activity_I3 = 1 --Output_I0 * IR_1
    Output_I3 = Activity_I3

    --body bending control
    Activity_I4b = Output_I1 * -1
    Output_I4b = Activity_I4b
    Activity_I3b = Output_I0 * -1
    Output_I3b = Activity_I3b
    
    file:write( string.format("%f\t",Output_I3b) )
    file:write( string.format("%f\t",Output_I4b) )

    file:write( string.format("%f\t",Output_J0) )
    file:write( string.format("%f\t",Output_J1) )
    file:write( string.format("%f\t",Output_J2) )
    file:write( string.format("%f\t",Output_J3) )
    file:write( string.format("%f\t",Output_J4) )
    file:write( string.format("%f\t",Output_J5) )

    file:write( string.format("%f\t",Output_J6) )
    file:write( string.format("%f\t",Output_J7) )

    --Neuronal equations for the neurons inside the VRN (new version)
    Activity_I9 = WeightI9_I4 * Output_I4 + WeightI9_C1 * Output_C1 + Bias_I9 
    Activity_I10 = WeightI10_I4 * Output_I4 + WeightI10_C1 * Output_C1 + Bias_I10 
    Activity_I11 = WeightI11_I4 * Output_I4 + WeightI11_C1 * Output_C1 + Bias_I11 
    Activity_I12 = WeightI12_I4 * Output_I4 + WeightI12_C1 * Output_C1 + Bias_I12 
    Activity_I14 = WeightI14_I9 * Output_I9 + WeightI14_I10 * Output_I10 + WeightI14_I11 * Output_I11 + WeightI14_I12 * Output_I12 
    Output_I9 = (math.exp(2*Activity_I9)-1)/(math.exp(2*Activity_I9)+1) --tanh
    Output_I10 = (math.exp(2*Activity_I10)-1)/(math.exp(2*Activity_I10)+1)
    Output_I11 = (math.exp(2*Activity_I11)-1)/(math.exp(2*Activity_I11)+1)
    Output_I12 = (math.exp(2*Activity_I12)-1)/(math.exp(2*Activity_I12)+1)
    Output_I14 = (math.exp(2*Activity_I14)-1)/(math.exp(2*Activity_I14)+1)

    --Neuronal equations for the neurons inside the VRN (new version)
    Activity_I5 = WeightI5_I3 * Output_I3 + WeightI5_C1 * Output_C1 + Bias_I5
    Activity_I6 = WeightI6_I3 * Output_I3 + WeightI6_C1 * Output_C1 + Bias_I6
    Activity_I7 = WeightI7_I3 * Output_I3 + WeightI7_C1 * Output_C1 + Bias_I7 
    Activity_I8 = WeightI8_I3 * Output_I3 + WeightI8_C1 * Output_C1 + Bias_I8 
    Activity_I13 = WeightI13_I5 * Output_I5 + WeightI13_I6 * Output_I6 + WeightI13_I7 * Output_I7 + WeightI13_I8 * Output_I8 
    Output_I5 = (math.exp(2*Activity_I5)-1)/(math.exp(2*Activity_I5)+1)
    Output_I6 = (math.exp(2*Activity_I6)-1)/(math.exp(2*Activity_I6)+1)
    Output_I7 = (math.exp(2*Activity_I7)-1)/(math.exp(2*Activity_I7)+1)
    Output_I8 = (math.exp(2*Activity_I8)-1)/(math.exp(2*Activity_I8)+1)
    Output_I13 = (math.exp(2*Activity_I13)-1)/(math.exp(2*Activity_I13)+1)
    
    file:write( string.format("%f\t",Output_I13) )
    file:write( string.format("%f\t",Output_I14) )
    
    --Wave gait
    --trochanter
    --The first recurrent neuron receives outputs from the first tr0 motor neuron
    Activity_left_tr0 = (recurrent_left_tr[1] * Output_left_tr1) + (Weighttr_I14[1] * Output_I1 * Output_C1)
    --print(Weightpf0_I14 * Output_I14 * 0.4)

    Output_left_tr0 = (math.exp(2*Activity_left_tr0)-1)/(math.exp(2*Activity_left_tr0)+1)

    Activity_left_tr1 = (recurrent_left_tr[2] * Output_left_tr1) + (trx_interneuron[1] * Output_left_tr0)

    Output_left_tr1 = (math.exp(2*Activity_left_tr1)-1)/(math.exp(2*Activity_left_tr1)+1)

    Activity_left_tr2 = (recurrent_left_tr[3] * Output_left_tr2) + (trx_interneuron[2] * Output_left_tr1)

    Output_left_tr2 = (math.exp(2*Activity_left_tr2)-1)/(math.exp(2*Activity_left_tr2)+1)

    Activity_left_tr3 = (recurrent_left_tr[4] * Output_left_tr3) + (trx_interneuron[3] * Output_left_tr2)

    Output_left_tr3 = (math.exp(2*Activity_left_tr3)-1)/(math.exp(2*Activity_left_tr3)+1)

    Activity_left_tr4 = (recurrent_left_tr[5] * Output_left_tr4) + (trx_interneuron[4] * Output_left_tr3)

    Output_left_tr4 = (math.exp(2*Activity_left_tr4)-1)/(math.exp(2*Activity_left_tr4)+1)

    Activity_left_tr5 = (recurrent_left_tr[6] * Output_left_tr5) + (trx_interneuron[5] * Output_left_tr4)

    Output_left_tr5 = (math.exp(2*Activity_left_tr5)-1)/(math.exp(2*Activity_left_tr5)+1)

    Activity_left_tr6 = (recurrent_left_tr[7] * Output_left_tr6) + (trx_interneuron[6] * Output_left_tr5)

    Output_left_tr6 = (math.exp(2*Activity_left_tr6)-1)/(math.exp(2*Activity_left_tr6)+1)

    Activity_left_tr7 = (recurrent_left_tr[8] * Output_left_tr7) + (trx_interneuron[7] * Output_left_tr6)

    Output_left_tr7 = (math.exp(2*Activity_left_tr7)-1)/(math.exp(2*Activity_left_tr7)+1)

    Activity_left_tr8 = (recurrent_left_tr[9] * Output_left_tr8) + (trx_interneuron[8] * Output_left_tr7)

    Output_left_tr8 = (math.exp(2*Activity_left_tr8)-1)/(math.exp(2*Activity_left_tr8)+1)

    Activity_left_tr9 = (recurrent_left_tr[10] * Output_left_tr9) + (trx_interneuron[9] * Output_left_tr8)

    Output_left_tr9 = (math.exp(2*Activity_left_tr9)-1)/(math.exp(2*Activity_left_tr9)+1)

    Activity_left_tr10 = (recurrent_left_tr[11] * Output_left_tr10) + (trx_interneuron[10] * Output_left_tr9)

    Output_left_tr10 = (math.exp(2*Activity_left_tr10)-1)/(math.exp(2*Activity_left_tr10)+1)



    --next leg
    
    Activity_left_tr11 = (recurrent_left_tr[12] * Output_left_tr11) + (trx_interneuron[11] * Output_left_tr10)

    Output_left_tr11 = (math.exp(2*Activity_left_tr11)-1)/(math.exp(2*Activity_left_tr11)+1)

    Activity_left_tr12 = (recurrent_left_tr[13] * Output_left_tr12) + (trx_interneuron[12] * Output_left_tr11)

    Output_left_tr12 = (math.exp(2*Activity_left_tr12)-1)/(math.exp(2*Activity_left_tr12)+1)

    Activity_left_tr13 = (recurrent_left_tr[14] * Output_left_tr13) + (trx_interneuron[13] * Output_left_tr12)

    Output_left_tr13 = (math.exp(2*Activity_left_tr13)-1)/(math.exp(2*Activity_left_tr13)+1)

    Activity_left_tr14 = (recurrent_left_tr[15] * Output_left_tr14) + (trx_interneuron[14] * Output_left_tr13)

    Output_left_tr14 = (math.exp(2*Activity_left_tr14)-1)/(math.exp(2*Activity_left_tr14)+1)

    Activity_left_tr15 = (recurrent_left_tr[16] * Output_left_tr15) + (trx_interneuron[15] * Output_left_tr14)

    Output_left_tr15 = (math.exp(2*Activity_left_tr15)-1)/(math.exp(2*Activity_left_tr15)+1)

    Activity_left_tr16 = (recurrent_left_tr[17] * Output_left_tr16) + (trx_interneuron[16] * Output_left_tr15)

    Output_left_tr16 = (math.exp(2*Activity_left_tr16)-1)/(math.exp(2*Activity_left_tr16)+1)

    Activity_left_tr17 = (recurrent_left_tr[18] * Output_left_tr17) + (trx_interneuron[17] * Output_left_tr16)

    Output_left_tr17 = (math.exp(2*Activity_left_tr17)-1)/(math.exp(2*Activity_left_tr17)+1)

    Activity_left_tr18 = (recurrent_left_tr[19] * Output_left_tr18) + (trx_interneuron[18] * Output_left_tr17)

    Output_left_tr18 = (math.exp(2*Activity_left_tr18)-1)/(math.exp(2*Activity_left_tr18)+1)

    Activity_left_tr19 = (recurrent_left_tr[20] * Output_left_tr19) + (trx_interneuron[19] * Output_left_tr18)

    Output_left_tr19 = (math.exp(2*Activity_left_tr19)-1)/(math.exp(2*Activity_left_tr19)+1)

    Activity_left_tr20 = (recurrent_left_tr[21] * Output_left_tr20) + (trx_interneuron[20] * Output_left_tr19)

    Output_left_tr20 = (math.exp(2*Activity_left_tr20)-1)/(math.exp(2*Activity_left_tr20)+1)

    --next leg

    Activity_left_tr21 = (recurrent_left_tr[22] * Output_left_tr21) + (trx_interneuron[21] * Output_left_tr20)

    Output_left_tr21 = (math.exp(2*Activity_left_tr21)-1)/(math.exp(2*Activity_left_tr21)+1)

    Activity_left_tr22 = (recurrent_left_tr[23] * Output_left_tr22) + (trx_interneuron[22] * Output_left_tr21)

    Output_left_tr22 = (math.exp(2*Activity_left_tr22)-1)/(math.exp(2*Activity_left_tr22)+1)

    Activity_left_tr23 = (recurrent_left_tr[24] * Output_left_tr23) + (trx_interneuron[23] * Output_left_tr22)

    Output_left_tr23 = (math.exp(2*Activity_left_tr23)-1)/(math.exp(2*Activity_left_tr23)+1)

    Activity_left_tr24 = (recurrent_left_tr[25] * Output_left_tr24) + (trx_interneuron[24] * Output_left_tr23)

    Output_left_tr24 = (math.exp(2*Activity_left_tr24)-1)/(math.exp(2*Activity_left_tr24)+1)

    Activity_left_tr25 = (recurrent_left_tr[26] * Output_left_tr25) + (trx_interneuron[25] * Output_left_tr24)

    Output_left_tr25 = (math.exp(2*Activity_left_tr25)-1)/(math.exp(2*Activity_left_tr25)+1)

    Activity_left_tr26 = (recurrent_left_tr[27] * Output_left_tr26) + (trx_interneuron[26] * Output_left_tr25)

    Output_left_tr26 = (math.exp(2*Activity_left_tr26)-1)/(math.exp(2*Activity_left_tr26)+1)

    Activity_left_tr27 = (recurrent_left_tr[28] * Output_left_tr27) + (trx_interneuron[27] * Output_left_tr26)

    Output_left_tr27 = (math.exp(2*Activity_left_tr27)-1)/(math.exp(2*Activity_left_tr27)+1)

    Activity_left_tr28 = (recurrent_left_tr[29] * Output_left_tr28) + (trx_interneuron[28] * Output_left_tr27)

    Output_left_tr28 = (math.exp(2*Activity_left_tr28)-1)/(math.exp(2*Activity_left_tr28)+1)

    Activity_left_tr29 = (recurrent_left_tr[30] * Output_left_tr29) + (trx_interneuron[29] * Output_left_tr28)

    Output_left_tr29 = (math.exp(2*Activity_left_tr29)-1)/(math.exp(2*Activity_left_tr29)+1)

    Activity_left_tr30 = (recurrent_left_tr[31] * Output_left_tr30) + (trx_interneuron[30] * Output_left_tr29)

    Output_left_tr30 = (math.exp(2*Activity_left_tr30)-1)/(math.exp(2*Activity_left_tr30)+1)

    --next leg

    Activity_left_tr31 = (recurrent_left_tr[32] * Output_left_tr31) + (trx_interneuron[31] * Output_left_tr30)

    Output_left_tr31 = (math.exp(2*Activity_left_tr31)-1)/(math.exp(2*Activity_left_tr31)+1)

    Activity_left_tr32 = (recurrent_left_tr[33] * Output_left_tr32) + (trx_interneuron[32] * Output_left_tr31)

    Output_left_tr32 = (math.exp(2*Activity_left_tr32)-1)/(math.exp(2*Activity_left_tr32)+1)

    Activity_left_tr33 = (recurrent_left_tr[34] * Output_left_tr33) + (trx_interneuron[33] * Output_left_tr32)

    Output_left_tr33 = (math.exp(2*Activity_left_tr33)-1)/(math.exp(2*Activity_left_tr33)+1)

    Activity_left_tr34 = (recurrent_left_tr[35] * Output_left_tr34) + (trx_interneuron[34] * Output_left_tr33)

    Output_left_tr34 = (math.exp(2*Activity_left_tr34)-1)/(math.exp(2*Activity_left_tr34)+1)

    Activity_left_tr35 = (recurrent_left_tr[36] * Output_left_tr35) + (trx_interneuron[35] * Output_left_tr34)

    Output_left_tr35 = (math.exp(2*Activity_left_tr35)-1)/(math.exp(2*Activity_left_tr35)+1)

    Activity_left_tr36 = (recurrent_left_tr[37] * Output_left_tr36) + (trx_interneuron[36] * Output_left_tr35)

    Output_left_tr36 = (math.exp(2*Activity_left_tr36)-1)/(math.exp(2*Activity_left_tr36)+1)

    Activity_left_tr37 = (recurrent_left_tr[38] * Output_left_tr37) + (trx_interneuron[37] * Output_left_tr36)

    Output_left_tr37 = (math.exp(2*Activity_left_tr37)-1)/(math.exp(2*Activity_left_tr37)+1)

    Activity_left_tr38 = (recurrent_left_tr[39] * Output_left_tr38) + (trx_interneuron[38] * Output_left_tr37)

    Output_left_tr38 = (math.exp(2*Activity_left_tr38)-1)/(math.exp(2*Activity_left_tr38)+1)

    Activity_left_tr39 = (recurrent_left_tr[40] * Output_left_tr39) + (trx_interneuron[39] * Output_left_tr38)

    Output_left_tr39 = (math.exp(2*Activity_left_tr39)-1)/(math.exp(2*Activity_left_tr39)+1)

    Activity_left_tr40 = (recurrent_left_tr[41] * Output_left_tr40) + (trx_interneuron[40] * Output_left_tr39)

    Output_left_tr40 = (math.exp(2*Activity_left_tr40)-1)/(math.exp(2*Activity_left_tr40)+1)

    --next leg
    
    Activity_left_tr41 = (recurrent_left_tr[42] * Output_left_tr41) + (trx_interneuron[41] * Output_left_tr40)

    Output_left_tr41 = (math.exp(2*Activity_left_tr41)-1)/(math.exp(2*Activity_left_tr41)+1)

    Activity_left_tr42 = (recurrent_left_tr[43] * Output_left_tr42) + (trx_interneuron[42] * Output_left_tr41)

    Output_left_tr42 = (math.exp(2*Activity_left_tr42)-1)/(math.exp(2*Activity_left_tr42)+1)

    Activity_left_tr43 = (recurrent_left_tr[44] * Output_left_tr43) + (trx_interneuron[43] * Output_left_tr42)

    Output_left_tr43 = (math.exp(2*Activity_left_tr43)-1)/(math.exp(2*Activity_left_tr43)+1)

    Activity_left_tr44 = (recurrent_left_tr[45] * Output_left_tr44) + (trx_interneuron[44] * Output_left_tr43)

    Output_left_tr44 = (math.exp(2*Activity_left_tr44)-1)/(math.exp(2*Activity_left_tr44)+1)

    Activity_left_tr45 = (recurrent_left_tr[46] * Output_left_tr45) + (trx_interneuron[45] * Output_left_tr44)

    Output_left_tr45 = (math.exp(2*Activity_left_tr45)-1)/(math.exp(2*Activity_left_tr45)+1)

    Activity_left_tr46 = (recurrent_left_tr[47] * Output_left_tr46) + (trx_interneuron[46] * Output_left_tr45)

    Output_left_tr46 = (math.exp(2*Activity_left_tr46)-1)/(math.exp(2*Activity_left_tr46)+1)

    Activity_left_tr47 = (recurrent_left_tr[48] * Output_left_tr47) + (trx_interneuron[47] * Output_left_tr46)

    Output_left_tr47 = (math.exp(2*Activity_left_tr47)-1)/(math.exp(2*Activity_left_tr47)+1)

    Activity_left_tr48 = (recurrent_left_tr[49] * Output_left_tr48) + (trx_interneuron[48] * Output_left_tr47)

    Output_left_tr48 = (math.exp(2*Activity_left_tr48)-1)/(math.exp(2*Activity_left_tr48)+1)

    Activity_left_tr49 = (recurrent_left_tr[50] * Output_left_tr49) + (trx_interneuron[49] * Output_left_tr48)

    Output_left_tr49 = (math.exp(2*Activity_left_tr49)-1)/(math.exp(2*Activity_left_tr49)+1)

    Activity_left_tr50 = (recurrent_left_tr[51] * Output_left_tr50) + (trx_interneuron[50] * Output_left_tr49)

    Output_left_tr50 = (math.exp(2*Activity_left_tr50)-1)/(math.exp(2*Activity_left_tr50)+1)

    --next leg

    Activity_left_tr51 = (recurrent_left_tr[52] * Output_left_tr51) + (trx_interneuron[51] * Output_left_tr50)

    Output_left_tr51 = (math.exp(2*Activity_left_tr51)-1)/(math.exp(2*Activity_left_tr51)+1)

    Activity_left_tr52 = (recurrent_left_tr[53] * Output_left_tr52) + (trx_interneuron[52] * Output_left_tr51)

    Output_left_tr52 = (math.exp(2*Activity_left_tr52)-1)/(math.exp(2*Activity_left_tr52)+1)

    Activity_left_tr53 = (recurrent_left_tr[54] * Output_left_tr53) + (trx_interneuron[53] * Output_left_tr52)

    Output_left_tr53 = (math.exp(2*Activity_left_tr53)-1)/(math.exp(2*Activity_left_tr53)+1)

    Activity_left_tr54 = (recurrent_left_tr[55] * Output_left_tr54) + (trx_interneuron[54] * Output_left_tr53)

    Output_left_tr54 = (math.exp(2*Activity_left_tr54)-1)/(math.exp(2*Activity_left_tr54)+1)

    Activity_left_tr55 = (recurrent_left_tr[56] * Output_left_tr55) + (trx_interneuron[55] * Output_left_tr54)

    Output_left_tr55 = (math.exp(2*Activity_left_tr55)-1)/(math.exp(2*Activity_left_tr55)+1)

    Activity_left_tr56 = (recurrent_left_tr[57] * Output_left_tr56) + (trx_interneuron[56] * Output_left_tr55)

    Output_left_tr56 = (math.exp(2*Activity_left_tr56)-1)/(math.exp(2*Activity_left_tr56)+1)

    Activity_left_tr57 = (recurrent_left_tr[58] * Output_left_tr57) + (trx_interneuron[57] * Output_left_tr56)

    Output_left_tr57 = (math.exp(2*Activity_left_tr57)-1)/(math.exp(2*Activity_left_tr57)+1)

    Activity_left_tr58 = (recurrent_left_tr[59] * Output_left_tr58) + (trx_interneuron[58] * Output_left_tr57)

    Output_left_tr58 = (math.exp(2*Activity_left_tr58)-1)/(math.exp(2*Activity_left_tr58)+1)

    Activity_left_tr59 = (recurrent_left_tr[60] * Output_left_tr59) + (trx_interneuron[59] * Output_left_tr58)

    Output_left_tr59 = (math.exp(2*Activity_left_tr59)-1)/(math.exp(2*Activity_left_tr59)+1)

    Activity_left_tr60 = (recurrent_left_tr[61] * Output_left_tr60) + (trx_interneuron[60] * Output_left_tr59)

    Output_left_tr60 = (math.exp(2*Activity_left_tr60)-1)/(math.exp(2*Activity_left_tr60)+1)

    --next leg

    Activity_left_tr61 = (recurrent_left_tr[62] * Output_left_tr61) + (trx_interneuron[61] * Output_left_tr60)

    Output_left_tr61 = (math.exp(2*Activity_left_tr61)-1)/(math.exp(2*Activity_left_tr61)+1)

    Activity_left_tr62 = (recurrent_left_tr[63] * Output_left_tr62) + (trx_interneuron[62] * Output_left_tr61)

    Output_left_tr62 = (math.exp(2*Activity_left_tr62)-1)/(math.exp(2*Activity_left_tr62)+1)

    Activity_left_tr63 = (recurrent_left_tr[64] * Output_left_tr63) + (trx_interneuron[63] * Output_left_tr62)

    Output_left_tr63 = (math.exp(2*Activity_left_tr63)-1)/(math.exp(2*Activity_left_tr63)+1)

    Activity_left_tr64 = (recurrent_left_tr[65] * Output_left_tr64) + (trx_interneuron[64] * Output_left_tr63)

    Output_left_tr64 = (math.exp(2*Activity_left_tr64)-1)/(math.exp(2*Activity_left_tr64)+1)

    Activity_left_tr65 = (recurrent_left_tr[66] * Output_left_tr65) + (trx_interneuron[65] * Output_left_tr64)

    Output_left_tr65 = (math.exp(2*Activity_left_tr65)-1)/(math.exp(2*Activity_left_tr65)+1)

    Activity_left_tr66 = (recurrent_left_tr[67] * Output_left_tr66) + (trx_interneuron[66] * Output_left_tr65)

    Output_left_tr66 = (math.exp(2*Activity_left_tr66)-1)/(math.exp(2*Activity_left_tr66)+1)

    Activity_left_tr67 = (recurrent_left_tr[68] * Output_left_tr67) + (trx_interneuron[67] * Output_left_tr66)

    Output_left_tr67 = (math.exp(2*Activity_left_tr67)-1)/(math.exp(2*Activity_left_tr67)+1)

    Activity_left_tr68 = (recurrent_left_tr[69] * Output_left_tr68) + (trx_interneuron[68] * Output_left_tr67)

    Output_left_tr68 = (math.exp(2*Activity_left_tr68)-1)/(math.exp(2*Activity_left_tr68)+1)

    Activity_left_tr69 = (recurrent_left_tr[70] * Output_left_tr69) + (trx_interneuron[69] * Output_left_tr68)

    Output_left_tr69 = (math.exp(2*Activity_left_tr69)-1)/(math.exp(2*Activity_left_tr69)+1)

    Activity_left_tr70 = (recurrent_left_tr[71] * Output_left_tr70) + (trx_interneuron[70] * Output_left_tr69)

    Output_left_tr70 = (math.exp(2*Activity_left_tr70)-1)/(math.exp(2*Activity_left_tr70)+1)

    --next leg

    Activity_left_tr71 = (recurrent_left_tr[72] * Output_left_tr71) + (trx_interneuron[71] * Output_left_tr70)

    Output_left_tr71 = (math.exp(2*Activity_left_tr71)-1)/(math.exp(2*Activity_left_tr71)+1)

    Activity_left_tr72 = (recurrent_left_tr[73] * Output_left_tr72) + (trx_interneuron[72] * Output_left_tr71)

    Output_left_tr72 = (math.exp(2*Activity_left_tr72)-1)/(math.exp(2*Activity_left_tr72)+1)

    Activity_left_tr73 = (recurrent_left_tr[74] * Output_left_tr73) + (trx_interneuron[73] * Output_left_tr72)

    Output_left_tr73 = (math.exp(2*Activity_left_tr73)-1)/(math.exp(2*Activity_left_tr73)+1)

    Activity_left_tr74 = (recurrent_left_tr[75] * Output_left_tr74) + (trx_interneuron[74] * Output_left_tr73)

    Output_left_tr74 = (math.exp(2*Activity_left_tr74)-1)/(math.exp(2*Activity_left_tr74)+1)

    Activity_left_tr75 = (recurrent_left_tr[76] * Output_left_tr75) + (trx_interneuron[75] * Output_left_tr74)

    Output_left_tr75 = (math.exp(2*Activity_left_tr75)-1)/(math.exp(2*Activity_left_tr75)+1)

    Activity_left_tr76 = (recurrent_left_tr[77] * Output_left_tr76) + (trx_interneuron[76] * Output_left_tr75)

    Output_left_tr76 = (math.exp(2*Activity_left_tr76)-1)/(math.exp(2*Activity_left_tr76)+1)

    Activity_left_tr77 = (recurrent_left_tr[78] * Output_left_tr77) + (trx_interneuron[77] * Output_left_tr76)

    Output_left_tr77 = (math.exp(2*Activity_left_tr77)-1)/(math.exp(2*Activity_left_tr77)+1)

    Activity_left_tr78 = (recurrent_left_tr[79] * Output_left_tr78) + (trx_interneuron[78] * Output_left_tr77)

    Output_left_tr78 = (math.exp(2*Activity_left_tr78)-1)/(math.exp(2*Activity_left_tr78)+1)

    Activity_left_tr79 = (recurrent_left_tr[80] * Output_left_tr79) + (trx_interneuron[79] * Output_left_tr78)

    Output_left_tr79 = (math.exp(2*Activity_left_tr79)-1)/(math.exp(2*Activity_left_tr79)+1)

    Activity_left_tr80 = (recurrent_left_tr[81] * Output_left_tr80) + (trx_interneuron[80] * Output_left_tr79)

    Output_left_tr80 = (math.exp(2*Activity_left_tr80)-1)/(math.exp(2*Activity_left_tr80)+1)

    --next leg

    Activity_left_tr81 = (recurrent_left_tr[82] * Output_left_tr81) + (trx_interneuron[81] * Output_left_tr80)

    Output_left_tr81 = (math.exp(2*Activity_left_tr81)-1)/(math.exp(2*Activity_left_tr81)+1)

    Activity_left_tr82 = (recurrent_left_tr[83] * Output_left_tr82) + (trx_interneuron[82] * Output_left_tr81)

    Output_left_tr82 = (math.exp(2*Activity_left_tr82)-1)/(math.exp(2*Activity_left_tr82)+1)

    Activity_left_tr83 = (recurrent_left_tr[84] * Output_left_tr83) + (trx_interneuron[83] * Output_left_tr82)

    Output_left_tr83 = (math.exp(2*Activity_left_tr83)-1)/(math.exp(2*Activity_left_tr83)+1)

    Activity_left_tr84 = (recurrent_left_tr[85] * Output_left_tr84) + (trx_interneuron[84] * Output_left_tr83)

    Output_left_tr84 = (math.exp(2*Activity_left_tr84)-1)/(math.exp(2*Activity_left_tr84)+1)

    Activity_left_tr85 = (recurrent_left_tr[86] * Output_left_tr85) + (trx_interneuron[85] * Output_left_tr84)

    Output_left_tr85 = (math.exp(2*Activity_left_tr85)-1)/(math.exp(2*Activity_left_tr85)+1)

    Activity_left_tr86 = (recurrent_left_tr[87] * Output_left_tr86) + (trx_interneuron[86] * Output_left_tr85)

    Output_left_tr86 = (math.exp(2*Activity_left_tr86)-1)/(math.exp(2*Activity_left_tr86)+1)

    Activity_left_tr87 = (recurrent_left_tr[88] * Output_left_tr87) + (trx_interneuron[87] * Output_left_tr86)

    Output_left_tr87 = (math.exp(2*Activity_left_tr87)-1)/(math.exp(2*Activity_left_tr87)+1)

    Activity_left_tr88 = (recurrent_left_tr[89] * Output_left_tr88) + (trx_interneuron[88] * Output_left_tr87)

    Output_left_tr88 = (math.exp(2*Activity_left_tr88)-1)/(math.exp(2*Activity_left_tr88)+1)

    Activity_left_tr89 = (recurrent_left_tr[90] * Output_left_tr89) + (trx_interneuron[89] * Output_left_tr88)

    Output_left_tr89 = (math.exp(2*Activity_left_tr89)-1)/(math.exp(2*Activity_left_tr89)+1)

    Activity_left_tr90 = (recurrent_left_tr[91] * Output_left_tr90) + (trx_interneuron[90] * Output_left_tr89)

    Output_left_tr90 = (math.exp(2*Activity_left_tr90)-1)/(math.exp(2*Activity_left_tr90)+1)

    --next leg

    Activity_left_tr91 = (recurrent_left_tr[92] * Output_left_tr91) + (trx_interneuron[91] * Output_left_tr90)

    Output_left_tr91 = (math.exp(2*Activity_left_tr91)-1)/(math.exp(2*Activity_left_tr91)+1)

    Activity_left_tr92 = (recurrent_left_tr[93] * Output_left_tr92) + (trx_interneuron[92] * Output_left_tr91)

    Output_left_tr92 = (math.exp(2*Activity_left_tr92)-1)/(math.exp(2*Activity_left_tr92)+1)

    Activity_left_tr93 = (recurrent_left_tr[94] * Output_left_tr93) + (trx_interneuron[93] * Output_left_tr92)

    Output_left_tr93 = (math.exp(2*Activity_left_tr93)-1)/(math.exp(2*Activity_left_tr93)+1)

    Activity_left_tr94 = (recurrent_left_tr[95] * Output_left_tr94) + (trx_interneuron[94] * Output_left_tr93)

    Output_left_tr94 = (math.exp(2*Activity_left_tr94)-1)/(math.exp(2*Activity_left_tr94)+1)

    Activity_left_tr95 = (recurrent_left_tr[96] * Output_left_tr95) + (trx_interneuron[95] * Output_left_tr94)

    Output_left_tr95 = (math.exp(2*Activity_left_tr95)-1)/(math.exp(2*Activity_left_tr95)+1)

    Activity_left_tr96 = (recurrent_left_tr[97] * Output_left_tr96) + (trx_interneuron[96] * Output_left_tr95)

    Output_left_tr96 = (math.exp(2*Activity_left_tr96)-1)/(math.exp(2*Activity_left_tr96)+1)

    Activity_left_tr97 = (recurrent_left_tr[98] * Output_left_tr97) + (trx_interneuron[97] * Output_left_tr96)

    Output_left_tr97 = (math.exp(2*Activity_left_tr97)-1)/(math.exp(2*Activity_left_tr97)+1)

    Activity_left_tr98 = (recurrent_left_tr[99] * Output_left_tr98) + (trx_interneuron[98] * Output_left_tr97)

    Output_left_tr98 = (math.exp(2*Activity_left_tr98)-1)/(math.exp(2*Activity_left_tr98)+1)

    Activity_left_tr99 = (recurrent_left_tr[100] * Output_left_tr99) + (trx_interneuron[99] * Output_left_tr98)

    Output_left_tr99 = (math.exp(2*Activity_left_tr99)-1)/(math.exp(2*Activity_left_tr99)+1)

    Activity_left_tr100 = (recurrent_left_tr[101] * Output_left_tr100) + (trx_interneuron[100] * Output_left_tr99)

    Output_left_tr100 = (math.exp(2*Activity_left_tr100)-1)/(math.exp(2*Activity_left_tr100)+1)

    --next leg

    Activity_left_tr101 = (recurrent_left_tr[102] * Output_left_tr101) + (trx_interneuron[101] * Output_left_tr100)

    Output_left_tr101 = (math.exp(2*Activity_left_tr101)-1)/(math.exp(2*Activity_left_tr101)+1)

    Activity_left_tr102 = (recurrent_left_tr[103] * Output_left_tr102) + (trx_interneuron[102] * Output_left_tr101)

    Output_left_tr102 = (math.exp(2*Activity_left_tr102)-1)/(math.exp(2*Activity_left_tr102)+1)

    Activity_left_tr103 = (recurrent_left_tr[104] * Output_left_tr103) + (trx_interneuron[103] * Output_left_tr102)

    Output_left_tr103 = (math.exp(2*Activity_left_tr103)-1)/(math.exp(2*Activity_left_tr103)+1)

    Activity_left_tr104 = (recurrent_left_tr[105] * Output_left_tr104) + (trx_interneuron[104] * Output_left_tr103)

    Output_left_tr104 = (math.exp(2*Activity_left_tr104)-1)/(math.exp(2*Activity_left_tr104)+1)

    Activity_left_tr105 = (recurrent_left_tr[106] * Output_left_tr105) + (trx_interneuron[105] * Output_left_tr104)

    Output_left_tr105 = (math.exp(2*Activity_left_tr105)-1)/(math.exp(2*Activity_left_tr105)+1)

    Activity_left_tr106 = (recurrent_left_tr[107] * Output_left_tr106) + (trx_interneuron[106] * Output_left_tr105)

    Output_left_tr106 = (math.exp(2*Activity_left_tr106)-1)/(math.exp(2*Activity_left_tr106)+1)

    Activity_left_tr107 = (recurrent_left_tr[108] * Output_left_tr107) + (trx_interneuron[107] * Output_left_tr106)

    Output_left_tr107 = (math.exp(2*Activity_left_tr107)-1)/(math.exp(2*Activity_left_tr107)+1)

    Activity_left_tr108 = (recurrent_left_tr[109] * Output_left_tr108) + (trx_interneuron[108] * Output_left_tr107)

    Output_left_tr108 = (math.exp(2*Activity_left_tr108)-1)/(math.exp(2*Activity_left_tr108)+1)

    Activity_left_tr109 = (recurrent_left_tr[110] * Output_left_tr109) + (trx_interneuron[109] * Output_left_tr108)

    Output_left_tr109 = (math.exp(2*Activity_left_tr109)-1)/(math.exp(2*Activity_left_tr109)+1)

    Activity_left_tr110 = (recurrent_left_tr[111] * Output_left_tr110) + (trx_interneuron[110] * Output_left_tr109)

    Output_left_tr110 = (math.exp(2*Activity_left_tr110)-1)/(math.exp(2*Activity_left_tr110)+1)

    --next leg

    Activity_left_tr111 = (recurrent_left_tr[112] * Output_left_tr111) + (trx_interneuron[111] * Output_left_tr110)

    Output_left_tr111 = (math.exp(2*Activity_left_tr111)-1)/(math.exp(2*Activity_left_tr111)+1)

    Activity_left_tr112 = (recurrent_left_tr[113] * Output_left_tr112) + (trx_interneuron[112] * Output_left_tr111)

    Output_left_tr112 = (math.exp(2*Activity_left_tr112)-1)/(math.exp(2*Activity_left_tr112)+1)

    Activity_left_tr113 = (recurrent_left_tr[114] * Output_left_tr113) + (trx_interneuron[113] * Output_left_tr112)

    Output_left_tr113 = (math.exp(2*Activity_left_tr113)-1)/(math.exp(2*Activity_left_tr113)+1)

    Activity_left_tr114 = (recurrent_left_tr[115] * Output_left_tr114) + (trx_interneuron[114] * Output_left_tr113)

    Output_left_tr114 = (math.exp(2*Activity_left_tr114)-1)/(math.exp(2*Activity_left_tr114)+1)

    Activity_left_tr115 = (recurrent_left_tr[116] * Output_left_tr115) + (trx_interneuron[115] * Output_left_tr114)

    Output_left_tr115 = (math.exp(2*Activity_left_tr115)-1)/(math.exp(2*Activity_left_tr115)+1)

    Activity_left_tr116 = (recurrent_left_tr[117] * Output_left_tr116) + (trx_interneuron[116] * Output_left_tr115)

    Output_left_tr116 = (math.exp(2*Activity_left_tr116)-1)/(math.exp(2*Activity_left_tr116)+1)

    Activity_left_tr117 = (recurrent_left_tr[118] * Output_left_tr117) + (trx_interneuron[117] * Output_left_tr116)

    Output_left_tr117 = (math.exp(2*Activity_left_tr117)-1)/(math.exp(2*Activity_left_tr117)+1)

    Activity_left_tr118 = (recurrent_left_tr[119] * Output_left_tr118) + (trx_interneuron[118] * Output_left_tr117)

    Output_left_tr118 = (math.exp(2*Activity_left_tr118)-1)/(math.exp(2*Activity_left_tr118)+1)

    Activity_left_tr119 = (recurrent_left_tr[120] * Output_left_tr119) + (trx_interneuron[119] * Output_left_tr118)

    Output_left_tr119 = (math.exp(2*Activity_left_tr119)-1)/(math.exp(2*Activity_left_tr119)+1)

    Activity_left_tr120 = (recurrent_left_tr[121] * Output_left_tr120) + (trx_interneuron[120] * Output_left_tr119)

    Output_left_tr120 = (math.exp(2*Activity_left_tr120)-1)/(math.exp(2*Activity_left_tr120)+1)

    --next leg

    Activity_left_tr121 = (recurrent_left_tr[122] * Output_left_tr121) + (trx_interneuron[121] * Output_left_tr120)

    Output_left_tr121 = (math.exp(2*Activity_left_tr121)-1)/(math.exp(2*Activity_left_tr121)+1)

    Activity_left_tr122 = (recurrent_left_tr[123] * Output_left_tr122) + (trx_interneuron[122] * Output_left_tr121)

    Output_left_tr122 = (math.exp(2*Activity_left_tr122)-1)/(math.exp(2*Activity_left_tr122)+1)

    Activity_left_tr123 = (recurrent_left_tr[124] * Output_left_tr123) + (trx_interneuron[123] * Output_left_tr122)

    Output_left_tr123 = (math.exp(2*Activity_left_tr123)-1)/(math.exp(2*Activity_left_tr123)+1)

    Activity_left_tr124 = (recurrent_left_tr[125] * Output_left_tr124) + (trx_interneuron[124] * Output_left_tr123)

    Output_left_tr124 = (math.exp(2*Activity_left_tr124)-1)/(math.exp(2*Activity_left_tr124)+1)

    Activity_left_tr125 = (recurrent_left_tr[126] * Output_left_tr125) + (trx_interneuron[125] * Output_left_tr124)

    Output_left_tr125 = (math.exp(2*Activity_left_tr125)-1)/(math.exp(2*Activity_left_tr125)+1)

    Activity_left_tr126 = (recurrent_left_tr[127] * Output_left_tr126) + (trx_interneuron[126] * Output_left_tr125)

    Output_left_tr126 = (math.exp(2*Activity_left_tr126)-1)/(math.exp(2*Activity_left_tr126)+1)

    Activity_left_tr127 = (recurrent_left_tr[128] * Output_left_tr127) + (trx_interneuron[127] * Output_left_tr126)

    Output_left_tr127 = (math.exp(2*Activity_left_tr127)-1)/(math.exp(2*Activity_left_tr127)+1)

    Activity_left_tr128 = (recurrent_left_tr[129] * Output_left_tr128) + (trx_interneuron[128] * Output_left_tr127)

    Output_left_tr128 = (math.exp(2*Activity_left_tr128)-1)/(math.exp(2*Activity_left_tr128)+1)

    Activity_left_tr129 = (recurrent_left_tr[130] * Output_left_tr129) + (trx_interneuron[129] * Output_left_tr128)

    Output_left_tr129 = (math.exp(2*Activity_left_tr129)-1)/(math.exp(2*Activity_left_tr129)+1)

    Activity_left_tr130 = (recurrent_left_tr[131] * Output_left_tr130) + (trx_interneuron[130] * Output_left_tr129)

    Output_left_tr130 = (math.exp(2*Activity_left_tr130)-1)/(math.exp(2*Activity_left_tr130)+1)

    --next leg

    Activity_left_tr131 = (recurrent_left_tr[132] * Output_left_tr131) + (trx_interneuron[131] * Output_left_tr130)

    Output_left_tr131 = (math.exp(2*Activity_left_tr131)-1)/(math.exp(2*Activity_left_tr131)+1)

    Activity_left_tr132 = (recurrent_left_tr[133] * Output_left_tr132) + (trx_interneuron[132] * Output_left_tr131)

    Output_left_tr132 = (math.exp(2*Activity_left_tr132)-1)/(math.exp(2*Activity_left_tr132)+1)

    Activity_left_tr133 = (recurrent_left_tr[134] * Output_left_tr133) + (trx_interneuron[133] * Output_left_tr132)

    Output_left_tr133 = (math.exp(2*Activity_left_tr133)-1)/(math.exp(2*Activity_left_tr133)+1)

    Activity_left_tr134 = (recurrent_left_tr[135] * Output_left_tr134) + (trx_interneuron[134] * Output_left_tr133)

    Output_left_tr134 = (math.exp(2*Activity_left_tr134)-1)/(math.exp(2*Activity_left_tr134)+1)

    Activity_left_tr135 = (recurrent_left_tr[136] * Output_left_tr135) + (trx_interneuron[135] * Output_left_tr134)

    Output_left_tr135 = (math.exp(2*Activity_left_tr135)-1)/(math.exp(2*Activity_left_tr135)+1)

    Activity_left_tr136 = (recurrent_left_tr[137] * Output_left_tr136) + (trx_interneuron[136] * Output_left_tr135)

    Output_left_tr136 = (math.exp(2*Activity_left_tr136)-1)/(math.exp(2*Activity_left_tr136)+1)

    Activity_left_tr137 = (recurrent_left_tr[138] * Output_left_tr137) + (trx_interneuron[137] * Output_left_tr136)

    Output_left_tr137 = (math.exp(2*Activity_left_tr137)-1)/(math.exp(2*Activity_left_tr137)+1)

    Activity_left_tr138 = (recurrent_left_tr[139] * Output_left_tr138) + (trx_interneuron[138] * Output_left_tr137)

    Output_left_tr138 = (math.exp(2*Activity_left_tr138)-1)/(math.exp(2*Activity_left_tr138)+1)

    Activity_left_tr139 = (recurrent_left_tr[140] * Output_left_tr139) + (trx_interneuron[139] * Output_left_tr138)

    Output_left_tr139 = (math.exp(2*Activity_left_tr139)-1)/(math.exp(2*Activity_left_tr139)+1)

    Activity_left_tr140 = (recurrent_left_tr[141] * Output_left_tr140) + (trx_interneuron[140] * Output_left_tr139)

    Output_left_tr140 = (math.exp(2*Activity_left_tr140)-1)/(math.exp(2*Activity_left_tr140)+1)

    --next leg

    Activity_left_tr141 = (recurrent_left_tr[142] * Output_left_tr141) + (trx_interneuron[141] * Output_left_tr140)

    Output_left_tr141 = (math.exp(2*Activity_left_tr141)-1)/(math.exp(2*Activity_left_tr141)+1)

    Activity_left_tr142 = (recurrent_left_tr[143] * Output_left_tr142) + (trx_interneuron[142] * Output_left_tr141)

    Output_left_tr142 = (math.exp(2*Activity_left_tr142)-1)/(math.exp(2*Activity_left_tr142)+1)

    Activity_left_tr143 = (recurrent_left_tr[144] * Output_left_tr143) + (trx_interneuron[143] * Output_left_tr142)

    Output_left_tr143 = (math.exp(2*Activity_left_tr143)-1)/(math.exp(2*Activity_left_tr143)+1)

    Activity_left_tr144 = (recurrent_left_tr[145] * Output_left_tr144) + (trx_interneuron[144] * Output_left_tr143)

    Output_left_tr144 = (math.exp(2*Activity_left_tr144)-1)/(math.exp(2*Activity_left_tr144)+1)

    Activity_left_tr145 = (recurrent_left_tr[146] * Output_left_tr145) + (trx_interneuron[145] * Output_left_tr144)

    Output_left_tr145 = (math.exp(2*Activity_left_tr145)-1)/(math.exp(2*Activity_left_tr145)+1)

    Activity_left_tr146 = (recurrent_left_tr[147] * Output_left_tr146) + (trx_interneuron[146] * Output_left_tr145)

    Output_left_tr146 = (math.exp(2*Activity_left_tr146)-1)/(math.exp(2*Activity_left_tr146)+1)

    Activity_left_tr147 = (recurrent_left_tr[148] * Output_left_tr147) + (trx_interneuron[147] * Output_left_tr146)

    Output_left_tr147 = (math.exp(2*Activity_left_tr147)-1)/(math.exp(2*Activity_left_tr147)+1)

    Activity_left_tr148 = (recurrent_left_tr[149] * Output_left_tr148) + (trx_interneuron[148] * Output_left_tr147)

    Output_left_tr148 = (math.exp(2*Activity_left_tr148)-1)/(math.exp(2*Activity_left_tr148)+1)

    Activity_left_tr149 = (recurrent_left_tr[150] * Output_left_tr149) + (trx_interneuron[149] * Output_left_tr148)

    Output_left_tr149 = (math.exp(2*Activity_left_tr149)-1)/(math.exp(2*Activity_left_tr149)+1)

    Activity_left_tr150 = (recurrent_left_tr[151] * Output_left_tr150) + (trx_interneuron[150] * Output_left_tr149)

    Output_left_tr150 = (math.exp(2*Activity_left_tr150)-1)/(math.exp(2*Activity_left_tr150)+1)

    Activity_left_tr151 = (recurrent_left_tr[152] * Output_left_tr151) + (trx_interneuron[151] * Output_left_tr150)

    Output_left_tr151 = (math.exp(2*Activity_left_tr151)-1)/(math.exp(2*Activity_left_tr151)+1)

    Activity_left_tr152 = (recurrent_left_tr[153] * Output_left_tr152) + (trx_interneuron[152] * Output_left_tr151)

    Output_left_tr152 = (math.exp(2*Activity_left_tr152)-1)/(math.exp(2*Activity_left_tr152)+1)

    Activity_left_tr153 = (recurrent_left_tr[154] * Output_left_tr153) + (trx_interneuron[153] * Output_left_tr152)

    Output_left_tr153 = (math.exp(2*Activity_left_tr153)-1)/(math.exp(2*Activity_left_tr153)+1)

    Activity_left_tr154 = (recurrent_left_tr[155] * Output_left_tr154) + (trx_interneuron[154] * Output_left_tr153)

    Output_left_tr154 = (math.exp(2*Activity_left_tr154)-1)/(math.exp(2*Activity_left_tr154)+1)

    Activity_left_tr155 = (recurrent_left_tr[156] * Output_left_tr155) + (trx_interneuron[155] * Output_left_tr154)

    Output_left_tr155 = (math.exp(2*Activity_left_tr155)-1)/(math.exp(2*Activity_left_tr155)+1)

    --Activity_left_tr151 = (recurrent_left_tr[152] * Output_left_tr151) + (trx_interneuron[151] * Output_left_tr150)

    --Output_left_tr151 = (math.exp(2*Activity_left_tr151)-1)/(math.exp(2*Activity_left_tr151)+1)

    --right side wave control

    --pf_7_control = Weightpf7_I13 * Output_I13

    --The first recurrent neuron receives outputs from the first tr0 motor neuron
    Activity_right_tr0 = (recurrent_right_tr[1] * Output_right_tr0) + (Weighttr_I13[1] * Output_I0 * Output_C1)

    Output_right_tr0 = (math.exp(2*Activity_right_tr0)-1)/(math.exp(2*Activity_right_tr0)+1)

    --Activity_right_tr1 = (0.0 * Output_right_tr1) + (pf_7_control)
    
    --file:write( string.format("%f\t",Activity_right_tr1) )

    --Output_right_tr1 = (math.exp(2*Activity_right_tr1)-1)/(math.exp(2*Activity_right_tr1)+1)
    
    --file:write( string.format("%f\t",Output_right_tr1) )

    Activity_right_tr1 = (recurrent_right_tr[2] * Output_right_tr1) + (trx_interneuron[1] * Output_right_tr0)

    Output_right_tr1 = (math.exp(2*Activity_right_tr1)-1)/(math.exp(2*Activity_right_tr1)+1)

    Activity_right_tr2 = (recurrent_right_tr[3] * Output_right_tr2) + (trx_interneuron[2] * Output_right_tr1)

    Output_right_tr2 = (math.exp(2*Activity_right_tr2)-1)/(math.exp(2*Activity_right_tr2)+1)

    Activity_right_tr3 = (recurrent_right_tr[4] * Output_right_tr3) + (trx_interneuron[3] * Output_right_tr2)

    Output_right_tr3 = (math.exp(2*Activity_right_tr3)-1)/(math.exp(2*Activity_right_tr3)+1)

    Activity_right_tr4 = (recurrent_right_tr[5] * Output_right_tr4) + (trx_interneuron[4] * Output_right_tr3)

    Output_right_tr4 = (math.exp(2*Activity_right_tr4)-1)/(math.exp(2*Activity_right_tr4)+1)

    Activity_right_tr5 = (recurrent_right_tr[6] * Output_right_tr5) + (trx_interneuron[5] * Output_right_tr4)

    Output_right_tr5 = (math.exp(2*Activity_right_tr5)-1)/(math.exp(2*Activity_right_tr5)+1)

    Activity_right_tr6 = (recurrent_right_tr[7] * Output_right_tr6) + (trx_interneuron[6] * Output_right_tr5)

    Output_right_tr6 = (math.exp(2*Activity_right_tr6)-1)/(math.exp(2*Activity_right_tr6)+1)

    Activity_right_tr7 = (recurrent_right_tr[8] * Output_right_tr7) + (trx_interneuron[7] * Output_right_tr6)

    Output_right_tr7 = (math.exp(2*Activity_right_tr7)-1)/(math.exp(2*Activity_right_tr7)+1)

    Activity_right_tr8 = (recurrent_right_tr[9] * Output_right_tr8) + (trx_interneuron[8] * Output_right_tr7)

    Output_right_tr8 = (math.exp(2*Activity_right_tr8)-1)/(math.exp(2*Activity_right_tr8)+1)

    Activity_right_tr9 = (recurrent_right_tr[10] * Output_right_tr9) + (trx_interneuron[9] * Output_right_tr8)

    Output_right_tr9 = (math.exp(2*Activity_right_tr9)-1)/(math.exp(2*Activity_right_tr9)+1)

    Activity_right_tr10 = (recurrent_right_tr[11] * Output_right_tr10) + (trx_interneuron[10] * Output_right_tr9)

    --file:write( string.format("%f\t",Activity_right_tr10) )

    Output_right_tr10 = (math.exp(2*Activity_right_tr10)-1)/(math.exp(2*Activity_right_tr10)+1)

    --file:write( string.format("%f\t",Output_right_tr10) )

    --next leg

    Activity_right_tr11 = (recurrent_right_tr[12] * Output_right_tr11) + (trx_interneuron[11] * Output_right_tr10)

    Output_right_tr11 = (math.exp(2*Activity_right_tr11)-1)/(math.exp(2*Activity_right_tr11)+1)

    Activity_right_tr12 = (recurrent_right_tr[13] * Output_right_tr12) + (trx_interneuron[12] * Output_right_tr11)

    Output_right_tr12 = (math.exp(2*Activity_right_tr12)-1)/(math.exp(2*Activity_right_tr12)+1)

    Activity_right_tr13 = (recurrent_right_tr[14] * Output_right_tr13) + (trx_interneuron[13] * Output_right_tr12)

    Output_right_tr13 = (math.exp(2*Activity_right_tr13)-1)/(math.exp(2*Activity_right_tr13)+1)

    Activity_right_tr14 = (recurrent_right_tr[15] * Output_right_tr14) + (trx_interneuron[14] * Output_right_tr13)

    Output_right_tr14 = (math.exp(2*Activity_right_tr14)-1)/(math.exp(2*Activity_right_tr14)+1)

    Activity_right_tr15 = (recurrent_right_tr[16] * Output_right_tr15) + (trx_interneuron[15] * Output_right_tr14)

    Output_right_tr15 = (math.exp(2*Activity_right_tr15)-1)/(math.exp(2*Activity_right_tr15)+1)

    Activity_right_tr16 = (recurrent_right_tr[17] * Output_right_tr16) + (trx_interneuron[16] * Output_right_tr15)

    Output_right_tr16 = (math.exp(2*Activity_right_tr16)-1)/(math.exp(2*Activity_right_tr16)+1)

    Activity_right_tr17 = (recurrent_right_tr[18] * Output_right_tr17) + (trx_interneuron[17] * Output_right_tr16)

    Output_right_tr17 = (math.exp(2*Activity_right_tr17)-1)/(math.exp(2*Activity_right_tr17)+1)

    Activity_right_tr18 = (recurrent_right_tr[19] * Output_right_tr18) + (trx_interneuron[18] * Output_right_tr17)

    Output_right_tr18 = (math.exp(2*Activity_right_tr18)-1)/(math.exp(2*Activity_right_tr18)+1)

    Activity_right_tr19 = (recurrent_right_tr[20] * Output_right_tr19) + (trx_interneuron[19] * Output_right_tr18)

    Output_right_tr19 = (math.exp(2*Activity_right_tr19)-1)/(math.exp(2*Activity_right_tr19)+1)

    Activity_right_tr20 = (recurrent_right_tr[21] * Output_right_tr20) + (trx_interneuron[20] * Output_right_tr19)

    Output_right_tr20 = (math.exp(2*Activity_right_tr20)-1)/(math.exp(2*Activity_right_tr20)+1)

    --next leg

    Activity_right_tr21 = (recurrent_right_tr[22] * Output_right_tr21) + (trx_interneuron[21] * Output_right_tr20)

    Output_right_tr21 = (math.exp(2*Activity_right_tr21)-1)/(math.exp(2*Activity_right_tr21)+1)

    Activity_right_tr22 = (recurrent_right_tr[23] * Output_right_tr22) + (trx_interneuron[22] * Output_right_tr21)

    Output_right_tr22 = (math.exp(2*Activity_right_tr22)-1)/(math.exp(2*Activity_right_tr22)+1)

    Activity_right_tr23 = (recurrent_right_tr[24] * Output_right_tr23) + (trx_interneuron[23] * Output_right_tr22)

    Output_right_tr23 = (math.exp(2*Activity_right_tr23)-1)/(math.exp(2*Activity_right_tr23)+1)

    Activity_right_tr24 = (recurrent_right_tr[25] * Output_right_tr24) + (trx_interneuron[24] * Output_right_tr23)

    Output_right_tr24 = (math.exp(2*Activity_right_tr24)-1)/(math.exp(2*Activity_right_tr24)+1)

    Activity_right_tr25 = (recurrent_right_tr[26] * Output_right_tr25) + (trx_interneuron[25] * Output_right_tr24)

    Output_right_tr25 = (math.exp(2*Activity_right_tr25)-1)/(math.exp(2*Activity_right_tr25)+1)

    Activity_right_tr26 = (recurrent_right_tr[27] * Output_right_tr26) + (trx_interneuron[26] * Output_right_tr25)

    Output_right_tr26 = (math.exp(2*Activity_right_tr26)-1)/(math.exp(2*Activity_right_tr26)+1)

    Activity_right_tr27 = (recurrent_right_tr[28] * Output_right_tr27) + (trx_interneuron[27] * Output_right_tr26)

    Output_right_tr27 = (math.exp(2*Activity_right_tr27)-1)/(math.exp(2*Activity_right_tr27)+1)

    Activity_right_tr28 = (recurrent_right_tr[29] * Output_right_tr28) + (trx_interneuron[28] * Output_right_tr27)

    Output_right_tr28 = (math.exp(2*Activity_right_tr28)-1)/(math.exp(2*Activity_right_tr28)+1)

    Activity_right_tr29 = (recurrent_right_tr[30] * Output_right_tr29) + (trx_interneuron[29] * Output_right_tr28)

    Output_right_tr29 = (math.exp(2*Activity_right_tr29)-1)/(math.exp(2*Activity_right_tr29)+1)

    Activity_right_tr30 = (recurrent_right_tr[31] * Output_right_tr30) + (trx_interneuron[30] * Output_right_tr29)

    Output_right_tr30 = (math.exp(2*Activity_right_tr30)-1)/(math.exp(2*Activity_right_tr30)+1)

    --next leg

    Activity_right_tr31 = (recurrent_right_tr[32] * Output_right_tr31) + (trx_interneuron[31] * Output_right_tr30)

    Output_right_tr31 = (math.exp(2*Activity_right_tr31)-1)/(math.exp(2*Activity_right_tr31)+1)

    Activity_right_tr32 = (recurrent_right_tr[33] * Output_right_tr32) + (trx_interneuron[32] * Output_right_tr31)

    Output_right_tr32 = (math.exp(2*Activity_right_tr32)-1)/(math.exp(2*Activity_right_tr32)+1)

    Activity_right_tr33 = (recurrent_right_tr[34] * Output_right_tr33) + (trx_interneuron[33] * Output_right_tr32)

    Output_right_tr33 = (math.exp(2*Activity_right_tr33)-1)/(math.exp(2*Activity_right_tr33)+1)

    Activity_right_tr34 = (recurrent_right_tr[35] * Output_right_tr34) + (trx_interneuron[34] * Output_right_tr33)

    Output_right_tr34 = (math.exp(2*Activity_right_tr34)-1)/(math.exp(2*Activity_right_tr34)+1)

    Activity_right_tr35 = (recurrent_right_tr[36] * Output_right_tr35) + (trx_interneuron[35] * Output_right_tr34)

    Output_right_tr35 = (math.exp(2*Activity_right_tr35)-1)/(math.exp(2*Activity_right_tr35)+1)

    Activity_right_tr36 = (recurrent_right_tr[37] * Output_right_tr36) + (trx_interneuron[36] * Output_right_tr35)

    Output_right_tr36 = (math.exp(2*Activity_right_tr36)-1)/(math.exp(2*Activity_right_tr36)+1)

    Activity_right_tr37 = (recurrent_right_tr[38] * Output_right_tr37) + (trx_interneuron[37] * Output_right_tr36)

    Output_right_tr37 = (math.exp(2*Activity_right_tr37)-1)/(math.exp(2*Activity_right_tr37)+1)

    Activity_right_tr38 = (recurrent_right_tr[39] * Output_right_tr38) + (trx_interneuron[38] * Output_right_tr37)

    Output_right_tr38 = (math.exp(2*Activity_right_tr38)-1)/(math.exp(2*Activity_right_tr38)+1)

    Activity_right_tr39 = (recurrent_right_tr[40] * Output_right_tr39) + (trx_interneuron[39] * Output_right_tr38)

    Output_right_tr39 = (math.exp(2*Activity_right_tr39)-1)/(math.exp(2*Activity_right_tr39)+1)

    Activity_right_tr40 = (recurrent_right_tr[41] * Output_right_tr40) + (trx_interneuron[40] * Output_right_tr39)

    Output_right_tr40 = (math.exp(2*Activity_right_tr40)-1)/(math.exp(2*Activity_right_tr40)+1)

    --next leg
    
    Activity_right_tr41 = (recurrent_right_tr[42] * Output_right_tr41) + (trx_interneuron[41] * Output_right_tr40)

    Output_right_tr41 = (math.exp(2*Activity_right_tr41)-1)/(math.exp(2*Activity_right_tr41)+1)

    Activity_right_tr42 = (recurrent_right_tr[43] * Output_right_tr42) + (trx_interneuron[42] * Output_right_tr41)

    Output_right_tr42 = (math.exp(2*Activity_right_tr42)-1)/(math.exp(2*Activity_right_tr42)+1)

    Activity_right_tr43 = (recurrent_right_tr[44] * Output_right_tr43) + (trx_interneuron[43] * Output_right_tr42)

    Output_right_tr43 = (math.exp(2*Activity_right_tr43)-1)/(math.exp(2*Activity_right_tr43)+1)

    Activity_right_tr44 = (recurrent_right_tr[45] * Output_right_tr44) + (trx_interneuron[44] * Output_right_tr43)

    Output_right_tr44 = (math.exp(2*Activity_right_tr44)-1)/(math.exp(2*Activity_right_tr44)+1)

    Activity_right_tr45 = (recurrent_right_tr[46] * Output_right_tr45) + (trx_interneuron[45] * Output_right_tr44)

    Output_right_tr45 = (math.exp(2*Activity_right_tr45)-1)/(math.exp(2*Activity_right_tr45)+1)

    Activity_right_tr46 = (recurrent_right_tr[47] * Output_right_tr46) + (trx_interneuron[46] * Output_right_tr45)

    Output_right_tr46 = (math.exp(2*Activity_right_tr46)-1)/(math.exp(2*Activity_right_tr46)+1)

    Activity_right_tr47 = (recurrent_right_tr[48] * Output_right_tr47) + (trx_interneuron[47] * Output_right_tr46)

    Output_right_tr47 = (math.exp(2*Activity_right_tr47)-1)/(math.exp(2*Activity_right_tr47)+1)

    Activity_right_tr48 = (recurrent_right_tr[49] * Output_right_tr48) + (trx_interneuron[48] * Output_right_tr47)

    Output_right_tr48 = (math.exp(2*Activity_right_tr48)-1)/(math.exp(2*Activity_right_tr48)+1)

    Activity_right_tr49 = (recurrent_right_tr[50] * Output_right_tr49) + (trx_interneuron[49] * Output_right_tr48)

    Output_right_tr49 = (math.exp(2*Activity_right_tr49)-1)/(math.exp(2*Activity_right_tr49)+1)

    Activity_right_tr50 = (recurrent_right_tr[51] * Output_right_tr50) + (trx_interneuron[50] * Output_right_tr49)

    Output_right_tr50 = (math.exp(2*Activity_right_tr50)-1)/(math.exp(2*Activity_right_tr50)+1)

    --next leg

    Activity_right_tr51 = (recurrent_right_tr[52] * Output_right_tr51) + (trx_interneuron[51] * Output_right_tr50)

    Output_right_tr51 = (math.exp(2*Activity_right_tr51)-1)/(math.exp(2*Activity_right_tr51)+1)

    Activity_right_tr52 = (recurrent_right_tr[53] * Output_right_tr52) + (trx_interneuron[52] * Output_right_tr51)

    Output_right_tr52 = (math.exp(2*Activity_right_tr52)-1)/(math.exp(2*Activity_right_tr52)+1)

    Activity_right_tr53 = (recurrent_right_tr[54] * Output_right_tr53) + (trx_interneuron[53] * Output_right_tr52)

    Output_right_tr53 = (math.exp(2*Activity_right_tr53)-1)/(math.exp(2*Activity_right_tr53)+1)

    Activity_right_tr54 = (recurrent_right_tr[55] * Output_right_tr54) + (trx_interneuron[54] * Output_right_tr53)

    Output_right_tr54 = (math.exp(2*Activity_right_tr54)-1)/(math.exp(2*Activity_right_tr54)+1)

    Activity_right_tr55 = (recurrent_right_tr[56] * Output_right_tr55) + (trx_interneuron[55] * Output_right_tr54)

    Output_right_tr55 = (math.exp(2*Activity_right_tr55)-1)/(math.exp(2*Activity_right_tr55)+1)

    Activity_right_tr56 = (recurrent_right_tr[57] * Output_right_tr56) + (trx_interneuron[56] * Output_right_tr55)

    Output_right_tr56 = (math.exp(2*Activity_right_tr56)-1)/(math.exp(2*Activity_right_tr56)+1)

    Activity_right_tr57 = (recurrent_right_tr[58] * Output_right_tr57) + (trx_interneuron[57] * Output_right_tr56)

    Output_right_tr57 = (math.exp(2*Activity_right_tr57)-1)/(math.exp(2*Activity_right_tr57)+1)

    Activity_right_tr58 = (recurrent_right_tr[59] * Output_right_tr58) + (trx_interneuron[58] * Output_right_tr57)

    Output_right_tr58 = (math.exp(2*Activity_right_tr58)-1)/(math.exp(2*Activity_right_tr58)+1)

    Activity_right_tr59 = (recurrent_right_tr[60] * Output_right_tr59) + (trx_interneuron[59] * Output_right_tr58)

    Output_right_tr59 = (math.exp(2*Activity_right_tr59)-1)/(math.exp(2*Activity_right_tr59)+1)

    Activity_right_tr60 = (recurrent_right_tr[61] * Output_right_tr60) + (trx_interneuron[60] * Output_right_tr59)

    Output_right_tr60 = (math.exp(2*Activity_right_tr60)-1)/(math.exp(2*Activity_right_tr60)+1)

    --next leg

    Activity_right_tr61 = (recurrent_right_tr[62] * Output_right_tr61) + (trx_interneuron[61] * Output_right_tr60)

    Output_right_tr61 = (math.exp(2*Activity_right_tr61)-1)/(math.exp(2*Activity_right_tr61)+1)

    Activity_right_tr62 = (recurrent_right_tr[63] * Output_right_tr62) + (trx_interneuron[62] * Output_right_tr61)

    Output_right_tr62 = (math.exp(2*Activity_right_tr62)-1)/(math.exp(2*Activity_right_tr62)+1)

    Activity_right_tr63 = (recurrent_right_tr[64] * Output_right_tr63) + (trx_interneuron[63] * Output_right_tr62)

    Output_right_tr63 = (math.exp(2*Activity_right_tr63)-1)/(math.exp(2*Activity_right_tr63)+1)

    Activity_right_tr64 = (recurrent_right_tr[65] * Output_right_tr64) + (trx_interneuron[64] * Output_right_tr63)

    Output_right_tr64 = (math.exp(2*Activity_right_tr64)-1)/(math.exp(2*Activity_right_tr64)+1)

    Activity_right_tr65 = (recurrent_right_tr[66] * Output_right_tr65) + (trx_interneuron[65] * Output_right_tr64)

    Output_right_tr65 = (math.exp(2*Activity_right_tr65)-1)/(math.exp(2*Activity_right_tr65)+1)

    Activity_right_tr66 = (recurrent_right_tr[67] * Output_right_tr66) + (trx_interneuron[66] * Output_right_tr65)

    Output_right_tr66 = (math.exp(2*Activity_right_tr66)-1)/(math.exp(2*Activity_right_tr66)+1)

    Activity_right_tr67 = (recurrent_right_tr[68] * Output_right_tr67) + (trx_interneuron[67] * Output_right_tr66)

    Output_right_tr67 = (math.exp(2*Activity_right_tr67)-1)/(math.exp(2*Activity_right_tr67)+1)

    Activity_right_tr68 = (recurrent_right_tr[69] * Output_right_tr68) + (trx_interneuron[68] * Output_right_tr67)

    Output_right_tr68 = (math.exp(2*Activity_right_tr68)-1)/(math.exp(2*Activity_right_tr68)+1)

    Activity_right_tr69 = (recurrent_right_tr[70] * Output_right_tr69) + (trx_interneuron[69] * Output_right_tr68)

    Output_right_tr69 = (math.exp(2*Activity_right_tr69)-1)/(math.exp(2*Activity_right_tr69)+1)

    Activity_right_tr70 = (recurrent_right_tr[71] * Output_right_tr70) + (trx_interneuron[70] * Output_right_tr69)

    Output_right_tr70 = (math.exp(2*Activity_right_tr70)-1)/(math.exp(2*Activity_right_tr70)+1)

    --next leg

    Activity_right_tr71 = (recurrent_right_tr[72] * Output_right_tr71) + (trx_interneuron[71] * Output_right_tr70)

    Output_right_tr71 = (math.exp(2*Activity_right_tr71)-1)/(math.exp(2*Activity_right_tr71)+1)

    Activity_right_tr72 = (recurrent_right_tr[73] * Output_right_tr72) + (trx_interneuron[72] * Output_right_tr71)

    Output_right_tr72 = (math.exp(2*Activity_right_tr72)-1)/(math.exp(2*Activity_right_tr72)+1)

    Activity_right_tr73 = (recurrent_right_tr[74] * Output_right_tr73) + (trx_interneuron[73] * Output_right_tr72)

    Output_right_tr73 = (math.exp(2*Activity_right_tr73)-1)/(math.exp(2*Activity_right_tr73)+1)

    Activity_right_tr74 = (recurrent_right_tr[75] * Output_right_tr74) + (trx_interneuron[74] * Output_right_tr73)

    Output_right_tr74 = (math.exp(2*Activity_right_tr74)-1)/(math.exp(2*Activity_right_tr74)+1)

    Activity_right_tr75 = (recurrent_right_tr[76] * Output_right_tr75) + (trx_interneuron[75] * Output_right_tr74)

    Output_right_tr75 = (math.exp(2*Activity_right_tr75)-1)/(math.exp(2*Activity_right_tr75)+1)

    Activity_right_tr76 = (recurrent_right_tr[77] * Output_right_tr76) + (trx_interneuron[76] * Output_right_tr75)

    Output_right_tr76 = (math.exp(2*Activity_right_tr76)-1)/(math.exp(2*Activity_right_tr76)+1)

    Activity_right_tr77 = (recurrent_right_tr[78] * Output_right_tr77) + (trx_interneuron[77] * Output_right_tr76)

    Output_right_tr77 = (math.exp(2*Activity_right_tr77)-1)/(math.exp(2*Activity_right_tr77)+1)

    Activity_right_tr78 = (recurrent_right_tr[79] * Output_right_tr78) + (trx_interneuron[78] * Output_right_tr77)

    Output_right_tr78 = (math.exp(2*Activity_right_tr78)-1)/(math.exp(2*Activity_right_tr78)+1)

    Activity_right_tr79 = (recurrent_right_tr[80] * Output_right_tr79) + (trx_interneuron[79] * Output_right_tr78)

    Output_right_tr79 = (math.exp(2*Activity_right_tr79)-1)/(math.exp(2*Activity_right_tr79)+1)

    Activity_right_tr80 = (recurrent_right_tr[81] * Output_right_tr80) + (trx_interneuron[80] * Output_right_tr79)

    Output_right_tr80 = (math.exp(2*Activity_right_tr80)-1)/(math.exp(2*Activity_right_tr80)+1)

    --next leg

    Activity_right_tr81 = (recurrent_right_tr[82] * Output_right_tr81) + (trx_interneuron[81] * Output_right_tr80)

    Output_right_tr81 = (math.exp(2*Activity_right_tr81)-1)/(math.exp(2*Activity_right_tr81)+1)

    Activity_right_tr82 = (recurrent_right_tr[83] * Output_right_tr82) + (trx_interneuron[82] * Output_right_tr81)

    Output_right_tr82 = (math.exp(2*Activity_right_tr82)-1)/(math.exp(2*Activity_right_tr82)+1)

    Activity_right_tr83 = (recurrent_right_tr[84] * Output_right_tr83) + (trx_interneuron[83] * Output_right_tr82)

    Output_right_tr83 = (math.exp(2*Activity_right_tr83)-1)/(math.exp(2*Activity_right_tr83)+1)

    Activity_right_tr84 = (recurrent_right_tr[85] * Output_right_tr84) + (trx_interneuron[84] * Output_right_tr83)

    Output_right_tr84 = (math.exp(2*Activity_right_tr84)-1)/(math.exp(2*Activity_right_tr84)+1)

    Activity_right_tr85 = (recurrent_right_tr[86] * Output_right_tr85) + (trx_interneuron[85] * Output_right_tr84)

    Output_right_tr85 = (math.exp(2*Activity_right_tr85)-1)/(math.exp(2*Activity_right_tr85)+1)

    Activity_right_tr86 = (recurrent_right_tr[87] * Output_right_tr86) + (trx_interneuron[86] * Output_right_tr85)

    Output_right_tr86 = (math.exp(2*Activity_right_tr86)-1)/(math.exp(2*Activity_right_tr86)+1)

    Activity_right_tr87 = (recurrent_right_tr[88] * Output_right_tr87) + (trx_interneuron[87] * Output_right_tr86)

    Output_right_tr87 = (math.exp(2*Activity_right_tr87)-1)/(math.exp(2*Activity_right_tr87)+1)

    Activity_right_tr88 = (recurrent_right_tr[89] * Output_right_tr88) + (trx_interneuron[88] * Output_right_tr87)

    Output_right_tr88 = (math.exp(2*Activity_right_tr88)-1)/(math.exp(2*Activity_right_tr88)+1)

    Activity_right_tr89 = (recurrent_right_tr[90] * Output_right_tr89) + (trx_interneuron[89] * Output_right_tr88)

    Output_right_tr89 = (math.exp(2*Activity_right_tr89)-1)/(math.exp(2*Activity_right_tr89)+1)

    Activity_right_tr90 = (recurrent_right_tr[91] * Output_right_tr90) + (trx_interneuron[90] * Output_right_tr89)

    Output_right_tr90 = (math.exp(2*Activity_right_tr90)-1)/(math.exp(2*Activity_right_tr90)+1)

    --next leg

    Activity_right_tr91 = (recurrent_right_tr[92] * Output_right_tr91) + (trx_interneuron[91] * Output_right_tr90)

    Output_right_tr91 = (math.exp(2*Activity_right_tr91)-1)/(math.exp(2*Activity_right_tr91)+1)

    Activity_right_tr92 = (recurrent_right_tr[93] * Output_right_tr92) + (trx_interneuron[92] * Output_right_tr91)

    Output_right_tr92 = (math.exp(2*Activity_right_tr92)-1)/(math.exp(2*Activity_right_tr92)+1)

    Activity_right_tr93 = (recurrent_right_tr[94] * Output_right_tr93) + (trx_interneuron[93] * Output_right_tr92)

    Output_right_tr93 = (math.exp(2*Activity_right_tr93)-1)/(math.exp(2*Activity_right_tr93)+1)

    Activity_right_tr94 = (recurrent_right_tr[95] * Output_right_tr94) + (trx_interneuron[94] * Output_right_tr93)

    Output_right_tr94 = (math.exp(2*Activity_right_tr94)-1)/(math.exp(2*Activity_right_tr94)+1)

    Activity_right_tr95 = (recurrent_right_tr[96] * Output_right_tr95) + (trx_interneuron[95] * Output_right_tr94)

    Output_right_tr95 = (math.exp(2*Activity_right_tr95)-1)/(math.exp(2*Activity_right_tr95)+1)

    Activity_right_tr96 = (recurrent_right_tr[97] * Output_right_tr96) + (trx_interneuron[96] * Output_right_tr95)

    Output_right_tr96 = (math.exp(2*Activity_right_tr96)-1)/(math.exp(2*Activity_right_tr96)+1)

    Activity_right_tr97 = (recurrent_right_tr[98] * Output_right_tr97) + (trx_interneuron[97] * Output_right_tr96)

    Output_right_tr97 = (math.exp(2*Activity_right_tr97)-1)/(math.exp(2*Activity_right_tr97)+1)

    Activity_right_tr98 = (recurrent_right_tr[99] * Output_right_tr98) + (trx_interneuron[98] * Output_right_tr97)

    Output_right_tr98 = (math.exp(2*Activity_right_tr98)-1)/(math.exp(2*Activity_right_tr98)+1)

    Activity_right_tr99 = (recurrent_right_tr[100] * Output_right_tr99) + (trx_interneuron[99] * Output_right_tr98)

    Output_right_tr99 = (math.exp(2*Activity_right_tr99)-1)/(math.exp(2*Activity_right_tr99)+1)

    Activity_right_tr100 = (recurrent_right_tr[101] * Output_right_tr100) + (trx_interneuron[100] * Output_right_tr99)

    Output_right_tr100 = (math.exp(2*Activity_right_tr100)-1)/(math.exp(2*Activity_right_tr100)+1)

    --next leg

    Activity_right_tr101 = (recurrent_right_tr[102] * Output_right_tr101) + (trx_interneuron[101] * Output_right_tr100)

    Output_right_tr101 = (math.exp(2*Activity_right_tr101)-1)/(math.exp(2*Activity_right_tr101)+1)

    Activity_right_tr102 = (recurrent_right_tr[103] * Output_right_tr102) + (trx_interneuron[102] * Output_right_tr101)

    Output_right_tr102 = (math.exp(2*Activity_right_tr102)-1)/(math.exp(2*Activity_right_tr102)+1)

    Activity_right_tr103 = (recurrent_right_tr[104] * Output_right_tr103) + (trx_interneuron[103] * Output_right_tr102)

    Output_right_tr103 = (math.exp(2*Activity_right_tr103)-1)/(math.exp(2*Activity_right_tr103)+1)

    Activity_right_tr104 = (recurrent_right_tr[105] * Output_right_tr104) + (trx_interneuron[104] * Output_right_tr103)

    Output_right_tr104 = (math.exp(2*Activity_right_tr104)-1)/(math.exp(2*Activity_right_tr104)+1)

    Activity_right_tr105 = (recurrent_right_tr[106] * Output_right_tr105) + (trx_interneuron[105] * Output_right_tr104)

    Output_right_tr105 = (math.exp(2*Activity_right_tr105)-1)/(math.exp(2*Activity_right_tr105)+1)

    Activity_right_tr106 = (recurrent_right_tr[107] * Output_right_tr106) + (trx_interneuron[106] * Output_right_tr105)

    Output_right_tr106 = (math.exp(2*Activity_right_tr106)-1)/(math.exp(2*Activity_right_tr106)+1)

    Activity_right_tr107 = (recurrent_right_tr[108] * Output_right_tr107) + (trx_interneuron[107] * Output_right_tr106)

    Output_right_tr107 = (math.exp(2*Activity_right_tr107)-1)/(math.exp(2*Activity_right_tr107)+1)

    Activity_right_tr108 = (recurrent_right_tr[109] * Output_right_tr108) + (trx_interneuron[108] * Output_right_tr107)

    Output_right_tr108 = (math.exp(2*Activity_right_tr108)-1)/(math.exp(2*Activity_right_tr108)+1)

    Activity_right_tr109 = (recurrent_right_tr[110] * Output_right_tr109) + (trx_interneuron[109] * Output_right_tr108)

    Output_right_tr109 = (math.exp(2*Activity_right_tr109)-1)/(math.exp(2*Activity_right_tr109)+1)

    Activity_right_tr110 = (recurrent_right_tr[111] * Output_right_tr110) + (trx_interneuron[110] * Output_right_tr109)

    Output_right_tr110 = (math.exp(2*Activity_right_tr110)-1)/(math.exp(2*Activity_right_tr110)+1)

    --next leg

    Activity_right_tr111 = (recurrent_right_tr[112] * Output_right_tr111) + (trx_interneuron[111] * Output_right_tr110)

    Output_right_tr111 = (math.exp(2*Activity_right_tr111)-1)/(math.exp(2*Activity_right_tr111)+1)

    Activity_right_tr112 = (recurrent_right_tr[113] * Output_right_tr112) + (trx_interneuron[112] * Output_right_tr111)

    Output_right_tr112 = (math.exp(2*Activity_right_tr112)-1)/(math.exp(2*Activity_right_tr112)+1)

    Activity_right_tr113 = (recurrent_right_tr[114] * Output_right_tr113) + (trx_interneuron[113] * Output_right_tr112)

    Output_right_tr113 = (math.exp(2*Activity_right_tr113)-1)/(math.exp(2*Activity_right_tr113)+1)

    Activity_right_tr114 = (recurrent_right_tr[115] * Output_right_tr114) + (trx_interneuron[114] * Output_right_tr113)

    Output_right_tr114 = (math.exp(2*Activity_right_tr114)-1)/(math.exp(2*Activity_right_tr114)+1)

    Activity_right_tr115 = (recurrent_right_tr[116] * Output_right_tr115) + (trx_interneuron[115] * Output_right_tr114)

    Output_right_tr115 = (math.exp(2*Activity_right_tr115)-1)/(math.exp(2*Activity_right_tr115)+1)

    Activity_right_tr116 = (recurrent_right_tr[117] * Output_right_tr116) + (trx_interneuron[116] * Output_right_tr115)

    Output_right_tr116 = (math.exp(2*Activity_right_tr116)-1)/(math.exp(2*Activity_right_tr116)+1)

    Activity_right_tr117 = (recurrent_right_tr[118] * Output_right_tr117) + (trx_interneuron[117] * Output_right_tr116)

    Output_right_tr117 = (math.exp(2*Activity_right_tr117)-1)/(math.exp(2*Activity_right_tr117)+1)

    Activity_right_tr118 = (recurrent_right_tr[119] * Output_right_tr118) + (trx_interneuron[118] * Output_right_tr117)

    Output_right_tr118 = (math.exp(2*Activity_right_tr118)-1)/(math.exp(2*Activity_right_tr118)+1)

    Activity_right_tr119 = (recurrent_right_tr[120] * Output_right_tr119) + (trx_interneuron[119] * Output_right_tr118)

    Output_right_tr119 = (math.exp(2*Activity_right_tr119)-1)/(math.exp(2*Activity_right_tr119)+1)

    Activity_right_tr120 = (recurrent_right_tr[121] * Output_right_tr120) + (trx_interneuron[120] * Output_right_tr119)

    Output_right_tr120 = (math.exp(2*Activity_right_tr120)-1)/(math.exp(2*Activity_right_tr120)+1)

    --next leg

    Activity_right_tr121 = (recurrent_right_tr[122] * Output_right_tr121) + (trx_interneuron[121] * Output_right_tr120)

    Output_right_tr121 = (math.exp(2*Activity_right_tr121)-1)/(math.exp(2*Activity_right_tr121)+1)

    Activity_right_tr122 = (recurrent_right_tr[123] * Output_right_tr122) + (trx_interneuron[122] * Output_right_tr121)

    Output_right_tr122 = (math.exp(2*Activity_right_tr122)-1)/(math.exp(2*Activity_right_tr122)+1)

    Activity_right_tr123 = (recurrent_right_tr[124] * Output_right_tr123) + (trx_interneuron[123] * Output_right_tr122)

    Output_right_tr123 = (math.exp(2*Activity_right_tr123)-1)/(math.exp(2*Activity_right_tr123)+1)

    Activity_right_tr124 = (recurrent_right_tr[125] * Output_right_tr124) + (trx_interneuron[124] * Output_right_tr123)

    Output_right_tr124 = (math.exp(2*Activity_right_tr124)-1)/(math.exp(2*Activity_right_tr124)+1)

    Activity_right_tr125 = (recurrent_right_tr[126] * Output_right_tr125) + (trx_interneuron[125] * Output_right_tr124)

    Output_right_tr125 = (math.exp(2*Activity_right_tr125)-1)/(math.exp(2*Activity_right_tr125)+1)

    Activity_right_tr126 = (recurrent_right_tr[127] * Output_right_tr126) + (trx_interneuron[126] * Output_right_tr125)

    Output_right_tr126 = (math.exp(2*Activity_right_tr126)-1)/(math.exp(2*Activity_right_tr126)+1)

    Activity_right_tr127 = (recurrent_right_tr[128] * Output_right_tr127) + (trx_interneuron[127] * Output_right_tr126)

    Output_right_tr127 = (math.exp(2*Activity_right_tr127)-1)/(math.exp(2*Activity_right_tr127)+1)

    Activity_right_tr128 = (recurrent_right_tr[129] * Output_right_tr128) + (trx_interneuron[128] * Output_right_tr127)

    Output_right_tr128 = (math.exp(2*Activity_right_tr128)-1)/(math.exp(2*Activity_right_tr128)+1)

    Activity_right_tr129 = (recurrent_right_tr[130] * Output_right_tr129) + (trx_interneuron[129] * Output_right_tr128)

    Output_right_tr129 = (math.exp(2*Activity_right_tr129)-1)/(math.exp(2*Activity_right_tr129)+1)

    Activity_right_tr130 = (recurrent_right_tr[131] * Output_right_tr130) + (trx_interneuron[130] * Output_right_tr129)

    Output_right_tr130 = (math.exp(2*Activity_right_tr130)-1)/(math.exp(2*Activity_right_tr130)+1)

    --next leg

    Activity_right_tr131 = (recurrent_right_tr[132] * Output_right_tr131) + (trx_interneuron[131] * Output_right_tr130)

    Output_right_tr131 = (math.exp(2*Activity_right_tr131)-1)/(math.exp(2*Activity_right_tr131)+1)

    Activity_right_tr132 = (recurrent_right_tr[133] * Output_right_tr132) + (trx_interneuron[132] * Output_right_tr131)

    Output_right_tr132 = (math.exp(2*Activity_right_tr132)-1)/(math.exp(2*Activity_right_tr132)+1)

    Activity_right_tr133 = (recurrent_right_tr[134] * Output_right_tr133) + (trx_interneuron[133] * Output_right_tr132)

    Output_right_tr133 = (math.exp(2*Activity_right_tr133)-1)/(math.exp(2*Activity_right_tr133)+1)

    Activity_right_tr134 = (recurrent_right_tr[135] * Output_right_tr134) + (trx_interneuron[134] * Output_right_tr133)

    Output_right_tr134 = (math.exp(2*Activity_right_tr134)-1)/(math.exp(2*Activity_right_tr134)+1)

    Activity_right_tr135 = (recurrent_right_tr[136] * Output_right_tr135) + (trx_interneuron[135] * Output_right_tr134)

    Output_right_tr135 = (math.exp(2*Activity_right_tr135)-1)/(math.exp(2*Activity_right_tr135)+1)

    Activity_right_tr136 = (recurrent_right_tr[137] * Output_right_tr136) + (trx_interneuron[136] * Output_right_tr135)

    Output_right_tr136 = (math.exp(2*Activity_right_tr136)-1)/(math.exp(2*Activity_right_tr136)+1)

    Activity_right_tr137 = (recurrent_right_tr[138] * Output_right_tr137) + (trx_interneuron[137] * Output_right_tr136)

    Output_right_tr137 = (math.exp(2*Activity_right_tr137)-1)/(math.exp(2*Activity_right_tr137)+1)

    Activity_right_tr138 = (recurrent_right_tr[139] * Output_right_tr138) + (trx_interneuron[138] * Output_right_tr137)

    Output_right_tr138 = (math.exp(2*Activity_right_tr138)-1)/(math.exp(2*Activity_right_tr138)+1)

    Activity_right_tr139 = (recurrent_right_tr[140] * Output_right_tr139) + (trx_interneuron[139] * Output_right_tr138)

    Output_right_tr139 = (math.exp(2*Activity_right_tr139)-1)/(math.exp(2*Activity_right_tr139)+1)

    Activity_right_tr140 = (recurrent_right_tr[141] * Output_right_tr140) + (trx_interneuron[140] * Output_right_tr139)

    Output_right_tr140 = (math.exp(2*Activity_right_tr140)-1)/(math.exp(2*Activity_right_tr140)+1)

    --next leg

    Activity_right_tr141 = (recurrent_right_tr[142] * Output_right_tr141) + (trx_interneuron[141] * Output_right_tr140)

    Output_right_tr141 = (math.exp(2*Activity_right_tr141)-1)/(math.exp(2*Activity_right_tr141)+1)

    Activity_right_tr142 = (recurrent_right_tr[143] * Output_right_tr142) + (trx_interneuron[142] * Output_right_tr141)

    Output_right_tr142 = (math.exp(2*Activity_right_tr142)-1)/(math.exp(2*Activity_right_tr142)+1)

    Activity_right_tr143 = (recurrent_right_tr[144] * Output_right_tr143) + (trx_interneuron[143] * Output_right_tr142)

    Output_right_tr143 = (math.exp(2*Activity_right_tr143)-1)/(math.exp(2*Activity_right_tr143)+1)

    Activity_right_tr144 = (recurrent_right_tr[145] * Output_right_tr144) + (trx_interneuron[144] * Output_right_tr143)

    Output_right_tr144 = (math.exp(2*Activity_right_tr144)-1)/(math.exp(2*Activity_right_tr144)+1)

    Activity_right_tr145 = (recurrent_right_tr[146] * Output_right_tr145) + (trx_interneuron[145] * Output_right_tr144)

    Output_right_tr145 = (math.exp(2*Activity_right_tr145)-1)/(math.exp(2*Activity_right_tr145)+1)

    Activity_right_tr146 = (recurrent_right_tr[147] * Output_right_tr146) + (trx_interneuron[146] * Output_right_tr145)

    Output_right_tr146 = (math.exp(2*Activity_right_tr146)-1)/(math.exp(2*Activity_right_tr146)+1)

    Activity_right_tr147 = (recurrent_right_tr[148] * Output_right_tr147) + (trx_interneuron[147] * Output_right_tr146)

    Output_right_tr147 = (math.exp(2*Activity_right_tr147)-1)/(math.exp(2*Activity_right_tr147)+1)

    Activity_right_tr148 = (recurrent_right_tr[149] * Output_right_tr148) + (trx_interneuron[148] * Output_right_tr147)

    Output_right_tr148 = (math.exp(2*Activity_right_tr148)-1)/(math.exp(2*Activity_right_tr148)+1)

    Activity_right_tr149 = (recurrent_right_tr[150] * Output_right_tr149) + (trx_interneuron[149] * Output_right_tr148)

    Output_right_tr149 = (math.exp(2*Activity_right_tr149)-1)/(math.exp(2*Activity_right_tr149)+1)

    Activity_right_tr150 = (recurrent_right_tr[151] * Output_right_tr150) + (trx_interneuron[150] * Output_right_tr149)

    Output_right_tr150 = (math.exp(2*Activity_right_tr150)-1)/(math.exp(2*Activity_right_tr150)+1)

    Activity_right_tr151 = (recurrent_right_tr[152] * Output_right_tr151) + (trx_interneuron[151] * Output_right_tr150)

    Output_right_tr151 = (math.exp(2*Activity_right_tr151)-1)/(math.exp(2*Activity_right_tr151)+1)

    Activity_right_tr152 = (recurrent_right_tr[153] * Output_right_tr152) + (trx_interneuron[152] * Output_right_tr151)

    Output_right_tr152 = (math.exp(2*Activity_right_tr152)-1)/(math.exp(2*Activity_right_tr152)+1)

    Activity_right_tr153 = (recurrent_right_tr[154] * Output_right_tr153) + (trx_interneuron[153] * Output_right_tr152)

    Output_right_tr153 = (math.exp(2*Activity_right_tr153)-1)/(math.exp(2*Activity_right_tr153)+1)

    Activity_right_tr154 = (recurrent_right_tr[155] * Output_right_tr154) + (trx_interneuron[154] * Output_right_tr153)

    Output_right_tr154 = (math.exp(2*Activity_right_tr154)-1)/(math.exp(2*Activity_right_tr154)+1)

    Activity_right_tr155 = (recurrent_right_tr[156] * Output_right_tr155) + (trx_interneuron[155] * Output_right_tr154)

    Output_right_tr155 = (math.exp(2*Activity_right_tr155)-1)/(math.exp(2*Activity_right_tr155)+1)


    --Prefemur - femur joints (denoted here as ft)
    
    --The first recurrent neuron receives outputs from the first tr0 motor neuron
    Activity_left_pf0 = (recurrent_left_pf[1] * Output_left_pf0) + (Weightpfl_C0[1] * Output_C0)

    Output_left_pf0 = (math.exp(2*Activity_left_pf0)-1)/(math.exp(2*Activity_left_pf0)+1)

    Activity_left_pf1 = (recurrent_left_pf[2] * Output_left_pf1) + (pfx_interneuron[1] * Output_left_pf0)

    Output_left_pf1 = (math.exp(2*Activity_left_pf1)-1)/(math.exp(2*Activity_left_pf1)+1)

    Activity_left_pf2 = (recurrent_left_pf[3] * Output_left_pf2) + (pfx_interneuron[2] * Output_left_pf1)

    Output_left_pf2 = (math.exp(2*Activity_left_pf2)-1)/(math.exp(2*Activity_left_pf2)+1)

    Activity_left_pf3 = (recurrent_left_pf[4] * Output_left_pf3) + (pfx_interneuron[3] * Output_left_pf2)

    Output_left_pf3 = (math.exp(2*Activity_left_pf3)-1)/(math.exp(2*Activity_left_pf3)+1)

    Activity_left_pf4 = (recurrent_left_pf[5] * Output_left_pf4) + (pfx_interneuron[4] * Output_left_pf3)

    Output_left_pf4 = (math.exp(2*Activity_left_pf4)-1)/(math.exp(2*Activity_left_pf4)+1)

    Activity_left_pf5 = (recurrent_left_pf[6] * Output_left_pf5) + (pfx_interneuron[5] * Output_left_pf4)

    Output_left_pf5 = (math.exp(2*Activity_left_pf5)-1)/(math.exp(2*Activity_left_pf5)+1)

    Activity_left_pf6 = (recurrent_left_pf[7] * Output_left_pf6) + (pfx_interneuron[6] * Output_left_pf5)

    Output_left_pf6 = (math.exp(2*Activity_left_pf6)-1)/(math.exp(2*Activity_left_pf6)+1)

    Activity_left_pf7 = (recurrent_left_pf[8] * Output_left_pf7) + (pfx_interneuron[7] * Output_left_pf6)

    Output_left_pf7 = (math.exp(2*Activity_left_pf7)-1)/(math.exp(2*Activity_left_pf7)+1)

    Activity_left_pf8 = (recurrent_left_pf[9] * Output_left_pf8) + (pfx_interneuron[8] * Output_left_pf7)

    Output_left_pf8 = (math.exp(2*Activity_left_pf8)-1)/(math.exp(2*Activity_left_pf8)+1)

    Activity_left_pf9 = (recurrent_left_pf[10] * Output_left_pf9) + (pfx_interneuron[9] * Output_left_pf8)

    Output_left_pf9 = (math.exp(2*Activity_left_pf9)-1)/(math.exp(2*Activity_left_pf9)+1)

    Activity_left_pf10 = (recurrent_left_pf[11] * Output_left_pf10) + (pfx_interneuron[10] * Output_left_pf9)

    --file:write( string.format("%f\t",Activity_left_pf10) )

    Output_left_pf10 = (math.exp(2*Activity_left_pf10)-1)/(math.exp(2*Activity_left_pf10)+1)

    --file:write( string.format("%f\t",Output_left_pf10) )

    --next leg
    
    Activity_left_pf11 = (recurrent_left_pf[12] * Output_left_pf11) + (pfx_interneuron[11] * Output_left_pf10)

    Output_left_pf11 = (math.exp(2*Activity_left_pf11)-1)/(math.exp(2*Activity_left_pf11)+1)

    Activity_left_pf12 = (recurrent_left_pf[13] * Output_left_pf12) + (pfx_interneuron[12] * Output_left_pf11)

    Output_left_pf12 = (math.exp(2*Activity_left_pf12)-1)/(math.exp(2*Activity_left_pf12)+1)

    Activity_left_pf13 = (recurrent_left_pf[14] * Output_left_pf13) + (pfx_interneuron[13] * Output_left_pf12)

    Output_left_pf13 = (math.exp(2*Activity_left_pf13)-1)/(math.exp(2*Activity_left_pf13)+1)

    Activity_left_pf14 = (recurrent_left_pf[15] * Output_left_pf14) + (pfx_interneuron[14] * Output_left_pf13)

    Output_left_pf14 = (math.exp(2*Activity_left_pf14)-1)/(math.exp(2*Activity_left_pf14)+1)

    Activity_left_pf15 = (recurrent_left_pf[16] * Output_left_pf15) + (pfx_interneuron[15] * Output_left_pf14)

    Output_left_pf15 = (math.exp(2*Activity_left_pf15)-1)/(math.exp(2*Activity_left_pf15)+1)

    Activity_left_pf16 = (recurrent_left_pf[17] * Output_left_pf16) + (pfx_interneuron[16] * Output_left_pf15)

    Output_left_pf16 = (math.exp(2*Activity_left_pf16)-1)/(math.exp(2*Activity_left_pf16)+1)

    Activity_left_pf17 = (recurrent_left_pf[18] * Output_left_pf17) + (pfx_interneuron[17] * Output_left_pf16)

    Output_left_pf17 = (math.exp(2*Activity_left_pf17)-1)/(math.exp(2*Activity_left_pf17)+1)

    Activity_left_pf18 = (recurrent_left_pf[19] * Output_left_pf18) + (pfx_interneuron[18] * Output_left_pf17)

    Output_left_pf18 = (math.exp(2*Activity_left_pf18)-1)/(math.exp(2*Activity_left_pf18)+1)

    Activity_left_pf19 = (recurrent_left_pf[20] * Output_left_pf19) + (pfx_interneuron[19] * Output_left_pf18)

    Output_left_pf19 = (math.exp(2*Activity_left_pf19)-1)/(math.exp(2*Activity_left_pf19)+1)

    Activity_left_pf20 = (recurrent_left_pf[21] * Output_left_pf20) + (pfx_interneuron[20] * Output_left_pf19)

    Output_left_pf20 = (math.exp(2*Activity_left_pf20)-1)/(math.exp(2*Activity_left_pf20)+1)

    --next leg

    Activity_left_pf21 = (recurrent_left_pf[22] * Output_left_pf21) + (pfx_interneuron[21] * Output_left_pf20)

    Output_left_pf21 = (math.exp(2*Activity_left_pf21)-1)/(math.exp(2*Activity_left_pf21)+1)

    Activity_left_pf22 = (recurrent_left_pf[23] * Output_left_pf22) + (pfx_interneuron[22] * Output_left_pf21)

    Output_left_pf22 = (math.exp(2*Activity_left_pf22)-1)/(math.exp(2*Activity_left_pf22)+1)

    Activity_left_pf23 = (recurrent_left_pf[24] * Output_left_pf23) + (pfx_interneuron[23] * Output_left_pf22)

    Output_left_pf23 = (math.exp(2*Activity_left_pf23)-1)/(math.exp(2*Activity_left_pf23)+1)

    Activity_left_pf24 = (recurrent_left_pf[25] * Output_left_pf24) + (pfx_interneuron[24] * Output_left_pf23)

    Output_left_pf24 = (math.exp(2*Activity_left_pf24)-1)/(math.exp(2*Activity_left_pf24)+1)

    Activity_left_pf25 = (recurrent_left_pf[26] * Output_left_pf25) + (pfx_interneuron[25] * Output_left_pf24)

    Output_left_pf25 = (math.exp(2*Activity_left_pf25)-1)/(math.exp(2*Activity_left_pf25)+1)

    Activity_left_pf26 = (recurrent_left_pf[27] * Output_left_pf26) + (pfx_interneuron[26] * Output_left_pf25)

    Output_left_pf26 = (math.exp(2*Activity_left_pf26)-1)/(math.exp(2*Activity_left_pf26)+1)

    Activity_left_pf27 = (recurrent_left_pf[28] * Output_left_pf27) + (pfx_interneuron[27] * Output_left_pf26)

    Output_left_pf27 = (math.exp(2*Activity_left_pf27)-1)/(math.exp(2*Activity_left_pf27)+1)

    Activity_left_pf28 = (recurrent_left_pf[29] * Output_left_pf28) + (pfx_interneuron[28] * Output_left_pf27)

    Output_left_pf28 = (math.exp(2*Activity_left_pf28)-1)/(math.exp(2*Activity_left_pf28)+1)

    Activity_left_pf29 = (recurrent_left_pf[30] * Output_left_pf29) + (pfx_interneuron[29] * Output_left_pf28)

    Output_left_pf29 = (math.exp(2*Activity_left_pf29)-1)/(math.exp(2*Activity_left_pf29)+1)

    Activity_left_pf30 = (recurrent_left_pf[31] * Output_left_pf30) + (pfx_interneuron[30] * Output_left_pf29)

    Output_left_pf30 = (math.exp(2*Activity_left_pf30)-1)/(math.exp(2*Activity_left_pf30)+1)

    --next leg

    Activity_left_pf31 = (recurrent_left_pf[32] * Output_left_pf31) + (pfx_interneuron[31] * Output_left_pf30)

    Output_left_pf31 = (math.exp(2*Activity_left_pf31)-1)/(math.exp(2*Activity_left_pf31)+1)

    Activity_left_pf32 = (recurrent_left_pf[33] * Output_left_pf32) + (pfx_interneuron[32] * Output_left_pf31)

    Output_left_pf32 = (math.exp(2*Activity_left_pf32)-1)/(math.exp(2*Activity_left_pf32)+1)

    Activity_left_pf33 = (recurrent_left_pf[34] * Output_left_pf33) + (pfx_interneuron[33] * Output_left_pf32)

    Output_left_pf33 = (math.exp(2*Activity_left_pf33)-1)/(math.exp(2*Activity_left_pf33)+1)

    Activity_left_pf34 = (recurrent_left_pf[35] * Output_left_pf34) + (pfx_interneuron[34] * Output_left_pf33)

    Output_left_pf34 = (math.exp(2*Activity_left_pf34)-1)/(math.exp(2*Activity_left_pf34)+1)

    Activity_left_pf35 = (recurrent_left_pf[36] * Output_left_pf35) + (pfx_interneuron[35] * Output_left_pf34)

    Output_left_pf35 = (math.exp(2*Activity_left_pf35)-1)/(math.exp(2*Activity_left_pf35)+1)

    Activity_left_pf36 = (recurrent_left_pf[37] * Output_left_pf36) + (pfx_interneuron[36] * Output_left_pf35)

    Output_left_pf36 = (math.exp(2*Activity_left_pf36)-1)/(math.exp(2*Activity_left_pf36)+1)

    Activity_left_pf37 = (recurrent_left_pf[38] * Output_left_pf37) + (pfx_interneuron[37] * Output_left_pf36)

    Output_left_pf37 = (math.exp(2*Activity_left_pf37)-1)/(math.exp(2*Activity_left_pf37)+1)

    Activity_left_pf38 = (recurrent_left_pf[39] * Output_left_pf38) + (pfx_interneuron[38] * Output_left_pf37)

    Output_left_pf38 = (math.exp(2*Activity_left_pf38)-1)/(math.exp(2*Activity_left_pf38)+1)

    Activity_left_pf39 = (recurrent_left_pf[40] * Output_left_pf39) + (pfx_interneuron[39] * Output_left_pf38)

    Output_left_pf39 = (math.exp(2*Activity_left_pf39)-1)/(math.exp(2*Activity_left_pf39)+1)

    Activity_left_pf40 = (recurrent_left_pf[41] * Output_left_pf40) + (pfx_interneuron[40] * Output_left_pf39)

    Output_left_pf40 = (math.exp(2*Activity_left_pf40)-1)/(math.exp(2*Activity_left_pf40)+1)

    --next leg
    
    Activity_left_pf41 = (recurrent_left_pf[42] * Output_left_pf41) + (pfx_interneuron[41] * Output_left_pf40)

    Output_left_pf41 = (math.exp(2*Activity_left_pf41)-1)/(math.exp(2*Activity_left_pf41)+1)

    Activity_left_pf42 = (recurrent_left_pf[43] * Output_left_pf42) + (pfx_interneuron[42] * Output_left_pf41)

    Output_left_pf42 = (math.exp(2*Activity_left_pf42)-1)/(math.exp(2*Activity_left_pf42)+1)

    Activity_left_pf43 = (recurrent_left_pf[44] * Output_left_pf43) + (pfx_interneuron[43] * Output_left_pf42)

    Output_left_pf43 = (math.exp(2*Activity_left_pf43)-1)/(math.exp(2*Activity_left_pf43)+1)

    Activity_left_pf44 = (recurrent_left_pf[45] * Output_left_pf44) + (pfx_interneuron[44] * Output_left_pf43)

    Output_left_pf44 = (math.exp(2*Activity_left_pf44)-1)/(math.exp(2*Activity_left_pf44)+1)

    Activity_left_pf45 = (recurrent_left_pf[46] * Output_left_pf45) + (pfx_interneuron[45] * Output_left_pf44)

    Output_left_pf45 = (math.exp(2*Activity_left_pf45)-1)/(math.exp(2*Activity_left_pf45)+1)

    Activity_left_pf46 = (recurrent_left_pf[47] * Output_left_pf46) + (pfx_interneuron[46] * Output_left_pf45)

    Output_left_pf46 = (math.exp(2*Activity_left_pf46)-1)/(math.exp(2*Activity_left_pf46)+1)

    Activity_left_pf47 = (recurrent_left_pf[48] * Output_left_pf47) + (pfx_interneuron[47] * Output_left_pf46)

    Output_left_pf47 = (math.exp(2*Activity_left_pf47)-1)/(math.exp(2*Activity_left_pf47)+1)

    Activity_left_pf48 = (recurrent_left_pf[49] * Output_left_pf48) + (pfx_interneuron[48] * Output_left_pf47)

    Output_left_pf48 = (math.exp(2*Activity_left_pf48)-1)/(math.exp(2*Activity_left_pf48)+1)

    Activity_left_pf49 = (recurrent_left_pf[50] * Output_left_pf49) + (pfx_interneuron[49] * Output_left_pf48)

    Output_left_pf49 = (math.exp(2*Activity_left_pf49)-1)/(math.exp(2*Activity_left_pf49)+1)

    Activity_left_pf50 = (recurrent_left_pf[51] * Output_left_pf50) + (pfx_interneuron[50] * Output_left_pf49)

    Output_left_pf50 = (math.exp(2*Activity_left_pf50)-1)/(math.exp(2*Activity_left_pf50)+1)

    --next leg

    Activity_left_pf51 = (recurrent_left_pf[52] * Output_left_pf51) + (pfx_interneuron[51] * Output_left_pf50)

    Output_left_pf51 = (math.exp(2*Activity_left_pf51)-1)/(math.exp(2*Activity_left_pf51)+1)

    Activity_left_pf52 = (recurrent_left_pf[53] * Output_left_pf52) + (pfx_interneuron[52] * Output_left_pf51)

    Output_left_pf52 = (math.exp(2*Activity_left_pf52)-1)/(math.exp(2*Activity_left_pf52)+1)

    Activity_left_pf53 = (recurrent_left_pf[54] * Output_left_pf53) + (pfx_interneuron[53] * Output_left_pf52)

    Output_left_pf53 = (math.exp(2*Activity_left_pf53)-1)/(math.exp(2*Activity_left_pf53)+1)

    Activity_left_pf54 = (recurrent_left_pf[55] * Output_left_pf54) + (pfx_interneuron[54] * Output_left_pf53)

    Output_left_pf54 = (math.exp(2*Activity_left_pf54)-1)/(math.exp(2*Activity_left_pf54)+1)

    Activity_left_pf55 = (recurrent_left_pf[56] * Output_left_pf55) + (pfx_interneuron[55] * Output_left_pf54)

    Output_left_pf55 = (math.exp(2*Activity_left_pf55)-1)/(math.exp(2*Activity_left_pf55)+1)

    Activity_left_pf56 = (recurrent_left_pf[57] * Output_left_pf56) + (pfx_interneuron[56] * Output_left_pf55)

    Output_left_pf56 = (math.exp(2*Activity_left_pf56)-1)/(math.exp(2*Activity_left_pf56)+1)

    Activity_left_pf57 = (recurrent_left_pf[58] * Output_left_pf57) + (pfx_interneuron[57] * Output_left_pf56)

    Output_left_pf57 = (math.exp(2*Activity_left_pf57)-1)/(math.exp(2*Activity_left_pf57)+1)

    Activity_left_pf58 = (recurrent_left_pf[59] * Output_left_pf58) + (pfx_interneuron[58] * Output_left_pf57)

    Output_left_pf58 = (math.exp(2*Activity_left_pf58)-1)/(math.exp(2*Activity_left_pf58)+1)

    Activity_left_pf59 = (recurrent_left_pf[60] * Output_left_pf59) + (pfx_interneuron[59] * Output_left_pf58)

    Output_left_pf59 = (math.exp(2*Activity_left_pf59)-1)/(math.exp(2*Activity_left_pf59)+1)

    Activity_left_pf60 = (recurrent_left_pf[61] * Output_left_pf60) + (pfx_interneuron[60] * Output_left_pf59)

    Output_left_pf60 = (math.exp(2*Activity_left_pf60)-1)/(math.exp(2*Activity_left_pf60)+1)

    --next leg

    Activity_left_pf61 = (recurrent_left_pf[62] * Output_left_pf61) + (pfx_interneuron[61] * Output_left_pf60)

    Output_left_pf61 = (math.exp(2*Activity_left_pf61)-1)/(math.exp(2*Activity_left_pf61)+1)

    Activity_left_pf62 = (recurrent_left_pf[63] * Output_left_pf62) + (pfx_interneuron[62] * Output_left_pf61)

    Output_left_pf62 = (math.exp(2*Activity_left_pf62)-1)/(math.exp(2*Activity_left_pf62)+1)

    Activity_left_pf63 = (recurrent_left_pf[64] * Output_left_pf63) + (pfx_interneuron[63] * Output_left_pf62)

    Output_left_pf63 = (math.exp(2*Activity_left_pf63)-1)/(math.exp(2*Activity_left_pf63)+1)

    Activity_left_pf64 = (recurrent_left_pf[65] * Output_left_pf64) + (pfx_interneuron[64] * Output_left_pf63)

    Output_left_pf64 = (math.exp(2*Activity_left_pf64)-1)/(math.exp(2*Activity_left_pf64)+1)

    Activity_left_pf65 = (recurrent_left_pf[66] * Output_left_pf65) + (pfx_interneuron[65] * Output_left_pf64)

    Output_left_pf65 = (math.exp(2*Activity_left_pf65)-1)/(math.exp(2*Activity_left_pf65)+1)

    Activity_left_pf66 = (recurrent_left_pf[67] * Output_left_pf66) + (pfx_interneuron[66] * Output_left_pf65)

    Output_left_pf66 = (math.exp(2*Activity_left_pf66)-1)/(math.exp(2*Activity_left_pf66)+1)

    Activity_left_pf67 = (recurrent_left_pf[68] * Output_left_pf67) + (pfx_interneuron[67] * Output_left_pf66)

    Output_left_pf67 = (math.exp(2*Activity_left_pf67)-1)/(math.exp(2*Activity_left_pf67)+1)

    Activity_left_pf68 = (recurrent_left_pf[69] * Output_left_pf68) + (pfx_interneuron[68] * Output_left_pf67)

    Output_left_pf68 = (math.exp(2*Activity_left_pf68)-1)/(math.exp(2*Activity_left_pf68)+1)

    Activity_left_pf69 = (recurrent_left_pf[70] * Output_left_pf69) + (pfx_interneuron[69] * Output_left_pf68)

    Output_left_pf69 = (math.exp(2*Activity_left_pf69)-1)/(math.exp(2*Activity_left_pf69)+1)

    Activity_left_pf70 = (recurrent_left_pf[71] * Output_left_pf70) + (pfx_interneuron[70] * Output_left_pf69)

    Output_left_pf70 = (math.exp(2*Activity_left_pf70)-1)/(math.exp(2*Activity_left_pf70)+1)

    --next leg

    Activity_left_pf71 = (recurrent_left_pf[72] * Output_left_pf71) + (pfx_interneuron[71] * Output_left_pf70)

    Output_left_pf71 = (math.exp(2*Activity_left_pf71)-1)/(math.exp(2*Activity_left_pf71)+1)

    Activity_left_pf72 = (recurrent_left_pf[73] * Output_left_pf72) + (pfx_interneuron[72] * Output_left_pf71)

    Output_left_pf72 = (math.exp(2*Activity_left_pf72)-1)/(math.exp(2*Activity_left_pf72)+1)

    Activity_left_pf73 = (recurrent_left_pf[74] * Output_left_pf73) + (pfx_interneuron[73] * Output_left_pf72)

    Output_left_pf73 = (math.exp(2*Activity_left_pf73)-1)/(math.exp(2*Activity_left_pf73)+1)

    Activity_left_pf74 = (recurrent_left_pf[75] * Output_left_pf74) + (pfx_interneuron[74] * Output_left_pf73)

    Output_left_pf74 = (math.exp(2*Activity_left_pf74)-1)/(math.exp(2*Activity_left_pf74)+1)

    Activity_left_pf75 = (recurrent_left_pf[76] * Output_left_pf75) + (pfx_interneuron[75] * Output_left_pf74)

    Output_left_pf75 = (math.exp(2*Activity_left_pf75)-1)/(math.exp(2*Activity_left_pf75)+1)

    Activity_left_pf76 = (recurrent_left_pf[77] * Output_left_pf76) + (pfx_interneuron[76] * Output_left_pf75)

    Output_left_pf76 = (math.exp(2*Activity_left_pf76)-1)/(math.exp(2*Activity_left_pf76)+1)

    Activity_left_pf77 = (recurrent_left_pf[78] * Output_left_pf77) + (pfx_interneuron[77] * Output_left_pf76)

    Output_left_pf77 = (math.exp(2*Activity_left_pf77)-1)/(math.exp(2*Activity_left_pf77)+1)

    Activity_left_pf78 = (recurrent_left_pf[79] * Output_left_pf78) + (pfx_interneuron[78] * Output_left_pf77)

    Output_left_pf78 = (math.exp(2*Activity_left_pf78)-1)/(math.exp(2*Activity_left_pf78)+1)

    Activity_left_pf79 = (recurrent_left_pf[80] * Output_left_pf79) + (pfx_interneuron[79] * Output_left_pf78)

    Output_left_pf79 = (math.exp(2*Activity_left_pf79)-1)/(math.exp(2*Activity_left_pf79)+1)

    Activity_left_pf80 = (recurrent_left_pf[81] * Output_left_pf80) + (pfx_interneuron[80] * Output_left_pf79)

    Output_left_pf80 = (math.exp(2*Activity_left_pf80)-1)/(math.exp(2*Activity_left_pf80)+1)

    --next leg

    Activity_left_pf81 = (recurrent_left_pf[82] * Output_left_pf81) + (pfx_interneuron[81] * Output_left_pf80)

    Output_left_pf81 = (math.exp(2*Activity_left_pf81)-1)/(math.exp(2*Activity_left_pf81)+1)

    Activity_left_pf82 = (recurrent_left_pf[83] * Output_left_pf82) + (pfx_interneuron[82] * Output_left_pf81)

    Output_left_pf82 = (math.exp(2*Activity_left_pf82)-1)/(math.exp(2*Activity_left_pf82)+1)

    Activity_left_pf83 = (recurrent_left_pf[84] * Output_left_pf83) + (pfx_interneuron[83] * Output_left_pf82)

    Output_left_pf83 = (math.exp(2*Activity_left_pf83)-1)/(math.exp(2*Activity_left_pf83)+1)

    Activity_left_pf84 = (recurrent_left_pf[85] * Output_left_pf84) + (pfx_interneuron[84] * Output_left_pf83)

    Output_left_pf84 = (math.exp(2*Activity_left_pf84)-1)/(math.exp(2*Activity_left_pf84)+1)

    Activity_left_pf85 = (recurrent_left_pf[86] * Output_left_pf85) + (pfx_interneuron[85] * Output_left_pf84)

    Output_left_pf85 = (math.exp(2*Activity_left_pf85)-1)/(math.exp(2*Activity_left_pf85)+1)

    Activity_left_pf86 = (recurrent_left_pf[87] * Output_left_pf86) + (pfx_interneuron[86] * Output_left_pf85)

    Output_left_pf86 = (math.exp(2*Activity_left_pf86)-1)/(math.exp(2*Activity_left_pf86)+1)

    Activity_left_pf87 = (recurrent_left_pf[88] * Output_left_pf87) + (pfx_interneuron[87] * Output_left_pf86)

    Output_left_pf87 = (math.exp(2*Activity_left_pf87)-1)/(math.exp(2*Activity_left_pf87)+1)

    Activity_left_pf88 = (recurrent_left_pf[89] * Output_left_pf88) + (pfx_interneuron[88] * Output_left_pf87)

    Output_left_pf88 = (math.exp(2*Activity_left_pf88)-1)/(math.exp(2*Activity_left_pf88)+1)

    Activity_left_pf89 = (recurrent_left_pf[90] * Output_left_pf89) + (pfx_interneuron[89] * Output_left_pf88)

    Output_left_pf89 = (math.exp(2*Activity_left_pf89)-1)/(math.exp(2*Activity_left_pf89)+1)

    Activity_left_pf90 = (recurrent_left_pf[91] * Output_left_pf90) + (pfx_interneuron[90] * Output_left_pf89)

    Output_left_pf90 = (math.exp(2*Activity_left_pf90)-1)/(math.exp(2*Activity_left_pf90)+1)

    --next leg

    Activity_left_pf91 = (recurrent_left_pf[92] * Output_left_pf91) + (pfx_interneuron[91] * Output_left_pf90)

    Output_left_pf91 = (math.exp(2*Activity_left_pf91)-1)/(math.exp(2*Activity_left_pf91)+1)

    Activity_left_pf92 = (recurrent_left_pf[93] * Output_left_pf92) + (pfx_interneuron[92] * Output_left_pf91)

    Output_left_pf92 = (math.exp(2*Activity_left_pf92)-1)/(math.exp(2*Activity_left_pf92)+1)

    Activity_left_pf93 = (recurrent_left_pf[94] * Output_left_pf93) + (pfx_interneuron[93] * Output_left_pf92)

    Output_left_pf93 = (math.exp(2*Activity_left_pf93)-1)/(math.exp(2*Activity_left_pf93)+1)

    Activity_left_pf94 = (recurrent_left_pf[95] * Output_left_pf94) + (pfx_interneuron[94] * Output_left_pf93)

    Output_left_pf94 = (math.exp(2*Activity_left_pf94)-1)/(math.exp(2*Activity_left_pf94)+1)

    Activity_left_pf95 = (recurrent_left_pf[96] * Output_left_pf95) + (pfx_interneuron[95] * Output_left_pf94)

    Output_left_pf95 = (math.exp(2*Activity_left_pf95)-1)/(math.exp(2*Activity_left_pf95)+1)

    Activity_left_pf96 = (recurrent_left_pf[97] * Output_left_pf96) + (pfx_interneuron[96] * Output_left_pf95)

    Output_left_pf96 = (math.exp(2*Activity_left_pf96)-1)/(math.exp(2*Activity_left_pf96)+1)

    Activity_left_pf97 = (recurrent_left_pf[98] * Output_left_pf97) + (pfx_interneuron[97] * Output_left_pf96)

    Output_left_pf97 = (math.exp(2*Activity_left_pf97)-1)/(math.exp(2*Activity_left_pf97)+1)

    Activity_left_pf98 = (recurrent_left_pf[99] * Output_left_pf98) + (pfx_interneuron[98] * Output_left_pf97)

    Output_left_pf98 = (math.exp(2*Activity_left_pf98)-1)/(math.exp(2*Activity_left_pf98)+1)

    Activity_left_pf99 = (recurrent_left_pf[100] * Output_left_pf99) + (pfx_interneuron[99] * Output_left_pf98)

    Output_left_pf99 = (math.exp(2*Activity_left_pf99)-1)/(math.exp(2*Activity_left_pf99)+1)

    Activity_left_pf100 = (recurrent_left_pf[101] * Output_left_pf100) + (pfx_interneuron[100] * Output_left_pf99)

    Output_left_pf100 = (math.exp(2*Activity_left_pf100)-1)/(math.exp(2*Activity_left_pf100)+1)

    --next leg

    Activity_left_pf101 = (recurrent_left_pf[102] * Output_left_pf101) + (pfx_interneuron[101] * Output_left_pf100)

    Output_left_pf101 = (math.exp(2*Activity_left_pf101)-1)/(math.exp(2*Activity_left_pf101)+1)

    Activity_left_pf102 = (recurrent_left_pf[103] * Output_left_pf102) + (pfx_interneuron[102] * Output_left_pf101)

    Output_left_pf102 = (math.exp(2*Activity_left_pf102)-1)/(math.exp(2*Activity_left_pf102)+1)

    Activity_left_pf103 = (recurrent_left_pf[104] * Output_left_pf103) + (pfx_interneuron[103] * Output_left_pf102)

    Output_left_pf103 = (math.exp(2*Activity_left_pf103)-1)/(math.exp(2*Activity_left_pf103)+1)

    Activity_left_pf104 = (recurrent_left_pf[105] * Output_left_pf104) + (pfx_interneuron[104] * Output_left_pf103)

    Output_left_pf104 = (math.exp(2*Activity_left_pf104)-1)/(math.exp(2*Activity_left_pf104)+1)

    Activity_left_pf105 = (recurrent_left_pf[106] * Output_left_pf105) + (pfx_interneuron[105] * Output_left_pf104)

    Output_left_pf105 = (math.exp(2*Activity_left_pf105)-1)/(math.exp(2*Activity_left_pf105)+1)

    Activity_left_pf106 = (recurrent_left_pf[107] * Output_left_pf106) + (pfx_interneuron[106] * Output_left_pf105)

    Output_left_pf106 = (math.exp(2*Activity_left_pf106)-1)/(math.exp(2*Activity_left_pf106)+1)

    Activity_left_pf107 = (recurrent_left_pf[108] * Output_left_pf107) + (pfx_interneuron[107] * Output_left_pf106)

    Output_left_pf107 = (math.exp(2*Activity_left_pf107)-1)/(math.exp(2*Activity_left_pf107)+1)

    Activity_left_pf108 = (recurrent_left_pf[109] * Output_left_pf108) + (pfx_interneuron[108] * Output_left_pf107)

    Output_left_pf108 = (math.exp(2*Activity_left_pf108)-1)/(math.exp(2*Activity_left_pf108)+1)

    Activity_left_pf109 = (recurrent_left_pf[110] * Output_left_pf109) + (pfx_interneuron[109] * Output_left_pf108)

    Output_left_pf109 = (math.exp(2*Activity_left_pf109)-1)/(math.exp(2*Activity_left_pf109)+1)

    Activity_left_pf110 = (recurrent_left_pf[111] * Output_left_pf110) + (pfx_interneuron[110] * Output_left_pf109)

    Output_left_pf110 = (math.exp(2*Activity_left_pf110)-1)/(math.exp(2*Activity_left_pf110)+1)

    --next leg

    Activity_left_pf111 = (recurrent_left_pf[112] * Output_left_pf111) + (pfx_interneuron[111] * Output_left_pf110)

    Output_left_pf111 = (math.exp(2*Activity_left_pf111)-1)/(math.exp(2*Activity_left_pf111)+1)

    Activity_left_pf112 = (recurrent_left_pf[113] * Output_left_pf112) + (pfx_interneuron[112] * Output_left_pf111)

    Output_left_pf112 = (math.exp(2*Activity_left_pf112)-1)/(math.exp(2*Activity_left_pf112)+1)

    Activity_left_pf113 = (recurrent_left_pf[114] * Output_left_pf113) + (pfx_interneuron[113] * Output_left_pf112)

    Output_left_pf113 = (math.exp(2*Activity_left_pf113)-1)/(math.exp(2*Activity_left_pf113)+1)

    Activity_left_pf114 = (recurrent_left_pf[115] * Output_left_pf114) + (pfx_interneuron[114] * Output_left_pf113)

    Output_left_pf114 = (math.exp(2*Activity_left_pf114)-1)/(math.exp(2*Activity_left_pf114)+1)

    Activity_left_pf115 = (recurrent_left_pf[116] * Output_left_pf115) + (pfx_interneuron[115] * Output_left_pf114)

    Output_left_pf115 = (math.exp(2*Activity_left_pf115)-1)/(math.exp(2*Activity_left_pf115)+1)

    Activity_left_pf116 = (recurrent_left_pf[117] * Output_left_pf116) + (pfx_interneuron[116] * Output_left_pf115)

    Output_left_pf116 = (math.exp(2*Activity_left_pf116)-1)/(math.exp(2*Activity_left_pf116)+1)

    Activity_left_pf117 = (recurrent_left_pf[118] * Output_left_pf117) + (pfx_interneuron[117] * Output_left_pf116)

    Output_left_pf117 = (math.exp(2*Activity_left_pf117)-1)/(math.exp(2*Activity_left_pf117)+1)

    Activity_left_pf118 = (recurrent_left_pf[119] * Output_left_pf118) + (pfx_interneuron[118] * Output_left_pf117)

    Output_left_pf118 = (math.exp(2*Activity_left_pf118)-1)/(math.exp(2*Activity_left_pf118)+1)

    Activity_left_pf119 = (recurrent_left_pf[120] * Output_left_pf119) + (pfx_interneuron[119] * Output_left_pf118)

    Output_left_pf119 = (math.exp(2*Activity_left_pf119)-1)/(math.exp(2*Activity_left_pf119)+1)

    Activity_left_pf120 = (recurrent_left_pf[121] * Output_left_pf120) + (pfx_interneuron[120] * Output_left_pf119)

    Output_left_pf120 = (math.exp(2*Activity_left_pf120)-1)/(math.exp(2*Activity_left_pf120)+1)

    --next leg

    Activity_left_pf121 = (recurrent_left_pf[122] * Output_left_pf121) + (pfx_interneuron[121] * Output_left_pf120)

    Output_left_pf121 = (math.exp(2*Activity_left_pf121)-1)/(math.exp(2*Activity_left_pf121)+1)

    Activity_left_pf122 = (recurrent_left_pf[123] * Output_left_pf122) + (pfx_interneuron[122] * Output_left_pf121)

    Output_left_pf122 = (math.exp(2*Activity_left_pf122)-1)/(math.exp(2*Activity_left_pf122)+1)

    Activity_left_pf123 = (recurrent_left_pf[124] * Output_left_pf123) + (pfx_interneuron[123] * Output_left_pf122)

    Output_left_pf123 = (math.exp(2*Activity_left_pf123)-1)/(math.exp(2*Activity_left_pf123)+1)

    Activity_left_pf124 = (recurrent_left_pf[125] * Output_left_pf124) + (pfx_interneuron[124] * Output_left_pf123)

    Output_left_pf124 = (math.exp(2*Activity_left_pf124)-1)/(math.exp(2*Activity_left_pf124)+1)

    Activity_left_pf125 = (recurrent_left_pf[126] * Output_left_pf125) + (pfx_interneuron[125] * Output_left_pf124)

    Output_left_pf125 = (math.exp(2*Activity_left_pf125)-1)/(math.exp(2*Activity_left_pf125)+1)

    Activity_left_pf126 = (recurrent_left_pf[127] * Output_left_pf126) + (pfx_interneuron[126] * Output_left_pf125)

    Output_left_pf126 = (math.exp(2*Activity_left_pf126)-1)/(math.exp(2*Activity_left_pf126)+1)

    Activity_left_pf127 = (recurrent_left_pf[128] * Output_left_pf127) + (pfx_interneuron[127] * Output_left_pf126)

    Output_left_pf127 = (math.exp(2*Activity_left_pf127)-1)/(math.exp(2*Activity_left_pf127)+1)

    Activity_left_pf128 = (recurrent_left_pf[129] * Output_left_pf128) + (pfx_interneuron[128] * Output_left_pf127)

    Output_left_pf128 = (math.exp(2*Activity_left_pf128)-1)/(math.exp(2*Activity_left_pf128)+1)

    Activity_left_pf129 = (recurrent_left_pf[130] * Output_left_pf129) + (pfx_interneuron[129] * Output_left_pf128)

    Output_left_pf129 = (math.exp(2*Activity_left_pf129)-1)/(math.exp(2*Activity_left_pf129)+1)

    Activity_left_pf130 = (recurrent_left_pf[131] * Output_left_pf130) + (pfx_interneuron[130] * Output_left_pf129)

    Output_left_pf130 = (math.exp(2*Activity_left_pf130)-1)/(math.exp(2*Activity_left_pf130)+1)

    --next leg

    Activity_left_pf131 = (recurrent_left_pf[132] * Output_left_pf131) + (pfx_interneuron[131] * Output_left_pf130)

    Output_left_pf131 = (math.exp(2*Activity_left_pf131)-1)/(math.exp(2*Activity_left_pf131)+1)

    Activity_left_pf132 = (recurrent_left_pf[133] * Output_left_pf132) + (pfx_interneuron[132] * Output_left_pf131)

    Output_left_pf132 = (math.exp(2*Activity_left_pf132)-1)/(math.exp(2*Activity_left_pf132)+1)

    Activity_left_pf133 = (recurrent_left_pf[134] * Output_left_pf133) + (pfx_interneuron[133] * Output_left_pf132)

    Output_left_pf133 = (math.exp(2*Activity_left_pf133)-1)/(math.exp(2*Activity_left_pf133)+1)

    Activity_left_pf134 = (recurrent_left_pf[135] * Output_left_pf134) + (pfx_interneuron[134] * Output_left_pf133)

    Output_left_pf134 = (math.exp(2*Activity_left_pf134)-1)/(math.exp(2*Activity_left_pf134)+1)

    Activity_left_pf135 = (recurrent_left_pf[136] * Output_left_pf135) + (pfx_interneuron[135] * Output_left_pf134)

    Output_left_pf135 = (math.exp(2*Activity_left_pf135)-1)/(math.exp(2*Activity_left_pf135)+1)

    Activity_left_pf136 = (recurrent_left_pf[137] * Output_left_pf136) + (pfx_interneuron[136] * Output_left_pf135)

    Output_left_pf136 = (math.exp(2*Activity_left_pf136)-1)/(math.exp(2*Activity_left_pf136)+1)

    Activity_left_pf137 = (recurrent_left_pf[138] * Output_left_pf137) + (pfx_interneuron[137] * Output_left_pf136)

    Output_left_pf137 = (math.exp(2*Activity_left_pf137)-1)/(math.exp(2*Activity_left_pf137)+1)

    Activity_left_pf138 = (recurrent_left_pf[139] * Output_left_pf138) + (pfx_interneuron[138] * Output_left_pf137)

    Output_left_pf138 = (math.exp(2*Activity_left_pf138)-1)/(math.exp(2*Activity_left_pf138)+1)

    Activity_left_pf139 = (recurrent_left_pf[140] * Output_left_pf139) + (pfx_interneuron[139] * Output_left_pf138)

    Output_left_pf139 = (math.exp(2*Activity_left_pf139)-1)/(math.exp(2*Activity_left_pf139)+1)

    Activity_left_pf140 = (recurrent_left_pf[141] * Output_left_pf140) + (pfx_interneuron[140] * Output_left_pf139)

    Output_left_pf140 = (math.exp(2*Activity_left_pf140)-1)/(math.exp(2*Activity_left_pf140)+1)

    --next leg

    Activity_left_pf141 = (recurrent_left_pf[142] * Output_left_pf141) + (pfx_interneuron[141] * Output_left_pf140)

    Output_left_pf141 = (math.exp(2*Activity_left_pf141)-1)/(math.exp(2*Activity_left_pf141)+1)

    Activity_left_pf142 = (recurrent_left_pf[143] * Output_left_pf142) + (pfx_interneuron[142] * Output_left_pf141)

    Output_left_pf142 = (math.exp(2*Activity_left_pf142)-1)/(math.exp(2*Activity_left_pf142)+1)

    Activity_left_pf143 = (recurrent_left_pf[144] * Output_left_pf143) + (pfx_interneuron[143] * Output_left_pf142)

    Output_left_pf143 = (math.exp(2*Activity_left_pf143)-1)/(math.exp(2*Activity_left_pf143)+1)

    Activity_left_pf144 = (recurrent_left_pf[145] * Output_left_pf144) + (pfx_interneuron[144] * Output_left_pf143)

    Output_left_pf144 = (math.exp(2*Activity_left_pf144)-1)/(math.exp(2*Activity_left_pf144)+1)

    Activity_left_pf145 = (recurrent_left_pf[146] * Output_left_pf145) + (pfx_interneuron[145] * Output_left_pf144)

    Output_left_pf145 = (math.exp(2*Activity_left_pf145)-1)/(math.exp(2*Activity_left_pf145)+1)

    Activity_left_pf146 = (recurrent_left_pf[147] * Output_left_pf146) + (pfx_interneuron[146] * Output_left_pf145)

    Output_left_pf146 = (math.exp(2*Activity_left_pf146)-1)/(math.exp(2*Activity_left_pf146)+1)

    Activity_left_pf147 = (recurrent_left_pf[148] * Output_left_pf147) + (pfx_interneuron[147] * Output_left_pf146)

    Output_left_pf147 = (math.exp(2*Activity_left_pf147)-1)/(math.exp(2*Activity_left_pf147)+1)

    Activity_left_pf148 = (recurrent_left_pf[149] * Output_left_pf148) + (pfx_interneuron[148] * Output_left_pf147)

    Output_left_pf148 = (math.exp(2*Activity_left_pf148)-1)/(math.exp(2*Activity_left_pf148)+1)

    Activity_left_pf149 = (recurrent_left_pf[150] * Output_left_pf149) + (pfx_interneuron[149] * Output_left_pf148)

    Output_left_pf149 = (math.exp(2*Activity_left_pf149)-1)/(math.exp(2*Activity_left_pf149)+1)

    Activity_left_pf150 = (recurrent_left_pf[151] * Output_left_pf150) + (pfx_interneuron[150] * Output_left_pf149)

    Output_left_pf150 = (math.exp(2*Activity_left_pf150)-1)/(math.exp(2*Activity_left_pf150)+1)

    Activity_left_pf151 = (recurrent_left_pf[152] * Output_left_pf151) + (pfx_interneuron[151] * Output_left_pf150)

    Output_left_pf151 = (math.exp(2*Activity_left_pf151)-1)/(math.exp(2*Activity_left_pf151)+1)

    Activity_left_pf152 = (recurrent_left_pf[153] * Output_left_pf152) + (pfx_interneuron[152] * Output_left_pf151)

    Output_left_pf152 = (math.exp(2*Activity_left_pf152)-1)/(math.exp(2*Activity_left_pf152)+1)

    Activity_left_pf153 = (recurrent_left_pf[154] * Output_left_pf153) + (pfx_interneuron[153] * Output_left_pf152)

    Output_left_pf153 = (math.exp(2*Activity_left_pf153)-1)/(math.exp(2*Activity_left_pf153)+1)

    Activity_left_pf154 = (recurrent_left_pf[155] * Output_left_pf154) + (pfx_interneuron[154] * Output_left_pf153)

    Output_left_pf154 = (math.exp(2*Activity_left_pf154)-1)/(math.exp(2*Activity_left_pf154)+1)

    Activity_left_pf155 = (recurrent_left_pf[156] * Output_left_pf155) + (pfx_interneuron[155] * Output_left_pf154)

    Output_left_pf155 = (math.exp(2*Activity_left_pf155)-1)/(math.exp(2*Activity_left_pf155)+1)

    Activity_left_pf156 = (recurrent_left_pf[157] * Output_left_pf156) + (pfx_interneuron[156] * Output_left_pf155)

    Output_left_pf156 = (math.exp(2*Activity_left_pf156)-1)/(math.exp(2*Activity_left_pf156)+1)
    
    Activity_left_pf157 = (recurrent_left_pf[158] * Output_left_pf157) + (pfx_interneuron[157] * Output_left_pf156)

    Output_left_pf157 = (math.exp(2*Activity_left_pf157)-1)/(math.exp(2*Activity_left_pf157)+1)

    Activity_left_pf158 = (recurrent_left_pf[159] * Output_left_pf158) + (pfx_interneuron[158] * Output_left_pf157)

    Output_left_pf158 = (math.exp(2*Activity_left_pf158)-1)/(math.exp(2*Activity_left_pf158)+1)

    Activity_left_pf159 = (recurrent_left_pf[160] * Output_left_pf159) + (pfx_interneuron[159] * Output_left_pf158)

    Output_left_pf159 = (math.exp(2*Activity_left_pf159)-1)/(math.exp(2*Activity_left_pf159)+1)

    Activity_left_pf160 = (recurrent_left_pf[161] * Output_left_pf160) + (pfx_interneuron[160] * Output_left_pf159)

    Output_left_pf160 = (math.exp(2*Activity_left_pf160)-1)/(math.exp(2*Activity_left_pf160)+1)

    Activity_left_pf161 = (recurrent_left_pf[162] * Output_left_pf161) + (pfx_interneuron[161] * Output_left_pf160)

    Output_left_pf161 = (math.exp(2*Activity_left_pf161)-1)/(math.exp(2*Activity_left_pf161)+1)

    --Right pf joints
    --right side wave control

    Activity_right_pf0 = (recurrent_right_pf[1] * Output_right_pf0) + (Weightpfr_C0[1] * Output_C0)

    Output_right_pf0 = (math.exp(2*Activity_right_pf0)-1)/(math.exp(2*Activity_right_pf0)+1)
    
    Activity_right_pf1 = (recurrent_right_pf[2] * Output_right_pf1) + (pfx_interneuron[1] * Output_right_pf0)

    Output_right_pf1 = (math.exp(2*Activity_right_pf1)-1)/(math.exp(2*Activity_right_pf1)+1)

    Activity_right_pf2 = (recurrent_right_pf[3] * Output_right_pf2) + (pfx_interneuron[2] * Output_right_pf1)

    Output_right_pf2 = (math.exp(2*Activity_right_pf2)-1)/(math.exp(2*Activity_right_pf2)+1)

    Activity_right_pf3 = (recurrent_right_pf[4] * Output_right_pf3) + (pfx_interneuron[3] * Output_right_pf2)

    Output_right_pf3 = (math.exp(2*Activity_right_pf3)-1)/(math.exp(2*Activity_right_pf3)+1)

    Activity_right_pf4 = (recurrent_right_pf[5] * Output_right_pf4) + (pfx_interneuron[4] * Output_right_pf3)

    Output_right_pf4 = (math.exp(2*Activity_right_pf4)-1)/(math.exp(2*Activity_right_pf4)+1)

    Activity_right_pf5 = (recurrent_right_pf[6] * Output_right_pf5) + (pfx_interneuron[5] * Output_right_pf4)

    Output_right_pf5 = (math.exp(2*Activity_right_pf5)-1)/(math.exp(2*Activity_right_pf5)+1)

    Activity_right_pf6 = (recurrent_right_pf[7] * Output_right_pf6) + (pfx_interneuron[6] * Output_right_pf5)

    Output_right_pf6 = (math.exp(2*Activity_right_pf6)-1)/(math.exp(2*Activity_right_pf6)+1)

    Activity_right_pf7 = (recurrent_right_pf[8] * Output_right_pf7) + (pfx_interneuron[7] * Output_right_pf6)

    Output_right_pf7 = (math.exp(2*Activity_right_pf7)-1)/(math.exp(2*Activity_right_pf7)+1)

    Activity_right_pf8 = (recurrent_right_pf[9] * Output_right_pf8) + (pfx_interneuron[8] * Output_right_pf7)

    Output_right_pf8 = (math.exp(2*Activity_right_pf8)-1)/(math.exp(2*Activity_right_pf8)+1)

    Activity_right_pf9 = (recurrent_right_pf[10] * Output_right_pf9) + (pfx_interneuron[9] * Output_right_pf8)

    Output_right_pf9 = (math.exp(2*Activity_right_pf9)-1)/(math.exp(2*Activity_right_pf9)+1)

    Activity_right_pf10 = (recurrent_right_pf[11] * Output_right_pf10) + (pfx_interneuron[10] * Output_right_pf9)

    --file:write( string.format("%f\t",Activity_right_pf10) )

    Output_right_pf10 = (math.exp(2*Activity_right_pf10)-1)/(math.exp(2*Activity_right_pf10)+1)

    --file:write( string.format("%f\t",Output_right_pf10) )

    --next leg 

    Activity_right_pf11 = (recurrent_right_pf[12] * Output_right_pf11) + (pfx_interneuron[11] * Output_right_pf10)

    Output_right_pf11 = (math.exp(2*Activity_right_pf11)-1)/(math.exp(2*Activity_right_pf11)+1)

    Activity_right_pf12 = (recurrent_right_pf[13] * Output_right_pf12) + (pfx_interneuron[12] * Output_right_pf11)

    Output_right_pf12 = (math.exp(2*Activity_right_pf12)-1)/(math.exp(2*Activity_right_pf12)+1)

    Activity_right_pf13 = (recurrent_right_pf[14] * Output_right_pf13) + (pfx_interneuron[13] * Output_right_pf12)

    Output_right_pf13 = (math.exp(2*Activity_right_pf13)-1)/(math.exp(2*Activity_right_pf13)+1)

    Activity_right_pf14 = (recurrent_right_pf[15] * Output_right_pf14) + (pfx_interneuron[14] * Output_right_pf13)

    Output_right_pf14 = (math.exp(2*Activity_right_pf14)-1)/(math.exp(2*Activity_right_pf14)+1)

    Activity_right_pf15 = (recurrent_right_pf[16] * Output_right_pf15) + (pfx_interneuron[15] * Output_right_pf14)

    Output_right_pf15 = (math.exp(2*Activity_right_pf15)-1)/(math.exp(2*Activity_right_pf15)+1)

    Activity_right_pf16 = (recurrent_right_pf[17] * Output_right_pf16) + (pfx_interneuron[16] * Output_right_pf15)

    Output_right_pf16 = (math.exp(2*Activity_right_pf16)-1)/(math.exp(2*Activity_right_pf16)+1)

    Activity_right_pf17 = (recurrent_right_pf[18] * Output_right_pf17) + (pfx_interneuron[17] * Output_right_pf16)

    Output_right_pf17 = (math.exp(2*Activity_right_pf17)-1)/(math.exp(2*Activity_right_pf17)+1)

    Activity_right_pf18 = (recurrent_right_pf[19] * Output_right_pf18) + (pfx_interneuron[18] * Output_right_pf17)

    Output_right_pf18 = (math.exp(2*Activity_right_pf18)-1)/(math.exp(2*Activity_right_pf18)+1)

    Activity_right_pf19 = (recurrent_right_pf[20] * Output_right_pf19) + (pfx_interneuron[19] * Output_right_pf18)

    Output_right_pf19 = (math.exp(2*Activity_right_pf19)-1)/(math.exp(2*Activity_right_pf19)+1)

    Activity_right_pf20 = (recurrent_right_pf[21] * Output_right_pf20) + (pfx_interneuron[20] * Output_right_pf19)

    Output_right_pf20 = (math.exp(2*Activity_right_pf20)-1)/(math.exp(2*Activity_right_pf20)+1)

    --next leg

    Activity_right_pf21 = (recurrent_right_pf[22] * Output_right_pf21) + (pfx_interneuron[21] * Output_right_pf20)

    Output_right_pf21 = (math.exp(2*Activity_right_pf21)-1)/(math.exp(2*Activity_right_pf21)+1)

    Activity_right_pf22 = (recurrent_right_pf[23] * Output_right_pf22) + (pfx_interneuron[22] * Output_right_pf21)

    Output_right_pf22 = (math.exp(2*Activity_right_pf22)-1)/(math.exp(2*Activity_right_pf22)+1)

    Activity_right_pf23 = (recurrent_right_pf[24] * Output_right_pf23) + (pfx_interneuron[23] * Output_right_pf22)

    Output_right_pf23 = (math.exp(2*Activity_right_pf23)-1)/(math.exp(2*Activity_right_pf23)+1)

    Activity_right_pf24 = (recurrent_right_pf[25] * Output_right_pf24) + (pfx_interneuron[24] * Output_right_pf23)

    Output_right_pf24 = (math.exp(2*Activity_right_pf24)-1)/(math.exp(2*Activity_right_pf24)+1)

    Activity_right_pf25 = (recurrent_right_pf[26] * Output_right_pf25) + (pfx_interneuron[25] * Output_right_pf24)

    Output_right_pf25 = (math.exp(2*Activity_right_pf25)-1)/(math.exp(2*Activity_right_pf25)+1)

    Activity_right_pf26 = (recurrent_right_pf[27] * Output_right_pf26) + (pfx_interneuron[26] * Output_right_pf25)

    Output_right_pf26 = (math.exp(2*Activity_right_pf26)-1)/(math.exp(2*Activity_right_pf26)+1)

    Activity_right_pf27 = (recurrent_right_pf[28] * Output_right_pf27) + (pfx_interneuron[27] * Output_right_pf26)

    Output_right_pf27 = (math.exp(2*Activity_right_pf27)-1)/(math.exp(2*Activity_right_pf27)+1)

    Activity_right_pf28 = (recurrent_right_pf[29] * Output_right_pf28) + (pfx_interneuron[28] * Output_right_pf27)

    Output_right_pf28 = (math.exp(2*Activity_right_pf28)-1)/(math.exp(2*Activity_right_pf28)+1)

    Activity_right_pf29 = (recurrent_right_pf[30] * Output_right_pf29) + (pfx_interneuron[29] * Output_right_pf28)

    Output_right_pf29 = (math.exp(2*Activity_right_pf29)-1)/(math.exp(2*Activity_right_pf29)+1)

    Activity_right_pf30 = (recurrent_right_pf[31] * Output_right_pf30) + (pfx_interneuron[30] * Output_right_pf29)

    Output_right_pf30 = (math.exp(2*Activity_right_pf30)-1)/(math.exp(2*Activity_right_pf30)+1)

    --next leg

    Activity_right_pf31 = (recurrent_right_pf[32] * Output_right_pf31) + (pfx_interneuron[31] * Output_right_pf30)

    Output_right_pf31 = (math.exp(2*Activity_right_pf31)-1)/(math.exp(2*Activity_right_pf31)+1)

    Activity_right_pf32 = (recurrent_right_pf[33] * Output_right_pf32) + (pfx_interneuron[32] * Output_right_pf31)

    Output_right_pf32 = (math.exp(2*Activity_right_pf32)-1)/(math.exp(2*Activity_right_pf32)+1)

    Activity_right_pf33 = (recurrent_right_pf[34] * Output_right_pf33) + (pfx_interneuron[33] * Output_right_pf32)

    Output_right_pf33 = (math.exp(2*Activity_right_pf33)-1)/(math.exp(2*Activity_right_pf33)+1)

    Activity_right_pf34 = (recurrent_right_pf[35] * Output_right_pf34) + (pfx_interneuron[34] * Output_right_pf33)

    Output_right_pf34 = (math.exp(2*Activity_right_pf34)-1)/(math.exp(2*Activity_right_pf34)+1)

    Activity_right_pf35 = (recurrent_right_pf[36] * Output_right_pf35) + (pfx_interneuron[35] * Output_right_pf34)

    Output_right_pf35 = (math.exp(2*Activity_right_pf35)-1)/(math.exp(2*Activity_right_pf35)+1)

    Activity_right_pf36 = (recurrent_right_pf[37] * Output_right_pf36) + (pfx_interneuron[36] * Output_right_pf35)

    Output_right_pf36 = (math.exp(2*Activity_right_pf36)-1)/(math.exp(2*Activity_right_pf36)+1)

    Activity_right_pf37 = (recurrent_right_pf[38] * Output_right_pf37) + (pfx_interneuron[37] * Output_right_pf36)

    Output_right_pf37 = (math.exp(2*Activity_right_pf37)-1)/(math.exp(2*Activity_right_pf37)+1)

    Activity_right_pf38 = (recurrent_right_pf[39] * Output_right_pf38) + (pfx_interneuron[38] * Output_right_pf37)

    Output_right_pf38 = (math.exp(2*Activity_right_pf38)-1)/(math.exp(2*Activity_right_pf38)+1)

    Activity_right_pf39 = (recurrent_right_pf[40] * Output_right_pf39) + (pfx_interneuron[39] * Output_right_pf38)

    Output_right_pf39 = (math.exp(2*Activity_right_pf39)-1)/(math.exp(2*Activity_right_pf39)+1)

    Activity_right_pf40 = (recurrent_right_pf[41] * Output_right_pf40) + (pfx_interneuron[40] * Output_right_pf39)

    Output_right_pf40 = (math.exp(2*Activity_right_pf40)-1)/(math.exp(2*Activity_right_pf40)+1)

    --next leg
    
    Activity_right_pf41 = (recurrent_right_pf[42] * Output_right_pf41) + (pfx_interneuron[41] * Output_right_pf40)

    Output_right_pf41 = (math.exp(2*Activity_right_pf41)-1)/(math.exp(2*Activity_right_pf41)+1)

    Activity_right_pf42 = (recurrent_right_pf[43] * Output_right_pf42) + (pfx_interneuron[42] * Output_right_pf41)

    Output_right_pf42 = (math.exp(2*Activity_right_pf42)-1)/(math.exp(2*Activity_right_pf42)+1)

    Activity_right_pf43 = (recurrent_right_pf[44] * Output_right_pf43) + (pfx_interneuron[43] * Output_right_pf42)

    Output_right_pf43 = (math.exp(2*Activity_right_pf43)-1)/(math.exp(2*Activity_right_pf43)+1)

    Activity_right_pf44 = (recurrent_right_pf[45] * Output_right_pf44) + (pfx_interneuron[44] * Output_right_pf43)

    Output_right_pf44 = (math.exp(2*Activity_right_pf44)-1)/(math.exp(2*Activity_right_pf44)+1)

    Activity_right_pf45 = (recurrent_right_pf[46] * Output_right_pf45) + (pfx_interneuron[45] * Output_right_pf44)

    Output_right_pf45 = (math.exp(2*Activity_right_pf45)-1)/(math.exp(2*Activity_right_pf45)+1)

    Activity_right_pf46 = (recurrent_right_pf[47] * Output_right_pf46) + (pfx_interneuron[46] * Output_right_pf45)

    Output_right_pf46 = (math.exp(2*Activity_right_pf46)-1)/(math.exp(2*Activity_right_pf46)+1)

    Activity_right_pf47 = (recurrent_right_pf[48] * Output_right_pf47) + (pfx_interneuron[47] * Output_right_pf46)

    Output_right_pf47 = (math.exp(2*Activity_right_pf47)-1)/(math.exp(2*Activity_right_pf47)+1)

    Activity_right_pf48 = (recurrent_right_pf[49] * Output_right_pf48) + (pfx_interneuron[48] * Output_right_pf47)

    Output_right_pf48 = (math.exp(2*Activity_right_pf48)-1)/(math.exp(2*Activity_right_pf48)+1)

    Activity_right_pf49 = (recurrent_right_pf[50] * Output_right_pf49) + (pfx_interneuron[49] * Output_right_pf48)

    Output_right_pf49 = (math.exp(2*Activity_right_pf49)-1)/(math.exp(2*Activity_right_pf49)+1)

    Activity_right_pf50 = (recurrent_right_pf[51] * Output_right_pf50) + (pfx_interneuron[50] * Output_right_pf49)

    Output_right_pf50 = (math.exp(2*Activity_right_pf50)-1)/(math.exp(2*Activity_right_pf50)+1)

    --next leg

    Activity_right_pf51 = (recurrent_right_pf[52] * Output_right_pf51) + (pfx_interneuron[51] * Output_right_pf50)

    Output_right_pf51 = (math.exp(2*Activity_right_pf51)-1)/(math.exp(2*Activity_right_pf51)+1)

    Activity_right_pf52 = (recurrent_right_pf[53] * Output_right_pf52) + (pfx_interneuron[52] * Output_right_pf51)

    Output_right_pf52 = (math.exp(2*Activity_right_pf52)-1)/(math.exp(2*Activity_right_pf52)+1)

    Activity_right_pf53 = (recurrent_right_pf[54] * Output_right_pf53) + (pfx_interneuron[53] * Output_right_pf52)

    Output_right_pf53 = (math.exp(2*Activity_right_pf53)-1)/(math.exp(2*Activity_right_pf53)+1)

    Activity_right_pf54 = (recurrent_right_pf[55] * Output_right_pf54) + (pfx_interneuron[54] * Output_right_pf53)

    Output_right_pf54 = (math.exp(2*Activity_right_pf54)-1)/(math.exp(2*Activity_right_pf54)+1)

    Activity_right_pf55 = (recurrent_right_pf[56] * Output_right_pf55) + (pfx_interneuron[55] * Output_right_pf54)

    Output_right_pf55 = (math.exp(2*Activity_right_pf55)-1)/(math.exp(2*Activity_right_pf55)+1)

    Activity_right_pf56 = (recurrent_right_pf[57] * Output_right_pf56) + (pfx_interneuron[56] * Output_right_pf55)

    Output_right_pf56 = (math.exp(2*Activity_right_pf56)-1)/(math.exp(2*Activity_right_pf56)+1)

    Activity_right_pf57 = (recurrent_right_pf[58] * Output_right_pf57) + (pfx_interneuron[57] * Output_right_pf56)

    Output_right_pf57 = (math.exp(2*Activity_right_pf57)-1)/(math.exp(2*Activity_right_pf57)+1)

    Activity_right_pf58 = (recurrent_right_pf[59] * Output_right_pf58) + (pfx_interneuron[58] * Output_right_pf57)

    Output_right_pf58 = (math.exp(2*Activity_right_pf58)-1)/(math.exp(2*Activity_right_pf58)+1)

    Activity_right_pf59 = (recurrent_right_pf[60] * Output_right_pf59) + (pfx_interneuron[59] * Output_right_pf58)

    Output_right_pf59 = (math.exp(2*Activity_right_pf59)-1)/(math.exp(2*Activity_right_pf59)+1)

    Activity_right_pf60 = (recurrent_right_pf[61] * Output_right_pf60) + (pfx_interneuron[60] * Output_right_pf59)

    Output_right_pf60 = (math.exp(2*Activity_right_pf60)-1)/(math.exp(2*Activity_right_pf60)+1)

    --next leg

    Activity_right_pf61 = (recurrent_right_pf[62] * Output_right_pf61) + (pfx_interneuron[61] * Output_right_pf60)

    Output_right_pf61 = (math.exp(2*Activity_right_pf61)-1)/(math.exp(2*Activity_right_pf61)+1)

    Activity_right_pf62 = (recurrent_right_pf[63] * Output_right_pf62) + (pfx_interneuron[62] * Output_right_pf61)

    Output_right_pf62 = (math.exp(2*Activity_right_pf62)-1)/(math.exp(2*Activity_right_pf62)+1)

    Activity_right_pf63 = (recurrent_right_pf[64] * Output_right_pf63) + (pfx_interneuron[63] * Output_right_pf62)

    Output_right_pf63 = (math.exp(2*Activity_right_pf63)-1)/(math.exp(2*Activity_right_pf63)+1)

    Activity_right_pf64 = (recurrent_right_pf[65] * Output_right_pf64) + (pfx_interneuron[64] * Output_right_pf63)

    Output_right_pf64 = (math.exp(2*Activity_right_pf64)-1)/(math.exp(2*Activity_right_pf64)+1)

    Activity_right_pf65 = (recurrent_right_pf[66] * Output_right_pf65) + (pfx_interneuron[65] * Output_right_pf64)

    Output_right_pf65 = (math.exp(2*Activity_right_pf65)-1)/(math.exp(2*Activity_right_pf65)+1)

    Activity_right_pf66 = (recurrent_right_pf[67] * Output_right_pf66) + (pfx_interneuron[66] * Output_right_pf65)

    Output_right_pf66 = (math.exp(2*Activity_right_pf66)-1)/(math.exp(2*Activity_right_pf66)+1)

    Activity_right_pf67 = (recurrent_right_pf[68] * Output_right_pf67) + (pfx_interneuron[67] * Output_right_pf66)

    Output_right_pf67 = (math.exp(2*Activity_right_pf67)-1)/(math.exp(2*Activity_right_pf67)+1)

    Activity_right_pf68 = (recurrent_right_pf[69] * Output_right_pf68) + (pfx_interneuron[68] * Output_right_pf67)

    Output_right_pf68 = (math.exp(2*Activity_right_pf68)-1)/(math.exp(2*Activity_right_pf68)+1)

    Activity_right_pf69 = (recurrent_right_pf[70] * Output_right_pf69) + (pfx_interneuron[69] * Output_right_pf68)

    Output_right_pf69 = (math.exp(2*Activity_right_pf69)-1)/(math.exp(2*Activity_right_pf69)+1)

    Activity_right_pf70 = (recurrent_right_pf[71] * Output_right_pf70) + (pfx_interneuron[70] * Output_right_pf69)

    Output_right_pf70 = (math.exp(2*Activity_right_pf70)-1)/(math.exp(2*Activity_right_pf70)+1)

    --next leg

    Activity_right_pf71 = (recurrent_right_pf[72] * Output_right_pf71) + (pfx_interneuron[71] * Output_right_pf70)

    Output_right_pf71 = (math.exp(2*Activity_right_pf71)-1)/(math.exp(2*Activity_right_pf71)+1)

    Activity_right_pf72 = (recurrent_right_pf[73] * Output_right_pf72) + (pfx_interneuron[72] * Output_right_pf71)

    Output_right_pf72 = (math.exp(2*Activity_right_pf72)-1)/(math.exp(2*Activity_right_pf72)+1)

    Activity_right_pf73 = (recurrent_right_pf[74] * Output_right_pf73) + (pfx_interneuron[73] * Output_right_pf72)

    Output_right_pf73 = (math.exp(2*Activity_right_pf73)-1)/(math.exp(2*Activity_right_pf73)+1)

    Activity_right_pf74 = (recurrent_right_pf[75] * Output_right_pf74) + (pfx_interneuron[74] * Output_right_pf73)

    Output_right_pf74 = (math.exp(2*Activity_right_pf74)-1)/(math.exp(2*Activity_right_pf74)+1)

    Activity_right_pf75 = (recurrent_right_pf[76] * Output_right_pf75) + (pfx_interneuron[75] * Output_right_pf74)

    Output_right_pf75 = (math.exp(2*Activity_right_pf75)-1)/(math.exp(2*Activity_right_pf75)+1)

    Activity_right_pf76 = (recurrent_right_pf[77] * Output_right_pf76) + (pfx_interneuron[76] * Output_right_pf75)

    Output_right_pf76 = (math.exp(2*Activity_right_pf76)-1)/(math.exp(2*Activity_right_pf76)+1)

    Activity_right_pf77 = (recurrent_right_pf[78] * Output_right_pf77) + (pfx_interneuron[77] * Output_right_pf76)

    Output_right_pf77 = (math.exp(2*Activity_right_pf77)-1)/(math.exp(2*Activity_right_pf77)+1)

    Activity_right_pf78 = (recurrent_right_pf[79] * Output_right_pf78) + (pfx_interneuron[78] * Output_right_pf77)

    Output_right_pf78 = (math.exp(2*Activity_right_pf78)-1)/(math.exp(2*Activity_right_pf78)+1)

    Activity_right_pf79 = (recurrent_right_pf[80] * Output_right_pf79) + (pfx_interneuron[79] * Output_right_pf78)

    Output_right_pf79 = (math.exp(2*Activity_right_pf79)-1)/(math.exp(2*Activity_right_pf79)+1)

    Activity_right_pf80 = (recurrent_right_pf[81] * Output_right_pf80) + (pfx_interneuron[80] * Output_right_pf79)

    Output_right_pf80 = (math.exp(2*Activity_right_pf80)-1)/(math.exp(2*Activity_right_pf80)+1)

    --next leg

    Activity_right_pf81 = (recurrent_right_pf[82] * Output_right_pf81) + (pfx_interneuron[81] * Output_right_pf80)

    Output_right_pf81 = (math.exp(2*Activity_right_pf81)-1)/(math.exp(2*Activity_right_pf81)+1)

    Activity_right_pf82 = (recurrent_right_pf[83] * Output_right_pf82) + (pfx_interneuron[82] * Output_right_pf81)

    Output_right_pf82 = (math.exp(2*Activity_right_pf82)-1)/(math.exp(2*Activity_right_pf82)+1)

    Activity_right_pf83 = (recurrent_right_pf[84] * Output_right_pf83) + (pfx_interneuron[83] * Output_right_pf82)

    Output_right_pf83 = (math.exp(2*Activity_right_pf83)-1)/(math.exp(2*Activity_right_pf83)+1)

    Activity_right_pf84 = (recurrent_right_pf[85] * Output_right_pf84) + (pfx_interneuron[84] * Output_right_pf83)

    Output_right_pf84 = (math.exp(2*Activity_right_pf84)-1)/(math.exp(2*Activity_right_pf84)+1)

    Activity_right_pf85 = (recurrent_right_pf[86] * Output_right_pf85) + (pfx_interneuron[85] * Output_right_pf84)

    Output_right_pf85 = (math.exp(2*Activity_right_pf85)-1)/(math.exp(2*Activity_right_pf85)+1)

    Activity_right_pf86 = (recurrent_right_pf[87] * Output_right_pf86) + (pfx_interneuron[86] * Output_right_pf85)

    Output_right_pf86 = (math.exp(2*Activity_right_pf86)-1)/(math.exp(2*Activity_right_pf86)+1)

    Activity_right_pf87 = (recurrent_right_pf[88] * Output_right_pf87) + (pfx_interneuron[87] * Output_right_pf86)

    Output_right_pf87 = (math.exp(2*Activity_right_pf87)-1)/(math.exp(2*Activity_right_pf87)+1)

    Activity_right_pf88 = (recurrent_right_pf[89] * Output_right_pf88) + (pfx_interneuron[88] * Output_right_pf87)

    Output_right_pf88 = (math.exp(2*Activity_right_pf88)-1)/(math.exp(2*Activity_right_pf88)+1)

    Activity_right_pf89 = (recurrent_right_pf[90] * Output_right_pf89) + (pfx_interneuron[89] * Output_right_pf88)

    Output_right_pf89 = (math.exp(2*Activity_right_pf89)-1)/(math.exp(2*Activity_right_pf89)+1)

    Activity_right_pf90 = (recurrent_right_pf[91] * Output_right_pf90) + (pfx_interneuron[90] * Output_right_pf89)

    Output_right_pf90 = (math.exp(2*Activity_right_pf90)-1)/(math.exp(2*Activity_right_pf90)+1)

    --next leg

    Activity_right_pf91 = (recurrent_right_pf[92] * Output_right_pf91) + (pfx_interneuron[91] * Output_right_pf90)

    Output_right_pf91 = (math.exp(2*Activity_right_pf91)-1)/(math.exp(2*Activity_right_pf91)+1)

    Activity_right_pf92 = (recurrent_right_pf[93] * Output_right_pf92) + (pfx_interneuron[92] * Output_right_pf91)

    Output_right_pf92 = (math.exp(2*Activity_right_pf92)-1)/(math.exp(2*Activity_right_pf92)+1)

    Activity_right_pf93 = (recurrent_right_pf[94] * Output_right_pf93) + (pfx_interneuron[93] * Output_right_pf92)

    Output_right_pf93 = (math.exp(2*Activity_right_pf93)-1)/(math.exp(2*Activity_right_pf93)+1)

    Activity_right_pf94 = (recurrent_right_pf[95] * Output_right_pf94) + (pfx_interneuron[94] * Output_right_pf93)

    Output_right_pf94 = (math.exp(2*Activity_right_pf94)-1)/(math.exp(2*Activity_right_pf94)+1)

    Activity_right_pf95 = (recurrent_right_pf[96] * Output_right_pf95) + (pfx_interneuron[95] * Output_right_pf94)

    Output_right_pf95 = (math.exp(2*Activity_right_pf95)-1)/(math.exp(2*Activity_right_pf95)+1)

    Activity_right_pf96 = (recurrent_right_pf[97] * Output_right_pf96) + (pfx_interneuron[96] * Output_right_pf95)

    Output_right_pf96 = (math.exp(2*Activity_right_pf96)-1)/(math.exp(2*Activity_right_pf96)+1)

    Activity_right_pf97 = (recurrent_right_pf[98] * Output_right_pf97) + (pfx_interneuron[97] * Output_right_pf96)

    Output_right_pf97 = (math.exp(2*Activity_right_pf97)-1)/(math.exp(2*Activity_right_pf97)+1)

    Activity_right_pf98 = (recurrent_right_pf[99] * Output_right_pf98) + (pfx_interneuron[98] * Output_right_pf97)

    Output_right_pf98 = (math.exp(2*Activity_right_pf98)-1)/(math.exp(2*Activity_right_pf98)+1)

    Activity_right_pf99 = (recurrent_right_pf[100] * Output_right_pf99) + (pfx_interneuron[99] * Output_right_pf98)

    Output_right_pf99 = (math.exp(2*Activity_right_pf99)-1)/(math.exp(2*Activity_right_pf99)+1)

    Activity_right_pf100 = (recurrent_right_pf[101] * Output_right_pf100) + (pfx_interneuron[100] * Output_right_pf99)

    Output_right_pf100 = (math.exp(2*Activity_right_pf100)-1)/(math.exp(2*Activity_right_pf100)+1)

    --next leg

    Activity_right_pf101 = (recurrent_right_pf[102] * Output_right_pf101) + (pfx_interneuron[101] * Output_right_pf100)

    Output_right_pf101 = (math.exp(2*Activity_right_pf101)-1)/(math.exp(2*Activity_right_pf101)+1)

    Activity_right_pf102 = (recurrent_right_pf[103] * Output_right_pf102) + (pfx_interneuron[102] * Output_right_pf101)

    Output_right_pf102 = (math.exp(2*Activity_right_pf102)-1)/(math.exp(2*Activity_right_pf102)+1)

    Activity_right_pf103 = (recurrent_right_pf[104] * Output_right_pf103) + (pfx_interneuron[103] * Output_right_pf102)

    Output_right_pf103 = (math.exp(2*Activity_right_pf103)-1)/(math.exp(2*Activity_right_pf103)+1)

    Activity_right_pf104 = (recurrent_right_pf[105] * Output_right_pf104) + (pfx_interneuron[104] * Output_right_pf103)

    Output_right_pf104 = (math.exp(2*Activity_right_pf104)-1)/(math.exp(2*Activity_right_pf104)+1)

    Activity_right_pf105 = (recurrent_right_pf[106] * Output_right_pf105) + (pfx_interneuron[105] * Output_right_pf104)

    Output_right_pf105 = (math.exp(2*Activity_right_pf105)-1)/(math.exp(2*Activity_right_pf105)+1)

    Activity_right_pf106 = (recurrent_right_pf[107] * Output_right_pf106) + (pfx_interneuron[106] * Output_right_pf105)

    Output_right_pf106 = (math.exp(2*Activity_right_pf106)-1)/(math.exp(2*Activity_right_pf106)+1)

    Activity_right_pf107 = (recurrent_right_pf[108] * Output_right_pf107) + (pfx_interneuron[107] * Output_right_pf106)

    Output_right_pf107 = (math.exp(2*Activity_right_pf107)-1)/(math.exp(2*Activity_right_pf107)+1)

    Activity_right_pf108 = (recurrent_right_pf[109] * Output_right_pf108) + (pfx_interneuron[108] * Output_right_pf107)

    Output_right_pf108 = (math.exp(2*Activity_right_pf108)-1)/(math.exp(2*Activity_right_pf108)+1)

    Activity_right_pf109 = (recurrent_right_pf[110] * Output_right_pf109) + (pfx_interneuron[109] * Output_right_pf108)

    Output_right_pf109 = (math.exp(2*Activity_right_pf109)-1)/(math.exp(2*Activity_right_pf109)+1)

    Activity_right_pf110 = (recurrent_right_pf[111] * Output_right_pf110) + (pfx_interneuron[110] * Output_right_pf109)

    Output_right_pf110 = (math.exp(2*Activity_right_pf110)-1)/(math.exp(2*Activity_right_pf110)+1)

    --next leg

    Activity_right_pf111 = (recurrent_right_pf[112] * Output_right_pf111) + (pfx_interneuron[111] * Output_right_pf110)

    Output_right_pf111 = (math.exp(2*Activity_right_pf111)-1)/(math.exp(2*Activity_right_pf111)+1)

    Activity_right_pf112 = (recurrent_right_pf[113] * Output_right_pf112) + (pfx_interneuron[112] * Output_right_pf111)

    Output_right_pf112 = (math.exp(2*Activity_right_pf112)-1)/(math.exp(2*Activity_right_pf112)+1)

    Activity_right_pf113 = (recurrent_right_pf[114] * Output_right_pf113) + (pfx_interneuron[113] * Output_right_pf112)

    Output_right_pf113 = (math.exp(2*Activity_right_pf113)-1)/(math.exp(2*Activity_right_pf113)+1)

    Activity_right_pf114 = (recurrent_right_pf[115] * Output_right_pf114) + (pfx_interneuron[114] * Output_right_pf113)

    Output_right_pf114 = (math.exp(2*Activity_right_pf114)-1)/(math.exp(2*Activity_right_pf114)+1)

    Activity_right_pf115 = (recurrent_right_pf[116] * Output_right_pf115) + (pfx_interneuron[115] * Output_right_pf114)

    Output_right_pf115 = (math.exp(2*Activity_right_pf115)-1)/(math.exp(2*Activity_right_pf115)+1)

    Activity_right_pf116 = (recurrent_right_pf[117] * Output_right_pf116) + (pfx_interneuron[116] * Output_right_pf115)

    Output_right_pf116 = (math.exp(2*Activity_right_pf116)-1)/(math.exp(2*Activity_right_pf116)+1)

    Activity_right_pf117 = (recurrent_right_pf[118] * Output_right_pf117) + (pfx_interneuron[117] * Output_right_pf116)

    Output_right_pf117 = (math.exp(2*Activity_right_pf117)-1)/(math.exp(2*Activity_right_pf117)+1)

    Activity_right_pf118 = (recurrent_right_pf[119] * Output_right_pf118) + (pfx_interneuron[118] * Output_right_pf117)

    Output_right_pf118 = (math.exp(2*Activity_right_pf118)-1)/(math.exp(2*Activity_right_pf118)+1)

    Activity_right_pf119 = (recurrent_right_pf[120] * Output_right_pf119) + (pfx_interneuron[119] * Output_right_pf118)

    Output_right_pf119 = (math.exp(2*Activity_right_pf119)-1)/(math.exp(2*Activity_right_pf119)+1)

    Activity_right_pf120 = (recurrent_right_pf[121] * Output_right_pf120) + (pfx_interneuron[120] * Output_right_pf119)

    Output_right_pf120 = (math.exp(2*Activity_right_pf120)-1)/(math.exp(2*Activity_right_pf120)+1)

    --next leg

    Activity_right_pf121 = (recurrent_right_pf[122] * Output_right_pf121) + (pfx_interneuron[121] * Output_right_pf120)

    Output_right_pf121 = (math.exp(2*Activity_right_pf121)-1)/(math.exp(2*Activity_right_pf121)+1)

    Activity_right_pf122 = (recurrent_right_pf[123] * Output_right_pf122) + (pfx_interneuron[122] * Output_right_pf121)

    Output_right_pf122 = (math.exp(2*Activity_right_pf122)-1)/(math.exp(2*Activity_right_pf122)+1)

    Activity_right_pf123 = (recurrent_right_pf[124] * Output_right_pf123) + (pfx_interneuron[123] * Output_right_pf122)

    Output_right_pf123 = (math.exp(2*Activity_right_pf123)-1)/(math.exp(2*Activity_right_pf123)+1)

    Activity_right_pf124 = (recurrent_right_pf[125] * Output_right_pf124) + (pfx_interneuron[124] * Output_right_pf123)

    Output_right_pf124 = (math.exp(2*Activity_right_pf124)-1)/(math.exp(2*Activity_right_pf124)+1)

    Activity_right_pf125 = (recurrent_right_pf[126] * Output_right_pf125) + (pfx_interneuron[125] * Output_right_pf124)

    Output_right_pf125 = (math.exp(2*Activity_right_pf125)-1)/(math.exp(2*Activity_right_pf125)+1)

    Activity_right_pf126 = (recurrent_right_pf[127] * Output_right_pf126) + (pfx_interneuron[126] * Output_right_pf125)

    Output_right_pf126 = (math.exp(2*Activity_right_pf126)-1)/(math.exp(2*Activity_right_pf126)+1)

    Activity_right_pf127 = (recurrent_right_pf[128] * Output_right_pf127) + (pfx_interneuron[127] * Output_right_pf126)

    Output_right_pf127 = (math.exp(2*Activity_right_pf127)-1)/(math.exp(2*Activity_right_pf127)+1)

    Activity_right_pf128 = (recurrent_right_pf[129] * Output_right_pf128) + (pfx_interneuron[128] * Output_right_pf127)

    Output_right_pf128 = (math.exp(2*Activity_right_pf128)-1)/(math.exp(2*Activity_right_pf128)+1)

    Activity_right_pf129 = (recurrent_right_pf[130] * Output_right_pf129) + (pfx_interneuron[129] * Output_right_pf128)

    Output_right_pf129 = (math.exp(2*Activity_right_pf129)-1)/(math.exp(2*Activity_right_pf129)+1)

    Activity_right_pf130 = (recurrent_right_pf[131] * Output_right_pf130) + (pfx_interneuron[130] * Output_right_pf129)

    Output_right_pf130 = (math.exp(2*Activity_right_pf130)-1)/(math.exp(2*Activity_right_pf130)+1)

    --next leg

    Activity_right_pf131 = (recurrent_right_pf[132] * Output_right_pf131) + (pfx_interneuron[131] * Output_right_pf130)

    Output_right_pf131 = (math.exp(2*Activity_right_pf131)-1)/(math.exp(2*Activity_right_pf131)+1)

    Activity_right_pf132 = (recurrent_right_pf[133] * Output_right_pf132) + (pfx_interneuron[132] * Output_right_pf131)

    Output_right_pf132 = (math.exp(2*Activity_right_pf132)-1)/(math.exp(2*Activity_right_pf132)+1)

    Activity_right_pf133 = (recurrent_right_pf[134] * Output_right_pf133) + (pfx_interneuron[133] * Output_right_pf132)

    Output_right_pf133 = (math.exp(2*Activity_right_pf133)-1)/(math.exp(2*Activity_right_pf133)+1)

    Activity_right_pf134 = (recurrent_right_pf[135] * Output_right_pf134) + (pfx_interneuron[134] * Output_right_pf133)

    Output_right_pf134 = (math.exp(2*Activity_right_pf134)-1)/(math.exp(2*Activity_right_pf134)+1)

    Activity_right_pf135 = (recurrent_right_pf[136] * Output_right_pf135) + (pfx_interneuron[135] * Output_right_pf134)

    Output_right_pf135 = (math.exp(2*Activity_right_pf135)-1)/(math.exp(2*Activity_right_pf135)+1)

    Activity_right_pf136 = (recurrent_right_pf[137] * Output_right_pf136) + (pfx_interneuron[136] * Output_right_pf135)

    Output_right_pf136 = (math.exp(2*Activity_right_pf136)-1)/(math.exp(2*Activity_right_pf136)+1)

    Activity_right_pf137 = (recurrent_right_pf[138] * Output_right_pf137) + (pfx_interneuron[137] * Output_right_pf136)

    Output_right_pf137 = (math.exp(2*Activity_right_pf137)-1)/(math.exp(2*Activity_right_pf137)+1)

    Activity_right_pf138 = (recurrent_right_pf[139] * Output_right_pf138) + (pfx_interneuron[138] * Output_right_pf137)

    Output_right_pf138 = (math.exp(2*Activity_right_pf138)-1)/(math.exp(2*Activity_right_pf138)+1)

    Activity_right_pf139 = (recurrent_right_pf[140] * Output_right_pf139) + (pfx_interneuron[139] * Output_right_pf138)

    Output_right_pf139 = (math.exp(2*Activity_right_pf139)-1)/(math.exp(2*Activity_right_pf139)+1)

    Activity_right_pf140 = (recurrent_right_pf[141] * Output_right_pf140) + (pfx_interneuron[140] * Output_right_pf139)

    Output_right_pf140 = (math.exp(2*Activity_right_pf140)-1)/(math.exp(2*Activity_right_pf140)+1)

    --next leg

    Activity_right_pf141 = (recurrent_right_pf[142] * Output_right_pf141) + (pfx_interneuron[141] * Output_right_pf140)

    Output_right_pf141 = (math.exp(2*Activity_right_pf141)-1)/(math.exp(2*Activity_right_pf141)+1)

    Activity_right_pf142 = (recurrent_right_pf[143] * Output_right_pf142) + (pfx_interneuron[142] * Output_right_pf141)

    Output_right_pf142 = (math.exp(2*Activity_right_pf142)-1)/(math.exp(2*Activity_right_pf142)+1)

    Activity_right_pf143 = (recurrent_right_pf[144] * Output_right_pf143) + (pfx_interneuron[143] * Output_right_pf142)

    Output_right_pf143 = (math.exp(2*Activity_right_pf143)-1)/(math.exp(2*Activity_right_pf143)+1)

    Activity_right_pf144 = (recurrent_right_pf[145] * Output_right_pf144) + (pfx_interneuron[144] * Output_right_pf143)

    Output_right_pf144 = (math.exp(2*Activity_right_pf144)-1)/(math.exp(2*Activity_right_pf144)+1)

    Activity_right_pf145 = (recurrent_right_pf[146] * Output_right_pf145) + (pfx_interneuron[145] * Output_right_pf144)

    Output_right_pf145 = (math.exp(2*Activity_right_pf145)-1)/(math.exp(2*Activity_right_pf145)+1)

    Activity_right_pf146 = (recurrent_right_pf[147] * Output_right_pf146) + (pfx_interneuron[146] * Output_right_pf145)

    Output_right_pf146 = (math.exp(2*Activity_right_pf146)-1)/(math.exp(2*Activity_right_pf146)+1)

    Activity_right_pf147 = (recurrent_right_pf[148] * Output_right_pf147) + (pfx_interneuron[147] * Output_right_pf146)

    Output_right_pf147 = (math.exp(2*Activity_right_pf147)-1)/(math.exp(2*Activity_right_pf147)+1)

    Activity_right_pf148 = (recurrent_right_pf[149] * Output_right_pf148) + (pfx_interneuron[148] * Output_right_pf147)

    Output_right_pf148 = (math.exp(2*Activity_right_pf148)-1)/(math.exp(2*Activity_right_pf148)+1)

    Activity_right_pf149 = (recurrent_right_pf[150] * Output_right_pf149) + (pfx_interneuron[149] * Output_right_pf148)

    Output_right_pf149 = (math.exp(2*Activity_right_pf149)-1)/(math.exp(2*Activity_right_pf149)+1)

    Activity_right_pf150 = (recurrent_right_pf[151] * Output_right_pf150) + (pfx_interneuron[150] * Output_right_pf149)

    Output_right_pf150 = (math.exp(2*Activity_right_pf150)-1)/(math.exp(2*Activity_right_pf150)+1)

    Activity_right_pf151 = (recurrent_right_pf[152] * Output_right_pf151) + (pfx_interneuron[151] * Output_right_pf150)

    Output_right_pf151 = (math.exp(2*Activity_right_pf151)-1)/(math.exp(2*Activity_right_pf151)+1)

    Activity_right_pf152 = (recurrent_right_pf[153] * Output_right_pf152) + (pfx_interneuron[152] * Output_right_pf151)

    Output_right_pf152 = (math.exp(2*Activity_right_pf152)-1)/(math.exp(2*Activity_right_pf152)+1)

    Activity_right_pf153 = (recurrent_right_pf[154] * Output_right_pf153) + (pfx_interneuron[153] * Output_right_pf152)

    Output_right_pf153 = (math.exp(2*Activity_right_pf153)-1)/(math.exp(2*Activity_right_pf153)+1)

    Activity_right_pf154 = (recurrent_right_pf[155] * Output_right_pf154) + (pfx_interneuron[154] * Output_right_pf153)

    Output_right_pf154 = (math.exp(2*Activity_right_pf154)-1)/(math.exp(2*Activity_right_pf154)+1)

    Activity_right_pf155 = (recurrent_right_pf[156] * Output_right_pf155) + (pfx_interneuron[155] * Output_right_pf154)

    Output_right_pf155 = (math.exp(2*Activity_right_pf155)-1)/(math.exp(2*Activity_right_pf155)+1)

    Activity_right_pf156 = (recurrent_right_pf[157] * Output_right_pf156) + (pfx_interneuron[156] * Output_right_pf155)

    Output_right_pf156 = (math.exp(2*Activity_right_pf156)-1)/(math.exp(2*Activity_right_pf156)+1)

    Activity_right_pf157 = (recurrent_right_pf[158] * Output_right_pf157) + (pfx_interneuron[157] * Output_right_pf156)

    Output_right_pf157 = (math.exp(2*Activity_right_pf157)-1)/(math.exp(2*Activity_right_pf157)+1)

    Activity_right_pf158 = (recurrent_right_pf[159] * Output_right_pf158) + (pfx_interneuron[158] * Output_right_pf157)

    Output_right_pf158 = (math.exp(2*Activity_right_pf158)-1)/(math.exp(2*Activity_right_pf158)+1)

    Activity_right_pf159 = (recurrent_right_pf[160] * Output_right_pf159) + (pfx_interneuron[159] * Output_right_pf158)

    Output_right_pf159 = (math.exp(2*Activity_right_pf159)-1)/(math.exp(2*Activity_right_pf159)+1)

    Activity_right_pf160 = (recurrent_right_pf[161] * Output_right_pf160) + (pfx_interneuron[160] * Output_right_pf159)

    Output_right_pf160 = (math.exp(2*Activity_right_pf160)-1)/(math.exp(2*Activity_right_pf160)+1)

    Activity_right_pf161 = (recurrent_right_pf[162] * Output_right_pf161) + (pfx_interneuron[161] * Output_right_pf160)

    Output_right_pf161 = (math.exp(2*Activity_right_pf161)-1)/(math.exp(2*Activity_right_pf161)+1)

    --Prefemur to femur joints (pf_x)

    -- --Retrogade waves
    tr_0_control = -Output_left_tr155 * 1 
    tr_1_control = -Output_left_tr144 * 1
    tr_2_control = -Output_left_tr133 * 1 
    tr_3_control = -Output_left_tr122 * 1 
    tr_4_control = -Output_left_tr111 * 1 
    tr_5_control = -Output_left_tr100 * 1 
    tr_6_control = -Output_left_tr89 * 1 
    --Last three segments
    tr_17_control = -Output_left_tr78 * 1 
    tr_18_control = -Output_left_tr67 * 1 
    tr_19_control = -Output_left_tr56 * 1 

    --new segments
    tr_20_control = -Output_left_tr45 * 1 
    tr_21_control = -Output_left_tr34 * 1 
    tr_22_control = -Output_left_tr23 * 1 
    tr_23_control = -Output_left_tr12 * 1 
    tr_24_control = -Output_left_tr1 * 1 

    
    file:write( string.format("%f\t",tr_0_control) )
    file:write( string.format("%f\t",tr_1_control) )
    file:write( string.format("%f\t",tr_2_control) )
    file:write( string.format("%f\t",tr_3_control) )
    file:write( string.format("%f\t",tr_4_control) )
    file:write( string.format("%f\t",tr_5_control) )
    file:write( string.format("%f\t",tr_6_control) )
    file:write( string.format("%f\t",tr_17_control) )
    file:write( string.format("%f\t",tr_18_control) )
    file:write( string.format("%f\t",tr_19_control) )
    file:write( string.format("%f\t",tr_20_control) )
    file:write( string.format("%f\t",tr_21_control) )
    file:write( string.format("%f\t",tr_22_control) )
    file:write( string.format("%f\t",tr_23_control) )
    file:write( string.format("%f\t",tr_24_control) )

    
    --Femur to tibia joints (ft_x)

    --retrogade
    pf_0_control = Output_left_pf155 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_0_control) )
    pf_1_control = Output_left_pf144 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_1_control) )
    pf_2_control = Output_left_pf133 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_2_control) )
    pf_3_control = Output_left_pf122 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_3_control) )
    pf_4_control = Output_left_pf111 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_4_control) )
    pf_5_control = Output_left_pf100 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_5_control) )
    pf_6_control = Output_left_pf89 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_6_control) )
    --Last three segments
    pf_17_control = Output_left_pf78 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_17_control) )
    pf_18_control = Output_left_pf67 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_18_control) )
    pf_19_control = Output_left_pf56 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_19_control) )
    --new segs
    pf_20_control = Output_left_pf45 * 0.8 * Bias_pf_Joint
    file:write( string.format("%f\t",pf_20_control) )
    pf_21_control = Output_left_pf34 * 0.8 * Bias_pf_Joint
    file:write( string.format("%f\t",pf_21_control) )
    pf_22_control = Output_left_pf23 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_22_control) )
    pf_23_control = Output_left_pf12 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_23_control) )
    pf_24_control = Output_left_pf1 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_24_control) )

    --Prefemur to femur joints 

    tr_7_control  = -Output_right_tr155 * 1 
    tr_8_control = -Output_right_tr144 * 1 
    tr_9_control  = -Output_right_tr133 * 1  
    tr_10_control = -Output_right_tr122 * 1 
    tr_11_control = -Output_right_tr111 * 1  
    tr_12_control = -Output_right_tr100 * 1   
    tr_13_control = -Output_right_tr89 * 1   
    tr_15_control = -Output_right_tr78 * 1 
    tr_14_control = -Output_right_tr67 * 1  
    tr_16_control = -Output_right_tr56 * 1  
    tr_25_control = -Output_right_tr45 * 1  
    tr_26_control = -Output_right_tr34 * 1  
    tr_27_control = -Output_right_tr23 * 1  
    tr_28_control = -Output_right_tr12 * 1  
    tr_29_control = -Output_right_tr1 * 1    

    
    file:write( string.format("%f\t",tr_7_control) )
    file:write( string.format("%f\t",tr_8_control) )
    file:write( string.format("%f\t",tr_9_control) )
    file:write( string.format("%f\t",tr_10_control) )
    file:write( string.format("%f\t",tr_11_control) )
    file:write( string.format("%f\t",tr_12_control) )
    file:write( string.format("%f\t",tr_13_control) )
    file:write( string.format("%f\t",tr_15_control) )
    file:write( string.format("%f\t",tr_14_control) )
    file:write( string.format("%f\t",tr_16_control) )
    file:write( string.format("%f\t",tr_25_control) )
    file:write( string.format("%f\t",tr_26_control) )
    file:write( string.format("%f\t",tr_27_control) )
    file:write( string.format("%f\t",tr_28_control) )
    file:write( string.format("%f\t",tr_29_control) )

    --Femur to tibia joints 
    --retrogade
    pf_7_control = Output_left_pf155 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_7_control) )
    pf_8_control = Output_left_pf144 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_8_control) )
    pf_9_control = Output_left_pf133 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_9_control) )
    pf_10_control = Output_left_pf122 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_10_control) )
    pf_11_control = Output_left_pf111 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_11_control) )
    pf_12_control = Output_left_pf100 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_12_control) )
    pf_13_control = Output_left_pf89 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_13_control) )
    --Last three segments
    pf_15_control = Output_left_pf78 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_15_control) )
    pf_14_control = Output_left_pf67 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_14_control) )
    pf_16_control = Output_left_pf56 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_16_control) )
    --new segs
    pf_25_control = Output_left_pf45 * 0.8 * Bias_pf_Joint
    file:write( string.format("%f\t",pf_25_control) )
    pf_26_control = Output_left_pf34 * 0.8 * Bias_pf_Joint
    file:write( string.format("%f\t",pf_26_control) )
    pf_27_control = Output_left_pf23 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_27_control) )
    pf_28_control = Output_left_pf12 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_28_control) )
    pf_29_control = Output_left_pf1 * 0.8  * Bias_pf_Joint
    file:write( string.format("%f\t",pf_29_control) )


    --Body
    --Setting joint target position for driving the movement
    --Segment 0 (Seg_0)
    tr_0_motor = sim.setJointTargetPosition(cx0_joint, tr_0_control * im_movement_factor)
    --print(tr_0_control * im_movement_factor)
    ft_0_motor = sim.setJointTargetPosition(ft_0, Bias_ft_Joint)
    tt_0_motor = sim.setJointTargetPosition(tt_0, 0.9)
    
    tr_7_motor = sim.setJointTargetPosition(cx7_joint, tr_7_control * im_movement_factor)
    --print(pf_7_control * im_movement_factor)
    ft_7_motor = sim.setJointTargetPosition(ft_7, Bias_ft_Joint)
    tt_7_motor = sim.setJointTargetPosition(tt_7, 0.9)
    
    --Segment 1 (Seg_1)
    tr_1_motor = sim.setJointTargetPosition(cx1_joint, tr_1_control * im_movement_factor)
    ft_1_motor = sim.setJointTargetPosition(ft_1, Bias_ft_Joint)
    tt_1_motor = sim.setJointTargetPosition(tt_1, 0.9)
    
    tr_8_motor = sim.setJointTargetPosition(cx8_joint, tr_8_control * im_movement_factor)
    ft_8_motor = sim.setJointTargetPosition(ft_8, Bias_ft_Joint)
    tt_8_motor = sim.setJointTargetPosition(tt_8, 0.9)
    
    --Segment 2 (Seg_2)
    tr_2_motor = sim.setJointTargetPosition(cx2_joint, tr_2_control * im_movement_factor)
    ft_2_motor = sim.setJointTargetPosition(ft_2, Bias_ft_Joint)
    tt_2_motor = sim.setJointTargetPosition(tt_2, 0.9)
    
    tr_9_motor = sim.setJointTargetPosition(cx9_joint, tr_9_control * im_movement_factor)
    ft_9_motor = sim.setJointTargetPosition(ft_9, Bias_ft_Joint)
    tt_9_motor = sim.setJointTargetPosition(tt_9, 0.9)
    
    --Segment 3 (Seg_3)
    tr_3_motor = sim.setJointTargetPosition(cx3_joint, tr_3_control * im_movement_factor)
    ft_3_motor = sim.setJointTargetPosition(ft_3, Bias_ft_Joint)
    tt_3_motor = sim.setJointTargetPosition(tt_3, 0.9)
    
    tr_10_motor = sim.setJointTargetPosition(cx10_joint, tr_10_control * im_movement_factor)
    ft_10_motor = sim.setJointTargetPosition(ft_10, Bias_ft_Joint)
    tt_10_motor = sim.setJointTargetPosition(tt_10, 0.9)
    
    --Segment 4 (Seg_4)
    tr_4_motor = sim.setJointTargetPosition(cx4_joint, tr_4_control * im_movement_factor)
    ft_4_motor = sim.setJointTargetPosition(ft_4, Bias_ft_Joint)
    tt_4_motor = sim.setJointTargetPosition(tt_4, 0.9)
    
    tr_11_motor = sim.setJointTargetPosition(cx11_joint, tr_11_control * im_movement_factor)
    ft_11_motor = sim.setJointTargetPosition(ft_11, Bias_ft_Joint)
    tt_11_motor = sim.setJointTargetPosition(tt_11, 0.9)
    
    --Segment 5 (Seg_5)
    tr_5_motor = sim.setJointTargetPosition(cx5_joint, tr_5_control * im_movement_factor)
    ft_5_motor = sim.setJointTargetPosition(ft_5, Bias_ft_Joint)
    tt_5_motor = sim.setJointTargetPosition(tt_5, 0.9)
    
    tr_12_motor = sim.setJointTargetPosition(cx12_joint, tr_12_control * im_movement_factor)
    ft_12_motor = sim.setJointTargetPosition(ft_12, Bias_ft_Joint)
    tt_12_motor = sim.setJointTargetPosition(tt_12, 0.9)
    
    --Segment 6 (Seg_6)
    tr_6_motor = sim.setJointTargetPosition(cx6_joint, tr_6_control * im_movement_factor)
    ft_6_motor = sim.setJointTargetPosition(ft_6, Bias_ft_Joint)
    tt_6_motor = sim.setJointTargetPosition(tt_6, 0.9)
    
    tr_13_motor = sim.setJointTargetPosition(cx13_joint, tr_13_control * im_movement_factor)
    ft_13_motor = sim.setJointTargetPosition(ft_13, Bias_ft_Joint)
    tt_13_motor = sim.setJointTargetPosition(tt_13, 0.9)
    
    --Segment 7 (Seg_7)
    tr_17_motor = sim.setJointTargetPosition(cx17_joint, tr_17_control * im_movement_factor)
    ft_17_motor = sim.setJointTargetPosition(ft_17, Bias_ft_Joint)
    tt_17_motor = sim.setJointTargetPosition(tt_17, 0.9)
    
    tr_15_motor = sim.setJointTargetPosition(cx15_joint, tr_15_control * im_movement_factor)
    ft_15_motor = sim.setJointTargetPosition(ft_15, Bias_ft_Joint)
    tt_15_motor = sim.setJointTargetPosition(tt_15, 0.9)
    
     --Segment 8 (Seg_8)
    tr_18_motor = sim.setJointTargetPosition(cx18_joint, tr_18_control * im_movement_factor)
    ft_18_motor = sim.setJointTargetPosition(ft_18, Bias_ft_Joint)
    tt_18_motor = sim.setJointTargetPosition(tt_18, 0.9)
    
    tr_14_motor = sim.setJointTargetPosition(cx14_joint, tr_14_control * im_movement_factor)
    ft_14_motor = sim.setJointTargetPosition(ft_14, Bias_ft_Joint)
    tt_14_motor = sim.setJointTargetPosition(tt_14, 0.9)
    
     --Segment 9 (Seg_9)
    tr_19_motor = sim.setJointTargetPosition(cx19_joint, tr_19_control * im_movement_factor)
    ft_19_motor = sim.setJointTargetPosition(ft_19, Bias_ft_Joint)
    tt_19_motor = sim.setJointTargetPosition(tt_19, 0.9)
    
    tr_16_motor = sim.setJointTargetPosition(cx16_joint, tr_16_control * im_movement_factor)---
    ft_16_motor = sim.setJointTargetPosition(ft_16, Bias_ft_Joint)
    tt_16_motor = sim.setJointTargetPosition(tt_16, 0.9)

    --Segment 10 (Seg_10)
    tr_20_motor = sim.setJointTargetPosition(cx20_joint, tr_20_control * im_movement_factor)
    ft_20_motor = sim.setJointTargetPosition(ft_20, Bias_ft_Joint)
    tt_20_motor = sim.setJointTargetPosition(tt_20, 0.9)
    
    tr_25_motor = sim.setJointTargetPosition(cx25_joint, tr_25_control * im_movement_factor)
    ft_25_motor = sim.setJointTargetPosition(ft_25, Bias_ft_Joint)
    tt_25_motor = sim.setJointTargetPosition(tt_25, 0.9)

    --Segment 11 (Seg_11)
    tr_21_motor = sim.setJointTargetPosition(cx21_joint, tr_21_control * im_movement_factor)
    ft_21_motor = sim.setJointTargetPosition(ft_21, Bias_ft_Joint)
    tt_21_motor = sim.setJointTargetPosition(tt_21, 0.9)
    
    tr_26_motor = sim.setJointTargetPosition(cx26_joint, tr_26_control * im_movement_factor)---
    ft_26_motor = sim.setJointTargetPosition(ft_26, Bias_ft_Joint)
    tt_26_motor = sim.setJointTargetPosition(tt_26, 0.9)

    --Segment 12 (Seg_12)
    tr_22_motor = sim.setJointTargetPosition(cx22_joint, tr_22_control * im_movement_factor)
    ft_22_motor = sim.setJointTargetPosition(ft_22, Bias_ft_Joint)
    tt_22_motor = sim.setJointTargetPosition(tt_22, 0.9)
    
    tr_27_motor = sim.setJointTargetPosition(cx27_joint, tr_27_control * im_movement_factor)---
    ft_27_motor = sim.setJointTargetPosition(ft_27, Bias_ft_Joint)
    tt_27_motor = sim.setJointTargetPosition(tt_27, 0.9)

    --Segment 13 (Seg_13)
    tr_23_motor = sim.setJointTargetPosition(cx23_joint, tr_23_control * im_movement_factor)
    ft_23_motor = sim.setJointTargetPosition(ft_23, Bias_ft_Joint)
    tt_23_motor = sim.setJointTargetPosition(tt_23, 0.9)
    
    tr_28_motor = sim.setJointTargetPosition(cx28_joint, tr_28_control * im_movement_factor)---
    ft_28_motor = sim.setJointTargetPosition(ft_28, Bias_ft_Joint)
    tt_28_motor = sim.setJointTargetPosition(tt_28, 0.9)

    --Segment 14 (Seg_14)
    tr_24_motor = sim.setJointTargetPosition(cx24_joint, tr_24_control * im_movement_factor)
    ft_24_motor = sim.setJointTargetPosition(ft_24, Bias_ft_Joint)
    tt_24_motor = sim.setJointTargetPosition(tt_24, 0.9)
    
    tr_29_motor = sim.setJointTargetPosition(cx29_joint, tr_29_control * im_movement_factor)---
    ft_29_motor = sim.setJointTargetPosition(ft_29, Bias_ft_Joint)
    tt_29_motor = sim.setJointTargetPosition(tt_29, 0.9)

    --AMPLITUDE REDUCTION--
    if IR1_signal > 0 then
        tr_0_motor = sim.setJointTargetPosition(cx0_joint, (tr_0_control * im_movement_factor) * 0.2)
        tr_1_motor = sim.setJointTargetPosition(cx1_joint, (tr_1_control * im_movement_factor) * 0.2)
        tr_2_motor = sim.setJointTargetPosition(cx2_joint, (tr_2_control * im_movement_factor) * 0.2)
        tr_3_motor = sim.setJointTargetPosition(cx3_joint, (tr_3_control * im_movement_factor) * 0.2)
        tr_4_motor = sim.setJointTargetPosition(cx4_joint, (tr_4_control * im_movement_factor) * 0.2)
        tr_5_motor = sim.setJointTargetPosition(cx5_joint, (tr_5_control * im_movement_factor) * 0.2)
        tr_6_motor = sim.setJointTargetPosition(cx6_joint, (tr_6_control * im_movement_factor) * 0.2)
        --Last three segments
        tr_17_motor = sim.setJointTargetPosition(cx17_joint, (tr_17_control * im_movement_factor) * 0.2)
        tr_18_motor = sim.setJointTargetPosition(cx18_joint, (tr_18_control * im_movement_factor) * 0.2)
        tr_19_motor = sim.setJointTargetPosition(cx19_joint, (tr_19_control * im_movement_factor) * 0.2)

        --new segment
        tr_20_motor = sim.setJointTargetPosition(cx20_joint, (tr_20_control * im_movement_factor) * 0.2)
        tr_21_motor = sim.setJointTargetPosition(cx21_joint, (tr_21_control * im_movement_factor) * 0.2)
        tr_22_motor = sim.setJointTargetPosition(cx22_joint, (tr_22_control * im_movement_factor) * 0.2)
        tr_23_motor = sim.setJointTargetPosition(cx23_joint, (tr_23_control * im_movement_factor) * 0.2)
        tr_24_motor = sim.setJointTargetPosition(cx24_joint, (tr_24_control * im_movement_factor) * 0.2)
    end

    if IR0_signal > 0 then
        tr_7_motor = sim.setJointTargetPosition(cx7_joint, (tr_7_control * im_movement_factor) * 0.2)
        tr_8_motor = sim.setJointTargetPosition(cx8_joint, (tr_8_control * im_movement_factor) * 0.2)
        tr_9_motor = sim.setJointTargetPosition(cx9_joint, (tr_9_control * im_movement_factor) * 0.2)
        tr_10_motor = sim.setJointTargetPosition(cx10_joint, (tr_10_control * im_movement_factor) * 0.2)
        tr_11_motor = sim.setJointTargetPosition(cx11_joint, (tr_11_control * im_movement_factor) * 0.2)
        tr_12_motor = sim.setJointTargetPosition(cx12_joint, (tr_12_control * im_movement_factor) * 0.2)
        tr_13_motor = sim.setJointTargetPosition(cx13_joint, (tr_13_control * im_movement_factor) * 0.2)
        --Last three segments
        tr_15_motor = sim.setJointTargetPosition(cx15_joint, (tr_15_control * im_movement_factor) * 0.2)
        tr_14_motor = sim.setJointTargetPosition(cx14_joint, (tr_14_control * im_movement_factor) * 0.2)
        tr_16_motor = sim.setJointTargetPosition(cx16_joint, (tr_16_control * im_movement_factor) * 0.2)

        --new segment
        tr_25_motor = sim.setJointTargetPosition(cx25_joint, (tr_25_control * im_movement_factor) * 0.2)
        tr_26_motor = sim.setJointTargetPosition(cx26_joint, (tr_26_control * im_movement_factor) * 0.2)
        tr_27_motor = sim.setJointTargetPosition(cx27_joint, (tr_27_control * im_movement_factor) * 0.2)
        tr_28_motor = sim.setJointTargetPosition(cx28_joint, (tr_28_control * im_movement_factor) * 0.2)
        tr_29_motor = sim.setJointTargetPosition(cx29_joint, (tr_29_control * im_movement_factor) * 0.2)
    end


    file:write( string.format("%f\t",tt_0_motor) )
    file:write( string.format("%f\t",tt_1_motor) )
    file:write( string.format("%f\t",tt_2_motor) )
    file:write( string.format("%f\t",tt_3_motor) )
    file:write( string.format("%f\t",tt_4_motor) )
    file:write( string.format("%f\t",tt_5_motor) )
    file:write( string.format("%f\t",tt_6_motor) )
    file:write( string.format("%f\t",tt_17_motor) )
    file:write( string.format("%f\t",tt_18_motor) )
    file:write( string.format("%f\t",tt_19_motor) )
    file:write( string.format("%f\t",tt_20_motor) )
    file:write( string.format("%f\t",tt_21_motor) )
    file:write( string.format("%f\t",tt_22_motor) )
    file:write( string.format("%f\t",tt_23_motor) )
    file:write( string.format("%f\t",tt_24_motor) )

    file:write( string.format("%f\t",tt_7_motor) )
    file:write( string.format("%f\t",tt_8_motor) )
    file:write( string.format("%f\t",tt_9_motor) )
    file:write( string.format("%f\t",tt_10_motor) )
    file:write( string.format("%f\t",tt_11_motor) )
    file:write( string.format("%f\t",tt_12_motor) )
    file:write( string.format("%f\t",tt_13_motor) )
    file:write( string.format("%f\t",tt_15_motor) )
    file:write( string.format("%f\t",tt_14_motor) )
    file:write( string.format("%f\t",tt_16_motor) )
    file:write( string.format("%f\t",tt_25_motor) )
    file:write( string.format("%f\t",tt_26_motor) )
    file:write( string.format("%f\t",tt_27_motor) )
    file:write( string.format("%f\t",tt_28_motor) )
    file:write( string.format("%f\t",tt_29_motor) )

    sim.setJointTargetPosition(pf_0, math.max(-0.6, pf_0_control*leg_movement_factor ))
    --print(math.min(0, ft_0_control*leg_movement_factor ))
    --print(math.min(3, ft_0_control*10))
    sim.setJointTargetPosition(pf_1, math.max(-0.6, pf_1_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_2, math.max(-0.6, pf_2_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_3, math.max(-0.6, pf_3_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_4, math.max(-0.6, pf_4_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_5, math.max(-0.6, pf_5_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_6, math.max(-0.6, pf_6_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_7, math.max(-0.6, pf_7_control*leg_movement_factor ))
    --print(ft_7_control*leg_movement_factor)
    --print((ft_7_control * 0.5) *leg_movement_factor )
    --print(ft_7_control*leg_movement_factor)
    sim.setJointTargetPosition(pf_8, math.max(-0.6, pf_8_control*leg_movement_factor ))
    --print(math.max(-0.6, pf_0_control*leg_movement_factor))
    sim.setJointTargetPosition(pf_9, math.max(-0.6, pf_9_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_10, math.max(-0.6, pf_10_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_11, math.max(-0.6, pf_11_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_12, math.max(-0.6, pf_12_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_13, math.max(-0.6, pf_13_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_14, math.max(-0.6, pf_14_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_15, math.max(-0.6, pf_15_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_16, math.max(-0.6, pf_16_control*leg_movement_factor ))---
    sim.setJointTargetPosition(pf_17, math.max(-0.6, pf_17_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_18, math.max(-0.6, pf_18_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_19, math.max(-0.6, pf_19_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_20, math.max(-0.6, pf_20_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_21, math.max(-0.6, pf_21_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_22, math.max(-0.6, pf_22_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_23, math.max(-0.6, pf_23_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_24, math.max(-0.6, pf_24_control*leg_movement_factor ))
    sim.setJointTargetPosition(pf_25, math.max(-0.6, pf_25_control*leg_movement_factor ))---
    sim.setJointTargetPosition(pf_26, math.max(-0.6, pf_26_control*leg_movement_factor ))---
    sim.setJointTargetPosition(pf_27, math.max(-0.6, pf_27_control*leg_movement_factor ))---
    sim.setJointTargetPosition(pf_28, math.max(-0.6, pf_28_control*leg_movement_factor ))---
    sim.setJointTargetPosition(pf_29, math.max(-0.6, pf_29_control*leg_movement_factor ))---

    

    --get joint positions
    --left
    cx0_joint_pos = sim.getJointPosition(cx0_joint)
    cx1_joint_pos = sim.getJointPosition(cx1_joint)
    cx2_joint_pos = sim.getJointPosition(cx2_joint)
    cx3_joint_pos = sim.getJointPosition(cx3_joint)
    cx4_joint_pos = sim.getJointPosition(cx4_joint)
    cx5_joint_pos = sim.getJointPosition(cx5_joint)
    cx6_joint_pos = sim.getJointPosition(cx6_joint)
    cx17_joint_pos = sim.getJointPosition(cx17_joint)
    cx18_joint_pos = sim.getJointPosition(cx18_joint)
    cx19_joint_pos = sim.getJointPosition(cx19_joint)
    cx20_joint_pos = sim.getJointPosition(cx20_joint)
    cx21_joint_pos = sim.getJointPosition(cx21_joint)
    cx22_joint_pos = sim.getJointPosition(cx22_joint)
    cx23_joint_pos = sim.getJointPosition(cx23_joint)
    cx24_joint_pos = sim.getJointPosition(cx24_joint)

    pf_0_pos = sim.getJointPosition(pf_0)
    pf_1_pos = sim.getJointPosition(pf_1)
    pf_2_pos = sim.getJointPosition(pf_2)
    pf_3_pos = sim.getJointPosition(pf_3)
    pf_4_pos = sim.getJointPosition(pf_4)
    pf_5_pos = sim.getJointPosition(pf_5)
    pf_6_pos = sim.getJointPosition(pf_6)
    pf_17_pos = sim.getJointPosition(pf_17)
    pf_18_pos = sim.getJointPosition(pf_18)
    pf_19_pos = sim.getJointPosition(pf_19)
    pf_20_pos = sim.getJointPosition(pf_20)
    pf_21_pos = sim.getJointPosition(pf_21)
    pf_22_pos = sim.getJointPosition(pf_22)
    pf_23_pos = sim.getJointPosition(pf_23)
    pf_24_pos = sim.getJointPosition(pf_24)

    a = tr_0_control * im_movement_factor
    b = math.min(0, pf_0_control*leg_movement_factor )

    file:write( string.format("%f\t", a) )
    file:write( string.format("%f\t", b) )

    file:write( string.format("%f\t",cx0_joint_pos) )
    file:write( string.format("%f\t",cx1_joint_pos) )
    file:write( string.format("%f\t",cx2_joint_pos) )
    file:write( string.format("%f\t",cx3_joint_pos) )
    file:write( string.format("%f\t",cx4_joint_pos) )
    file:write( string.format("%f\t",cx5_joint_pos) )
    file:write( string.format("%f\t",cx6_joint_pos) )
    file:write( string.format("%f\t",cx17_joint_pos) )
    file:write( string.format("%f\t",cx18_joint_pos) )
    file:write( string.format("%f\t",cx19_joint_pos) )
    file:write( string.format("%f\t",cx20_joint_pos) )
    file:write( string.format("%f\t",cx21_joint_pos) )
    file:write( string.format("%f\t",cx22_joint_pos) )
    file:write( string.format("%f\t",cx23_joint_pos) )
    file:write( string.format("%f\t",cx24_joint_pos) )

    file:write( string.format("%f\t",pf_0_pos) )
    file:write( string.format("%f\t",pf_1_pos) )
    file:write( string.format("%f\t",pf_2_pos) )
    file:write( string.format("%f\t",pf_3_pos) )
    file:write( string.format("%f\t",pf_4_pos) )
    file:write( string.format("%f\t",pf_5_pos) )
    file:write( string.format("%f\t",pf_6_pos) )
    file:write( string.format("%f\t",pf_17_pos) )
    file:write( string.format("%f\t",pf_18_pos) )
    file:write( string.format("%f\t",pf_19_pos) )
    file:write( string.format("%f\t",pf_20_pos) )
    file:write( string.format("%f\t",pf_21_pos) )
    file:write( string.format("%f\t",pf_22_pos) )
    file:write( string.format("%f\t",pf_23_pos) )
    file:write( string.format("%f\t",pf_24_pos) )

    --right
    cx7_joint_pos = sim.getJointPosition(cx7_joint)
    cx8_joint_pos = sim.getJointPosition(cx8_joint)
    cx9_joint_pos = sim.getJointPosition(cx9_joint)
    cx10_joint_pos = sim.getJointPosition(cx10_joint)
    cx11_joint_pos = sim.getJointPosition(cx11_joint)
    cx12_joint_pos = sim.getJointPosition(cx12_joint)
    cx13_joint_pos = sim.getJointPosition(cx13_joint)
    cx15_joint_pos = sim.getJointPosition(cx15_joint)
    cx14_joint_pos = sim.getJointPosition(cx14_joint)
    cx16_joint_pos = sim.getJointPosition(cx16_joint)
    cx25_joint_pos = sim.getJointPosition(cx25_joint)
    cx26_joint_pos = sim.getJointPosition(cx26_joint)
    cx27_joint_pos = sim.getJointPosition(cx27_joint)
    cx28_joint_pos = sim.getJointPosition(cx28_joint)
    cx29_joint_pos = sim.getJointPosition(cx29_joint)

    pf_7_pos = sim.getJointPosition(pf_7)
    pf_8_pos = sim.getJointPosition(pf_8)
    pf_9_pos = sim.getJointPosition(pf_9)
    pf_10_pos = sim.getJointPosition(pf_10)
    pf_11_pos = sim.getJointPosition(pf_11)
    pf_12_pos = sim.getJointPosition(pf_12)
    pf_13_pos = sim.getJointPosition(pf_13)
    pf_14_pos = sim.getJointPosition(pf_15)
    pf_15_pos = sim.getJointPosition(pf_14)
    pf_16_pos = sim.getJointPosition(pf_16)
    pf_25_pos = sim.getJointPosition(pf_25)
    pf_26_pos = sim.getJointPosition(pf_26)
    pf_27_pos = sim.getJointPosition(pf_27)
    pf_28_pos = sim.getJointPosition(pf_28)
    pf_29_pos = sim.getJointPosition(pf_29)

    file:write( string.format("%f\t",cx7_joint_pos) )
    file:write( string.format("%f\t",cx8_joint_pos) )
    file:write( string.format("%f\t",cx9_joint_pos) )
    file:write( string.format("%f\t",cx10_joint_pos) )
    file:write( string.format("%f\t",cx11_joint_pos) )
    file:write( string.format("%f\t",cx12_joint_pos) )
    file:write( string.format("%f\t",cx13_joint_pos) )
    file:write( string.format("%f\t",cx15_joint_pos) )
    file:write( string.format("%f\t",cx14_joint_pos) )
    file:write( string.format("%f\t",cx16_joint_pos) )
    file:write( string.format("%f\t",cx25_joint_pos) )
    file:write( string.format("%f\t",cx26_joint_pos) )
    file:write( string.format("%f\t",cx27_joint_pos) )
    file:write( string.format("%f\t",cx28_joint_pos) )
    file:write( string.format("%f\t",cx29_joint_pos) )

    file:write( string.format("%f\t",pf_7_pos) )
    file:write( string.format("%f\t",pf_8_pos) )
    file:write( string.format("%f\t",pf_9_pos) )
    file:write( string.format("%f\t",pf_10_pos) )
    file:write( string.format("%f\t",pf_11_pos) )
    file:write( string.format("%f\t",pf_12_pos) )
    file:write( string.format("%f\t",pf_13_pos) )
    file:write( string.format("%f\t",pf_15_pos) )
    file:write( string.format("%f\t",pf_14_pos) )
    file:write( string.format("%f\t",pf_16_pos) )
    file:write( string.format("%f\t",pf_25_pos) )
    file:write( string.format("%f\t",pf_26_pos) )
    file:write( string.format("%f\t",pf_27_pos) )
    file:write( string.format("%f\t",pf_28_pos) )
    file:write( string.format("%f\t",pf_29_pos) )
    

    --Left side with IR0
    Activity_1 = WeightI4_1 * Output_I4b + Weight1_1 * Output_1 
    Output_1 = (math.exp(2*Activity_1)-1)/(math.exp(2*Activity_1)+1)

    Activity_2 = Weight1_2 * Output_1 + Weight2_2 * Output_2
    Output_2 = (math.exp(2*Activity_2)-1)/(math.exp(2*Activity_2)+1)

    Output_2a = Output_2 - Output_1

    Activity_3 = Weight2_3* Output_2 + Weight3_3 * Output_3
    Output_3 = (math.exp(2*Activity_3)-1)/(math.exp(2*Activity_3)+1)

    Output_3a = Output_3 - Output_2

    Activity_4 = Weight3_4 * Output_3 + Weight4_4 * Output_4
    Output_4 = (math.exp(2*Activity_4)-1)/(math.exp(2*Activity_4)+1)

    Output_4a = Output_4 - Output_3

    Activity_5 = Weight4_5 * Output_4 + Weight5_5 * Output_5
    Output_5 = (math.exp(2*Activity_5)-1)/(math.exp(2*Activity_5)+1)

    Output_5a = Output_5 - Output_4

    Activity_6 = Weight5_6 * Output_5 + Weight6_6 * Output_6
    Output_6 = (math.exp(2*Activity_6)-1)/(math.exp(2*Activity_6)+1)

    Output_6a = Output_6 - Output_5

    Activity_7 = Weight6_7 * Output_6 + Weight7_7 * Output_7
    Output_7 = (math.exp(2*Activity_7)-1)/(math.exp(2*Activity_7)+1)

    Output_7a = Output_7 - Output_6

    Activity_8 = Weight7_8 * Output_7 + Weight8_8 * Output_8
    Output_8 = (math.exp(2*Activity_8)-1)/(math.exp(2*Activity_8)+1)

    Output_8a = Output_8 - Output_7

    Activity_9 = Weight8_9 * Output_8 + Weight9_9 * Output_9
    Output_9 = (math.exp(2*Activity_9)-1)/(math.exp(2*Activity_9)+1)

    Output_9a = Output_9 - Output_8
    
    Activity_10 = Weight9_10 * Output_9 + Weight10_10 * Output_10
    Output_10 = (math.exp(2*Activity_10)-1)/(math.exp(2*Activity_10)+1)

    Output_10a = Output_10 - Output_9

    Activity_11 = Weight10_11 * Output_10 + Weight11_11 * Output_11
    Output_11 = (math.exp(2*Activity_11)-1)/(math.exp(2*Activity_11)+1)

    Output_11a = Output_11 - Output_10

    Activity_12 = Weight11_12 * Output_11 + Weight12_12 * Output_12
    Output_12 = (math.exp(2*Activity_12)-1)/(math.exp(2*Activity_12)+1)

    Output_12a = Output_12 - Output_11

    Activity_13 = Weight12_13 * Output_12 + Weight13_13 * Output_13
    Output_13 = (math.exp(2*Activity_13)-1)/(math.exp(2*Activity_13)+1)

    Output_13a = Output_13 - Output_12 

    Activity_14 = Weight13_14 * Output_13 + Weight14_14 * Output_14
    Output_14 = (math.exp(2*Activity_14)-1)/(math.exp(2*Activity_14)+1)

    Output_14a = Output_14 - Output_13 

    Activity_15 = Weight14_15 * Output_14 + Weight15_15 * Output_15
    Output_15 = (math.exp(2*Activity_15)-1)/(math.exp(2*Activity_15)+1)

    Output_15a = Output_15 - Output_14 

    Activity_16 = Weight15_16 * Output_15 + Weight16_16 * Output_16
    Output_16 = (math.exp(2*Activity_16)-1)/(math.exp(2*Activity_16)+1)

    Output_16a = Output_16 - Output_15 

    Activity_17 = Weight16_17 * Output_16 + Weight17_17 * Output_17
    Output_17 = (math.exp(2*Activity_17)-1)/(math.exp(2*Activity_17)+1)

    Output_17a = Output_17 - Output_16 
    
    Activity_18 = Weight17_18 * Output_17 + Weight18_18 * Output_18
    Output_18 = (math.exp(2*Activity_18)-1)/(math.exp(2*Activity_18)+1)

    Output_18a = Output_18 - Output_17 
    
    Activity_19 = Weight18_19 * Output_18 + Weight19_19 * Output_19
    Output_19 = (math.exp(2*Activity_19)-1)/(math.exp(2*Activity_19)+1)

    Output_19a = Output_19 - Output_18 
    
    Activity_20 = Weight19_20 * Output_19 + Weight20_20 * Output_20
    Output_20 = (math.exp(2*Activity_20)-1)/(math.exp(2*Activity_20)+1)

    Output_20a = Output_20 - Output_19 
    
    Activity_21 = Weight20_21 * Output_20 + Weight21_21 * Output_21
    Output_21 = (math.exp(2*Activity_21)-1)/(math.exp(2*Activity_21)+1)

    Output_21a = Output_21 - Output_20 
    
    Activity_22 = Weight21_22 * Output_21 + Weight22_22 * Output_22
    Output_22 = (math.exp(2*Activity_22)-1)/(math.exp(2*Activity_22)+1)

    Output_22a = Output_22 - Output_21 
    
    Activity_23 = Weight22_23 * Output_22 + Weight23_23 * Output_23
    Output_23 = (math.exp(2*Activity_23)-1)/(math.exp(2*Activity_23)+1)

    Output_23a = Output_23 - Output_22 

    Activity_24 = Weight23_24 * Output_23 + Weight24_24 * Output_24
    Output_24 = (math.exp(2*Activity_24)-1)/(math.exp(2*Activity_24)+1)

    Output_24a = Output_24 - Output_23
    
    Activity_25 = Weight24_25 * Output_24 + Weight25_25 * Output_25
    Output_25 = (math.exp(2*Activity_25)-1)/(math.exp(2*Activity_25)+1)

    Output_25a = Output_25 - Output_24
    
    Activity_26 = Weight25_26 * Output_25 + Weight26_26 * Output_26
    Output_26 = (math.exp(2*Activity_26)-1)/(math.exp(2*Activity_26)+1)

    Output_26a = Output_26 - Output_25
    
    Activity_27 = Weight26_27 * Output_26 + Weight27_27 * Output_27
    Output_27 = (math.exp(2*Activity_27)-1)/(math.exp(2*Activity_27)+1)

    Output_27a = Output_27 - Output_26
    
    Activity_28 = Weight27_28 * Output_27 + Weight28_28 * Output_28
    Output_28 = (math.exp(2*Activity_28)-1)/(math.exp(2*Activity_28)+1)

    Output_28a = Output_28 - Output_27
    
    Activity_29 = Weight28_29 * Output_28 + Weight29_29 * Output_29
    Output_29 = (math.exp(2*Activity_29)-1)/(math.exp(2*Activity_29)+1)

    Output_29a = Output_29 - Output_28
    
    Activity_30 = Weight29_30 * Output_29 + Weight30_30 * Output_30
    Output_30 = (math.exp(2*Activity_30)-1)/(math.exp(2*Activity_30)+1)

    Output_30a = Output_30 - Output_29
    
    Activity_31 = Weight30_31 * Output_30 + Weight31_31 * Output_31
    Output_31 = (math.exp(2*Activity_31)-1)/(math.exp(2*Activity_31)+1)

    Output_31a = Output_31 - Output_30
    
    Activity_32 = Weight31_32 * Output_31 + Weight32_32 * Output_32
    Output_32 = (math.exp(2*Activity_32)-1)/(math.exp(2*Activity_32)+1)

    Output_32a = Output_32 - Output_31
    
    Activity_33 = Weight32_33 * Output_32 + Weight33_33 * Output_33
    Output_33 = (math.exp(2*Activity_33)-1)/(math.exp(2*Activity_33)+1)

    Output_33a = Output_33 - Output_32
    
    Activity_34 = Weight33_34 * Output_33 + Weight34_34 * Output_34
    Output_34 = (math.exp(2*Activity_34)-1)/(math.exp(2*Activity_34)+1)

    Output_34a = Output_34 - Output_33
    
    Activity_35 = Weight34_35 * Output_34 + Weight35_35 * Output_35
    Output_35 = (math.exp(2*Activity_35)-1)/(math.exp(2*Activity_35)+1)

    Output_35a = Output_35 - Output_34
    
    Activity_36 = Weight35_36 * Output_35 + Weight36_36 * Output_36
    Output_36 = (math.exp(2*Activity_36)-1)/(math.exp(2*Activity_36)+1)

    Output_36a = Output_36 - Output_35
    
    Activity_37 = Weight36_37 * Output_36 + Weight37_37 * Output_37
    Output_37 = (math.exp(2*Activity_37)-1)/(math.exp(2*Activity_37)+1)

    Output_37a = Output_37 - Output_36
    
    Activity_38= Weight37_38 * Output_37 + Weight38_38 * Output_38
    Output_38 = (math.exp(2*Activity_38)-1)/(math.exp(2*Activity_38)+1)

    Output_38a = Output_38 - Output_37
    
    Activity_39 = Weight38_39 * Output_38 + Weight39_39 * Output_39
    Output_39 = (math.exp(2*Activity_39)-1)/(math.exp(2*Activity_39)+1)

    Output_39a = Output_39 - Output_38
    
    Activity_40 = Weight39_40 * Output_39 + Weight40_40 * Output_40
    Output_40 = (math.exp(2*Activity_40)-1)/(math.exp(2*Activity_40)+1)

    Output_40a = Output_40 - Output_39
    
    Activity_41 = Weight40_41 * Output_40 + Weight41_41 * Output_41
    Output_41 = (math.exp(2*Activity_41)-1)/(math.exp(2*Activity_41)+1)

    Output_41a = Output_41 - Output_40
    
    Activity_42 = Weight41_42 * Output_41 + Weight42_42 * Output_42
    Output_42 = (math.exp(2*Activity_42)-1)/(math.exp(2*Activity_42)+1)

    Output_42a = Output_42 - Output_41
    
    Activity_43 = Weight42_43 * Output_42 + Weight43_43 * Output_43
    Output_43 = (math.exp(2*Activity_43)-1)/(math.exp(2*Activity_43)+1)

    Output_43a = Output_43 - Output_42
    
    Activity_44 = Weight43_44 * Output_43 + Weight44_44 * Output_44
    Output_44 = (math.exp(2*Activity_44)-1)/(math.exp(2*Activity_44)+1)

    Output_44a = Output_44 - Output_43
    
    Activity_45 = Weight44_45 * Output_44 + Weight45_45 * Output_45
    Output_45 = (math.exp(2*Activity_45)-1)/(math.exp(2*Activity_45)+1)

    Output_45a = Output_45 - Output_44
    
    Activity_46 = Weight45_46 * Output_45 + Weight46_46 * Output_46
    Output_46 = (math.exp(2*Activity_46)-1)/(math.exp(2*Activity_46)+1)

    Output_46a = Output_46 - Output_45
    
    Activity_47 = Weight46_47 * Output_46 + Weight47_47 * Output_47
    Output_47 = (math.exp(2*Activity_47)-1)/(math.exp(2*Activity_47)+1)

    Output_47a = Output_47 - Output_46
    
    Activity_48 = Weight47_48 * Output_47 + Weight48_48 * Output_48
    Output_48 = (math.exp(2*Activity_48)-1)/(math.exp(2*Activity_48)+1)

    Output_48a = Output_48 - Output_47
    
    Activity_49 = Weight48_49 * Output_48 + Weight49_49 * Output_49
    Output_49 = (math.exp(2*Activity_49)-1)/(math.exp(2*Activity_49)+1)

    Output_49a = Output_49 - Output_48
    
    Activity_50 = Weight49_50 * Output_49 + Weight50_50 * Output_50
    Output_50 = (math.exp(2*Activity_50)-1)/(math.exp(2*Activity_50)+1)

    Output_50a = Output_50 - Output_49
    
    Activity_51 = Weight50_51 * Output_50 + Weight51_51 * Output_51
    Output_51 = (math.exp(2*Activity_51)-1)/(math.exp(2*Activity_51)+1)

    Output_51a = Output_51 - Output_50
    
    Activity_52 = Weight51_52 * Output_51 + Weight52_52 * Output_52
    Output_52 = (math.exp(2*Activity_52)-1)/(math.exp(2*Activity_52)+1)

    Output_52a = Output_52 - Output_51
    
    Activity_53 = Weight52_53 * Output_52 + Weight53_53 * Output_53
    Output_53 = (math.exp(2*Activity_53)-1)/(math.exp(2*Activity_53)+1)

    Output_53a = Output_53 - Output_52
    
    Activity_54 = Weight53_54 * Output_53 + Weight54_54 * Output_54
    Output_54 = (math.exp(2*Activity_54)-1)/(math.exp(2*Activity_54)+1)

    Output_54a = Output_54 - Output_53
    
    Activity_55 = Weight54_55 * Output_54 + Weight55_55 * Output_55
    Output_55 = (math.exp(2*Activity_55)-1)/(math.exp(2*Activity_55)+1)

    Output_55a = Output_55 - Output_54
    
    Activity_56 = Weight55_56 * Output_55 + Weight56_56 * Output_56
    Output_56 = (math.exp(2*Activity_56)-1)/(math.exp(2*Activity_56)+1)

    Output_56a = Output_56 - Output_55
    
    Activity_57 = Weight56_57 * Output_56 + Weight57_57 * Output_57
    Output_57 = (math.exp(2*Activity_57)-1)/(math.exp(2*Activity_57)+1)

    Output_57a = Output_57 - Output_56
    
    Activity_58 = Weight57_58 * Output_57 + Weight58_58 * Output_58
    Output_58 = (math.exp(2*Activity_58)-1)/(math.exp(2*Activity_58)+1)

    Output_58a = Output_58 - Output_57
    
    Activity_59 = Weight58_59 * Output_58 + Weight59_59 * Output_59
    Output_59 = (math.exp(2*Activity_59)-1)/(math.exp(2*Activity_59)+1)

    Output_59a = Output_59 - Output_58

    Activity_60 = Weight59_60 * Output_59 + Weight60_60 * Output_60
    Output_60 = (math.exp(2*Activity_60)-1)/(math.exp(2*Activity_60)+1)

    Output_60a = Output_60 - Output_59
    
    Activity_61 = Weight60_61 * Output_60 + Weight61_61 * Output_61
    Output_61 = (math.exp(2*Activity_61)-1)/(math.exp(2*Activity_61)+1)

    Output_61a = Output_61 - Output_60
    
    Activity_62 = Weight61_62 * Output_61 + Weight62_62 * Output_62
    Output_62 = (math.exp(2*Activity_62)-1)/(math.exp(2*Activity_62)+1)

    Output_62a = Output_62 - Output_61
    
    Activity_63 = Weight62_63 * Output_62 + Weight63_63 * Output_63
    Output_63 = (math.exp(2*Activity_63)-1)/(math.exp(2*Activity_63)+1)

    Output_63a = Output_63 - Output_62
    
    Activity_64 = Weight63_64 * Output_63 + Weight64_64 * Output_64
    Output_64 = (math.exp(2*Activity_64)-1)/(math.exp(2*Activity_64)+1)

    Output_64a = Output_64 - Output_63

    Activity_65 = Weight64_65 * Output_64 + Weight65_65 * Output_65
    Output_65 = (math.exp(2*Activity_65)-1)/(math.exp(2*Activity_65)+1)

    Output_65a = Output_65 - Output_64
    
    Activity_66 = Weight65_66 * Output_65 + Weight66_66 * Output_66
    Output_66 = (math.exp(2*Activity_66)-1)/(math.exp(2*Activity_66)+1)

    Output_66a = Output_66 - Output_65
    
    Activity_67 = Weight66_67 * Output_66 + Weight67_67 * Output_67
    Output_67 = (math.exp(2*Activity_67)-1)/(math.exp(2*Activity_67)+1)

    Output_67a = Output_67 - Output_66
    
    Activity_68 = Weight67_68 * Output_67 + Weight68_68 * Output_68
    Output_68 = (math.exp(2*Activity_68)-1)/(math.exp(2*Activity_68)+1)

    Output_68a = Output_68 - Output_67
    
    Activity_69 = Weight68_69 * Output_68 + Weight69_69 * Output_69
    Output_69 = (math.exp(2*Activity_69)-1)/(math.exp(2*Activity_69)+1)

    Output_69a = Output_69 - Output_68

    Activity_70 = Weight69_70 * Output_69 + Weight70_70 * Output_70
    Output_70 = (math.exp(2*Activity_70)-1)/(math.exp(2*Activity_70)+1)

    Output_70a = Output_70 - Output_69
    
    Activity_71 = Weight70_71 * Output_70 + Weight71_71 * Output_71
    Output_71 = (math.exp(2*Activity_71)-1)/(math.exp(2*Activity_71)+1)

    Output_71a = Output_71 - Output_70

    Activity_72 = Weight71_72 * Output_71 + Weight72_72 * Output_72
    Output_72 = (math.exp(2*Activity_72)-1)/(math.exp(2*Activity_72)+1)

    Output_72a = Output_72 - Output_71
    
    Activity_73 = Weight72_73 * Output_72 + Weight73_73 * Output_73
    Output_73 = (math.exp(2*Activity_73)-1)/(math.exp(2*Activity_73)+1)

    Output_73a = Output_73 - Output_72
    
    Activity_74 = Weight73_74 * Output_73 + Weight74_74 * Output_74
    Output_74 = (math.exp(2*Activity_74)-1)/(math.exp(2*Activity_74)+1)

    Output_74a = Output_74 - Output_73
    
    Activity_75 = Weight74_75 * Output_74 + Weight75_75 * Output_75
    Output_75 = (math.exp(2*Activity_75)-1)/(math.exp(2*Activity_75)+1)

    Output_75a = Output_75 - Output_74
    
    Activity_76 = Weight75_76 * Output_75 + Weight76_76 * Output_76
    Output_76 = (math.exp(2*Activity_76)-1)/(math.exp(2*Activity_76)+1)

    Output_76a = Output_76 - Output_75
    
    Activity_77 = Weight76_77 * Output_76 + Weight77_77 * Output_77
    Output_77 = (math.exp(2*Activity_77)-1)/(math.exp(2*Activity_77)+1)

    Output_77a = Output_77 - Output_76
    
    Activity_78 = Weight77_78 * Output_77 + Weight78_78 * Output_78
    Output_78 = (math.exp(2*Activity_78)-1)/(math.exp(2*Activity_78)+1)

    Output_78a = Output_78 - Output_77

    Activity_79 = Weight78_79 * Output_78 + Weight79_79 * Output_79
    Output_79 = (math.exp(2*Activity_79)-1)/(math.exp(2*Activity_79)+1)

    Output_79a = Output_79 - Output_78
    
    Activity_80 = Weight79_80 * Output_79 + Weight80_80 * Output_80
    Output_80 = (math.exp(2*Activity_80)-1)/(math.exp(2*Activity_80)+1)

    Output_80a = Output_80 - Output_79
    
    Activity_81 = Weight80_81 * Output_80 + Weight81_81 * Output_81
    Output_81 = (math.exp(2*Activity_81)-1)/(math.exp(2*Activity_81)+1)

    Output_81a = Output_81 - Output_80

    Activity_82 = Weight81_82 * Output_81 + Weight82_82 * Output_82
    Output_82 = (math.exp(2*Activity_82)-1)/(math.exp(2*Activity_82)+1)
    
    Activity_83 = Weight82_83 * Output_82 + Weight83_83 * Output_83
    Output_83 = (math.exp(2*Activity_83)-1)/(math.exp(2*Activity_83)+1)
    
    Activity_84 = Weight83_84 * Output_83 + Weight84_84 * Output_84
    Output_84 = (math.exp(2*Activity_84)-1)/(math.exp(2*Activity_84)+1)
    
    Activity_85 = Weight84_85 * Output_84 + Weight85_85 * Output_85
    Output_85 = (math.exp(2*Activity_85)-1)/(math.exp(2*Activity_85)+1)
    
    Activity_86 = Weight85_86 * Output_85 + Weight86_86 * Output_86
    Output_86 = (math.exp(2*Activity_86)-1)/(math.exp(2*Activity_86)+1)
    
    Activity_87 = Weight86_87 * Output_86 + Weight87_87 * Output_87
    Output_87 = (math.exp(2*Activity_87)-1)/(math.exp(2*Activity_87)+1)

    Activity_88 = Weight87_88 * Output_87 + Weight88_88 * Output_88
    Output_88 = (math.exp(2*Activity_88)-1)/(math.exp(2*Activity_88)+1)

    Activity_89 = Weight88_89 * Output_88 + Weight89_89 * Output_89
    Output_89 = (math.exp(2*Activity_89)-1)/(math.exp(2*Activity_89)+1)
    
    Activity_90 = Weight89_90 * Output_89 + Weight90_90 * Output_90
    Output_90 = (math.exp(2*Activity_90)-1)/(math.exp(2*Activity_90)+1)

    Output_90a = Output_90 - Output_89
    
    Activity_91 = Weight90_91 * Output_90 + Weight91_91 * Output_91
    Output_91 = (math.exp(2*Activity_91)-1)/(math.exp(2*Activity_91)+1)
    
    Activity_92 = Weight91_92 * Output_91 + Weight92_92 * Output_92
    Output_92 = (math.exp(2*Activity_92)-1)/(math.exp(2*Activity_92)+1)
    
    Activity_93 = Weight92_93 * Output_92 + Weight93_93 * Output_93
    Output_93 = (math.exp(2*Activity_93)-1)/(math.exp(2*Activity_93)+1)
    
    Activity_94 = Weight93_94 * Output_93 + Weight94_94 * Output_94
    Output_94 = (math.exp(2*Activity_94)-1)/(math.exp(2*Activity_94)+1)
    
    Activity_95 = Weight94_95 * Output_94 + Weight95_95 * Output_95
    Output_95 = (math.exp(2*Activity_95)-1)/(math.exp(2*Activity_95)+1)
    
    Activity_96 = Weight95_96 * Output_95 + Weight96_96 * Output_96
    Output_96 = (math.exp(2*Activity_96)-1)/(math.exp(2*Activity_96)+1)
    
    Activity_97 = Weight96_97 * Output_96 + Weight97_97 * Output_97
    Output_97 = (math.exp(2*Activity_97)-1)/(math.exp(2*Activity_97)+1)

    Activity_98 = Weight97_98 * Output_97 + Weight98_98 * Output_98
    Output_98 = (math.exp(2*Activity_98)-1)/(math.exp(2*Activity_98)+1)

    Activity_99 = Weight98_99 * Output_98 + Weight99_99 * Output_99
    Output_99 = (math.exp(2*Activity_99)-1)/(math.exp(2*Activity_99)+1)
    
    Activity_100 = Weight99_100 * Output_99 + Weight100_100 * Output_100
    Output_100 = (math.exp(2*Activity_100)-1)/(math.exp(2*Activity_100)+1)
    
    Activity_101 = Weight100_101 * Output_100 + Weight101_101 * Output_101
    Output_101 = (math.exp(2*Activity_101)-1)/(math.exp(2*Activity_101)+1)
    
    Activity_102 = Weight101_102 * Output_101 + Weight102_102 * Output_102
    Output_102 = (math.exp(2*Activity_102)-1)/(math.exp(2*Activity_102)+1)
    
    Activity_103 = Weight102_103 * Output_102 + Weight103_103 * Output_103
    Output_103 = (math.exp(2*Activity_103)-1)/(math.exp(2*Activity_103)+1)
    
    Activity_104 = Weight103_104 * Output_103 + Weight104_104 * Output_104
    Output_104 = (math.exp(2*Activity_104)-1)/(math.exp(2*Activity_104)+1)
    
    Activity_105 = Weight104_105 * Output_104 + Weight105_105 * Output_105
    Output_105 = (math.exp(2*Activity_105)-1)/(math.exp(2*Activity_105)+1)
    
    Activity_106 = Weight105_106 * Output_105 + Weight106_106 * Output_106
    Output_106 = (math.exp(2*Activity_106)-1)/(math.exp(2*Activity_106)+1)
    
    Activity_107 = Weight106_107 * Output_106 + Weight107_107 * Output_107
    Output_107 = (math.exp(2*Activity_107)-1)/(math.exp(2*Activity_107)+1)

    Activity_108 = Weight107_108 * Output_107 + Weight108_108 * Output_108
    Output_108 = (math.exp(2*Activity_108)-1)/(math.exp(2*Activity_108)+1)

    Activity_109 = Weight108_109 * Output_108 + Weight109_109 * Output_109
    Output_109 = (math.exp(2*Activity_109)-1)/(math.exp(2*Activity_109)+1)
    
    Activity_110 = Weight109_110 * Output_109 + Weight110_110 * Output_110
    Output_110 = (math.exp(2*Activity_110)-1)/(math.exp(2*Activity_110)+1)

    Output_110a = Output_110 - Output_109
    
    Activity_111 = Weight110_111 * Output_110 + Weight111_111 * Output_111
    Output_111 = (math.exp(2*Activity_111)-1)/(math.exp(2*Activity_111)+1)
    
    Activity_112 = Weight111_112 * Output_111 + Weight112_112 * Output_112
    Output_112 = (math.exp(2*Activity_112)-1)/(math.exp(2*Activity_112)+1)
    
    Activity_113 = Weight112_113 * Output_112 + Weight113_113 * Output_113
    Output_113 = (math.exp(2*Activity_113)-1)/(math.exp(2*Activity_113)+1)
    
    Activity_114 = Weight113_114 * Output_113 + Weight114_114 * Output_114
    Output_114 = (math.exp(2*Activity_114)-1)/(math.exp(2*Activity_114)+1)
    
    Activity_115 = Weight114_115 * Output_114 + Weight115_115 * Output_115
    Output_115 = (math.exp(2*Activity_115)-1)/(math.exp(2*Activity_115)+1)
    
    Activity_116 = Weight115_116 * Output_115 + Weight116_116 * Output_116
    Output_116 = (math.exp(2*Activity_116)-1)/(math.exp(2*Activity_116)+1)
    
    Activity_117 = Weight116_117 * Output_116 + Weight117_117 * Output_117
    Output_117 = (math.exp(2*Activity_117)-1)/(math.exp(2*Activity_117)+1)

    Activity_118 = Weight117_118 * Output_117 + Weight118_118 * Output_118
    Output_118 = (math.exp(2*Activity_118)-1)/(math.exp(2*Activity_118)+1)

    Activity_119 = Weight118_119 * Output_118 + Weight119_119 * Output_119
    Output_119 = (math.exp(2*Activity_119)-1)/(math.exp(2*Activity_119)+1)
    
    Activity_120 = Weight119_120 * Output_119 + Weight120_120 * Output_120
    Output_120 = (math.exp(2*Activity_120)-1)/(math.exp(2*Activity_120)+1)
    
    Activity_121 = Weight120_121 * Output_120 + Weight121_121 * Output_121
    Output_121 = (math.exp(2*Activity_121)-1)/(math.exp(2*Activity_121)+1)
    
    Activity_122 = Weight121_122 * Output_121 + Weight122_122 * Output_122
    Output_122 = (math.exp(2*Activity_122)-1)/(math.exp(2*Activity_122)+1)
    
    Activity_123 = Weight122_123 * Output_122 + Weight123_123 * Output_123
    Output_123 = (math.exp(2*Activity_123)-1)/(math.exp(2*Activity_123)+1)

    Activity_124 = Weight123_124 * Output_123 + Weight124_124 * Output_124
    Output_124 = (math.exp(2*Activity_124)-1)/(math.exp(2*Activity_124)+1)
    
    Activity_125 = Weight124_125 * Output_124 + Weight125_125 * Output_125
    Output_125 = (math.exp(2*Activity_125)-1)/(math.exp(2*Activity_125)+1)
    
    Activity_126 = Weight125_126 * Output_125 + Weight126_126 * Output_126
    Output_126 = (math.exp(2*Activity_126)-1)/(math.exp(2*Activity_126)+1)
    
    Activity_127 = Weight126_127 * Output_126 + Weight127_127 * Output_127
    Output_127 = (math.exp(2*Activity_127)-1)/(math.exp(2*Activity_127)+1)

    Activity_128 = Weight127_128 * Output_127 + Weight128_128 * Output_128
    Output_128 = (math.exp(2*Activity_128)-1)/(math.exp(2*Activity_128)+1)

    Activity_129 = Weight128_129 * Output_128 + Weight129_129 * Output_129
    Output_129 = (math.exp(2*Activity_129)-1)/(math.exp(2*Activity_129)+1)
    
    Activity_130 = Weight129_130 * Output_129 + Weight130_130 * Output_130
    Output_130 = (math.exp(2*Activity_130)-1)/(math.exp(2*Activity_130)+1)

    Output_130a = Output_130 - Output_129
    
    Activity_131 = Weight130_131 * Output_130 + Weight131_131 * Output_131
    Output_131 = (math.exp(2*Activity_131)-1)/(math.exp(2*Activity_131)+1)    

    --Right side with IR1
    Activity_1R = WeightI3_1R * Output_I3b + Weight1R_1R * Output_1R 
    Output_1R = (math.exp(2*Activity_1R)-1)/(math.exp(2*Activity_1R)+1)

    Activity_2R = Weight1R_2R * Output_1R + Weight2R_2R * Output_2R
    Output_2R = (math.exp(2*Activity_2R)-1)/(math.exp(2*Activity_2R)+1)

    Output_2Ra = Output_2R - Output_1R

    Activity_3R = Weight2R_3R * Output_2R + Weight3R_3R * Output_3R
    Output_3R = (math.exp(2*Activity_3R)-1)/(math.exp(2*Activity_3R)+1)

    Output_3Ra = Output_3R - Output_2R

    Activity_4R = Weight3R_4R * Output_3R + Weight4R_4R * Output_4R
    Output_4R = (math.exp(2*Activity_4R)-1)/(math.exp(2*Activity_4R)+1)

    Output_4Ra = Output_4R - Output_3R

    Activity_5R = Weight4R_5R * Output_4R + Weight5R_5R * Output_5R
    Output_5R = (math.exp(2*Activity_5R)-1)/(math.exp(2*Activity_5R)+1)

    Output_5Ra = Output_5R - Output_4R

    Activity_6R = Weight5R_6R * Output_5R + Weight6R_6R * Output_6R
    Output_6R = (math.exp(2*Activity_6R)-1)/(math.exp(2*Activity_6R)+1)

    Output_6Ra = Output_6R - Output_5R

    Activity_7R = Weight6R_7R * Output_6R + Weight7R_7R * Output_7R
    Output_7R = (math.exp(2*Activity_7R)-1)/(math.exp(2*Activity_7R)+1)

    Output_7Ra = Output_7R - Output_6R

    Activity_8R = Weight7R_8R * Output_7R + Weight8R_8R * Output_8R
    Output_8R = (math.exp(2*Activity_8R)-1)/(math.exp(2*Activity_8R)+1)

    Output_8Ra = Output_8R - Output_7R

    Activity_9R = Weight8R_9R * Output_8R + Weight9R_9R * Output_9R
    Output_9R = (math.exp(2*Activity_9R)-1)/(math.exp(2*Activity_9R)+1)

    Output_9Ra = Output_9R - Output_8R
    
    Activity_10R = Weight9R_10R * Output_9R + Weight10R_10R * Output_10R
    Output_10R = (math.exp(2*Activity_10R)-1)/(math.exp(2*Activity_10R)+1)

    Output_10Ra = Output_10R - Output_9R

    Activity_11R = Weight10R_11R * Output_10R + Weight11R_11R * Output_11R
    Output_11R = (math.exp(2*Activity_11R)-1)/(math.exp(2*Activity_11R)+1)

    Output_11Ra = Output_11R - Output_10R

    Activity_12R = Weight11R_12R * Output_11R + Weight12R_12R * Output_12R
    Output_12R = (math.exp(2*Activity_12R)-1)/(math.exp(2*Activity_12R)+1)

    Output_12Ra = Output_12R - Output_11R

    Activity_13R = Weight12R_13R * Output_12R + Weight13R_13R * Output_13R
    Output_13R = (math.exp(2*Activity_13R)-1)/(math.exp(2*Activity_13R)+1)

    Output_13Ra = Output_13R - Output_12R

    Activity_14R = Weight13R_14R * Output_13R + Weight14R_14R * Output_14R
    Output_14R = (math.exp(2*Activity_14R)-1)/(math.exp(2*Activity_14R)+1)

    Output_14Ra = Output_14R - Output_13R

    Activity_15R = Weight14R_15R * Output_14R + Weight15R_15R * Output_15R
    Output_15R = (math.exp(2*Activity_15R)-1)/(math.exp(2*Activity_15R)+1)

    Output_15Ra = Output_15R - Output_14R

    Activity_16R = Weight15R_16R * Output_15R + Weight16R_16R * Output_16R
    Output_16R = (math.exp(2*Activity_16R)-1)/(math.exp(2*Activity_16R)+1)

    Output_16Ra = Output_16R - Output_15R

    Activity_17R = Weight16R_17R * Output_16R + Weight17R_17R * Output_17R
    Output_17R = (math.exp(2*Activity_17R)-1)/(math.exp(2*Activity_17R)+1)

    Output_17Ra = Output_17R - Output_16R
    
    Activity_18R = Weight17R_18R * Output_17R + Weight18R_18R * Output_18R
    Output_18R = (math.exp(2*Activity_18R)-1)/(math.exp(2*Activity_18R)+1)

    Output_18Ra = Output_18R - Output_17R
    
    Activity_19R = Weight18R_19R * Output_18R + Weight19R_19R * Output_19R
    Output_19R = (math.exp(2*Activity_19R)-1)/(math.exp(2*Activity_19R)+1)

    Output_19Ra = Output_19R - Output_18R
    
    Activity_20R = Weight19R_20R * Output_19R + Weight20R_20R * Output_20R
    Output_20R = (math.exp(2*Activity_20R)-1)/(math.exp(2*Activity_20R)+1)

    Output_20Ra = Output_20R - Output_19R
    
    Activity_21R = Weight20R_21R * Output_20R + Weight21R_21R * Output_21R
    Output_21R = (math.exp(2*Activity_21R)-1)/(math.exp(2*Activity_21R)+1)

    Output_21Ra = Output_21R - Output_20R
    
    Activity_22R = Weight21R_22R * Output_21R + Weight22R_22R * Output_22R
    Output_22R = (math.exp(2*Activity_22R)-1)/(math.exp(2*Activity_22R)+1)

    Output_22Ra = Output_22R - Output_21R
    
    Activity_23R = Weight22R_23R * Output_22R + Weight23R_23R * Output_23R
    Output_23R = (math.exp(2*Activity_23R)-1)/(math.exp(2*Activity_23R)+1)

    Output_23Ra = Output_23R - Output_22R
    
    Activity_24R = Weight23R_24R * Output_23R + Weight24R_24R * Output_24R
    Output_24R = (math.exp(2*Activity_24R)-1)/(math.exp(2*Activity_24R)+1)

    Output_24Ra = Output_24R - Output_23R
    
    Activity_25R = Weight24R_25R * Output_24R + Weight25R_25R * Output_25R
    Output_25R = (math.exp(2*Activity_25R)-1)/(math.exp(2*Activity_25R)+1)

    Output_25Ra = Output_25R - Output_24R
    
    Activity_26R = Weight25R_26R * Output_25R + Weight26R_26R * Output_26R
    Output_26R = (math.exp(2*Activity_26R)-1)/(math.exp(2*Activity_26R)+1)

    Output_26Ra = Output_26R - Output_25R

    Activity_27R = Weight26R_27R * Output_26R + Weight27R_27R * Output_27R
    Output_27R = (math.exp(2*Activity_27R)-1)/(math.exp(2*Activity_27R)+1)

    Output_27Ra = Output_27R - Output_26R
    
    Activity_28R = Weight27R_28R * Output_27R + Weight28R_28R * Output_28R
    Output_28R = (math.exp(2*Activity_28R)-1)/(math.exp(2*Activity_28R)+1)

    Output_28Ra = Output_28R - Output_27R
    
    Activity_29R = Weight28R_29R * Output_28R + Weight29R_29R * Output_29R
    Output_29R = (math.exp(2*Activity_29R)-1)/(math.exp(2*Activity_29R)+1)

    Output_29Ra = Output_29R - Output_28R
    
    Activity_30R = Weight29R_30R * Output_29R + Weight30R_30R * Output_30R
    Output_30R = (math.exp(2*Activity_30R)-1)/(math.exp(2*Activity_30R)+1)

    Output_30Ra = Output_30R - Output_29R
    
    Activity_31R = Weight30R_31R * Output_30R + Weight31R_31R * Output_31R
    Output_31R = (math.exp(2*Activity_31R)-1)/(math.exp(2*Activity_31R)+1)

    Output_31Ra = Output_31R - Output_30R
    
    Activity_32R = Weight31R_32R * Output_31R + Weight32R_32R * Output_32R
    Output_32R = (math.exp(2*Activity_32R)-1)/(math.exp(2*Activity_32R)+1)

    Output_32Ra = Output_32R - Output_31R
    
    Activity_33R = Weight32R_33R * Output_32R + Weight33R_33R * Output_33R
    Output_33R = (math.exp(2*Activity_33R)-1)/(math.exp(2*Activity_33R)+1)

    Output_33Ra = Output_33R - Output_32R
    
    Activity_34R = Weight33R_34R * Output_33R + Weight34R_34R * Output_34R
    Output_34R = (math.exp(2*Activity_34R)-1)/(math.exp(2*Activity_34R)+1)

    Output_34Ra = Output_34R - Output_33R
    
    Activity_35R = Weight34R_35R * Output_34R + Weight35R_35R * Output_35R
    Output_35R = (math.exp(2*Activity_35R)-1)/(math.exp(2*Activity_35R)+1)

    Output_35Ra = Output_35R - Output_34R
    
    Activity_36R = Weight35R_36R * Output_35R + Weight36R_36R * Output_36R
    Output_36R = (math.exp(2*Activity_36R)-1)/(math.exp(2*Activity_36R)+1)

    Output_36Ra = Output_36R - Output_35R
    
    Activity_37R = Weight36R_37R * Output_36R + Weight37R_37R * Output_37R
    Output_37R = (math.exp(2*Activity_37R)-1)/(math.exp(2*Activity_37R)+1)

    Output_37Ra = Output_37R - Output_36R
    
    Activity_38R = Weight37R_38R * Output_37R + Weight38R_38R * Output_38R
    Output_38R = (math.exp(2*Activity_38R)-1)/(math.exp(2*Activity_38R)+1)

    Output_38Ra = Output_38R - Output_37R
    
    Activity_39R = Weight38R_39R * Output_38R + Weight39R_39R * Output_39R
    Output_39R = (math.exp(2*Activity_39R)-1)/(math.exp(2*Activity_39R)+1)

    Output_39Ra = Output_39R - Output_38R
    
    Activity_40R = Weight39R_40R * Output_39R + Weight40R_40R * Output_40R
    Output_40R = (math.exp(2*Activity_40R)-1)/(math.exp(2*Activity_40R)+1)

    Output_40Ra = Output_40R - Output_39R
    
    Activity_41R = Weight40R_41R * Output_40R + Weight41R_41R * Output_41R
    Output_41R = (math.exp(2*Activity_41R)-1)/(math.exp(2*Activity_41R)+1)

    Output_41Ra = Output_41R - Output_40R
    
    Activity_42R = Weight41R_42R * Output_41R + Weight42R_42R * Output_42R
    Output_42R = (math.exp(2*Activity_42R)-1)/(math.exp(2*Activity_42R)+1)

    Output_42Ra = Output_42R - Output_41R
    
    Activity_43R = Weight42R_43R * Output_42R + Weight43R_43R * Output_43R
    Output_43R = (math.exp(2*Activity_43R)-1)/(math.exp(2*Activity_43R)+1)

    Output_43Ra = Output_43R - Output_42R
    
    Activity_44R = Weight43R_44R * Output_43R + Weight44R_44R * Output_44R
    Output_44R = (math.exp(2*Activity_44R)-1)/(math.exp(2*Activity_44R)+1)

    Output_44Ra = Output_44R - Output_43R
    
    Activity_45R = Weight44R_45R * Output_44R + Weight45R_45R * Output_45R
    Output_45R = (math.exp(2*Activity_45R)-1)/(math.exp(2*Activity_45R)+1)

    Output_45Ra = Output_45R - Output_44R
    
    Activity_46R = Weight45R_46R * Output_45R + Weight46R_46R * Output_46R
    Output_46R = (math.exp(2*Activity_46R)-1)/(math.exp(2*Activity_46R)+1)

    Output_46Ra = Output_46R - Output_45R
    
    Activity_47R = Weight46R_47R * Output_46R + Weight47R_47R * Output_47R
    Output_47R = (math.exp(2*Activity_47R)-1)/(math.exp(2*Activity_47R)+1)

    Output_47Ra = Output_47R - Output_46R
    
    Activity_48R = Weight47R_48R * Output_47R + Weight48R_48R * Output_48R
    Output_48R = (math.exp(2*Activity_48R)-1)/(math.exp(2*Activity_48R)+1)

    Output_48Ra = Output_48R - Output_47R
    
    Activity_49R = Weight48R_49R * Output_48R + Weight49R_49R * Output_49R
    Output_49R = (math.exp(2*Activity_49R)-1)/(math.exp(2*Activity_49R)+1)

    Output_49Ra = Output_49R - Output_48R

    Activity_50R = Weight49R_50R * Output_49R + Weight50R_50R * Output_50R
    Output_50R = (math.exp(2*Activity_50R)-1)/(math.exp(2*Activity_50R)+1)

    Output_50Ra = Output_50R - Output_49R
    
    Activity_51R = Weight50R_51R * Output_50R + Weight51R_51R * Output_51R
    Output_51R = (math.exp(2*Activity_51R)-1)/(math.exp(2*Activity_51R)+1)

    Output_51Ra = Output_51R - Output_50R
    
    Activity_52R = Weight51R_52R * Output_51R + Weight52R_52R * Output_52R
    Output_52R = (math.exp(2*Activity_52R)-1)/(math.exp(2*Activity_52R)+1)

    Output_52Ra = Output_52R - Output_51R
    
    Activity_53R = Weight52R_53R * Output_52R + Weight53R_53R * Output_53R
    Output_53R = (math.exp(2*Activity_53R)-1)/(math.exp(2*Activity_53R)+1)

    Output_53Ra = Output_53R - Output_52R
    
    Activity_54R = Weight53R_54R * Output_53R + Weight54R_54R * Output_54R
    Output_54R = (math.exp(2*Activity_54R)-1)/(math.exp(2*Activity_54R)+1)

    Output_54Ra = Output_54R - Output_53R
    
    Activity_55R = Weight54R_55R * Output_54R + Weight55R_55R * Output_55R
    Output_55R = (math.exp(2*Activity_55R)-1)/(math.exp(2*Activity_55R)+1)

    Output_55Ra = Output_55R - Output_54R
    
    Activity_56R = Weight55R_56R * Output_55R + Weight56R_56R * Output_56R
    Output_56R = (math.exp(2*Activity_56R)-1)/(math.exp(2*Activity_56R)+1)

    Output_56Ra = Output_56R - Output_55R
    
    Activity_57R = Weight56R_57R * Output_56R + Weight57R_57R * Output_57R
    Output_57R = (math.exp(2*Activity_57R)-1)/(math.exp(2*Activity_57R)+1)

    Output_57Ra = Output_57R - Output_56R
    
    Activity_58R = Weight57R_58R * Output_57R + Weight58R_58R * Output_58R
    Output_58R = (math.exp(2*Activity_58R)-1)/(math.exp(2*Activity_58R)+1)

    Output_58Ra = Output_58R - Output_57R
    
    Activity_59R = Weight58R_59R * Output_58R + Weight59R_59R * Output_59R
    Output_59R = (math.exp(2*Activity_59R)-1)/(math.exp(2*Activity_59R)+1)

    Output_59Ra = Output_59R - Output_58R

    Activity_60R = Weight59R_60R * Output_59R + Weight60R_60R * Output_60R
    Output_60R = (math.exp(2*Activity_60R)-1)/(math.exp(2*Activity_60R)+1)

    Output_60Ra = Output_60R - Output_59R
    
    Activity_61R = Weight60R_61R * Output_60R + Weight61R_61R * Output_61R
    Output_61R = (math.exp(2*Activity_61R)-1)/(math.exp(2*Activity_61R)+1)

    Output_61Ra = Output_61R - Output_60R
    
    Activity_62R = Weight61R_62R * Output_61R + Weight62R_62R * Output_62R
    Output_62R = (math.exp(2*Activity_62R)-1)/(math.exp(2*Activity_62R)+1)

    Output_62Ra = Output_62R - Output_61R
    
    Activity_63R = Weight62R_63R * Output_62R + Weight63R_63R * Output_63R
    Output_63R = (math.exp(2*Activity_63R)-1)/(math.exp(2*Activity_63R)+1)

    Output_63Ra = Output_63R - Output_62R
    
    Activity_64R = Weight63R_64R * Output_63R + Weight64R_64R * Output_64R
    Output_64R = (math.exp(2*Activity_64R)-1)/(math.exp(2*Activity_64R)+1)

    Output_64Ra = Output_64R - Output_63R

    Activity_65R = Weight64R_65R * Output_64R + Weight65R_65R * Output_65R
    Output_65R = (math.exp(2*Activity_65R)-1)/(math.exp(2*Activity_65R)+1)

    Output_65Ra = Output_65R - Output_64R
    
    Activity_66R = Weight65R_66R * Output_65R + Weight66R_66R * Output_66R
    Output_66R = (math.exp(2*Activity_66R)-1)/(math.exp(2*Activity_66R)+1)

    Output_66Ra = Output_66R - Output_65R
    
    Activity_67R = Weight66R_67R * Output_66R + Weight67R_67R * Output_67R
    Output_67R = (math.exp(2*Activity_67R)-1)/(math.exp(2*Activity_67R)+1)

    Output_67Ra = Output_67R - Output_66R
    
    Activity_68R = Weight67R_68R * Output_67R + Weight68R_68R * Output_68R
    Output_68R = (math.exp(2*Activity_68R)-1)/(math.exp(2*Activity_68R)+1)

    Output_68Ra = Output_68R - Output_67R
    
    Activity_69R = Weight68R_69R * Output_68R + Weight69R_69R * Output_69R
    Output_69R = (math.exp(2*Activity_69R)-1)/(math.exp(2*Activity_69R)+1)

    Output_69Ra = Output_69R - Output_68R

    Activity_70R = Weight69R_70R * Output_69R + Weight70R_70R * Output_70R
    Output_70R = (math.exp(2*Activity_70R)-1)/(math.exp(2*Activity_70R)+1)

    Output_70Ra = Output_70R - Output_69R
    
    Activity_71R = Weight70R_71R * Output_70R + Weight71R_71R * Output_71R
    Output_71R = (math.exp(2*Activity_71R)-1)/(math.exp(2*Activity_71R)+1)

    Output_71Ra = Output_71R - Output_70R

    Activity_72R = Weight71R_72R * Output_71R + Weight72R_72R * Output_72R
    Output_72R = (math.exp(2*Activity_72R)-1)/(math.exp(2*Activity_72R)+1)

    Output_72Ra = Output_72R - Output_71R
    
    Activity_73R = Weight72R_73R * Output_72R + Weight73R_73R * Output_73R
    Output_73R = (math.exp(2*Activity_73R)-1)/(math.exp(2*Activity_73R)+1)

    Output_73Ra = Output_73R - Output_72R
    
    Activity_74R = Weight73R_74R * Output_73R + Weight74R_74R * Output_74R
    Output_74R = (math.exp(2*Activity_74R)-1)/(math.exp(2*Activity_74R)+1)

    Output_74Ra = Output_74R - Output_73R
    
    Activity_75R = Weight74R_75R * Output_74R + Weight75R_75R * Output_75R
    Output_75R = (math.exp(2*Activity_75R)-1)/(math.exp(2*Activity_75R)+1)

    Output_75Ra = Output_75R - Output_74R
    
    Activity_76R = Weight75R_76R * Output_75R + Weight76R_76R * Output_76R
    Output_76R = (math.exp(2*Activity_76R)-1)/(math.exp(2*Activity_76R)+1)

    Output_76Ra = Output_76R - Output_75R
    
    Activity_77R = Weight76R_77R * Output_76R + Weight77R_77R * Output_77R
    Output_77R = (math.exp(2*Activity_77R)-1)/(math.exp(2*Activity_77R)+1)

    Output_77Ra = Output_77R - Output_76R
    
    Activity_78R = Weight77R_78R * Output_77R + Weight78R_78R * Output_78R
    Output_78R = (math.exp(2*Activity_78R)-1)/(math.exp(2*Activity_78R)+1)

    Output_78Ra = Output_78R - Output_77R

    Activity_79R = Weight78R_79R * Output_78R + Weight79R_79R * Output_79R
    Output_79R = (math.exp(2*Activity_79R)-1)/(math.exp(2*Activity_79R)+1)

    Output_79Ra = Output_79R - Output_78R
     
    Activity_80R = Weight79R_80R * Output_79R + Weight80R_80R * Output_80R
    Output_80R = (math.exp(2*Activity_80R)-1)/(math.exp(2*Activity_80R)+1)

    Output_80Ra = Output_80R - Output_79R
    
    Activity_81R = Weight80R_81R * Output_80R + Weight81R_81R * Output_81R
    Output_81R = (math.exp(2*Activity_81R)-1)/(math.exp(2*Activity_81R)+1)

    Output_81Ra = Output_81R - Output_80R

    Activity_82R = Weight81R_82R * Output_81R + Weight82R_82R * Output_82R
    Output_82R = (math.exp(2*Activity_82R)-1)/(math.exp(2*Activity_82R)+1)
    
    Activity_83R = Weight82R_83R * Output_82R + Weight83R_83R * Output_83R
    Output_83R = (math.exp(2*Activity_83R)-1)/(math.exp(2*Activity_83R)+1)
    
    Activity_84R = Weight83R_84R * Output_83R + Weight84R_84R * Output_84R
    Output_84R = (math.exp(2*Activity_84R)-1)/(math.exp(2*Activity_84R)+1)
    
    Activity_85R = Weight84R_85R * Output_84R + Weight85R_85R * Output_85R
    Output_85R = (math.exp(2*Activity_85R)-1)/(math.exp(2*Activity_85R)+1)
    
    Activity_86R = Weight85R_86R * Output_85R + Weight86R_86R * Output_86R
    Output_86R = (math.exp(2*Activity_86R)-1)/(math.exp(2*Activity_86R)+1)
    
    Activity_87R = Weight86R_87R * Output_86R + Weight87R_87R * Output_87R
    Output_87R = (math.exp(2*Activity_87R)-1)/(math.exp(2*Activity_87R)+1)

    Activity_88R = Weight87R_88R * Output_87R + Weight88R_88R * Output_88R
    Output_88R = (math.exp(2*Activity_88R)-1)/(math.exp(2*Activity_88R)+1)

    Activity_89R = Weight88R_89R * Output_88R + Weight89R_89R * Output_89R
    Output_89R = (math.exp(2*Activity_89R)-1)/(math.exp(2*Activity_89R)+1)
    
    Activity_90R = Weight89R_90R * Output_89R + Weight90R_90R * Output_90R
    Output_90R = (math.exp(2*Activity_90R)-1)/(math.exp(2*Activity_90R)+1)

    Output_90Ra = Output_90R - Output_89R
    
    Activity_91R = Weight90R_91R * Output_90R + Weight91R_91R * Output_91R
    Output_91R = (math.exp(2*Activity_91R)-1)/(math.exp(2*Activity_91R)+1)
    
    Activity_92R = Weight91R_92R * Output_91R + Weight92R_92R * Output_92R
    Output_92R = (math.exp(2*Activity_92R)-1)/(math.exp(2*Activity_92R)+1)
    
    Activity_93R = Weight92R_93R * Output_92R + Weight93R_93R * Output_93R
    Output_93R = (math.exp(2*Activity_93R)-1)/(math.exp(2*Activity_93R)+1)
    
    Activity_94R = Weight93R_94R * Output_93R + Weight94R_94R * Output_94R
    Output_94R = (math.exp(2*Activity_94R)-1)/(math.exp(2*Activity_94R)+1)
    
    Activity_95R = Weight94R_95R * Output_94R + Weight95R_95R * Output_95R
    Output_95R = (math.exp(2*Activity_95R)-1)/(math.exp(2*Activity_95R)+1)
    
    Activity_96R = Weight95R_96R * Output_95R + Weight96R_96R * Output_96R
    Output_96R = (math.exp(2*Activity_96R)-1)/(math.exp(2*Activity_96R)+1)
    
    Activity_97R = Weight96R_97R * Output_96R + Weight97R_97R * Output_97R
    Output_97R = (math.exp(2*Activity_97R)-1)/(math.exp(2*Activity_97R)+1)

    Activity_98R = Weight97R_98R * Output_97R + Weight98R_98R * Output_98R
    Output_98R = (math.exp(2*Activity_98R)-1)/(math.exp(2*Activity_98R)+1)

    Activity_99R = Weight98R_99R * Output_98R + Weight99R_99R * Output_99R
    Output_99R = (math.exp(2*Activity_99R)-1)/(math.exp(2*Activity_99R)+1)
    
    Activity_100R = Weight99R_100R * Output_99R + Weight100R_100R * Output_100R
    Output_100R = (math.exp(2*Activity_100R)-1)/(math.exp(2*Activity_100R)+1)
    
    Activity_101R = Weight100R_101R * Output_100R + Weight101R_101R * Output_101R
    Output_101R = (math.exp(2*Activity_101R)-1)/(math.exp(2*Activity_101R)+1)
    
    Activity_102R = Weight101R_102R * Output_101R + Weight102R_102R * Output_102R
    Output_102R = (math.exp(2*Activity_102R)-1)/(math.exp(2*Activity_102R)+1)
    
    Activity_103R = Weight102R_103R * Output_102R + Weight103R_103R * Output_103R
    Output_103R = (math.exp(2*Activity_103R)-1)/(math.exp(2*Activity_103R)+1)
    
    Activity_104R = Weight103R_104R * Output_103R + Weight104R_104R * Output_104R
    Output_104R = (math.exp(2*Activity_104R)-1)/(math.exp(2*Activity_104R)+1)
    
    Activity_105R = Weight104R_105R * Output_104R + Weight105R_105R * Output_105R
    Output_105R = (math.exp(2*Activity_105R)-1)/(math.exp(2*Activity_105R)+1)
    
    Activity_106R = Weight105R_106R * Output_105R + Weight106R_106R * Output_106R
    Output_106R = (math.exp(2*Activity_106R)-1)/(math.exp(2*Activity_106R)+1)
    
    Activity_107R = Weight106R_107R * Output_106R + Weight107R_107R * Output_107R
    Output_107R = (math.exp(2*Activity_107R)-1)/(math.exp(2*Activity_107R)+1)

    Activity_108R = Weight107R_108R * Output_107R + Weight108R_108R * Output_108R
    Output_108R = (math.exp(2*Activity_108R)-1)/(math.exp(2*Activity_108R)+1)

    Activity_109R = Weight108R_109R * Output_108R + Weight109R_109R * Output_109R
    Output_109R = (math.exp(2*Activity_109R)-1)/(math.exp(2*Activity_109R)+1)
    
    Activity_110R = Weight109R_110R * Output_109R + Weight110R_110R * Output_110R
    Output_110R = (math.exp(2*Activity_110R)-1)/(math.exp(2*Activity_110R)+1)

    Output_110Ra = Output_110R - Output_109R
    
    Activity_111R = Weight110R_111R * Output_110R + Weight111R_111R * Output_111R
    Output_111R = (math.exp(2*Activity_111R)-1)/(math.exp(2*Activity_111R)+1)
    
    Activity_112R = Weight111R_112R * Output_111R + Weight112R_112R * Output_112R
    Output_112R = (math.exp(2*Activity_112R)-1)/(math.exp(2*Activity_112R)+1)
    
    Activity_113R = Weight112R_113R * Output_112R + Weight113R_113R * Output_113R
    Output_113R = (math.exp(2*Activity_113R)-1)/(math.exp(2*Activity_113R)+1)
    
    Activity_114R = Weight113R_114R * Output_113R + Weight114R_114R * Output_114R
    Output_114R = (math.exp(2*Activity_114R)-1)/(math.exp(2*Activity_114R)+1)
    
    Activity_115R = Weight114R_115R * Output_114R + Weight115R_115R * Output_115R
    Output_115R = (math.exp(2*Activity_115R)-1)/(math.exp(2*Activity_115R)+1)
    
    Activity_116R = Weight115R_116R * Output_115R + Weight116R_116R * Output_116R
    Output_116R = (math.exp(2*Activity_116R)-1)/(math.exp(2*Activity_116R)+1)
    
    Activity_117R = Weight116R_117R * Output_116R + Weight117R_117R * Output_117R
    Output_117R = (math.exp(2*Activity_117R)-1)/(math.exp(2*Activity_117R)+1)

    Activity_118R = Weight117R_118R * Output_117R + Weight118R_118R * Output_118R
    Output_118R = (math.exp(2*Activity_118R)-1)/(math.exp(2*Activity_118R)+1)

    Activity_119R = Weight118R_119R * Output_118R + Weight119R_119R * Output_119R
    Output_119R = (math.exp(2*Activity_119R)-1)/(math.exp(2*Activity_119R)+1)
    
    Activity_120R = Weight119R_120R * Output_119R + Weight120R_120R * Output_120R
    Output_120R = (math.exp(2*Activity_120R)-1)/(math.exp(2*Activity_120R)+1)
    
    Activity_121R = Weight120R_121R * Output_120R + Weight121R_121R * Output_121R
    Output_121R = (math.exp(2*Activity_121R)-1)/(math.exp(2*Activity_121R)+1)
    
    Activity_122R = Weight121R_122R * Output_121R + Weight122R_122R * Output_122R
    Output_122R = (math.exp(2*Activity_122R)-1)/(math.exp(2*Activity_122R)+1)
    
    Activity_123R = Weight122R_123R * Output_122R + Weight123R_123R * Output_123R
    Output_123R = (math.exp(2*Activity_123R)-1)/(math.exp(2*Activity_123R)+1)

    Activity_124R = Weight123R_124R * Output_123R + Weight124R_124R * Output_124R
    Output_124R = (math.exp(2*Activity_124R)-1)/(math.exp(2*Activity_124R)+1)
    
    Activity_125R = Weight124R_125R * Output_124R + Weight125R_125R * Output_125R
    Output_125R = (math.exp(2*Activity_125R)-1)/(math.exp(2*Activity_125R)+1)
    
    Activity_126R = Weight125R_126R * Output_125R + Weight126R_126R * Output_126R
    Output_126R = (math.exp(2*Activity_126R)-1)/(math.exp(2*Activity_126R)+1)
    
    Activity_127R = Weight126R_127R * Output_126R + Weight127R_127R * Output_127R
    Output_127R = (math.exp(2*Activity_127R)-1)/(math.exp(2*Activity_127R)+1)

    Activity_128R = Weight127R_128R * Output_127R + Weight128R_128R * Output_128R
    Output_128R = (math.exp(2*Activity_128R)-1)/(math.exp(2*Activity_128R)+1)

    Activity_129R = Weight128R_129R * Output_128R + Weight129R_129R * Output_129R
    Output_129R = (math.exp(2*Activity_129R)-1)/(math.exp(2*Activity_129R)+1)
    
    Activity_130R = Weight129R_130R * Output_129R + Weight130R_130R * Output_130R
    Output_130R = (math.exp(2*Activity_130R)-1)/(math.exp(2*Activity_130R)+1)

    Output_130Ra = Output_130R - Output_129R
    
    Activity_131R = Weight130R_131R * Output_130R + Weight131R_131R * Output_131R
    Output_131R = (math.exp(2*Activity_131R)-1)/(math.exp(2*Activity_131R)+1)


    --vertbend joint controllers
    vertbend0_control = ((Output_1 - Output_1R) / 2) * 0.2
    vertbend1_control = ((Output_11 - Output_11R) / 2) * 0.2
    vertbend2_control = ((Output_21 - Output_21R) / 2) * 0.2 
    vertbend3_control = ((Output_31 - Output_31R) / 2) * 0.2 
    vertbend4_control = ((Output_41 - Output_41R) / 2) * 0.2 
    vertbend5_control = ((Output_51 - Output_51R) / 2) * 0.2 
    vertbend6_control = ((Output_61 - Output_61R) / 2) * 0.2 
    vertbend7_control = ((Output_71 - Output_71R) / 2) * 0.2 
    vertbend8_control = ((Output_81 - Output_81R) / 2) * 0.2 
    vertbend9_control = ((Output_91 - Output_91R) / 2) * 0.2 
    vertbend10_control = ((Output_101 - Output_101R) / 2) * 0.2 
    vertbend11_control = ((Output_111 - Output_111R) / 2) * 0.2 
    vertbend12_control = ((Output_121 - Output_121R) / 2) * 0.2 
    vertbend13_control = ((Output_131 - Output_131R) / 2) * 0.2 
    
    file:write( string.format("%f\t",vertbend0_control) )
    file:write( string.format("%f\t",vertbend1_control) )
    file:write( string.format("%f\t",vertbend2_control) )
    file:write( string.format("%f\t",vertbend3_control) )
    file:write( string.format("%f\t",vertbend4_control) )
    file:write( string.format("%f\t",vertbend5_control) )
    file:write( string.format("%f\t",vertbend6_control) )
    file:write( string.format("%f\t",vertbend7_control) )
    file:write( string.format("%f\t",vertbend8_control) )
    file:write( string.format("%f\t",vertbend9_control) )
    file:write( string.format("%f\t",vertbend10_control) )
    file:write( string.format("%f\t",vertbend11_control) )
    file:write( string.format("%f\t",vertbend12_control) )
    file:write( string.format("%f\t",vertbend13_control) )
    
    
    --Position controls
    
    sim.setJointTargetPosition(Seg0_vertbend, vertbend0_control)
    bodyjoint_0 = sim.getJointTargetPosition(Seg0_vertbend)

    sim.setJointTargetPosition(Seg1_vertbend, vertbend1_control)
    bodyjoint_1 = sim.getJointTargetPosition(Seg1_vertbend)
    
    sim.setJointTargetPosition(Seg2_vertbend, vertbend2_control)
    bodyjoint_2 = sim.getJointTargetPosition(Seg2_vertbend)
    
    sim.setJointTargetPosition(Seg3_vertbend, vertbend3_control)
    bodyjoint_3 = sim.getJointTargetPosition(Seg3_vertbend)
    
    sim.setJointTargetPosition(Seg4_vertbend, vertbend4_control)
    bodyjoint_4 = sim.getJointTargetPosition(Seg4_vertbend)
    
    sim.setJointTargetPosition(Seg5_vertbend, vertbend5_control)
    bodyjoint_5 = sim.getJointTargetPosition(Seg5_vertbend)
    
    sim.setJointTargetPosition(Seg6_vertbend, vertbend6_control)
    bodyjoint_6 = sim.getJointTargetPosition(Seg6_vertbend)
    
    sim.setJointTargetPosition(Seg7_vertbend, vertbend7_control)
    bodyjoint_7 = sim.getJointTargetPosition(Seg7_vertbend)
    
    sim.setJointTargetPosition(Seg8_vertbend, vertbend8_control)
    bodyjoint_8 = sim.getJointTargetPosition(Seg8_vertbend)

    sim.setJointTargetPosition(Seg9_vertbend, vertbend9_control)
    bodyjoint_9 = sim.getJointTargetPosition(Seg9_vertbend)

    sim.setJointTargetPosition(Seg10_vertbend, vertbend10_control)
    bodyjoint_10 = sim.getJointTargetPosition(Seg10_vertbend)

    sim.setJointTargetPosition(Seg11_vertbend, vertbend11_control)
    bodyjoint_11 = sim.getJointTargetPosition(Seg11_vertbend)
    
    sim.setJointTargetPosition(Seg12_vertbend, vertbend12_control)
    bodyjoint_12 = sim.getJointTargetPosition(Seg12_vertbend)

    sim.setJointTargetPosition(Seg13_vertbend, vertbend13_control)
    bodyjoint_13 = sim.getJointTargetPosition(Seg13_vertbend)
    
    --Obtain bodjoint orientations

    bod_orient0 = sim.getObjectOrientation(Dummy_seg0, -1)
    bod_orient1 = sim.getObjectOrientation(Dummy_seg1, -1)
    bod_orient2 = sim.getObjectOrientation(Dummy_seg2, -1)
    bod_orient3 = sim.getObjectOrientation(Dummy_seg3, -1)
    bod_orient4 = sim.getObjectOrientation(Dummy_seg4, -1)
    bod_orient5 = sim.getObjectOrientation(Dummy_seg5, -1)
    bod_orient6 = sim.getObjectOrientation(Dummy_seg6, -1)
    bod_orient7 = sim.getObjectOrientation(Dummy_seg7, -1)
    bod_orient8 = sim.getObjectOrientation(Dummy_seg8, -1)
    bod_orient9 = sim.getObjectOrientation(Dummy_seg9, -1)
    bod_orient10 = sim.getObjectOrientation(Dummy_seg10, -1)
    bod_orient11 = sim.getObjectOrientation(Dummy_seg11, -1)
    bod_orient12 = sim.getObjectOrientation(Dummy_seg12, -1)
    bod_orient13 = sim.getObjectOrientation(Dummy_seg13, -1)
    bod_orient14 = sim.getObjectOrientation(Dummy_seg14, -1)

    file:write( string.format("%f\t",bod_orient0[3]) )
    file:write( string.format("%f\t",bod_orient1[3]) )
    file:write( string.format("%f\t",bod_orient2[3]) )
    file:write( string.format("%f\t",bod_orient3[3]) )
    file:write( string.format("%f\t",bod_orient4[3]) )
    file:write( string.format("%f\t",bod_orient5[3]) )
    file:write( string.format("%f\t",bod_orient6[3]) )
    file:write( string.format("%f\t",bod_orient7[3]) )
    file:write( string.format("%f\t",bod_orient8[3]) )
    file:write( string.format("%f\t",bod_orient9[3]) )
    file:write( string.format("%f\t",bod_orient10[3]) )
    file:write( string.format("%f\t",bod_orient11[3]) )
    file:write( string.format("%f\t",bod_orient12[3]) )
    file:write( string.format("%f\t",bod_orient13[3]) )
    file:write( string.format("%f\t",bod_orient14[3]) )

    --Obtain bodjoint positions 
    bj0_position = sim.getObjectPosition(Seg_0, -1)
    bj1_position = sim.getObjectPosition(Seg_1, -1)
    bj2_position = sim.getObjectPosition(Seg_2, -1)
    bj3_position = sim.getObjectPosition(Seg_3, -1)
    bj4_position = sim.getObjectPosition(Seg_4, -1)
    bj5_position = sim.getObjectPosition(Seg_5, -1)
    bj6_position = sim.getObjectPosition(Seg_6, -1)
    bj7_position = sim.getObjectPosition(Seg_7, -1)
    bj8_position = sim.getObjectPosition(Seg_8, -1)
    bj9_position = sim.getObjectPosition(Seg_9, -1)
    bj10_position = sim.getObjectPosition(Seg_10, -1)
    bj11_position = sim.getObjectPosition(Seg_11, -1)
    bj12_position = sim.getObjectPosition(Seg_12, -1)
    bj13_position = sim.getObjectPosition(Seg_13, -1)
    bj14_position = sim.getObjectPosition(Seg_14, -1)

    file:write( string.format("%f\t",bj0_position[2]) )
    file:write( string.format("%f\t",bj1_position[2]) )
    file:write( string.format("%f\t",bj2_position[2]) )
    file:write( string.format("%f\t",bj3_position[2]) )
    file:write( string.format("%f\t",bj4_position[2]) )
    file:write( string.format("%f\t",bj5_position[2]) )
    file:write( string.format("%f\t",bj6_position[2]) )
    file:write( string.format("%f\t",bj7_position[2]) )
    file:write( string.format("%f\t",bj8_position[2]) )
    file:write( string.format("%f\t",bj9_position[2]) )
    file:write( string.format("%f\t",bj10_position[2]) )
    file:write( string.format("%f\t",bj11_position[2]) )
    file:write( string.format("%f\t",bj12_position[2]) )
    file:write( string.format("%f\t",bj13_position[2]) )
    file:write( string.format("%f\t",bj14_position[2]) )
    
    file:write( string.format("%f\t",cx1_joint_pos) )
    file:write( string.format("%f\t",cx2_joint_pos) )
    file:write( string.format("%f\t",cx3_joint_pos) )
    file:write( string.format("%f\t",cx4_joint_pos) )
    file:write( string.format("%f\t",cx5_joint_pos) )
    file:write( string.format("%f\t",cx6_joint_pos) )
    file:write( string.format("%f\t",cx17_joint_pos) )
    file:write( string.format("%f\t",cx18_joint_pos) )
    file:write( string.format("%f\t",cx19_joint_pos) )
    file:write( string.format("%f\t",cx20_joint_pos) )
    file:write( string.format("%f\t",cx21_joint_pos) )
    file:write( string.format("%f\t",cx22_joint_pos) )
    file:write( string.format("%f\t",cx23_joint_pos) )
    file:write( string.format("%f\t",cx24_joint_pos) )

    file:write( string.format("%f\t",cx7_joint_pos) )
    file:write( string.format("%f\t",cx8_joint_pos) )
    file:write( string.format("%f\t",cx9_joint_pos) )
    file:write( string.format("%f\t",cx10_joint_pos) )
    file:write( string.format("%f\t",cx11_joint_pos) )
    file:write( string.format("%f\t",cx12_joint_pos) )
    file:write( string.format("%f\t",cx13_joint_pos) )
    file:write( string.format("%f\t",cx15_joint_pos) )
    file:write( string.format("%f\t",cx14_joint_pos) )
    file:write( string.format("%f\t",cx16_joint_pos) )
    file:write( string.format("%f\t",cx25_joint_pos) )
    file:write( string.format("%f\t",cx26_joint_pos) )
    file:write( string.format("%f\t",cx27_joint_pos) )
    file:write( string.format("%f\t",cx28_joint_pos) )
    file:write( string.format("%f\t",cx29_joint_pos) )

end

    



function sysCall_sensing()

    --sim.setGraphStreamValue(graph, tr0_left, 180 * sim.getJointVelocity(cx0_joint)/math.pi)
    --sim.setGraphStreamValue(graph, tr0_right, 180 * sim.getJointVelocity(cx7_joint)/math.pi)

    --sim.setGraphStreamValue(graphTwo, tr0_left, 180 * sim.getJointVelocity(cx0_joint)/math.pi)
    --sim.setGraphStreamValue(graphTwo, pf0_left, 180 * sim.getJointVelocity(pf_0)/math.pi)

    --sim.setGraphStreamValue(graphThree, tr0_right, 180 * sim.getJointVelocity(cx7_joint)/math.pi)
    --sim.setGraphStreamValue(graphThree, pf0_right, 180 * sim.getJointVelocity(pf_7)/math.pi)

    --sim.setGraphStreamValue(graphFour, pf0_left, 180 * sim.getJointVelocity(pf_0)/math.pi)
    --sim.setGraphStreamValue(graphFour, pf0_right, 180 * sim.getJointVelocity(pf_7)/math.pi)

    -- sim.setGraphStreamValue(graphFive, tr0_left, 180 * sim.getJointVelocity(cx0_joint)/math.pi)
    -- sim.setGraphStreamValue(graphFive, tr0_right, 180 * sim.getJointVelocity(cx7_joint)/math.pi)

    -- Reading the force sensors at each segment
    --Seg_0
    P0_forcesense, force_0, torque = sim.readForceSensor(P0_force)
    file:write( string.format("%f\t",force_0[3]) )
    --print(force_0[3])
    P7_forcesense, force_7, torque = sim.readForceSensor(P7_force)
    file:write( string.format("%f\t",force_7[3]) )

    --Seg_1
    P1_forcesense, force_1, torque = sim.readForceSensor(P1_force)
    file:write( string.format("%f\t",force_1[3]) )
    P8_forcesense, force_8, torque = sim.readForceSensor(P8_force)
    file:write( string.format("%f\t",force_8[3]) )

    --Seg_2
    P2_forcesense, force_2, torque = sim.readForceSensor(P2_force)
    file:write( string.format("%f\t",force_2[3]) )
    P9_forcesense, force_9, torque = sim.readForceSensor(P9_force)
    file:write( string.format("%f\t",force_9[3]) )

    --Seg_3
    P3_forcesense, force_3, torque = sim.readForceSensor(P3_force)
    file:write( string.format("%f\t",force_3[3]) )
    P10_forcesense, force_10, torque = sim.readForceSensor(P10_force)
    file:write( string.format("%f\t",force_10[3]) )

    --Seg_4
    P4_forcesense, force_4, torque = sim.readForceSensor(P4_force)
    file:write( string.format("%f\t",force_4[3]) )
    P11_forcesense, force_11, torque = sim.readForceSensor(P11_force)
    file:write( string.format("%f\t",force_11[3]) )

    --Seg_5
    P5_forcesense, force_5, torque = sim.readForceSensor(P5_force)
    file:write( string.format("%f\t",force_5[3]) )
    P12_forcesense, force_12, torque = sim.readForceSensor(P12_force)
    file:write( string.format("%f\t",force_12[3]) )

    --Seg_6
    P6_forcesense, force_6, torque = sim.readForceSensor(P6_force)
    file:write( string.format("%f\t",force_6[3]) )
    P13_forcesense, force_13, torque = sim.readForceSensor(P13_force)
    file:write( string.format("%f\t",force_13[3]) )
    
    --Seg_7
    P17_forcesense, force_17, torque = sim.readForceSensor(P17_force)
    file:write( string.format("%f\t",force_17[3]) )
    P15_forcesense, force_15, torque = sim.readForceSensor(P15_force)
    file:write( string.format("%f\t",force_15[3]) )
    
    --Seg_8
    P18_forcesense, force_18, torque = sim.readForceSensor(P18_force)
    file:write( string.format("%f\t",force_18[3]) )
    P14_forcesense, force_14, torque = sim.readForceSensor(P14_force)
    file:write( string.format("%f\t",force_14[3]) )
    
    --Seg_9
    P19_forcesense, force_19, torque = sim.readForceSensor(P19_force)
    file:write( string.format("%f\t",force_19[3]) )
    P16_forcesense, force_16, torque = sim.readForceSensor(P16_force)
    file:write( string.format("%f\t",force_16[3]) )

    --Seg_10
    P20_forcesense, force_20, torque = sim.readForceSensor(P20_force)
    file:write( string.format("%f\t",force_20[3]) )
    P25_forcesense, force_25, torque = sim.readForceSensor(P25_force)
    file:write( string.format("%f\t",force_25[3]) )

    --Seg_11
    P21_forcesense, force_21, torque = sim.readForceSensor(P21_force)
    file:write( string.format("%f\t",force_21[3]) )
    P26_forcesense, force_26, torque = sim.readForceSensor(P26_force)
    file:write( string.format("%f\t",force_26[3]) )

    --Seg_12
    P22_forcesense, force_22, torque = sim.readForceSensor(P22_force)
    file:write( string.format("%f\t",force_22[3]) )
    P27_forcesense, force_27, torque = sim.readForceSensor(P27_force)
    file:write( string.format("%f\t",force_27[3]) )

    --Seg_13
    P23_forcesense, force_23, torque = sim.readForceSensor(P23_force)
    file:write( string.format("%f\t",force_23[3]) )
    P28_forcesense, force_28, torque = sim.readForceSensor(P28_force)
    file:write( string.format("%f\t",force_28[3]) )

    --Seg_14
    P24_forcesense, force_24, torque = sim.readForceSensor(P24_force)
    file:write( string.format("%f\t",force_24[3]) )
    P29_forcesense, force_29, torque = sim.readForceSensor(P29_force)
    file:write( string.format("%f\t",force_29[3]) )

 

    --Foot contacts 
    Foot_0_contact = sim.getContactInfo(sim.handle_all, Foot_0, 1)
    Foot_1_contact = sim.getContactInfo(sim.handle_all, Foot_1, 1)
    Foot_2_contact = sim.getContactInfo(sim.handle_all, Foot_2, 1)
    Foot_3_contact = sim.getContactInfo(sim.handle_all, Foot_3, 1)
    Foot_4_contact = sim.getContactInfo(sim.handle_all, Foot_4, 1)
    Foot_5_contact = sim.getContactInfo(sim.handle_all, Foot_5, 1)
    Foot_6_contact = sim.getContactInfo(sim.handle_all, Foot_6, 1)
    Foot_17_contact = sim.getContactInfo(sim.handle_all, Foot_17, 1)
    Foot_18_contact = sim.getContactInfo(sim.handle_all, Foot_18, 1)
    Foot_19_contact = sim.getContactInfo(sim.handle_all, Foot_19, 1)
    Foot_20_contact = sim.getContactInfo(sim.handle_all, Foot_20, 1)
    Foot_21_contact = sim.getContactInfo(sim.handle_all, Foot_21, 1)
    Foot_22_contact = sim.getContactInfo(sim.handle_all, Foot_22, 1)
    Foot_23_contact = sim.getContactInfo(sim.handle_all, Foot_23, 1)
    Foot_24_contact = sim.getContactInfo(sim.handle_all, Foot_24, 1)


    Foot_7_contact = sim.getContactInfo(sim.handle_all, Foot_7, 1)
    Foot_8_contact = sim.getContactInfo(sim.handle_all, Foot_8, 1)
    Foot_9_contact = sim.getContactInfo(sim.handle_all, Foot_9, 1)
    Foot_10_contact = sim.getContactInfo(sim.handle_all, Foot_10, 1)
    Foot_11_contact = sim.getContactInfo(sim.handle_all, Foot_11, 1)
    Foot_12_contact = sim.getContactInfo(sim.handle_all, Foot_12, 1)
    Foot_13_contact = sim.getContactInfo(sim.handle_all, Foot_13, 1)
    Foot_15_contact = sim.getContactInfo(sim.handle_all, Foot_15, 1)
    Foot_14_contact = sim.getContactInfo(sim.handle_all, Foot_14, 1)
    Foot_16_contact = sim.getContactInfo(sim.handle_all, Foot_16, 1)
    Foot_25_contact = sim.getContactInfo(sim.handle_all, Foot_25, 1)
    Foot_26_contact = sim.getContactInfo(sim.handle_all, Foot_26, 1)
    Foot_27_contact = sim.getContactInfo(sim.handle_all, Foot_27, 1)
    Foot_28_contact = sim.getContactInfo(sim.handle_all, Foot_28, 1)
    Foot_29_contact = sim.getContactInfo(sim.handle_all, Foot_29, 1)


    --I used these to print out foot contact. They can be ignored.
    foot_orient = sim.getObjectOrientation(Dummy_foot, -1)
    file:write( string.format("%f\t",foot_orient[3]) )

    foot_contact = sim.getContactInfo(sim.handle_all, Dummy_foot, 1)

    sysTime = sim.getSystemTime()
    file:write( string.format("%f\t",sysTime) )
    timeStep = sim.getSimulationTimeStep()
    file:write( string.format("%f\t",timeStep) )
    time = sim.getSimulationTime()
    file:write( string.format("%f\n",time) )

end

function sysCall_cleanup()
    file:close()
end

 
