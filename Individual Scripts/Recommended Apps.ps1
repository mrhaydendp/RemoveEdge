# Check If Winget Is Installed
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    'Winget Already Installed'
}  
else{
    Write-Host "Winget not found, installing it right now."
    Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
    $nid = (Get-Process AppInstaller).Id
    Wait-Process -Id $nid
    Write-Host Winget Installed
}
winget install brave
winget install 7zip
winget install bleachbit