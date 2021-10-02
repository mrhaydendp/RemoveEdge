# Remove Edge installer
& 'C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe' --uninstall --system-level --verbose-logging --force-uninstall

# Add registry file that tells Windows you have the old Edge browser
Start-BitsTransfer https://coachtestprep.s3.amazonaws.com/direct-uploads/user-68790/4d215565-acb4-4984-a2b8-3e56d9e99895/stopedge.zip ~\stopedge.zip

# Unzip and run .reg file
Expand-Archive ~\stopedge.zip ~
~\stopedge.reg

# Wait 10 seconds
Start-Sleep 10

# Cleanup
Remove-Item ~\stopedge*
