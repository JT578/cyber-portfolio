<#
.SYNOPSIS
    Verifies baseline Windows logging settings.
#>

$results = @()

# Check Process Creation auditing
$ap = (auditpol /get /subcategory:"Process Creation") -join "`n"
$pc_enabled = $ap -match "Success\s*:\s*Enabled"

# Check command-line in 4688
$cmdline = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -Name "ProcessCreationIncludeCmdLine_Enabled" -ErrorAction SilentlyContinue
$cmdline_enabled = ($cmdline.ProcessCreationIncludeCmdLine_Enabled -eq 1)

# Check PS transcription
$tx = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" -ErrorAction SilentlyContinue
$tx_enabled = ($tx.EnableTranscripting -eq 1)
$tx_dir = $tx.OutputDirectory

# Check Script Block Logging
$sbl = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -ErrorAction SilentlyContinue
$sbl_enabled = ($sbl.EnableScriptBlockLogging -eq 1)

# Check Module Logging
$ml = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -ErrorAction SilentlyContinue
$ml_enabled = ($ml.EnableModuleLogging -eq 1)

$results += [PSCustomObject]@{{ Setting = "Audit Process Creation (4688)"; Enabled = $pc_enabled }}
$results += [PSCustomObject]@{{ Setting = "Include CommandLine in 4688"; Enabled = $cmdline_enabled }}
$results += [PSCustomObject]@{{ Setting = "PowerShell Transcription"; Enabled = $tx_enabled; Detail = $tx_dir }}
$results += [PSCustomObject]@{{ Setting = "PowerShell Script Block Logging"; Enabled = $sbl_enabled }}
$results += [PSCustomObject]@{{ Setting = "PowerShell Module Logging"; Enabled = $ml_enabled }}

$results | Format-Table -AutoSize
