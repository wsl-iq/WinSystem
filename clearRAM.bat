@echo off
title Free Up RAM and Check Memory Usage

:: Run as Admin
>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config\system"
if %errorlevel% NEQ 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Cleaning RAM more effectively using Taskkill for high-memory processes
echo Cleaning RAM by closing high memory consuming processes...
for /f "tokens=1,2,*" %%a in ('powershell -Command "Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5 | Format-Table -HideTableHeaders Name, Id"') do (
    echo Closing process: %%a
    taskkill /f /pid %%b
)

:: Show memory usage by processes
echo.
echo Showing top memory consuming processes...
powershell -Command "Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 Name, @{Name='Memory(GB)';Expression={[math]::round($_.WorkingSet / 1GB, 2)}}"

echo RAM cleaned and processes displayed!
pause
