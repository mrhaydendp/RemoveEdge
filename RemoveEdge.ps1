#Requires -RunAsAdministrator

# If Edge is not installed, ask to install or exit
if (!(Test-Path "${env:ProgramFiles(x86)}\Microsoft\Edge")){
    $option = Read-Host "Edge was not Found, Would you Like to Install it? (Y/n)"
    if ("$option" -ne "n"){
        Start-BitsTransfer -Source "https://go.microsoft.com/fwlink/?linkid=2109047&Channel=Stable&language=en&brand=M100" MicrosoftEdgeSetup.exe; .\MicrosoftEdgeSetup.exe
        Get-Process MicrosoftEdgeSetup | Wait-Process
        Write-Host "Edge Installation Complete"
        Remove-Item .\MicrosoftEdgeSetup.exe
    }
    Write-Host "Exiting..."
    pause; exit
}

# Enable & create system restore point
Enable-ComputerRestore -Drive (Get-Location).Drive.Root
Checkpoint-Computer  -Description "Before RemoveEdge" -RestorePointType "MODIFY_SETTINGS"

# Force stop Edge
Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process
Start-Sleep 2

# Remove Edge from ProgramFiles & AppData
Get-Item "${env:ProgramFiles(x86)}\Microsoft\Edge\","$env:LOCALAPPDATA\Packages\Microsoft.MicrosoftEdge*" | % {
Remove-Item "$_" -Recurse -Force -Verbose
}

# Create registry file that tells Windows you have the old non-Chromium Edge browser (disables updates)
New-Item -Path "HKLM:\SOFTWARE\Microsoft\" -Name "EdgeUpdate" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdate\" -Name "DoNotUpdateToEdgeWithChromium" -Type DWORD -Value 1 -Force

# Remove Edge shortcut from desktop & start
Get-Item "C:\Users\*\Desktop\Microsoft Edge.lnk","C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" | % { Remove-Item "$_" -Recurse -Force -Verbose }

# Ask to reset taskbar pins to remove Edge & restart Explorer to apply desktop, start, & taskbar changes
$option = Read-Host "Would you Like to Reset Taskbar Pins? (Y/n)"
if ("$option" -ne "n"){
    Remove-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites" -ErrorAction SilentlyContinue
}
Get-Process explorer | Stop-Process
