# Generates simple events to test logging
Start-Process notepad.exe
Start-Sleep -Seconds 2
Stop-Process -Name notepad -Force -ErrorAction SilentlyContinue

# Simple PowerShell command to trigger transcription/script block logging
Write-Output "Hello from Week 1 test" | Out-Null
