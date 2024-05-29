# Build mappa beállítása

$scriptDir = $PWD.Path
$buildDir = "$scriptDir\opencv\build-0529-2"

# A target mappák létrehozása

$targetDir = "$scriptDir\target"
$libDir = "$targetDir\lib"
$cvDir = "$targetDir\include\opencv2"

mkdir $targetDir
mkdir $libDir
mkdir $cvDir

# A lib mappába másolás
Copy-Item "$buildDir\lib\libopencv_world.a" -Destination $libDir
Copy-Item "$buildDir\3rdparty\lib\*" -Destination $libDir -Recurse

# Az opencv2 mappába másolás
Copy-Item "$buildDir\install\include\opencv4\opencv2\*" -Destination $cvDir -Recurse
Copy-Item .\opencv\include\opencv2\* -Destination $cvDir -Recurse
Copy-Item "$buildDir\opencv2\*" -Destination $cvDir -Recurse

Read-Host "Nyomjon meg egy billentyût a folytatáshoz..."