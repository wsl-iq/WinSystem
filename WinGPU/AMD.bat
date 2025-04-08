
@echo off
:: === Run as admin ===
>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title GPU Optimizer - AMD
color 0C

echo Optimizing AMD GPU...
powercfg -setactive SCHEME_MIN

echo (Optional) Restart AMD driver using Devcon...
:: devcon restart *VEN_1002* >nul 2>&1

echo AMD GPU optimization done.
pause
