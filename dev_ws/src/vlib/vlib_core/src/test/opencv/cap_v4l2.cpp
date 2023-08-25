#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/features2d.hpp"
#include <iostream>

using namespace cv;
using namespace std;

int main() {
    cv::Mat frame;
    cv::VideoCapture cap("/dev/video0", cv::CAP_V4L2);
    cap.set(cv::CAP_PROP_FRAME_WIDTH, 1920);
    cap.set(cv::CAP_PROP_FRAME_HEIGHT, 1080);
    cap.set(cv::CAP_PROP_FPS, 60);
    cap.set(cv::CAP_PROP_FOURCC, cv::VideoWriter::fourcc('m', 'j', 'p', 'g'));
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