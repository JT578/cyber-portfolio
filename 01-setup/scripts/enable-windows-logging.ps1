<#
.SYNOPSIS
    Enables baseline Windows logging for lab purposes.
.DESCRIPTION
    - Enables Audit Process Creation (4688)
    - Adds command-line to process creation events
    - Enables PowerShell transcription, script block logging, and module logging
    NOTE: Run as Administrator.
#>

# Create PowerShell log directory
$LogDir = "C:\Logs\PowerShell"
New-Item -ItemType Directory -Path $LogDir -Force | Out-Null

# Enable Audit Process Creation
Write-Host "[*] Enabling Audit Process Creation"
auditpol /set /subcategory:"Process Creation" /success:enable | Out-Null

# Include command line in 4688
Write-Host "[*] Including command line in process creation events"
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -Name "ProcessCreationIncludeCmdLine_Enabled" -Type DWord -Value 1

# PowerShell Transcription
Write-Host "[*] Enabling PowerShell transcription"
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" -Name "EnableTranscripting" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" -Name "OutputDirectory" -Type String -Value $LogDir

# PowerShell Script Block Logging
Write-Host "[*] Enabling Script Block Logging"
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Type DWord -Value 1

# PowerShell Module Logging
Write-Host "[*] Enabling Module Logging"
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "EnableModuleLogging" -Type DWord -Value 1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" -Name "*" -PropertyType String -Value "*" -Force | Out-Null

Write-Host "[+] Baseline logging enabled. A reboot is recommended."
