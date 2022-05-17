# If Winget isn't Installed, Open App Installer Store Page to Install
if (!(Get-AppxPackage -name "Microsoft.DesktopAppInstaller")) {
    Start-Process "ms-windows-store://pdp/?ProductId=9NBLGGH4NNS1"
    $nid = (Get-Process WinStore.App).Id; Wait-Process -Id $nid
}
