#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/features2d.hpp"
#include <iostream>

using namespace cv;
using namespace std;

int main() {
    cv::Mat frame;
    // cv::VideoCapture cap("v4l2src device=/dev/video0 ! video/x-raw, format=MJPG, width=640, height=480, framerate=30/1 ! appsink", CAP_GSTREAMER);
    cv::VideoCapture cap("v4l2src device=/dev/video0 ! image/jpeg, witdh=1920 ! v4l2jpegdec ! video/x-raw ! imxvideoconvert_g2d ! video/x-raw, format=BGRx ! queue ! videoconvert ! video/x-raw,format=BGR ! appsink", cv::CAP_GSTREAMER);

    cap.set(cv::CAP_PROP_FRAME_WIDTH, 1920);
    cap.set(cv::CAP_PROP_FRAME_HEIGHT, 1080);
    cap.set(cv::CAP_PROP_FPS, 30);
    cap.set(cv::CAP_PROP_FOURCC, cv::VideoWriter::fourcc('M', 'J', 'P', 'G'));
    if (!cap.isOpened()) {  // check if we succeeded
        std::cout << ("Failure to open camera") << "\n";
        std::cin.get();
    }
    else {
        for (;;) {
            cap >> frame;
            imshow("Frame", frame);
            //hit esc to quit
            if (cv::waitKey(1) == 27)  break;
        }
    }
}