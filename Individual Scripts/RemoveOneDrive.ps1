# Stop Running OneDrive Process(s)
Get-Process OneDrive -ErrorAction SilentlyContinue | Stop-Process

# Determine OneDrive Setup Path Based on Arch
$path = "SysWOW64"
if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") {
    $path = "System32"
}

# Run OneDrive Setup with /uninstall Command
& "$env:SystemRoot\$path\OneDriveSetup.exe" /uninstall