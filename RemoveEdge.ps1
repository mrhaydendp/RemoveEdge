# Removes Edge installer
'C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe' --uninstall --system-level --verbose-logging --force-uninstall

# Adds registry file that tells Windows you have the old Edge browser
Invoke-WebRequest -Uri https://christitus.com/files/stopedge.zip -OutFile ./stopedge.zip

# Unzip and run .reg file
Expand-Archive .\stopedge.zip -Force .\
.\stopedge.reg

# Cleanup
rm ./stopedge*
