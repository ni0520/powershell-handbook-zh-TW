[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$reference = @(Get-Content -LiteralPath (Join-Path $root 'data/approved-verbs.json') -Raw | ConvertFrom-Json)
$runtime = @(Get-Verb | Select-Object Verb, Group)
$differences = @(Compare-Object ($reference | ForEach-Object { '{0}:{1}' -f $_.verb,$_.group }) ($runtime | ForEach-Object { '{0}:{1}' -f $_.Verb,$_.Group }))
if ($differences.Count -ne 0) { throw 'Verb reference differs from this runtime.' }
if (($reference | Group-Object verb | Where-Object Count -gt 1).Count -gt 0) { throw 'Duplicate verb.' }
if (($reference | Where-Object verb -eq 'Ping').naming_status -ne 'reserved-prefer-Test') { throw 'Missing reserved Ping distinction.' }
$index = @(Get-Content -LiteralPath (Join-Path $root 'data/cmdlet-index.json') -Raw | ConvertFrom-Json)
foreach ($entry in $reference) {
    foreach ($name in $entry.examples) {
        if (-not ($index | Where-Object { $_.name -eq $name -and $_.verb -eq $entry.verb })) { throw "Invalid example: $name" }
    }
}
[ordered]@{
    run_at_utc = [datetime]::UtcNow.ToString('o')
    powershell = $PSVersionTable.PSVersion.ToString()
    os = $PSVersionTable.OS
    status = 'passed'
    runtime_count = $runtime.Count
    reference_count = $reference.Count
    source = 'Get-Verb list observation; no product command execution implied'
    reserved_exception = 'Ping: prefer Test for new command names'
    entries = $runtime
} | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $root 'progress/verb-runtime-results.json') -Encoding utf8
