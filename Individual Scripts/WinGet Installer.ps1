# Check if WinGet is Installed, if not Install Run Script
if (!(Test-Path "~\AppData\Local\Microsoft\WindowsApps\winget.exe")){
    # Get Architecture Type & Install Latest Version of VCLibs From MS Docs
    $arch = "x64"
    if ((Get-WmiObject -Class Win32_ComputerSystem).SystemType -match '(x86)'){
        $arch = "x86"
    }
    $vclibs = (Invoke-WebRequest -UseBasicParsing -URI "https://docs.microsoft.com/en-us/troubleshoot/developer/visualstudio/cpp/libraries/c-runtime-packages-desktop-bridge").Links.Href | Select-String "Microsoft.VCLibs.$arch"
    Add-AppxPackage -Path "$vclibs"
    # Grab Latest Stable Release of WinGet from GitHub
    $latest = (Invoke-WebRequest -UseBasicParsing -URI "https://github.com/microsoft/winget-cli/releases/latest").Links.Href | Select-String ".msixbundle"
    Add-AppxPackage -Path "https://github.com$latest"
}