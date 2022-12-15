# Manual Appinstaller Method
if (!(Test-Path "$HOME\AppData\Local\Microsoft\WindowsApps\winget.exe")){
    Start-BitsTransfer "https://aka.ms/getwinget" getwinget.msixbundle; .\getwinget.msixbundle
    Get-Process AppInstaller | Wait-Process
    Write-Host "Successfully Installed Winget"
}

# Windows Store Method
if (!(Test-Path "$HOME\AppData\Local\Microsoft\WindowsApps\winget.exe")){
    Start-Process "ms-windows-store://pdp/?ProductId=9NBLGGH4NNS1"
    Get-Process WinStore.App | Wait-Process
    Write-Host "Successfully Installed Winget"
}

# Manual Add-Appx Method
if (!(Test-Path "$HOME\AppData\Local\Microsoft\WindowsApps\winget.exe")){
    $arch = "64"
    if (([IntPtr]::Size * 8) -eq 32){
        $arch = "86"
    }
    Add-AppxPackage -DependencyPath "https://aka.ms/Microsoft.VCLibs.x$arch.14.00.Desktop.appx" -Path "https://aka.ms/getwinget" -ForceUpdateFromAnyVersion
}
