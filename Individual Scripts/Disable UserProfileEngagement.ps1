# Create UserProfileEngagement Key
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\" -Name "UserProfileEngagement" -Force

# Create ScoobeSystemSettingEnabled in UserProfileEngagement Directory With a DWORD Value of 0
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement\" -Name "ScoobeSystemSettingEnabled" -Force -Type DWORD -Value 0
