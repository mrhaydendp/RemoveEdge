# Toggle Transparency & Animations
$value = "1"
if (Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency"){
    $value = "0"
}
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Type DWORD -Value "$value" -Force
New-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics\" -Name "MinAnimate" -Type DWORD -Value "$value" -Force
