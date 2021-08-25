# Removes Edge installer
& 'C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe' --uninstall --system-level --verbose-logging --force-uninstall

# Adds registry file that tells Windows you have the old Edge browser
Start-BitsTransfer -Source https://christitus.com/files/stopedge.zip -Destination ./

# Unzip and run .reg file
Expand-Archive .\stopedge.zip .\
.\stopedge.reg

# Cleanup
rm ./stopedge*
