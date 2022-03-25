# Check if WinGet is Installed, if not Install From MS Store
if (!(Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe)){
    Write-Host "WinGet not Found, Installing Now"
    Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
    $nid = (Get-Process AppInstaller).Id; Wait-Process -Id $nid
    Write-Host "WinGet Successfully Installed"
}

# Wait 5 Seconds
Start-Sleep 5

# Install Recommended Apps
$applications = @("Brave","7-Zip","BleachBit")
foreach ($app in $applications){
    winget install -s winget -e "$app" --accept-source-agreements
}
