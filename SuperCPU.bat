@echo off
title CPU Performance Optimizer
color 0E

echo ================================
echo    Optimizing CPU Performance
echo ================================
timeout /t 1 >nul

:: Set High Performance Power Plan
echo Setting power plan to High Performance...
powercfg -setactive SCHEME_MIN

:: Clear standby memory (via PowerShell)
echo Clearing memory cache...
powershell -command "Clear-Content -Path '$env:TEMP\*.tmp' -ErrorAction SilentlyContinue"

:: Close high CPU usage background tasks (optional ones)
echo Killing unnecessary high-CPU processes...
taskkill /F /IM "OneDrive.exe" >nul 2>&1
taskkill /F /IM "YourPhone.exe" >nul 2>&1
taskkill /F /IM "chrome.exe" >nul 2>&1
taskkill /F /IM "msedge.exe" >nul 2>&1
taskkill /F /IM "Teams.exe" >nul 2>&1

:: Run system idle tasks to release CPU
echo Running idle system cleanup...
%windir%\System32\rundll32.exe advapi32.dll,ProcessIdleTasks

:: Refresh system cache
echo Refreshing system state...
ipconfig /flushdns >nul

echo ================================
echo     CPU Optimization Done
echo ================================
pause
