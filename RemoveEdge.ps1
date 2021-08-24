# Removes Edge installer
Remove-Item 'C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe'

# Adds registry file that tells Windows you have the old Edge browser
Invoke-WebRequest -Uri https://christitus.com/files/stopedge.zip -OutFile ./stopedge.zip

# Unzip and run .reg file
Expand-Archive .\stopedge.zip -Force .\
.\stopedge.reg