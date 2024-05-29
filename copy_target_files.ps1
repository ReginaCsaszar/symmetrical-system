# Build mappa be�ll�t�sa

$scriptDir = $PWD.Path
$buildDir = "$scriptDir\opencv\build-0529-2"

# A target mapp�k l�trehoz�sa

$targetDir = "$scriptDir\target"
$libDir = "$targetDir\lib"
$cvDir = "$targetDir\include\opencv2"

mkdir $targetDir
mkdir $libDir
mkdir $cvDir

# A lib mapp�ba m�sol�s
Copy-Item "$buildDir\lib\libopencv_world.a" -Destination $libDir
Copy-Item "$buildDir\3rdparty\lib\*" -Destination $libDir -Recurse

# Az opencv2 mapp�ba m�sol�s
Copy-Item "$buildDir\install\include\opencv4\opencv2\*" -Destination $cvDir -Recurse
Copy-Item .\opencv\include\opencv2\* -Destination $cvDir -Recurse
Copy-Item "$buildDir\opencv2\*" -Destination $cvDir -Recurse

Read-Host "Nyomjon meg egy billenty�t a folytat�shoz..."