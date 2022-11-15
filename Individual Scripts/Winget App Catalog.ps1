$applications = @(
    "## Utilities"
    "Windows Terminal"
    "PowerToys (Preview)"
    "7-Zip"
    "AutoHotkey"
    "Discord"
    "BleachBit"
    "GitHub Desktop"
    "balenaEtcher"
    "## Web Browsers"
    "Brave"
    "Mozilla Firefox"
    "Google Chrome"
    "## Video & Image Tools"
    "GIMP"
    "VLC media player"
    "## Document Tools"
    "VSCodium"
    "Notepad++"
) | Out-GridView -Title "Select Application(s) to Install (Ctrl + Click to Select Multiple)" -OutputMode Multiple | ForEach-Object {
    winget install -s winget "$_" --accept-source-agreements | Out-Host
}