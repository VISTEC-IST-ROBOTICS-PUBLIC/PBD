import open3d as o3d
import cv2
import numpy as np
import json
import time
import mediapipe as mp
import pyqtgraph as pg
import pyqtgraph.opengl as gl
from pyqtgraph.Qt import QtCore, QtWidgets
from pyqtgraph.Qt.QtGui import QFont
import pandas as pd

o3d.t.io.RealSenseSensor.list_devices()

palm_indices = [0, 1, 2, 5, 9, 13, 17]  # index of hand palm

# Load mediapipe hand detection model
mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_hands = mp.solutions.hands
hands = mp_hands.Hands(
    model_complexity=0,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.5)
connections_style = mp_drawing_styles.get_default_hand_connections_style()  # dict with (indexA, indexB):DrawingSpec(color=(128, 128, 128), thickness=3, circle_radius=2)
n_keypoints = len(connections_style.keys())
n_keypoints = 21 # hand model has 21 keypoints
viz_pos = np.empty((n_keypoints, 3))
viz_thickness = np.empty((n_keypoints))
viz_color = np.empty((n_keypoints, 4))
viz_lines = []
keypoint_pairs = []

_tail_period = 2  # period to store history (second)
tail = {'positions':[], 'viz_positions':[], 'timestamp':[]}   # hand 3D position history

# GUI States
_recording_status = False
_calibrate_camera_pose_status = False
_calibrate_robot_pose_status = False
_display_overlay = True
_start_recording_timestamp = time.time()
record_buffer = {'positions':[], 'viz_positions':[], 'timestamp':[]}   # hand 3D position recording buffer

# Prepare Rendering Window
app = pg.mkQApp("GL Hand Plot")

# Create individual 2D-plot
mw = QtWidgets.QMainWindow()
mw.setWindowTitle('Individual Position Axis Plot')
mw.resize(800, 800)
cw = QtWidgets.QWidget()
mw.setCentralWidget(cw)
l = QtWidgets.QVBoxLayout()
cw.setLayout(l)
# Create X plot
pw_x = pg.PlotWidget(name='X')  ## giving the plots names allows us to link their axes together
pw_x.setLabel('left', 'X', units='m')
pw_x.setLabel('bottom', 'Time', units='s')
pw_x.setXRange(0, _tail_period)
pw_x.setYRange(-1, 1)
p_x = pw_x.plot()
p_x.setPen((200, 200, 100))
l.addWidget(pw_x)
# Create Y plot
pw_y = pg.PlotWidget(name='Y')
pw_y.setLabel('left', 'Y', units='m')
pw_y.setLabel('bottom', 'Time', units='s')
pw_y.setXRange(0, _tail_period)
pw_y.setYRange(-1, 1)
p_y = pw_y.plot()
p_y.setPen((200, 200, 100))
l.addWidget(pw_y)
# Create Z plot
pw_z = pg.PlotWidget(name='Z')
pw_z.setLabel('left', 'Z', units='m')
pw_z.setLabel('bottom', 'Time', units='s')
pw_z.setXRange(0, _tail_period)
pw_z.setYRange(0, 2)
p_z = pw_z.plot()
p_z.setPen((200, 200, 100))
l.addWidget(pw_z)
mw.show()

# Create 3D-plot
w = gl.GLViewWidget()
w.show()
w.setWindowTitle('pyqtgraph GL Hand Plot')
w.setCameraPosition(distance=5)
w.setModelview()
# gx = gl.GLGridItem()
# gx.setSpacing(0.1, 0.1, 0.1)
# gx.setSize(1, 1, 1)
# gx.rotate(90, 0, 1, 0)
# w.addItem(gx)
# gy = gl.GLGridItem()
# gy.setSpacing(0.1, 0.1, 0.1)
# gy.setSize(1, 1, 1)
# gy.rotate(90, 1, 0, 0)
# w.addItem(gy)
gz = gl.GLGridItem()
gz.setSpacing(0.4, 0.4, 0.4)
gz.setSize(2, 2, 2)
gz.translate(0, 0, 2)
w.addItem(gz)


