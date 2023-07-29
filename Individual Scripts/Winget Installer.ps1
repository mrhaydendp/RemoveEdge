# Check if Winget is already installed
if (Test-Path "$HOME\AppData\Local\Microsoft\WindowsApps\winget.exe"){
    Write-Host "Winget Already Installed, Exiting..."
    pause; exit
}

# Select installer method
$option = Read-Host "Winget Installation Methods:`n1. Appinstaller`n2. Windows Store`n3. Add-Appx`nOptions (1,2,3)"

# Installation methods
if ("$option" -eq "1"){
    Write-Host "Installing 'getwinget.msixbundle' from Official Microsoft Link & Running with Appinstaller"
    Start-BitsTransfer "https://aka.ms/getwinget" getwinget.msixbundle; .\getwinget.msixbundle
    Get-Process AppInstaller | Wait-Process
} elseif ("$option" -eq "2"){
    Write-Host "Opening Store Link..."
    Start-Process "ms-windows-store://pdp/?ProductId=9NBLGGH4NNS1"
    Get-Process WinStore.App | Wait-Process
} elseif ("$option" -eq "3"){
    Write-Host "Checking Architecture"
    $arch = "64"
    if (([IntPtr]::Size * 8) -eq 32){
        $arch = "86"
    }
    Write-Host "Stream-installing Winget & VCLibs"
    Add-AppxPackage -DependencyPath "https://aka.ms/Microsoft.VCLibs.x$arch.14.00.Desktop.appx" -Path "https://aka.ms/getwinget" -ForceUpdateFromAnyVersion
}

# Check if Winget status
$status = "Failed to Install Winget"
if (Test-Path "$HOME\AppData\Local\Microsoft\WindowsApps\winget.exe"){
    $status = "Winget Successfully Installed"
}
Write-Host "$status"
