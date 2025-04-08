@echo off
title Auto Background Killer
color 0A

echo Detecting running background applications...
timeout /t 2 >nul

:: Get list of running tasks filtered by session name "Console" (user programs)
tasklist /FI "SESSIONNAME eq Console" > running_processes.txt

:: Display the running user-level processes
echo ===============================================
echo Running user-level processes:
echo ===============================================
type running_processes.txt | find /v "Image Name"
echo ===============================================

echo.
set /p confirm=Do you want to terminate all these processes? (Y/N): 
if /i "%confirm%"=="Y" goto kill
if /i "%confirm%"=="N" goto end

:kill
echo Terminating processes...
for /f "skip=3 tokens=1" %%a in (running_processes.txt) do (
    taskkill /F /IM "%%a" >nul 2>&1
)
echo All user-level background processes have been terminated.
goto end

:end
del running_processes.txt >nul 2>&1
echo Done.
pause

