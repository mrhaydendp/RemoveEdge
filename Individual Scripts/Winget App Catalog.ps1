# Applications List
$applications = (
    [PSCustomObject] @{Program="7-Zip";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="BleachBit";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="CPUID CPU-Z";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="HWiNFO";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="Notepad++";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="NVCleanstall";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="Obsidian";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="PowerToys (Preview)";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="TechPowerUp GPU-Z";Source="Winget";Category="Utilities"},
    [PSCustomObject] @{Program="Brave";Source="Winget";Category="Browsers"},
    [PSCustomObject] @{Program="Google Chrome";Source="Winget";Category="Browsers"},
    [PSCustomObject] @{Program="Microsoft Edge Browser";Source="MSStore";Category="Browsers"},
    [PSCustomObject] @{Program="Mozilla Firefox";Source="Winget";Category="Browsers"},
    [PSCustomObject] @{Program="VSCodium";Source="Winget";Category="Development"},
    [PSCustomObject] @{Program="Visual Studio Code";Source="Winget";Category="Development"},
    [PSCustomObject] @{Program="Discord";Source="Winget";Category="Gaming"},
    [PSCustomObject] @{Program="GOG Galaxy";Source="Winget";Category="Gaming"},
    [PSCustomObject] @{Program="Steam";Source="Winget";Category="Gaming"}
)

# Install Selected Applications by Using Source and Program Tags
$applications | Out-GridView -Title "Select Application(s) to Install (Ctrl + Click to Select Multiple)" -Passthru | % {
    winget install -s $_.Source $_.Program --accept-package-agreements --accept-source-agreements
}
