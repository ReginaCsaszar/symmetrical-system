#include <iostream> // for standard I/O
#include <string>   // for strings
#include <iomanip>  // for controlling float print precision
#include <sstream>  // string to number conversion
#include <opencv2/core.hpp>     // Basic OpenCV structures (cv::Mat, Scalar)
#include <opencv2/core/bindings_utils.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <emscripten.h>
#include <emscripten/bind.h>

namespace ems = emscripten;


int lowThreshold = 50;
const int maxThreshold = 100;
const int ratio = 3;
const int kernel_size = 3;

void cannyImage(cv::Mat & input, cv::Mat & output){
    cv::Mat bwmat, rmat, detected_edges;
    cv::cvtColor(input, bwmat, cv::COLOR_BGRA2GRAY);
    cv::blur( bwmat, detected_edges, cv::Size(3,3) );
    cv::Canny( detected_edges, detected_edges, lowThreshold, lowThreshold*ratio, kernel_size );
    cv::cvtColor(detected_edges, output, cv::COLOR_GRAY2BGRA);
}

template<typename T>
ems::val matData(const cv::Mat& mat)
{
    return ems::val(ems::memory_view<T>((mat.total()*mat.elemSize())/sizeof(T),
                           (T*)mat.data));
}

cv::Mat* createJSMat(int rows, int cols)
{
    return new cv::Mat(rows, cols, CV_8UC4);
}

EMSCRIPTEN_BINDINGS(my_module) {
    ems::register_vector<uchar>("vector_uchar");
    ems::class_<cv::Mat>("Mat")
        .constructor(&createJSMat, ems::allow_raw_pointers())
        .property("rows", &cv::Mat::rows)
        .property("cols", &cv::Mat::cols)
        .property("data", &matData<unsigned char>);

    ems::function("cannyImage", &cannyImage);
}

