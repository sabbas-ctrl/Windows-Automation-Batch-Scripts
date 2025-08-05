@echo off
setlocal EnableDelayedExpansion

:: Ask user for the directory
set /p rootDir=Enter the path of the folder to search in (e.g., D:\Projects): 

:: Check if directory exists
if not exist "%rootDir%" (
    echo The path "%rootDir%" does not exist.
    pause
    exit /b
)

echo Searching for node_modules folders in "%rootDir%" ...
echo.

:: Find all node_modules folders and delete
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
