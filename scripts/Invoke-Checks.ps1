[CmdletBinding()]
param(
    [string]$PesterManifest = '/workspace/handbook-tools/modules/Pester/5.7.1/Pester.psd1',
    [string]$AnalyzerManifest = '/workspace/handbook-tools/modules/PSScriptAnalyzer/1.25.0/PSScriptAnalyzer.psd1',
    [string]$TestPath,
    [string]$ReportDirectory
)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
if (-not $TestPath) { $TestPath = Join-Path $root 'tests' }
if (-not $ReportDirectory) { $ReportDirectory = Join-Path $root 'progress' }
Import-Module $PesterManifest -RequiredVersion 5.7.1 -ErrorAction Stop
Import-Module $AnalyzerManifest -RequiredVersion 1.25.0 -ErrorAction Stop
$configuration = New-PesterConfiguration
$configuration.Run.Path = $TestPath
$configuration.Run.PassThru = $true
$configuration.Output.Verbosity = 'Detailed'
$result = Invoke-Pester -Configuration $configuration
$report = [ordered]@{
    run_at_utc = [datetime]::UtcNow.ToString('o')
    powershell = $PSVersionTable.PSVersion.ToString()
    os = $PSVersionTable.OS
    pester = (Get-Module Pester).Version.ToString()
    result = $result.Result
    total = $result.TotalCount
    passed = $result.PassedCount
    failed = $result.FailedCount
    skipped = $result.SkippedCount
    tests = @($result.Tests | ForEach-Object {
        [ordered]@{ name=$_.ExpandedPath -join ' / '; result=$_.Result; error=($_.ErrorRecord | Out-String).Trim() }
    })
}
$report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $ReportDirectory 'pester-results.json') -Encoding utf8
$findings = @(Invoke-ScriptAnalyzer -Path (Join-Path $root 'examples') -Recurse -Severity Warning,Error)
[ordered]@{
    run_at_utc = [datetime]::UtcNow.ToString('o')
    version = (Get-Module PSScriptAnalyzer).Version.ToString()
    scope = 'examples/**/*.ps1 and examples/**/*.psm1; default rules, Warning/Error'
    status = $(if ($findings.Count) { 'failed' } else { 'passed' })
    findings = @($findings | Select-Object RuleName,Severity,ScriptName,Line,Message)
} | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $ReportDirectory 'static-analysis-results.json') -Encoding utf8
$findings | Format-Table RuleName,ScriptName,Line,Message
if ($result.Result -ne 'Passed' -or $result.TotalCount -eq 0 -or $findings.Count -gt 0) { exit 1 }
exit 0
