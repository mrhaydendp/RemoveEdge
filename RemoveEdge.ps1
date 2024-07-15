# If script isn't running as admin, restart with admin privileges
if (([Security.Principal.WindowsIdentity]::GetCurrent()).Owner.Value -ne "S-1-5-32-544") {
    $terminal = "powershell"
    if (Get-Command wt -ErrorAction SilentlyContinue) { $terminal = "wt" }
        Start-Process wt -Verb RunAs "PowerShell -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

# Exit if Edge was not found
if (!(Test-Path "C:\Program Files(x86)\Microsoft\Edge")){
    $option = Read-Host "Edge was not Found, Would you Like to Re-install it? (Y/n)"
    if ("$option" -ne "n"){
        winget install -s winget "Microsoft Edge"
    }
    Write-Host "Exiting"
    pause; exit
}

# Enable & create system restore point
Enable-ComputerRestore -Drive "$env:HOMEDRIVE" 
Checkpoint-Computer -Description "Before RemoveEdge" -RestorePointType "MODIFY_SETTINGS"

# Create registry file that tells Windows you have the old non-Chromium Edge browser (disables updates)
Write-Host "Disabling Edge Updates"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\" -Name "EdgeUpdate" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdate\" -Name "DoNotUpdateToEdgeWithChromium" -Type DWORD -Value 1 -Force

# Stop Edge
Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process

# Remove Edge shortcuts
Write-Host "Removing Edge Shortcuts From: Desktop & Start Menu"
Get-Item "$HOME\Desktop\*","C:\ProgramData\Microsoft\Windows\Start Menu\Programs\*" -Include "*Microsoft Edge*" | % { Remove-Item "$_" -Force -Verbose }

# Remove Edge data
Write-Host "Removing Edge Data"
Get-Item "C:\Program Files (x86)\Microsoft\Edge\","$env:LOCALAPPDATA\Packages\Microsoft.MicrosoftEdge*" | % {Remove-Item "$_" -Recurse -Force -Verbose}

# Ask to reset taskbar pins & restart Explorer to apply changes
$option = Read-Host "Would you Like to Reset Taskbar Pins? (Y/n)"
if ("$option" -ne "n"){
    Remove-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites" -ErrorAction SilentlyContinue
}
Get-Process explorer | Stop-Process
