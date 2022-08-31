# Determine System Architecture
$arch = ([IntPtr]::Size * 8)
if ("$arch" -eq 32) {
$arch = 86
}

# Install VCLibs & Winget using Microsoft Shortlinks 
Add-AppxPackage -DependencyPath "https://aka.ms/Microsoft.VCLibs.x$arch.14.00.Desktop.appx" -Path "https://aka.ms/getwinget" -ForceUpdateFromAnyVersion	
