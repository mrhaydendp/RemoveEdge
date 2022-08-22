# Delete Edge setup.exe and all of its subfolders
$edge = (Get-ChildItem 'C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe' | Select -First 1)
& $edge --uninstall --system-level --verbose-logging --force-uninstall

# Create registry file that tells Windows you have the old non-Chromium Edge browser (disables updates)
New-Item -Path "HKLM:\SOFTWARE\Microsoft\" -Name "EdgeUpdate" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdate\" -Name 'DoNotUpdateToEdgeWithChromium' -Force -Type DWORD -Value 1
