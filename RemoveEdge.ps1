# Delete latest version of Edge and all of its subfolders
$edge = (Get-ChildItem 'C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe')
& $edge[0] --uninstall --system-level --verbose-logging --force-uninstall

# Create registry file that tells Windows you have the old Edge browser
New-Item -Path "HKLM:\SOFTWARE\Microsoft\" -Name "EdgeUpdate" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdate\" -Name 'DoNotUpdateToEdgeWithChromium' -Force -Type DWORD -Value 1
