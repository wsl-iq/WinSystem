@echo off
cd /d "%~dp0"

echo Updating files...

curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/LICENSE
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/BootOptimization
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/README.md
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/CleanDisk.bat
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/CleanMemoryRAM.bat
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/CloseBackRound.bat
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/SuperCPU.bat
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/WinSys.py
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/Uninstall.py
curl -O https://raw.githubusercontent.com/wsl-iq/WinSystem/main/Update.py

echo Finish Update Files 

echo Updating directories...

curl -L -o UnlockSpeed.zip https://github.com/wsl-iq/WinSystem/archive/refs/heads/main/UnlockSpeed.zip
curl -L -o WinCPU.zip https://github.com/wsl-iq/WinSystem/archive/refs/heads/main/WinCPU.zip
curl -L -o WinGPU.zip https://github.com/wsl-iq/WinSystem/archive/refs/heads/main/WinGPU.zip
curl -L -o WinGPU.zip https://github.com/wsl-iq/WinSystem/archive/refs/heads/main/FixBug.zip
curl -L -o WinGPU.zip https://github.com/wsl-iq/WinSystem/archive/refs/heads/main/BIOS.zip

echo Finish Update Folders or directories

echo Unzipping files...

powershell -command "Expand-Archive -Force 'UnlockSpeed.zip' '.'"
powershell -command "Expand-Archive -Force 'WinCPU.zip' '.'"
powershell -command "Expand-Archive -Force 'WinGPU.zip' '.'"
powershell -command "Expand-Archive -Force 'FixBug.zip' '.'"
powershell -command "Expand-Archive -Force 'BIOS.zip' '.'"

echo Finish UnZip Folders

echo Removing temporary files...

del UnlockSpeed.zip
del WinCPU.zip
del WinGPU.zip
del FixBug.zip
del BIOS.zip


echo Cleaning temporary files...
del /q /s /f "%temp%\*"
cleanmgr /sagerun:1

echo Project update completed successfully!

set /p choice=Do you want to restart the computer? (Y/N): 

if /I "%choice%"=="Y" goto restart
if /I "%choice%"=="N" goto cancel

echo Invalid choice, please enter Y or N.
pause
exit

:restart
echo The computer will restart in 5 seconds...
timeout /t 5 /nobreak >nul
shutdown /r /t 0
exit

:cancel
echo Operation canceled.
pause
exit
