@echo off
:: === Run as admin ===
>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title GPU Optimizer - Intel
color 0B

echo Optimizing Intel Integrated Graphics...
powercfg -setacvalueindex SCHEME_MIN SUB_VIDEO VIDEOIDLE 0
powercfg -setactive SCHEME_MIN

echo (Optional) Restart Intel driver using Devcon...
:: devcon restart *VEN_8086* >nul 2>&1

echo Intel GPU optimization done.
pause
