@echo off
:: === Run as admin ===
>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title Boot Optimizer
color 0A

echo Setting boot timeout to 5 seconds...
bcdedit /timeout 5

echo Disabling unnecessary startup apps...

:: Auto disable known startup hogs
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /f >nul 2>&1
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Skype /f >nul 2>&1
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Teams /f >nul 2>&1

echo Fast Boot (enabled by default in BIOS) - Check manually if needed.
echo Boot optimization done.
pause
