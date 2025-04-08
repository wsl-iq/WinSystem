@echo off
echo Cleaning hard drive...
timeout /t 2 >nul

:: Delete temporary files

cleanmgr /sageset:1

del /q /f /s "%temp%\*" 2>nul
del /q /f /s "C:\Windows\Temp\*" 2>nul

:: Run Disk Cleanup with saved settings
cleanmgr /sagerun:1

:: Delete Prefetch files
del /q /f /s "C:\Windows\Prefetch\*" 2>nul

:: Delete Windows error reports
del /q /f /s "C:\ProgramData\Microsoft\Windows\WER\*" 2>nul

echo Hard drive cleanup completed.
pause
