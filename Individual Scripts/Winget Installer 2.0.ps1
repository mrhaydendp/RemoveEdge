# If Winget isn't Installed, Open MS Store Page
if (!Get-AppPackage -name 'Microsoft.DesktopAppInstaller') {
    Start-Process "ms-windows-store://pdp/?ProductId=9NBLGGH4NNS1"
    $nid = (Get-Process AppInstaller).Id; Wait-Process -Id $nid
}