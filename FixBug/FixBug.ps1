# WinSystem  : personal computer assistant
# Version    : 1
# Github     : https://github.com/wsl-iq/WinSystem
# Developer  : Mohammed Al-Baqer
# ==================================================================================================
# Title    : Windows System Repair Script (SFC + DISM + Optional Restart)
# Author   : Mohammed Al-Baqer
# Name     : FixBug
# Language : PowerShell
# Purpose  : This script is used to scan and repair Windows system files and image components.
#            It ensures system stability and integrity by using SFC and DISM tools.
# ==================================================================================================

# 📌 What This Script Does:
# - Checks if the script is run as Administrator.
# - Runs "sfc /scannow" to scan and repair corrupted or missing system files.
# - Runs "DISM" commands to check and restore the system image:
#     > DISM /Online /Cleanup-Image /CheckHealth
#     > DISM /Online /Cleanup-Image /ScanHealth
#     > DISM /Online /Cleanup-Image /RestoreHealth
# - After repairs, it prompts the user to optionally restart the computer to apply changes.

# 🧠 When to Use:
# - When experiencing slow system performance or crashing apps.
# - When system files might be corrupted or missing.
# - After malware removal or unexpected shutdowns.
# - When Windows features stop working properly.

# ⚠️ Important Notes:
# - Must be run with Administrator privileges.
# - Script is safe to use and doesn't delete personal files.
# - Scans may take several minutes depending on system status.
# - Restarting the system after repair is recommended for best results.

# ✅ Recommended for:
# - Technicians, developers, or any user facing system issues on Windows.
# - Integrating into system maintenance tools or automation scripts.

# 🔚 End of Description
# ==================================================================================================


if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as Administrator."
    exit
}

Write-Host "`n[+] Starting system file check with SFC..." -ForegroundColor Cyan
sfc /scannow

Write-Host "`n[+] SFC completed. Now running DISM checks..." -ForegroundColor Yellow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

Write-Host "`n[+] Repairs completed." -ForegroundColor Green

$restart = Read-Host "`nDo you want to restart the computer now? (y/n)"
if ($restart -eq "y") {
    Write-Host "Restarting the computer..." -ForegroundColor Red
    Restart-Computer
} else {
    Write-Host "Restart cancelled. Please reboot manually later." -ForegroundColor Yellow
}
