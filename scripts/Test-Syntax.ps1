[CmdletBinding()]
param([Parameter(Mandatory)][string]$InputJson)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$cases = Get-Content -LiteralPath $InputJson -Raw | ConvertFrom-Json
$results = foreach ($case in $cases) {
    $tokens = $null
    $parseErrors = $null
    $null = [System.Management.Automation.Language.Parser]::ParseInput(
        $case.code, [ref]$tokens, [ref]$parseErrors
    )
    [pscustomobject]@{
        name = $case.name
        status = $(if ($parseErrors.Count -eq 0) { 'passed' } else { 'failed' })
        errors = @($parseErrors | ForEach-Object { $_.Message })
    }
}
$failed = @($results | Where-Object status -eq failed).Count
[ordered]@{
    run_at_utc = [datetime]::UtcNow.ToString('o')
    powershell = $PSVersionTable.PSVersion.ToString()
    passed = @($results).Count - $failed
    failed = $failed
    cases = @($results)
} | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $root 'progress/syntax-results.json') -Encoding utf8
if ($failed) { $results | Where-Object status -eq failed | Format-List; exit 1 }
Write-Output "Parser passed: $(@($results).Count) cases; no execution implied"
