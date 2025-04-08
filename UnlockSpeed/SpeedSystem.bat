
@echo off
:: === Run as admin ===
>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title Safe Performance Boost (Pseudo Overclock)
color 0E

echo Enabling Ultimate Performance mode...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

echo Disabling CPU throttling...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f

echo Using all CPU cores at boot...
bcdedit /set {current} numproc %NUMBER_OF_PROCESSORS%

echo Disabling Sleep and Hibernate...
powercfg -h off
powercfg -change -standby-timeout-ac 0
powercfg -change -monitor-timeout-ac 0

echo Applying additional tweaks for max performance...

:: Prioritize foreground apps
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f

echo Boost applied successfully!
pause
