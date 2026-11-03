@echo off
setlocal EnableDelayedExpansion

title Proteus VSM Library Installer
echo ==============================================================
echo        Proteus VSM Simulation Library Pack Installer
echo ==============================================================
echo.

:: Check for Administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Administrative permissions required!
    echo Please right-click this file and select "Run as administrator".
    echo.
    pause
    exit /b 1
)

set "SOURCE_LIB=%~dp0L"
set "SOURCE_MOD=%~dp0m"

if not exist "%SOURCE_LIB%" (
    echo [ERROR] Library folder "L" not found in %~dp0
    pause
    exit /b 1
)

if not exist "%SOURCE_MOD%" (
    echo [ERROR] Models folder "m" not found in %~dp0
    pause
    exit /b 1
)

:: Check common Proteus installation paths
set "TARGET_FOUND=0"

:: 1. Proteus 8.x in ProgramData
if exist "%ProgramData%\Labcenter Electronics\Proteus 8 Professional" (
    set "PROTEUS_LIB=%ProgramData%\Labcenter Electronics\Proteus 8 Professional\LIBRARY"
    set "PROTEUS_MOD=%ProgramData%\Labcenter Electronics\Proteus 8 Professional\MODELS"
    set "TARGET_FOUND=1"
    set "VER_NAME=Proteus 8 Professional"
)

:: 2. Proteus 7.x in Program Files (x86)
if "!TARGET_FOUND!"=="0" (
    if exist "%ProgramFiles(x86)%\Labcenter Electronics\Proteus 7 Professional" (
        set "PROTEUS_LIB=%ProgramFiles(x86)%\Labcenter Electronics\Proteus 7 Professional\LIBRARY"
        set "PROTEUS_MOD=%ProgramFiles(x86)%\Labcenter Electronics\Proteus 7 Professional\MODELS"
        set "TARGET_FOUND=1"
        set "VER_NAME=Proteus 7 Professional (x86)"
    )
)

:: 3. Proteus 7.x in Program Files
if "!TARGET_FOUND!"=="0" (
    if exist "%ProgramFiles%\Labcenter Electronics\Proteus 7 Professional" (
        set "PROTEUS_LIB=%ProgramFiles%\Labcenter Electronics\Proteus 7 Professional\LIBRARY"
        set "PROTEUS_MOD=%ProgramFiles%\Labcenter Electronics\Proteus 7 Professional\MODELS"
        set "TARGET_FOUND=1"
        set "VER_NAME=Proteus 7 Professional"
    )
)

if "!TARGET_FOUND!"=="0" (
    echo [WARNING] Default Proteus directories were not automatically detected.
    echo.
    echo Please enter the full path to your Proteus root folder
    echo (e.g. C:\ProgramData\Labcenter Electronics\Proteus 8 Professional):
    set /p "CUSTOM_DIR=Path: "
    if exist "!CUSTOM_DIR!" (
        set "PROTEUS_LIB=!CUSTOM_DIR!\LIBRARY"
        set "PROTEUS_MOD=!CUSTOM_DIR!\MODELS"
        set "VER_NAME=Custom Path"
    ) else (
        echo [ERROR] Directory does not exist. Aborting installation.
        pause
        exit /b 1
    )
)

echo [INFO] Detected installation: !VER_NAME!
echo [INFO] Library target: "!PROTEUS_LIB!"
echo [INFO] Models target:  "!PROTEUS_MOD!"
echo.

:: Ensure destination folders exist
if not exist "!PROTEUS_LIB!" mkdir "!PROTEUS_LIB!"
if not exist "!PROTEUS_MOD!" mkdir "!PROTEUS_MOD!"

echo Copying library files (*.LIB, *.IDX)...
copy /Y "%SOURCE_LIB%\*.*" "!PROTEUS_LIB!\" >nul
if %errorlevel% equ 0 (
    echo   [OK] Copied 16 component libraries to LIBRARY folder.
) else (
    echo   [FAIL] Could not copy library files.
)

echo Copying simulation model DLLs (*.dll)...
copy /Y "%SOURCE_MOD%\*.*" "!PROTEUS_MOD!\" >nul
if %errorlevel% equ 0 (
    echo   [OK] Copied simulation models to MODELS folder.
) else (
    echo   [FAIL] Could not copy model files.
)

echo.
echo ==============================================================
echo                  Installation Complete!
echo ==============================================================
echo Restart Proteus to use the newly installed components.
echo.
pause
