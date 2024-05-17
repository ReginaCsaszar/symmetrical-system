# A target mappák létrehozása
mkdir -Path .\target
mkdir -Path .\target\lib
mkdir -Path .\target\include\opencv2

# A lib mappába másolás
Copy-Item -Path .\opencv\cmake-build-wasm\lib\libopencv_world.a -Destination .\target\lib
Copy-Item -Path .\opencv\cmake-build-wasm\3rdparty\lib\* -Destination .\target\lib -Recurse

# Az opencv2 mappába másolás
Copy-Item -Path .\opencv\cmake-build-wasm\install\include\opencv4\opencv2\* -Destination .\target\include\opencv2 -Recurse
Copy-Item -Path .\opencv\include\opencv2\* -Destination .\target\include\opencv2 -Recurse
Copy-Item -Path .\opencv\cmake-build-wasm\opencv2\* -Destination .\target\include\opencv2 -Recurse


#Read-Host