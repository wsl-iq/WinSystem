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
