# If "SystemUsesLightTheme" is True, Switch to Dark Theme Using Registry Keys Else, Switch to Light Theme
if (Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme"){
    @("AppsUseLightTheme","SystemUsesLightTheme") | % { New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "$_" -Type DWORD -Value 0 -Force }   
} else {
    @("AppsUseLightTheme","SystemUsesLightTheme") | % { New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "$_" -Type DWORD -Value 1 -Force }   
}