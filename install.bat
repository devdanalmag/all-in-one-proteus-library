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
    echo [ERROR] Source Library folder "L" not found in:
    echo "%~dp0"
    pause
    exit /b 1
)

if not exist "%SOURCE_MOD%" (
    echo [ERROR] Source Models folder "m" not found in:
    echo "%~dp0"
    pause
    exit /b 1
)

set "TARGET_FOUND=0"

:: =============================================================
:: STEP 1: CHECK "Program Files (x86)" (Primary / Most Common)
:: =============================================================

:: 1A. Proteus 8 Professional (DATA subfolder layout)
if exist "%ProgramFiles(x86)%\Labcenter Electronics\Proteus 8 Professional\DATA\LIBRARY" (
    set "PROTEUS_LIB=%ProgramFiles(x86)%\Labcenter Electronics\Proteus 8 Professional\DATA\LIBRARY"
    set "PROTEUS_MOD=%ProgramFiles(x86)%\Labcenter Electronics\Proteus 8 Professional\DATA\MODELS"
    set "TARGET_FOUND=1"
    set "VER_NAME=Proteus 8 Professional [Program Files (x86)\...\DATA]"
)

:: 1B. Proteus 8 Professional (Direct root layout)
if "!TARGET_FOUND!"=="0" (
    if exist "%ProgramFiles(x86)%\Labcenter Electronics\Proteus 8 Professional\LIBRARY" (
        set "PROTEUS_LIB=%ProgramFiles(x86)%\Labcenter Electronics\Proteus 8 Professional\LIBRARY"
        set "PROTEUS_MOD=%ProgramFiles(x86)%\Labcenter Electronics\Proteus 8 Professional\MODELS"
        set "TARGET_FOUND=1"
        set "VER_NAME=Proteus 8 Professional [Program Files (x86)]"
    )
)

:: 1C. Proteus 7 Professional
if "!TARGET_FOUND!"=="0" (
    if exist "%ProgramFiles(x86)%\Labcenter Electronics\Proteus 7 Professional\LIBRARY" (
        set "PROTEUS_LIB=%ProgramFiles(x86)%\Labcenter Electronics\Proteus 7 Professional\LIBRARY"
        set "PROTEUS_MOD=%ProgramFiles(x86)%\Labcenter Electronics\Proteus 7 Professional\MODELS"
        set "TARGET_FOUND=1"
        set "VER_NAME=Proteus 7 Professional [Program Files (x86)]"
    )
)

:: =============================================================
:: STEP 2: FALLBACK TO "ProgramData" (If not in Program Files x86)
:: =============================================================
if "!TARGET_FOUND!"=="0" (
    echo [INFO] Not found in "Program Files (x86)". Checking "%ProgramData%"...
    if exist "%ProgramData%\Labcenter Electronics\Proteus 8 Professional\LIBRARY" (
        set "PROTEUS_LIB=%ProgramData%\Labcenter Electronics\Proteus 8 Professional\LIBRARY"
        set "PROTEUS_MOD=%ProgramData%\Labcenter Electronics\Proteus 8 Professional\MODELS"
        set "TARGET_FOUND=1"
        set "VER_NAME=Proteus 8 Professional [ProgramData]"
    )
)

