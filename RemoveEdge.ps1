#Requires -RunAsAdministrator

# Check if Edge is installed
if (!(Test-Path "${env:ProgramFiles(x86)}\Microsoft\Edge")){
    Write-Host "Error: Microsoft Edge was not Found"
    pause; exit
}

# Backup start menu
Write-Host "Backing Up Start Menu to:" "'$HOME\Documents\Backup'"
Copy-Item -Recurse "C:\ProgramData\Microsoft\Windows\Start Menu" "$HOME\Documents\Backup"

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
