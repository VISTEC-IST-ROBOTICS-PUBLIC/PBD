#!/usr/bin/env -S HOME=${HOME} ${HOME}/.virtualenvs/demo/bin/python
import rclpy
from rclpy.node import Node
from cv_bridge import CvBridge
from geometry_msgs.msg import Vector3Stamped, Vector3
from sensor_msgs.msg import Image, CameraInfo
from std_msgs.msg import UInt32MultiArray, UInt8MultiArray
from ament_index_python.packages import get_package_share_directory
import os
# from pyquaternion import Quaternion as Q
from scipy.spatial.transform import Rotation as R
import numpy as np
np.set_printoptions(suppress = True)
import open3d as o3d
import cv2
from openvino.runtime import Core, Layout, Type

# For each detection, the description is in the [x_min, y_min, x_max, y_max, conf] format:
# The image passed here is in BGR format with changed width and height. To display it in colors expected by matplotlib, use cvtColor function
def convert_result_to_image(bgr_image, resized_image, boxes, threshold=0.3, conf_labels=True):
    # Define colors for boxes and descriptions.
    colors = {"red": (255, 0, 0), "green": (0, 255, 0)}

    # Fetch the image shapes to calculate a ratio.
    (real_y, real_x), (resized_y, resized_x) = bgr_image.shape[:2], resized_image.shape[:2]
    ratio_x, ratio_y = real_x / resized_x, real_y / resized_y

    # Convert the base image from BGR to RGB format.
    rgb_image = cv2.cvtColor(bgr_image, cv2.COLOR_BGR2RGB)

    if len(boxes) == 0: return rgb_image
    conf_max = max(boxes[:, -1])
    # Iterate through non-zero boxes.
    for box in boxes:
        # Pick a confidence factor from the last place in an array.
        conf = box[-1]
        if conf < conf_max: continue
        if conf > threshold:
            # Convert float to int and multiply corner position of each box by x and y ratio.
            # If the bounding box is found at the top of the image,
            # position the upper box bar little lower to make it visible on the image.
            (x_min, y_min, x_max, y_max) = [
                int(max(corner_position * ratio_y, 10)) if idx % 2
                else int(corner_position * ratio_x)
                for idx, corner_position in enumerate(box[:-1])
            ]

            # Draw a box based on the position, parameters in rectangle function are: image, start_point, end_point, color, thickness.
            rgb_image = cv2.rectangle(rgb_image, (x_min, y_min), (x_max, y_max), colors["green"], 3)

            # Add text to the image based on position and confidence.
            # Parameters in text function are: image, text, bottom-left_corner_textfield, font, font_scale, color, thickness, line_type.
            if conf_labels:
                rgb_image = cv2.putText(
                    rgb_image,
                    f"{conf:.2f}",
                    (x_min, y_min - 10),
                    cv2.FONT_HERSHEY_SIMPLEX,
                    0.8,
                    colors["red"],
                    0.5,
                    cv2.LINE_AA,
                )

    return rgb_image
# Load ATSS model
ie = Core()
print("Avaliable devices:")
print(ie.available_devices)
model = ie.read_model(f"{get_package_share_directory('vlib_description')}/models/cup_atss/model.xml")
model.reshape([1, 3, 736, 992])
compiled_model = ie.compile_model(model, "CPU")
input_layer_ir = compiled_model.input(0)
labels_output_layer_ir = compiled_model.output("labels")
bbox_output_layer_ir = compiled_model.output("boxes")
N, C, H, W = input_layer_ir.shape
rs = o3d.t.io.RealSenseSensor()
rs.init_sensor()
rs.start_capture(True)  # true: start recording with capture
metadata = rs.get_metadata()
_depth_scale = metadata.depth_scale  # ["depth_scale"]
_intrinsic_matrix = metadata.intrinsics.intrinsic_matrix  # ["intrinsic_matrix"]

