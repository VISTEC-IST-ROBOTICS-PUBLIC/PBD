#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/features2d.hpp"
#include <iostream>

using namespace cv;
using namespace std;

int main() {
    cv::Mat im_with_keypoints; std::vector<cv::KeyPoint> keypoints;
    cv::Mat grayImage, camFrame, kernel;
    int morphBNo2 = 2;
    char str[200];
    //Setting detector parameters
    cv::SimpleBlobDetector::Params params;
    params.filterByCircularity = true;
    params.filterByArea = true;
    params.minArea = 200.0f;
    //Creating a detector object
    cv::Ptr<cv::SimpleBlobDetector> detector = cv::SimpleBlobDetector::create(params);
    //video capture settings
    cv::VideoCapture cap(0); // open the default camera
    cap.set(3, 640);
    cap.set(4, 480);
    //checking video stream
    if (!cap.isOpened()) {  // check if we succeeded
        std::cout << ("Failure to open camera") << "\n";
        std::cin.get();
    }
    else {
        for (;;) {
            // get a new frame from camera
            cap >> camFrame;
            //converting video to single channel grayscale
            cv::cvtColor(camFrame, grayImage, cv::COLOR_BGR2GRAY);
            grayImage.convertTo(grayImage, CV_8U);
            //filter noise
            cv::GaussianBlur(grayImage, grayImage, Size(5, 5), 0, 0);
            //apply automatic threshold
            cv::threshold(grayImage, grayImage, 0.0, 255, cv::THRESH_BINARY_INV | cv::THRESH_OTSU);
            //background area
            cv::dilate(grayImage, grayImage, kernel, cv::Point(-1, -1), morphBNo2);
            cv::Mat image(grayImage.rows, grayImage.cols, CV_8U, cv::Scalar(255, 255, 255));
            cv::Mat invBack2 = image - grayImage;
            //blob detection
            detector->detect(invBack2, keypoints);
            int nrOfBlobs = keypoints.size();
            // draw keypoints
            cv::drawKeypoints(camFrame, keypoints, im_with_keypoints, cv::Scalar(0, 0, 255),
                      cv::DrawMatchesFlags::DRAW_RICH_KEYPOINTS);
            //text only appears if at least 1 blob is detected
            if (nrOfBlobs >0 ) {
                sprintf(str, "total pips: %d ", nrOfBlobs);
                cv::putText(im_with_keypoints, str, cv::Point2f(10, 25), cv::FONT_HERSHEY_PLAIN,
                    2, cv::Scalar(0, 255, 255, 255));
            }
            //show image
            imshow("keypoints", im_with_keypoints);
            std::cout << "number of pips: " << nrOfBlobs << std::endl;
            //hit esc to quit
            if (cv::waitKey(1) == 27)  break;
        }
    }
    return 0 ;
}