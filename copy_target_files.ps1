# Build mappa beállítása

$scriptDir = $PWD.Path
$opencvBuildDir = "$scriptDir\opencv\build-0527"

# A target mappák létrehozása

$targetDir = Join-Path $scriptDir "target"
$libDir = Join-Path $targetDir "lib"
$opencv2Dir = Join-Path $targetDir "include\opencv2"

#mkdir -Path $targetDir
#mkdir -Path $libDir
#mkdir -Path $cv2Dir

# A lib mappába másolás
Copy-Item -Path "$opencvBuildDir\lib\libopencv_world.a" -Destination $libDir
Copy-Item -Path "$opencvBuildDir\3rdparty\lib\*" -Destination $libDir -Recurse

# Az opencv2 mappába másolás
Copy-Item -Path "$opencvBuildDir\install\include\opencv4\opencv2\*" -Destination $opencv2Dir -Recurse
Copy-Item -Path .\opencv\include\opencv2\* -Destination $opencv2Dir -Recurse
Copy-Item -Path "$opencvBuildDir\opencv2\*" -Destination $opencv2Dir -Recurse

Read-Host "Nyomjon meg egy billentyût a folytatáshoz..."