:: =============================================================
:: STEP 3: FALLBACK TO 64-bit "Program Files"
:: =============================================================
if "!TARGET_FOUND!"=="0" (
    echo [INFO] Checking "%ProgramFiles%"...
    if exist "%ProgramFiles%\Labcenter Electronics\Proteus 8 Professional\DATA\LIBRARY" (
        set "PROTEUS_LIB=%ProgramFiles%\Labcenter Electronics\Proteus 8 Professional\DATA\LIBRARY"
        set "PROTEUS_MOD=%ProgramFiles%\Labcenter Electronics\Proteus 8 Professional\DATA\MODELS"
        set "TARGET_FOUND=1"
        set "VER_NAME=Proteus 8 Professional [Program Files\...\DATA]"
    ) else if exist "%ProgramFiles%\Labcenter Electronics\Proteus 8 Professional\LIBRARY" (
        set "PROTEUS_LIB=%ProgramFiles%\Labcenter Electronics\Proteus 8 Professional\LIBRARY"
        set "PROTEUS_MOD=%ProgramFiles%\Labcenter Electronics\Proteus 8 Professional\MODELS"
        set "TARGET_FOUND=1"
        set "VER_NAME=Proteus 8 Professional [Program Files]"
    ) else if exist "%ProgramFiles%\Labcenter Electronics\Proteus 7 Professional\LIBRARY" (
        set "PROTEUS_LIB=%ProgramFiles%\Labcenter Electronics\Proteus 7 Professional\LIBRARY"
        set "PROTEUS_MOD=%ProgramFiles%\Labcenter Electronics\Proteus 7 Professional\MODELS"
        set "TARGET_FOUND=1"
        set "VER_NAME=Proteus 7 Professional [Program Files]"
    )
)

:: =============================================================
:: STEP 4: MANUAL DIRECTORY PROMPT (If all automatic paths fail)
:: =============================================================
if "!TARGET_FOUND!"=="0" (
    echo.
    echo [WARNING] Proteus directories were not automatically detected in:
    echo   1. "%ProgramFiles(x86)%\Labcenter Electronics\"
    echo   2. "%ProgramData%\Labcenter Electronics\"
    echo   3. "%ProgramFiles%\Labcenter Electronics\"
    echo.
    echo Please enter the full path to your Proteus root folder
    echo (e.g. C:\Program Files (x86)\Labcenter Electronics\Proteus 8 Professional):
    set /p "CUSTOM_DIR=Path: "
    if exist "!CUSTOM_DIR!\DATA\LIBRARY" (
        set "PROTEUS_LIB=!CUSTOM_DIR!\DATA\LIBRARY"
        set "PROTEUS_MOD=!CUSTOM_DIR!\DATA\MODELS"
        set "VER_NAME=Custom Path [DATA]"
    ) else if exist "!CUSTOM_DIR!\LIBRARY" (
        set "PROTEUS_LIB=!CUSTOM_DIR!\LIBRARY"
        set "PROTEUS_MOD=!CUSTOM_DIR!\MODELS"
        set "VER_NAME=Custom Path"
    ) else (
        echo [ERROR] Neither LIBRARY nor DATA\LIBRARY exists in "!CUSTOM_DIR!".
        echo Aborting installation.
        pause
        exit /b 1
    )
)

echo.
echo --------------------------------------------------------------
echo [SUCCESS] Detected Proteus Installation:
echo           !VER_NAME!
echo.
echo [Target Folders]
echo   Libraries: "!PROTEUS_LIB!"
echo   Models:    "!PROTEUS_MOD!"
echo --------------------------------------------------------------
echo.

:: Ensure destination folders exist
if not exist "!PROTEUS_LIB!" mkdir "!PROTEUS_LIB!"
if not exist "!PROTEUS_MOD!" mkdir "!PROTEUS_MOD!"

echo [1/2] Copying 16 component libraries (*.LIB, *.IDX)...
copy /Y "%SOURCE_LIB%\*.*" "!PROTEUS_LIB!\" >nul
if %errorlevel% equ 0 (
    echo       Done! Copied 32 library and index files.
) else (
    echo       [FAIL] Error occurred copying library files.
)

echo.
echo [2/2] Copying VSM simulation models (*.dll)...
copy /Y "%SOURCE_MOD%\*.*" "!PROTEUS_MOD!\" >nul
if %errorlevel% equ 0 (
    echo       Done! Copied GPSMODULE.dll, OLED.DLL, and WIFI.dll.
) else (
    echo       [FAIL] Error occurred copying model DLLs.
)

echo.
echo ==============================================================
echo                Installation Complete!
echo ==============================================================
echo Restart Proteus ISIS so it can load the new library files.
echo.
pause
