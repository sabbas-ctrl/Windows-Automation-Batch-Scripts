# 🖥️ Windows Batch Script Utilities by Sabbas Ahmad

A collection of helpful and customizable Windows `.bat` scripts to automate routine developer workflows, save disk space, and log real-time battery performance — all crafted for productivity and ease of use.

💡 This repo is open for personal use and contributions from fellow developers. May Allah ﷻ bless our efforts with barakah and benefit.

---

## 📜 Table of Contents

- [Overview](#-overview)
- [Included Scripts](#-included-scripts)
  - [DevSetup.bat](#devsetupbat)
  - [Delete Node Modules.bat](#delete-node-modulesbat)
  - [Battery Logger.bat](#battery-loggerbat)
- [Customization Guide](#-customization-guide)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)

---

## 🔧 Overview

This repository contains three powerful scripts:

- **DevSetup.bat**: One-click developer environment launcher
- **Delete Node Modules.bat**: Reclaims space by deleting unnecessary `node_modules`
- **Battery Logger.bat**: Tracks and logs battery percentage + charging status over time

---

## 📂 Included Scripts

### 🚀 DevSetup.bat – Customizable Developer Environment Launcher

Launch VS Code and multiple Chrome profiles with Gmail, GitHub, ChatGPT, Gemini, freeCodeCamp, and more — in one click!

**What It Does:**
- Opens your specified project in VS Code
- Launches multiple Chrome profiles:
  - **Profile 5**: Gmail, GitHub, ChatGPT, Gemini, freeCodeCamp, and localhost
  - **Profiles 1 & 9**: Gmail

**Script:**
```bat
@echo off
color a
title Development Setup

powershell.exe -NoProfile -WindowStyle Hidden -Command "& {Start-Process -FilePath 'C:\Users\DELL\AppData\Local\Programs\Microsoft VS Code\Code.exe' -ArgumentList 'C:\Users\DELL\Desktop\freeCodeCamp\Quality-Assurance\boilerplate-mochachai-main\'}"
start chrome.exe --profile-directory="Profile 5" "https://mail.google.com" "https://github.com/sabbas-ctrl" "https://www.freecodecamp.org/learn/back-end-development-and-apis/" "https://gemini.google.com/app/97d9d2071477a758" "https://chatgpt.com/" "http://localhost:3000/"
start chrome.exe --profile-directory="Profile 1" "https://mail.google.com"
start chrome.exe --profile-directory="Profile 9" "https://mail.google.com"
```

---

### 🧹 Delete Node Modules.bat – React / Node Disk Cleanup

Frees disk space by deleting all `node_modules` folders from a root directory recursively.

**Why Use It?**
- Node-based projects often contain huge `node_modules` folders. This script:
  - Prompts for a root directory
  - Recursively deletes all `node_modules` folders within

**Script:**
```bat
@echo off
setlocal EnableDelayedExpansion
set /p rootDir=Enter the path of the folder to search in (e.g., D:\Projects): 
if not exist "%rootDir%" (
    echo The path "%rootDir%" does not exist.
    pause
    exit /b
)
echo Searching for node_modules folders in "%rootDir%" ...
echo.
for /d /r "%rootDir%" %%d in (node_modules) do (
    if /i "%%~nxd"=="node_modules" (
        echo Found: %%d
        rd /s /q "%%d"
        echo Deleted: %%d
        echo.
    )
)
echo Done.
pause
```

---

### 🔋 Battery Logger.bat – Battery Status Logger

Logs battery percentage and status (Charging, Discharging, Fully Charged) to a `.txt` file in your Documents folder.

**Use Case:**
- Perfect for laptop users who want to:
  - Track real battery usage over time
  - Analyze battery degradation or charging behavior

**Output Sample:**
```
[Tuesday, 5 August 2025, 10:13 PM] Battery: 86%, Status: Discharging
```

**Script:**
```bat
@echo off
setlocal
set "logFile=%USERPROFILE%\Documents\BatteryLog.txt"
for /f "tokens=1-7 delims=/:. " %%a in ('echo %date% %time%') do (
    set "weekday=%%a"
    set "day=%%b"
    set "month=%%c"
    set "year=%%d"
    set "hour=%%e"
    set "minute=%%f"
    set "second=%%g"
)
set "ampm=AM"
if %hour% GEQ 12 (
    set "ampm=PM"
    if %hour% GTR 12 set /a hour-=12
)
if %hour%==0 set hour=12
if %hour% LSS 10 set hour=0%hour%
set "datetime=%weekday%, %day% %month% %year%, %hour%:%minute% %ampm%"
for /f "skip=1" %%a in ('wmic path Win32_Battery get BatteryStatus') do (
    set "batteryStatus=%%a"
    goto :next1
)
:next1
for /f "skip=1" %%a in ('wmic path Win32_Battery get EstimatedChargeRemaining') do (
    set "batteryPercent=%%a"
    goto :next2
)
:next2
set "batteryStatus=%batteryStatus: =%"
set "batteryPercent=%batteryPercent: =%"
set "statusText=Unknown"
if "%batteryStatus%"=="1" set "statusText=Discharging"
if "%batteryStatus%"=="2" set "statusText=AC Power (Charging)"
if "%batteryStatus%"=="3" set "statusText=Fully Charged"
echo [%datetime%] Battery: %batteryPercent%%, Status: %statusText% >> "%logFile%"
echo Logged: [%datetime%] Battery: %batteryPercent%%, Status: %statusText%
endlocal
```

---

## 🛠️ Customization Guide

All scripts are designed to be user-friendly and customizable:

- **DevSetup.bat:**
  - Change VS Code path to match your system.
  - Replace Chrome profiles and URLs based on your dev workflow.
- **Delete Node Modules.bat:**
  - Works out of the box. Just enter the correct root folder.
- **Battery Logger.bat:**
  - No need to modify unless you want a different log file location or format.

---

## 🤝 Contributing

All ideas, improvements, and enhancements are welcome!

You can contribute by:

1. **Forking the repository**
2. **Creating a feature branch:**
   ```bash
   git checkout -b feature-branch-name
   ```
3. **Committing your changes:**
   ```bash
   git commit -m "Added new utility script"
   ```
4. **Opening a Pull Request**

Feel free to suggest enhancements, add new automation scripts, or improve error handling.

---

## 📄 License

This project is licensed under the MIT License.

You are free to use, modify, and distribute this code — just keep the attribution.

---

## 👤 Author

**Sabbas Ahmad**

🧑‍💻 BSCS Student at Air University Islamabad  
💼 XAF Developer at DSPAK  
📍 Pakistan  
🔗 GitHub: [sabbas-ctrl](https://github.com/sabbas-ctrl)

> "اللهم بارك لنا في أعمالنا واجعلها خالصة لوجهك الكريم"
>
> O Allah, bless our efforts and make them sincerely for