rs = o3d.t.io.RealSenseSensor()
rs.init_sensor()
rs.start_capture(True)  # true: start recording with capture
metadata = rs.get_metadata()
_depth_scale = metadata.depth_scale     # ["depth_scale"]
_intrinsic_matrix = metadata.intrinsics.intrinsic_matrix # ["intrinsic_matrix"]
print(_intrinsic_matrix)
_fx = _intrinsic_matrix[0][0]
_fy = _intrinsic_matrix[1][1]
_cx = _intrinsic_matrix[0][2]
_cy = _intrinsic_matrix[1][2]
o3d_intrinsic = o3d.camera.PinholeCameraIntrinsic(width=1280, height=720, intrinsic_matrix=_intrinsic_matrix)
# Init camera
for i in range(30): rs.capture_frame(wait=True, align_depth_to_color=True)
current_transformation = np.identity(4)

class Detector(Node):
    def __init__(self):
        super().__init__('cup_detector')
        self.declare_parameters(
            namespace='',
            parameters=[('cup_position_topic', '/obstacle_position')]
        )
        ## Publisher ##
        cup_position_topic_name = self.get_parameter('cup_position_topic').value
        self.cup_position_pub = self.create_publisher(Vector3Stamped, cup_position_topic_name, 10)

        timer_period = 1/30  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
    
    def timer_callback(self):
        rgbd = rs.capture_frame(wait=True, align_depth_to_color=True)
        ## Crop RGBD image with bounding box of target object
        rgb, depth = np.array(rgbd.color), np.array(rgbd.depth)
        bgr = cv2.cvtColor(rgb, cv2.COLOR_BGR2RGB)
        resized_image = cv2.resize(rgb, (W, H))
        # Reshape to the network input shape.
        input_tensor = np.expand_dims(resized_image.transpose(2, 0, 1), 0)  # change data layout from HWC to CHW
        output_tensors = compiled_model(input_tensor)
        bboxs = output_tensors[bbox_output_layer_ir]
        labels = output_tensors[labels_output_layer_ir]
        # Remove zero only boxes.
        non_zero_indices = ~np.all(bboxs == 0, axis=2)
        labels = labels[non_zero_indices]
        bboxs = bboxs[non_zero_indices]
        # print(labels, bboxs)
        (real_y, real_x), (resized_y, resized_x) = bgr.shape[:2], resized_image.shape[:2]
        ratio_x, ratio_y = real_x / resized_x, real_y / resized_y
    
        canvas = bgr.copy()
        cv2.imshow("Viz", cv2.cvtColor(convert_result_to_image(bgr, resized_image, bboxs, threshold=0.3, conf_labels=False), cv2.COLOR_BGR2RGB))
        cv2.waitKey(1)
        bbox_list, confidence_list = [], []
        for i in range(len(bboxs)):
            bbox, label = bboxs[i], labels[i]
            confidence = bbox[4]
            (x_min, y_min, x_max, y_max) = [int(max(corner_position * ratio_y, 10)) if idx % 2 else int(corner_position * ratio_x) for idx, corner_position in enumerate(bbox[:-1])]
            bbox_list.append([x_min, y_min, x_max, y_max])
            confidence_list.append(confidence)
        mask = np.zeros(rgb.shape[:2], dtype="uint8")
        is_target_valid = False
        if len(confidence_list):
            if max(confidence_list) > 0.3:
                is_target_valid = True
                index = confidence_list.index(max(confidence_list))
                [x_min, y_min, x_max, y_max] = bbox_list[index]
                mask = cv2.rectangle(mask, (x_min, y_min), (x_max, y_max), 255, -1)
                centroid = (int((x_min+x_max)/2), int((y_min+y_max)/2))
                z = np.median(depth[np.nonzero(mask)])/_depth_scale
                x = (centroid[0] - _cx) * z / _fx
                y = (centroid[1] - _cy) * z / _fy

                position_msg = Vector3Stamped()
                position_msg.header.stamp = self.get_clock().now().to_msg()
                position_msg.vector = Vector3(x=x, y=y, z=z)
                self.cup_position_pub.publish(position_msg)

def main():
    rclpy.init()
    cup_detector = Detector()
    rclpy.spin(cup_detector)
    cup_detector.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()