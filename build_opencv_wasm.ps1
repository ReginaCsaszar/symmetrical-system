# Set current directory for project directory
$projectDir = Get-Location.Path

# Activate emsdk
Set-Location ..\..\emsdk
emsdk.bat activate latest
emsdk_env.bat

# Create build directory and move to it
Set-Location &projectDir

New-Item -ItemType Directory -Path "opencv\build-0527"
Set-Location "opencv\build_0527"

# Generate CMake build files with desired options
emcmake cmake .. \
  -DCMAKE_CXX_FLAGS="-pthread" \
  -DBUILD_IPP_IW=OFF \
  -DBUILD_ITT=OFF \
  -DBUILD_JPEG=OFF \
  -DBUILD_PACKAGE=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DBUILD_PROTOBUF=OFF \
  -DBUILD_SHARED_LIBS=OFF \
  -DBUILD_TESTS=OFF \
  -DBUILD_ZLIB=ON \
  -DBUILD_opencv_apps=OFF \
  -DBUILD_opencv_calib3d=ON \
  -DBUILD_opencv_core=ON \
  -DBUILD_opencv_dnn=ON \
  -DBUILD_opencv_features2d=ON \
  -DBUILD_opencv_flann=ON \
  -DBUILD_opencv_gapi=OFF \
  -DBUILD_opencv_highgui=OFF \
  -DBUILD_opencv_imgcodecs=ON \
  -DBUILD_opencv_imgproc=ON \
  -DBUILD_opencv_java_bindings_generator=OFF \
  -DBUILD_opencv_js=OFF \
  -DBUILD_opencv_js_bindings_generator=OFF \
  -DBUILD_opencv_ml=OFF \
  -DBUILD_opencv_objc_bindings_generator=OFF \
  -DBUILD_opencv_photo=OFF \
  -DBUILD_opencv_python_bindings_generator=OFF \
  -DBUILD_opencv_python_tests=OFF \
  -DBUILD_opencv_stitching=OFF \
  -DBUILD_opencv_ts=OFF \
   -DBUILD_opencv_videoio=OFF \
  -DBUILD_opencv_world=ON \
  -DCV_ENABLE_INTRINSICS=OFF \
  -DOPENCV_DNN_OPENCL=OFF \
  -DWITH_1394=OFF \
  -DWITH_ADE=OFF \
  -DWITH_FFMPEG=OFF \
  -DWITH_GSTREAMER=OFF \
  -DWITH_GTK=OFF \
  -DWITH_IMGCODEC_HDR=OFF \
  -DWITH_IMGCODEC_PFM=OFF \
  -DWITH_IMGCODEC_PXM=OFF \
  -DWITH_IMGCODEC_SUNRASTER=OFF \
  -DWITH_IPP=OFF \
  -DWITH_ITT=OFF \
  -DWITH_JASPER=OFF \
  -DWITH_LAPACK=OFF \
  -DWITH_OPENCL=OFF \
  -DWITH_OPENCLAMDBLAS=OFF \
  -DWITH_OPENCLAMDFFT=OFF \
  -DWITH_PNG=ON \
  -DWITH_PROTOBUF=OFF \
  -DWITH_PTHREADS_PF=ON \
  -DWITH_QUIRC=OFF \
  -DWITH_TIFF=OFF \
  -DWITH_V4L=OFF \
  -DWITH_VA=OFF \
  -DWITH_VA_INTEL=OFF \
  -DWITH_WEBP=OFF

# Build OpenCV using Ninja
ninja

#copy generated files on their dedicated place
ninja install

Read-Host