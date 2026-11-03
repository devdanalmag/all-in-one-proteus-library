# ⚡ Proteus VSM Simulation Library Pack
> Comprehensive simulation library and VSM model collection for **Labcenter Proteus (ISIS)**, featuring Arduino boards, wireless modules, biometric sensors, environmental monitors, and graphic displays.

[![Proteus Compatibility](https://img.shields.io/badge/Proteus-7.x%20%7C%208.x-007acc.svg?style=flat-square&logo=visual-studio-code)](#compatibility)
[![Platform](https://img.shields.io/badge/Platform-Windows-00adef.svg?style=flat-square&logo=windows)](#installation)
[![Components](https://img.shields.io/badge/Modules-16%20Libraries%20%2B%203%20DLLs-brightgreen.svg?style=flat-square)](#catalog)
[![License](https://img.shields.io/badge/License-Academic%20%2F%20Personal%20Use-orange.svg?style=flat-square)](#credits--disclaimer)

---

## 📖 Overview

Standard Proteus installations do not ship with models for modern IoT hardware, wireless transceivers, or popular consumer breakout boards. This repository supplies ready-to-use **Proteus VSM (Virtual System Modelling)** component libraries (`.LIB`, `.IDX`) and dynamic simulation engines (`.DLL`) that enable circuit design, firmware verification, and realistic interactive simulation without physical hardware.

### Key Highlights
- **16 Component Libraries (`L/`)**: Schematic symbols, pin definitions, package assignments, and library search indices.
- **3 Simulation Dynamic Link Libraries (`m/`)**: Active VSM models providing real-time hardware simulation for GPS, OLED displays, and Wi-Fi networking.
- **Microcontrollers & Dev Boards**: Complete Arduino boards (Uno, Mega 2560, Nano, Mini, Pro Mini).
- **Wireless & IoT**: ESP8266 Wi-Fi, SIM800L / SIM900D GSM, HC-05 / HC-06 Bluetooth, NRF24L01 2.4GHz RF.
- **Biometric & Environmental Sensors**: MAX30102 pulse oximeter, DHT11/DHT22 temperature & humidity, ultrasonic distance, PIR motion, flame, soil moisture, and vibration sensors.
- **Displays & Power**: SSD1306 OLED graphical display, DS1307 real-time clock, and photovoltaic solar panel module.

---

## 📂 Repository Directory Layout

```text
.
├── L/                        # Proteus Schematic Libraries & Indices
│   ├── ArduinoTEP.IDX / .LIB # Arduino Uno, Nano, Mini, Mega 2560
│   ├── BLUETOOTH.IDX / .LIB  # HC-05 & HC-06 Bluetooth serial modules
│   ├── DHT SENSOR.IDX / .LIB # DHT11 / DHT22 temperature & humidity sensors
│   ├── ESP8266.IDX / .LIB    # ESP8266 Wi-Fi module
│   ├── FLAME_SENSOR.IDX / .LIB# Infrared flame detection sensor
│   ├── GPS MODULE.IDX / .LIB # GPS receiver simulation module
│   ├── GSM.IDX / .LIB        # SIM800L & SIM900D GSM/GPRS modules
│   ├── MAX301XX.IDX / .LIB   # MAX30102 pulse oximeter & heart rate sensor
│   ├── NRF24L01.IDX / .LIB   # NRF24L01 & NRF24L01+PA/LNA 2.4GHz transceivers
│   ├── OLED.IDX / .LIB       # I2C/SPI monochrome OLED display
│   ├── PIR SENSOR.IDX / .LIB # PIR motion detection sensor
│   ├── RTCModule.IDX / .LIB  # DS1307 I2C real-time clock
│   ├── SOLAR_PANEL.IDX / .LIB# Photovoltaic solar cell panel
│   ├── SoilMoisture.IDX / .LIB# Soil moisture hygrometer sensor
│   ├── UltraSonic.IDX / .LIB # HC-SR04 ultrasonic distance sensor
│   └── VibrationSensor.IDX / .LIB# SW-420 tilt & vibration sensor
│
├── m/                        # Proteus VSM Dynamic Simulation Models
│   ├── GPSMODULE.dll         # VSM simulation engine for GPS NMEA stream
│   ├── OLED.DLL              # Interactive pixel rendering engine for OLED
│   └── WIFI.dll              # TCP/IP & AT command engine for ESP8266
│
└── README.md                 # Documentation & installation guide
```

> **Directory Mapping Rule:**
> - Files in **`L/`** correspond to the Proteus **`LIBRARY`** directory.
> - Files in **`m/`** correspond to the Proteus **`MODELS`** directory.

---

## 📦 Component Catalog & Search Reference

When searching for parts in Proteus ISIS (by pressing <kbd>P</kbd> or clicking **Pick Devices**), refer to the table below for component names, categories, and required models:

| # | Component / Description | Library File | Search Keywords / Device Name | Category | Simulation Model / Notes |
|:---:|:---|:---|:---|:---|:---|
| **1** | **Arduino Microcontrollers**<br>• Arduino Uno R3<br>• Arduino MEGA 2560 Rev3<br>• Arduino Nano [4.0]<br>• Arduino Pro Mini / Mini | `ArduinoTEP` | `ARDUINO UNO REV3`<br>`Arduino MEGA 2560`<br>`Arduino NANO`<br>`Arduino Pro Mini` | `Arduino`<br>`Analog ICs` | Native `AVR2.DLL`<br>Attach compiled `.hex` in component properties |
| **2** | **Bluetooth Modules**<br>• HC-05 (Master/Slave)<br>• HC-06 (Slave only) | `BLUETOOTH` | `Bluetooth Module HC-05 v1`<br>`Bluetooth Module HC-06 v1` | `Bluetooth` | `COMPIM.DLL`<br>Virtual RS232 COM port bridge |
| **3** | **DHT Sensors**<br>• DHT11 / DHT22 Humidity & Temperature | `DHT SENSOR` | `DHT SENSOR`<br>`Humidity & Temperature Sensor` | `DHT SENSOR`<br>`Transducers` | Single-bus digital sensor simulation |
| **4** | **ESP8266 Wi-Fi Module**<br>• ESP-01 / ESP8266 Module | `ESP8266` | `WIFI MODULE`<br>`ESP8266` | `WIFI MODULE` | **Requires `WIFI.dll`** in `MODELS/` |
| **5** | **Flame Sensor**<br>• Infrared Flame Detector Module | `FLAME_SENSOR` | `Flame Sensor`<br>`FLAME_SENSOR` | `Sensors` | Interactive logic state test pin (0/1) |
| **6** | **GPS Module**<br>• Simulated GPS Receiver | `GPS MODULE` | `Simulated GPS Module`<br>`GPS MODULE` | `Gps Module` | **Requires `GPSMODULE.dll`** in `MODELS/`<br>Outputs standard NMEA sentences |
| **7** | **GSM / GPRS Modules**<br>• SIM800L Cellular Breakout<br>• SIM900D Module | `GSM` | `GSM Module Sim800L`<br>`GSM Module Sim900D` | `GSM`<br>`Source era` | Serial AT-command interface simulation |
| **8** | **MAX30102 Biometric Sensor**<br>• Heart Rate & Pulse Oximeter | `MAX301XX` | `MAX30102`<br>`MAX30102 SENSOR` | `MAX30102 SENSOR` | I2C biometric optical sensor simulation |
| **9** | **NRF24L01 Transceivers**<br>• NRF24L01 2.4GHz RF<br>• NRF24L01+PA/LNA (High Power) | `NRF24L01` | `NRF24L01 Transmitter/Receiver`<br>`NRF24L01+PA/LNA` | `RF24` | SPI communication interface simulation |
| **10** | **OLED Display**<br>• 0.96" Monochrome Graphic OLED (SSD1306) | `OLED` | `OLED DISPLAY.`<br>`OLED` | `Optoelectronics`<br>`Graphical LCDs` | **Requires `OLED.DLL`** in `MODELS/`<br>Interactive pixel matrix display |
| **11** | **PIR Motion Sensor**<br>• HC-SR501 Pyroelectric Sensor | `PIR SENSOR` | `pir sensor`<br>`PIR SENSOR` | `PIR SENSOR` | Toggle state input pin for motion events |
| **12** | **RTC Module**<br>• DS1307 Real-Time Clock (64x8 Serial) | `RTCModule` | `64 x 8 Serial Real-Time Clock`<br>`RTCModule` | `Transducers`<br>`Sensors` | I2C clock calendar bus simulation |
| **13** | **Solar Panel**<br>• Photovoltaic Solar Cell Simulator | `SOLAR_PANEL` | `Solar Panel`<br>`SOLAR_PANEL` | `Modules`<br>`Power Sources` | Analog voltage output simulating light levels |
| **14** | **Soil Moisture Sensor**<br>• Soil Hygrometer Module | `SoilMoisture` | `Soil Moisture Sensor`<br>`SoilMoisture` | `Sensors` | Analog voltage probe & digital comparator |
| **15** | **Ultrasonic Distance Sensor**<br>• HC-SR04 Range Finder | `UltraSonic` | `Ultrasonic Sensor (HC-SR04)`<br>`ULTRASONIC` | `ULTRASONIC` | Trigger input / Echo pulse output timing |
| **16** | **Vibration Sensor**<br>• SW-420 Tilt / Shock Switch | `VibrationSensor` | `Vibration Sensor`<br>`VibrationSensor` | `Sensors` | Digital shock trigger logic output |

---

## 🚀 Installation Guide

Installing these libraries into Proteus takes less than two minutes.

### Step 1: Locate your Proteus Directories

The exact destination folders depend on your Proteus version and Windows edition:

#### For Proteus 8.x (8.0 through 8.16+):
- **Library Directory:**
  ```text
  C:\ProgramData\Labcenter Electronics\Proteus 8 Professional\LIBRARY
  ```
- **Models Directory:**
  ```text
  C:\ProgramData\Labcenter Electronics\Proteus 8 Professional\MODELS
  ```

> 💡 **Note on ProgramData:**
> `C:\ProgramData` is hidden by default in Windows. To access it quickly:
> 1. Press <kbd>Win</kbd> + <kbd>R</kbd> on your keyboard.
> 2. Paste `C:\ProgramData\Labcenter Electronics\Proteus 8 Professional` and hit **Enter**.

#### For Proteus 7.x:
- **Library Directory:**
  ```text
  C:\Program Files (x86)\Labcenter Electronics\Proteus 7 Professional\LIBRARY
  ```
- **Models Directory:**
  ```text
  C:\Program Files (x86)\Labcenter Electronics\Proteus 7 Professional\MODELS
  ```

---

### Step 2: Copy the Files

1. **Copy Library Files (`L/`):**
   - Open folder `L/` in this repository.
   - Select all files (`*.LIB` and `*.IDX` — 32 files total).
   - Copy and paste them into the Proteus **`LIBRARY`** folder.
2. **Copy Model Files (`m/`):**
   - Open folder `m/` in this repository.
   - Select all three files (`GPSMODULE.dll`, `OLED.DLL`, `WIFI.dll`).
   - Copy and paste them into the Proteus **`MODELS`** folder.

---

### Quick 1-Click Installation

#### Option A: Run `install.bat` (Recommended)
1. Right-click [`install.bat`](file:///c:/Users/Dev%20Dan%20Almag/OneDrive/Documents/drive/ALL/install.bat) in this folder.
2. Select **"Run as administrator"**.
3. The installer detects your Proteus 8 or 7 installation and copies all `.LIB`, `.IDX`, and `.DLL` files to their respective destination directories automatically.

#### Option B: PowerShell
If you prefer running a command in PowerShell (Administrator):
1. Right-click the **Start menu** and select **Terminal (Admin)** or **PowerShell (Administrator)**.
2. Change directory to this folder:
   ```powershell
   cd "C:\path\to\this\repository"
   ```
3. Run the automated copy script:
   ```powershell
   $proteusDir = "C:\ProgramData\Labcenter Electronics\Proteus 8 Professional"
   if (Test-Path $proteusDir) {
       Copy-Item -Path ".\L\*" -Destination "$proteusDir\LIBRARY\" -Force -Verbose
       Copy-Item -Path ".\m\*" -Destination "$proteusDir\MODELS\" -Force -Verbose
       Write-Host "`n✅ Successfully installed Proteus Library and Model files!" -ForegroundColor Green
   } else {
       Write-Host "`n❌ Proteus 8 directory not found. Please verify your installation path." -ForegroundColor Red
   }
   ```

---

## 🛠️ How to Use in Proteus ISIS

1. **Launch Proteus ISIS**: Close and reopen Proteus if it was running so it re-indexes the libraries.
2. **Open Device Browser**: Click the **Pick Devices** button (or press keyboard shortcut <kbd>P</kbd>).
3. **Search for Components**: Type any keyword from the [Component Catalog](#catalog) (e.g. `ARDUINO UNO REV3`, `HC-05`, `OLED`, `ESP8266`, `DHT SENSOR`).
4. **Place on Schematic**: Double-click the component to add it to your selector list, then place it onto your schematic canvas.
5. **Attach Hex Firmware (for Microcontrollers)**:
   - Double-click the placed Arduino or microcontroller symbol.
   - In the **Program File** property field, click the folder icon.
   - Select your compiled `.hex` binary (exported from Arduino IDE via `Sketch` ➔ `Export Compiled Binary`).
6. **Configure Peripheral Virtual Ports / Test Pins**:
   - For **Bluetooth (HC-05/06)**: Configure the virtual COM port (e.g., `COM1` or a virtual COM pair created via com0com / Virtual Serial Port Driver) to link your simulation to a PC serial terminal or mobile Bluetooth emulator.
   - For **Sensors (Flame, PIR, Vibration, Ultrasonic)**: These modules feature test pins (`TEST PIN` / `LOGIC STATE`). Connect a `LOGICSTATE` or `POT-HG` potentiometer to trigger states during live simulation.
7. **Run Simulation**: Click the green **Play** button at the bottom-left corner of the Proteus interface to start real-time execution.

---

## ❓ Troubleshooting & FAQs

### Q1: The components do not show up when I press "P" in Proteus.
- **Cause:** Both `.LIB` and `.IDX` files must be present together in the Proteus `LIBRARY` folder. If `.IDX` is missing, Proteus cannot index the parts.
- **Fix:** Ensure both `FILENAME.LIB` and `FILENAME.IDX` were copied into the `LIBRARY` directory. Restart Proteus.

### Q2: Simulation error: "Cannot find model `GPSMODULE.dll`", "`WIFI.dll`", or "`OLED.DLL`".
- **Cause:** The VSM dynamic link library files were not placed into the `MODELS` folder.
- **Fix:** Copy `GPSMODULE.dll`, `OLED.DLL`, and `WIFI.dll` from the `m/` directory directly into:
  `C:\ProgramData\Labcenter Electronics\Proteus 8 Professional\MODELS\`

### Q3: "Access Denied" or "Administrator Permission Required" when copying.
- **Cause:** `C:\ProgramData` and `C:\Program Files (x86)` are system-protected directories.
- **Fix:** When Windows displays the UAC prompt, click **Continue** (or run your file manager / PowerShell script as Administrator).

### Q4: How do I generate a `.hex` file for Arduino in Arduino IDE?
1. Open your sketch in the Arduino IDE.
2. Select your board under **Tools ➔ Board** (e.g. *Arduino Uno*).
3. Click **Sketch ➔ Export Compiled Binary** (<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd>).
4. The `.hex` file will be generated in the sketch folder next to your `.ino` file.

---

## ⚖️ Credits & Disclaimer

- The models and schematic libraries in this collection were developed and curated by contributors across the embedded engineering community (including **The Engineering Projects** and **Embedded Manufacturing Synergy**).
- All trademarks, registered logos, and brand names (Labcenter Electronics, Proteus, Arduino, Espressif, Microchip, Maxim Integrated, Nordic Semiconductor) belong to their respective copyright holders.
- This package is intended for educational, academic, prototyping, and circuit simulation purposes.
