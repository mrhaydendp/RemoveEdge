Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("(^{ESC})")
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("Visual Effects")
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep 1.2
[System.Windows.Forms.SendKeys]::SendWait("{TAB} {TAB} ")
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("(%{F4})")