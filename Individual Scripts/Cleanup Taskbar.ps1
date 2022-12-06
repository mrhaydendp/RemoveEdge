$icons = @("TaskbarMn","TaskbarDa","ShowTaskViewButton","TaskbarAl")
foreach ($icon in $icons){
    New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" -Name "$icon" -Force -Type DWORD -Value 0
}
New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\" -Name "Explorer" -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer\" -Name "DisableSearchBoxSuggestions" -Force -Type DWORD -Value 1
