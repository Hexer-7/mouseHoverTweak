@echo off
setlocal EnableDelayedExpansion

:: Set the registry key where startup programs are listed
set "regKey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"

:mainMenu
cls
echo 1. Add a program to startup
echo 2. Exit
echo.
set /p "choice=Enter your choice: "

if "%choice%"=="1" goto addProgram
if "%choice%"=="2" goto :eof
goto mainMenu

:addProgram
for /f "delims=" %%x in ('powershell -Command "Add-Type -AssemblyName System.windows.forms; $fileDialog = New-Object System.Windows.Forms.OpenFileDialog; $fileDialog.Filter = 'Executables (*.exe)|*.exe'; $fileDialog.ShowDialog() | Out-Null; $fileDialog.FileName"') do set "filePath=%%x"
if "%filePath%"=="" goto mainMenu

:: Extract the file name without extension from the path
for %%i in ("%filePath%") do set "fileName=%%~ni"

:: Add the program path to the registry
reg add "%regKey%" /v "%fileName%" /d "%filePath%" /f
echo Program added successfully.
pause
goto mainMenu
