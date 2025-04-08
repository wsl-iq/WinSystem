@echo off
:: === Run as admin ===
>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title CPU Optimizer - AMD Ryzen
color 0C

echo Optimizing AMD Ryzen CPU...
powercfg -setactive SCHEME_MIN

sc stop SysMain
sc config SysMain start=disabled

%SystemRoot%\System32\rundll32.exe advapi32.dll,ProcessIdleTasks

echo AMD Ryzen CPU optimization completed.
pause
