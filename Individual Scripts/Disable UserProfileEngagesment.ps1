Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\
Get-Item .\ | New-Item 'UserProfileEngagement' -Force
New-ItemProperty .\UserProfileEngagement\ -Name 'ScoobeSystemSettingEnabled' -Value "0" -PropertyType DWORD -Force