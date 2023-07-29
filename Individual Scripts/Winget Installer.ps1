# Check if Winget is already installed
if (Test-Path "$HOME\AppData\Local\Microsoft\WindowsApps\winget.exe"){
    Write-Host "Winget Already Installed, Exiting..."
    pause; exit
}

# Select installation method
$option = Read-Host "Winget Installation Methods:`n1. Direct Install (Default)`n2. Winget .msixbundle`n3. Windows Store`nOptions (1,2,3)"

# Installation methods
if ("$option" -eq "2"){
    Write-Host "Installing Winget .msixbundle & Opening in App Installer"
    Start-BitsTransfer "https://aka.ms/getwinget" getwinget.msixbundle; .\getwinget.msixbundle
    Get-Process AppInstaller | Wait-Process
} elseif ("$option" -eq "3"){
    Write-Host "Opening Store Link..."
    Start-Process "ms-windows-store://pdp/?ProductId=9NBLGGH4NNS1"
    Get-Process WinStore.App | Wait-Process
} else {
    Write-Host "Opening App Installer..."
    Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
    Get-Process AppInstaller | Wait-Process
}

# Check if Winget status
$status = "Failed to Install Winget"
if (Test-Path "$HOME\AppData\Local\Microsoft\WindowsApps\winget.exe"){
    $status = "Winget Successfully Installed"
}
Write-Host "$status"
