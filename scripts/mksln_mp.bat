@echo off
setlocal EnableDelayedExpansion

if "%~1"=="" (
    set "BUILD_TYPE=Debug"
) else (
    set "BUILD_TYPE=%~1"
)

if exist CMakeLists.txt (
    pushd
    mkdir build-mp
    cd build-mp
    cmake -G "Visual Studio 17 2022" -A Win32 -DKISAK_MP=1 -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ..
    popd
) else (
    echo You must run this from the ROOT directory
    echo Usage: scripts/mksln.bat
    exit /b 1
)