# Visualize Hand landmark (scatter plot)
hand_landmark_drawing_style = mp_drawing_styles.get_default_hand_landmarks_style()
for key, drawing_style in enumerate(hand_landmark_drawing_style.items()):
    i = drawing_style[0].value   # drawing style index
    color = drawing_style[1].color
    circle_radius = drawing_style[1].circle_radius
    viz_color[i] = (color[2]/255, color[1]/255, color[0]/255, 1)
    viz_thickness[i] = circle_radius / 400
sp1 = gl.GLScatterPlotItem(pos=viz_pos,
                           size=viz_thickness,
                           color=viz_color,
                           pxMode=False)
w.addItem(sp1)

# Visualize hand landmark connection (line plot)
hand_skeleton_drawing_style = mp_drawing_styles.get_default_hand_connections_style()
for key, drawing_style in enumerate(hand_skeleton_drawing_style.items()):
    print(drawing_style)
    keypoint_pair = drawing_style[0]
    keypoint_pairs.append(keypoint_pair)
    color = drawing_style[1].color
    thickness = drawing_style[1].thickness
    line = gl.GLLinePlotItem(pos=[(0, 0, 0), (1, 1, 1)],
                             color=(color[2]/255, color[1]/255, color[0]/255, 1),
                             width=thickness,
                             antialias=True)
    viz_lines.append(line)
    w.addItem(line)
# Visualize hand wind tail from position history (line plot)
tail['GLLinePlotItem'] = gl.GLLinePlotItem(pos=[(0, 0, 0), (1, 1, 1)],
                                           color=(1, 1, 1, 1),
                                           width=1,
                                           antialias=True)
w.addItem(tail['GLLinePlotItem'])
record_buffer['GLLinePlotItem'] = gl.GLLinePlotItem(pos=[(0, 0, 0), (1, 1, 1)],
                                           color=(0, 1, 0, 1),
                                           width=2,
                                           antialias=True)
w.addItem(record_buffer['GLLinePlotItem'])
record_buffer['GLLinePlotItem'].setVisible(False)    # Hide by default
# Visualize hand 3D position
axisitem = gl.GLAxisItem()
w.addItem(axisitem)
gl_hand_position_text = gl.GLTextItem(pos=(0.0, 0.0, 0.0), text='', font=QFont('Helvetica', 8))
w.addItem(gl_hand_position_text)

# List available Realsense camera
# o3d.t.io.RealSenseSensor.list_devices()

with open("config.json") as cf:
    rs_cfg = o3d.t.io.RealSenseSensorConfig(json.load(cf))

rs = o3d.t.io.RealSenseSensor()
rs.init_sensor(rs_cfg, 0)
rs.start_capture(True)  # true: start recording with capture
metadata = rs.get_metadata()
print(dir(metadata))
_depth_scale = metadata.depth_scale     # ["depth_scale"]
_intrinsic_matrix = metadata.intrinsics.intrinsic_matrix # ["intrinsic_matrix"] # 'get_focal_length', 'get_principal_point', 'get_skew', 'height', 'intrinsic_matrix', 'is_valid', 'set_intrinsics', 'width'
print(_depth_scale)
print(_intrinsic_matrix)
_fx = _intrinsic_matrix[0][0]
_fy = _intrinsic_matrix[1][1]
_cx = _intrinsic_matrix[0][2]
_cy = _intrinsic_matrix[1][2]


