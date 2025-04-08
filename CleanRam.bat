@echo off
title Deep RAM Cleaner
color 0B

echo Cleaning temporary files...
del /q /f /s "%temp%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1

echo.
echo Attempting deep RAM cleanup using PowerShell...
timeout /t 1 >nul

:: Use PowerShell to run garbage collection and empty working sets
powershell -command "Get-Process | Where-Object { $_.PM -gt 50MB } | ForEach-Object { try { $_.MinWorkingSet = 5MB; $_.MaxWorkingSet = 10MB } catch {} }"

echo.
echo Running idle system tasks to free memory...
%windir%\System32\rundll32.exe advapi32.dll,ProcessIdleTasks

echo.
echo RAM cleanup completed.
pause
