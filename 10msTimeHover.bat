@echo off
color 4
echo Setting Context Menu Hover Time to 10ms...

:: Set Context Menu Hover Time to 10ms (10000 microseconds)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 10 /f

echo.
echo Context Menu Hover Time has been set to 10ms. You have to sign out or restart system to see results.
echo.
pause
