# Add latest SDIO version to download link & download to $HOME\Desktop
Write-Host "Finding Latest SDIO Version From: 'https://www.glenn.delahoy.com/snappy-driver-installer-origin'"
$latest = (Invoke-RestMethod "https://www.glenn.delahoy.com/snappy-driver-installer-origin/" | Select-String "SDIO_(.*?)[0-9].zip").Matches.Value
if (!("$latest")){
    Write-Host "Error: Could not Find Latest SDIO Version`nExiting..."
    exit
}
Write-Host "Found: $latest"
Start-BitsTransfer -Source "https://www.glenn.delahoy.com/snappy-driver-installer-origin/downloads/sdio/$latest" -Destination "$HOME\Desktop"
if (Test-Path "$HOME\Desktop\$latest"){
    Write-Host "Successfully Installed to: '$HOME\Desktop\$latest'"
}
