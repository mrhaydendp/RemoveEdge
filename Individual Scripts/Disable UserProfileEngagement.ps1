# Go to HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\
Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\

# Create UserProfileEngagement Key
Get-Item .\ | New-Item 'UserProfileEngagement' -Force

# Create ScoobeSystemSettingEnabled DWORD With a Value of 0
New-ItemProperty .\UserProfileEngagement\ -Name 'ScoobeSystemSettingEnabled' -Value "0" -PropertyType DWORD -Force
