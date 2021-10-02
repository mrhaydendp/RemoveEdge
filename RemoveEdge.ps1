# Remove Edge installer
& 'C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe' --uninstall --system-level --verbose-logging --force-uninstall

# Create registry file that tells Windows you have the old Edge browser
Set-Location HKLM:\SOFTWARE\Microsoft\
Get-Item .\ | New-Item 'EdgeUpdate' -Force
New-ItemProperty .\EdgeUpdate\ -Name 'DoNotUpdateToEdgeWithChromium' -Value "1" -PropertyType DWORD -Force
