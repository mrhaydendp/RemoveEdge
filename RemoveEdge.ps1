# Force close Edge
Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process
Start-Sleep 2

# Remove Edge from ProgramFiles, AppData, ProgramData, Start Menu, & Desktop
Get-Item "${env:ProgramFiles(x86)}\Microsoft\Edge\","$env:LOCALAPPDATA\Packages\Microsoft.MicrosoftEdge*","$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge*","$HOME\Desktop\Microsoft Edge*" | % {
    Remove-Item "$_" -Recurse -Force
}

# Create registry file that tells Windows you have the old non-Chromium Edge browser (disables updates)
New-Item -Path "HKLM:\SOFTWARE\Microsoft\" -Name "EdgeUpdate" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdate\" -Name "DoNotUpdateToEdgeWithChromium" -Type DWORD -Value 1 -Force
