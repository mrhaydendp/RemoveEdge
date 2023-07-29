# Center taskbar & remove MS items
@("TaskbarMn","TaskbarDa","ShowTaskViewButton","TaskbarAl") | % {
    New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" -Name "$_" -Type DWORD -Value 0 -Force
}

# Disable search in start menu
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search\" -Name "SearchboxTaskbarMode" -Type DWORD -Value 0 -Force
New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\" -Name "Explorer" -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer\" -Name "DisableSearchBoxSuggestions" -Type DWORD -Value 1 -Force

# Restart Explorer to apply changes
Get-Process explorer | Stop-Process
