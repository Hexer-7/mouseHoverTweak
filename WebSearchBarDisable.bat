@echo off
cls
color 4
echo Disabling Web Search in Windows 11 or 10...

:: Step 1: Run the batch file with admin rights
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"

:: Check if the batch file is running with admin rights
if %errorlevel% neq 0 (
  echo Please run this batch file as administrator.
  echo.
  pause
  exit /b
)

:: Step 2: Navigate to the appropriate registry key and set the value
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f

:: Step 3: Force Explorer to refresh the settings
taskkill /f /im explorer.exe
start explorer.exe

echo.
echo Web Search has been disabled.
echo.
pause
