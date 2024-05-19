
cmake_minimum_required(VERSION 3.5)
project(WasmSample)

set(CMAKE_CXX_STANDARD 17)
set(SAMPLE_SRC_DIR ${CMAKE_SOURCE_DIR}/include)

set(EMSDK_FLAGS
        " -pthread -s USE_PTHREADS -s PTHREAD_POOL_SIZE=4 \
        -s INITIAL_MEMORY=128mb ")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${EMSDK_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${EMSDK_FLAGS}")

add_executable(WasmSample ${CMAKE_SOURCE_DIR}/include/image2.cpp)

set(OPENCV_INCLUDE_PATH "${CMAKE_SOURCE_DIR}/target/include")
set(OPENCV_LIB_PATH "${CMAKE_SOURCE_DIR}/target/lib")

target_link_libraries(WasmSample ${OPENCV_LIB_PATH}/libopencv_world.a)
target_include_directories(WasmSample PUBLIC ${OPENCV_INCLUDE_PATH})