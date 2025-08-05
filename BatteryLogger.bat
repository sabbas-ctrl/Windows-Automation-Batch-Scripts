@echo off
setlocal

:: Set log file path
set "logFile=%USERPROFILE%\Documents\BatteryLog.txt"

:: Get readable timestamp: Tuesday, 5 August 2025, 10:13 PM
for /f "tokens=1-7 delims=/:. " %%a in ('echo %date% %time%') do (
    set "weekday=%%a"
    set "day=%%b"
    set "month=%%c"
    set "year=%%d"
    set "hour=%%e"
    set "minute=%%f"
    set "second=%%g"
)

:: Handle AM/PM and 12-hour conversion
set "ampm=AM"
if %hour% GEQ 12 (
    set "ampm=PM"
    if %hour% GTR 12 set /a hour-=12
)
if %hour%==0 set hour=12
if %hour% LSS 10 set hour=0%hour%

set "datetime=%weekday%, %day% %month% %year%, %hour%:%minute% %ampm%"

:: Get battery status
for /f "skip=1" %%a in ('wmic path Win32_Battery get BatteryStatus') do (
    set "batteryStatus=%%a"
    goto :next1
)
:next1

:: Get battery percentage
for /f "skip=1" %%a in ('wmic path Win32_Battery get EstimatedChargeRemaining') do (
    set "batteryPercent=%%a"
    goto :next2
)
:next2

:: Clean values (remove spaces)
set "batteryStatus=%batteryStatus: =%"
set "batteryPercent=%batteryPercent: =%"

:: Interpret battery status
set "statusText=Unknown"
if "%batteryStatus%"=="1" set "statusText=Discharging"
if "%batteryStatus%"=="2" set "statusText=AC Power (Charging)"
if "%batteryStatus%"=="3" set "statusText=Fully Charged"

:: Write to log file
echo [%datetime%] Battery: %batteryPercent%%, Status: %statusText% >> "%logFile%"

echo Logged: [%datetime%] Battery: %batteryPercent%%, Status: %statusText%

endlocal
