# Delete latest version of Edge and all of its subfolders
$edge = @(Get-ChildItem 'C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe')
& $edge[0] --uninstall --system-level --verbose-logging --force-uninstall

# Create registry file that tells Windows you have the old Edge browser
Set-Location HKLM:\SOFTWARE\Microsoft\
Get-Item .\ | New-Item 'EdgeUpdate' -Force
New-ItemProperty .\EdgeUpdate\ -Name 'DoNotUpdateToEdgeWithChromium' -Value "1" -PropertyType DWORD -Force
