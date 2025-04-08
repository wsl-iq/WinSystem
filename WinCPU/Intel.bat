@echo off
:: === Run as admin ===
>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title CPU Optimizer - Intel
color 0B

echo Optimizing Intel CPU...
powercfg -setactive SCHEME_MIN

sc config SysMain start=auto
net start SysMain

%SystemRoot%\System32\rundll32.exe advapi32.dll,ProcessIdleTasks

echo Intel CPU optimization completed.
pause
