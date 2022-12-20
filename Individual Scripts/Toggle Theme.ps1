# If "SystemUsesLightTheme" is True, Switch to Dark Theme Using Registry Keys Else, Switch to Light Theme
$value = "1"
if (Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme"){
    $value = "0"
}
@("AppsUseLightTheme","SystemUsesLightTheme") | % { New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "$_" -Type DWORD -Value "$value" -Force }   
