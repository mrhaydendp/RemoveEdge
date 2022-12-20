# Force close Edge & delete application directory
Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process
Start-Sleep 2
Remove-Item "C:\Program Files (x86)\Microsoft\Edge\" -Recurse -Force
Get-Item "$HOME\AppData\Local\Packages\Microsoft.MicrosoftEdge*" | % { Remove-Item "$_" -Recurse -Force }

# Create registry file that tells Windows you have the old non-Chromium Edge browser (disables updates)
New-Item -Path "HKLM:\SOFTWARE\Microsoft\" -Name "EdgeUpdate" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdate\" -Name "DoNotUpdateToEdgeWithChromium" -Type DWORD -Value 1 -Force
