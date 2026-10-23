[CmdletBinding()]
param()
$root = Split-Path $PSScriptRoot -Parent
$names = 'Get-Process','Get-Service','Get-WinEvent','Get-CimInstance','Resolve-DnsName','Test-NetConnection'
$commands = foreach ($name in $names) {
    [pscustomobject]@{Name=$name;Available=[bool](Get-Command $name -ErrorAction SilentlyContinue)}
}
$ping = Get-Command ping -CommandType Application -ErrorAction SilentlyContinue
$icmpStatus = 'unavailable'
$icmpError = $null
try {
    $result = Test-Connection -TargetName 127.0.0.1 -Count 1 -TimeoutSeconds 1 -Quiet -ErrorAction Stop
    $icmpStatus = if ($result) { 'passed' } else { 'failed' }
} catch { $icmpError = $_.Exception.Message }
[ordered]@{
    run_at_utc = [datetime]::UtcNow.ToString('o')
    os = $PSVersionTable.OS
    powershell = $PSVersionTable.PSVersion.ToString()
    windows = $env:OS -eq 'Windows_NT'
    registry_provider = [bool](Get-PSProvider Registry -ErrorAction SilentlyContinue)
    ping_application = [bool]$ping
    commands = @($commands)
    loopback_icmp = [ordered]@{ status=$icmpStatus;error=$icmpError }
    remote_targets_tested = @()
} | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $root 'progress/platform-capabilities.json') -Encoding utf8
