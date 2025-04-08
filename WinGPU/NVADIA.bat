@echo off
:: === Run as admin ===
>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title GPU Optimizer - Nvidia
color 0A

echo Optimizing Nvidia GPU...
powercfg -setactive SCHEME_MIN

echo (Optional) Restart Nvidia driver using Devcon...
:: devcon restart *VEN_10DE* >nul 2>&1

echo Nvidia GPU optimization done.
pause