def update():
    global sp1, hands, pos
    # Global States
    global _recording_status, _calibrate_camera_pose_status, _calibrate_robot_pose_status, _display_overlay, record_buffer, _start_recording_timestamp
    # wait for frames and align them
    rgbd = rs.capture_frame(wait=True,
                            align_depth_to_color=True)
    # iM = o3d.camera.PinholeCameraIntrinsic(o3d.camera.PinholeCameraIntrinsicParameters.PrimeSenseDefault)
    # print(iM)   # 'get_focal_length', 'get_principal_point', 'get_skew', 'height', 'intrinsic_matrix', 'is_valid', 'set_intrinsics', 'width'
    # for func in dir(iM):
    #     if func[0] is not '_': print("%s: %s"%(func, getattr(iM, func)))
    # key = cv2.imshow("A", cv2.cvtColor(np.array(rgbd.color), cv2.COLOR_RGB2BGR))
    depth = np.array(rgbd.depth, dtype=np.uint16)[:, :, 0]  # remove last dimension (480, 640, 1) --> (480, 640)
    canvas = np.array(rgbd.color, dtype=np.uint8)
    palm_mask = np.zeros((canvas.shape[:2]), dtype=np.uint8)
    # print(depth.shape)
    depth_u8 = (depth).astype('uint8')
    _, depth_valid_mask = cv2.threshold(depth_u8, 1, 255, cv2.THRESH_BINARY)
    # Detect Hand
    results = hands.process(cv2.cvtColor(np.array(rgbd.color), cv2.COLOR_BGR2RGB))
    if results.multi_hand_landmarks:
        # print(results.multi_hand_world_landmarks)
        # print(results.multi_handedness) # index, score, side[left, right]
        for hand_landmarks in results.multi_hand_landmarks:
            # Draw the hand annotations on the image.
            if _display_overlay:
                mp_drawing.draw_landmarks(
                    canvas,
                    hand_landmarks,
                    mp_hands.HAND_CONNECTIONS,
                    mp_drawing_styles.get_default_hand_landmarks_style(),
                    mp_drawing_styles.get_default_hand_connections_style())

            palm_points = [(round(hand_landmarks.landmark[palm_index].x * canvas.shape[1]), round(hand_landmarks.landmark[palm_index].y * canvas.shape[0])) for palm_index in palm_indices]
            palm_points = np.array(palm_points, dtype=np.int32)
            palm_points = cv2.convexHull(palm_points, False)    # Find convex hull of palm polygon
            # palm_points = palm_points[np.argsort(np.apply_along_axis(lambda x: np.arctan2(-x[1], -x[0] + 4) + np.pi * 2, axis=1, arr=palm_points)), :]
            centroid = np.mean(palm_points, axis=0).reshape(-1).astype(np.int64)
            # centroid_X = sum([hand_landmarks.landmark[palm_index].x for palm_index in palm_indices]) * canvas.shape[1] / len(palm_indices)
            # centroid_Y = sum([hand_landmarks.landmark[palm_index].y for palm_index in palm_indices]) * canvas.shape[0] / len(palm_indices)
            # cv2.circle(canvas, (int(centroid_X), int(centroid_Y)), 20, (0, 0, 255), -1)
            # print(palm_points)
            # cv2.fillPoly(canvas, [palm_points], (0,255,0))  # visualize palm mask in canvas

            # Generate palm binary mask
            cv2.fillPoly(palm_mask, [palm_points], 255)
            palm_mask_count = np.count_nonzero(palm_mask)   # count palm mask size
            palm_mask = cv2.bitwise_and(palm_mask, depth_valid_mask, palm_mask) # remove area with invalid depth
            palm_mask_valid_count = np.count_nonzero(palm_mask)   # count palm mask size (only valid depth)
            if _display_overlay: canvas[np.nonzero(palm_mask)] = (0, 255, 0)     # visualize palm mask with valid depth in canvas

            ## plot histogram of depth within palm polygon ##
            # plt.hist(depth[np.where(palm_mask != 0)].ravel(), 256, [0, 2000])
            # plt.draw()
            # plt.pause(0.1)
            # plt.clf()

            # Find average value of valid depth inside palm mask
            average_depth = np.mean(depth[np.where(palm_mask != 0)].ravel())
            z = (average_depth/_depth_scale)
            depth_confident = palm_mask_valid_count/palm_mask_count
            # cv2.putText(canvas, "%.2f" % (z), centroid - (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 0), 2, cv2.LINE_AA)  # depth
            if _display_overlay: cv2.putText(canvas, "{:.0%}".format(depth_confident), centroid + (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 1, cv2.LINE_AA)
            # Calculate palm coordinate in camera space with camera intrinsic matrix
            # z = d / depth_scale
            # x = (u - cx) * z / fx
            # y = (v - cy) * z / fy

            x = (centroid[0] - _cx) * z / _fx
            y = (centroid[1] - _cy) * z / _fy

            if _display_overlay: cv2.putText(canvas, "[%.2f, %.2f, %.2f]" % (x, y, z), centroid - (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 1, cv2.LINE_AA)
            gl_hand_position_text.setData(pos=(x, y, z), text="[%.2f, %.2f, %.2f]" % (x, y, z))
            # translate hand keypoint from local --> camera coordinate
            for i, point in enumerate(hand_landmarks.landmark):
                # pos[i] = (point.x, point.y, point.z)
                # Centroid + hand skeleton offset
                viz_pos[i] = (x + point.x - hand_landmarks.landmark[0].x,
                              y + point.y - hand_landmarks.landmark[0].y,
                              z + point.z - hand_landmarks.landmark[0].z)

            sp1.setData(pos=viz_pos, color=viz_color, size=viz_thickness)   # update hand keypoint position
            # update hand tail history / recording buffer
            tail['positions'].append([x, y, z])
            tail['timestamp'].append(time.time())
            tail['viz_positions'].append(viz_pos[0])
            record_buffer['positions'].append([x, y, z])
            record_buffer['timestamp'].append(time.time()-_start_recording_timestamp)
            record_buffer['viz_positions'].append(viz_pos[0])
            # update line plot (connection between hand keypoints)
            for i, keypoint_pair in enumerate(keypoint_pairs):
                viz_lines[i].setData(pos=[viz_pos[keypoint_pair[0]], viz_pos[keypoint_pair[1]]])
                viz_lines[i].setData(pos=[viz_pos[keypoint_pair[0]], viz_pos[keypoint_pair[1]]])
            if _recording_status:   # update recording path
                record_buffer['GLLinePlotItem'].setData(pos=record_buffer['positions'])
            else:   # update hand tail
                while len(tail['viz_positions']) > 0 and (time.time() - tail['timestamp'][0]) > _tail_period: # remove expired position in history
                    tail['positions'].pop(0) and tail['timestamp'].pop(0) and tail['viz_positions'].pop(0)
                tail['GLLinePlotItem'].setData(pos=tail['positions'])
            # update hand tail line plot
                # generate relative time stamp
            tail['relative timestamp'] = [timestamp - time.time() + _tail_period for timestamp in tail['timestamp']]
            p_x.setData(y=np.array(tail['positions'])[:, 0], x=tail['relative timestamp'])
            p_y.setData(y=np.array(tail['positions'])[:, 1], x=tail['relative timestamp'])
            p_z.setData(y=np.array(tail['positions'])[:, 2], x=tail['relative timestamp'])

            break   # Only process one hand

    cv2.imshow("Detection & Depth Mask", canvas)
    key = cv2.waitKey(1)
    if key == "27": exit(0)
    elif key == ord(' '):   # Start/Stop capture recording
        if _recording_status:   # Stop recording
            _hand_pose_dataframe = pd.DataFrame(columns=['timestamp', 'X', 'Y', 'Z'])   # Create dataframe
            # Toggle display mode
            tail['GLLinePlotItem'].setVisible(True)
            if not _display_overlay: record_buffer['GLLinePlotItem'].setVisible(False)
            # Save & dump CSV file
            _hand_pose_dataframe['timestamp'] = record_buffer['timestamp']
            _hand_pose_dataframe['X'] = np.array(record_buffer['positions'])[:, 0]
            _hand_pose_dataframe['Y'] = np.array(record_buffer['positions'])[:, 1]
            _hand_pose_dataframe['Z'] = np.array(record_buffer['positions'])[:, 2]

            _hand_pose_dataframe.to_csv('path.csv')
        else:                   # Start recording
            # Clear recording buffer (except 'GLLinePlotItem')
            record_buffer['positions'] = []
            record_buffer['viz_positions'] = []
            record_buffer['timestamp'] = []
            _start_recording_timestamp = time.time()    # Reset initial timestamp
            # Toggle display mode
            tail['GLLinePlotItem'].setVisible(False)
            record_buffer['GLLinePlotItem'].setVisible(True)
        _recording_status = not _recording_status
    elif key == ord('o'):
        record_buffer['GLLinePlotItem'].setVisible(False)
    elif key == ord('v'):   # Toggle display overlay
        _display_overlay = not _display_overlay
    elif key == ord('l'):   # Load saved calibration data from .json
        pass
    elif key == ord('c'):   # Capture & Save new calibration for Camera<->Marker
        pass
    elif key == ord('z'):   # Capture & Save new calibration for Robot<-> Marker
        pass


    # pcd = o3d.geometry.PointCloud.create_from_rgbd_image(
    #     rgbd,
    #     o3d.camera.PinholeCameraIntrinsic(o3d.camera.PinholeCameraIntrinsicParameters.PrimeSenseDefault)
    # )

t = QtCore.QTimer()
t.timeout.connect(update)
t.start(50)

if __name__ == '__main__':
    pg.exec()
    rs.stop_capture()