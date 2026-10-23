[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$root = Split-Path $PSScriptRoot -Parent
$results = [System.Collections.Generic.List[object]]::new()
function Assert-Learning {
    param([string]$Name, [scriptblock]$Check)
    try {
        $actual = & $Check
        if ($actual -isnot [bool] -or -not $actual) {
            throw "Expected a single true Boolean, got: $actual"
        }
        $results.Add([pscustomobject]@{ name = $Name; status = 'passed' })
    } catch {
        $results.Add([pscustomobject]@{
            name = $Name; status = 'failed'; error = $_.Exception.Message
        })
    }
}
Import-Module (Join-Path $root 'examples/17/LearningFunctions.psm1') -Force
$testDirectory = Join-Path ([System.IO.Path]::GetTempPath()) ('handbook-' + [guid]::NewGuid())
$previous = Get-Location
try {
    New-Item -ItemType Directory -Path $testDirectory | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $testDirectory 'child') | Out-Null
    [System.IO.File]::WriteAllText((Join-Path $testDirectory 'report[1].txt'), 'abc')
    [System.IO.File]::WriteAllText((Join-Path $testDirectory 'guide.md'), 'guide')
    Set-Location -LiteralPath $testDirectory
    Assert-Learning '01-current-process' { (Get-Process -Id $PID).Id -eq $PID }
    Assert-Learning '02-baseline' { $PSVersionTable.PSVersion.ToString() -eq '7.6.8' }
    Assert-Learning '03-utf8' { [Text.Encoding]::UTF8.GetByteCount('繁體中文測試') -eq 18 }
    Assert-Learning '04-profile-path' { $PROFILE -is [string] -and $PROFILE.Length -gt 0 }
    Assert-Learning '05-location' { (Get-Location).Path -eq $testDirectory }
    Assert-Learning '05-literal-brackets' { (Get-Item -LiteralPath './report[1].txt').Length -eq 3 }
    Assert-Learning '05-file-filter' { @(Get-ChildItem -LiteralPath . -File -Filter '*.md').Count -eq 1 }
    Assert-Learning '05-directory' { @(Get-ChildItem -LiteralPath . -Directory).Count -eq 1 }
    Assert-Learning '06-help-basic' { $null -ne (Get-Help Get-ChildItem).Name }
    Assert-Learning '06-actual-syntax' { (Get-Command Get-ChildItem -Syntax | Out-String).Contains('LiteralPath') }
    Assert-Learning '07-alias' { (Get-Alias gci).Definition -eq 'Get-ChildItem' }
    Assert-Learning '07-command-source' { (Get-Command Get-ChildItem).ModuleName -eq 'Microsoft.PowerShell.Management' }
    Assert-Learning '08-note-property' { @([pscustomobject]@{Name='A';Count=2} | Get-Member -MemberType NoteProperty).Count -eq 2 }
    Assert-Learning '08-array-vs-elements' {
        $arrayType = (Get-Member -InputObject (1,2,3) | Select-Object -First 1).TypeName
        $itemType = (1,2,3 | Get-Member | Select-Object -First 1).TypeName
        $arrayType -eq 'System.Object[]' -and $itemType -eq 'System.Int32'
    }
    Assert-Learning '09-select-property' { ([pscustomobject]@{Name='A'} | Select-Object Name).Name -eq 'A' }
    Assert-Learning '09-expand-property' { ([pscustomobject]@{Name='A'} | Select-Object -ExpandProperty Name) -is [string] }
    Assert-Learning '09-pipeline-byvalue' { ((1,2,3 | Get-LearningSquare) -join ',') -eq '1,4,9' }
    Assert-Learning '09-pipeline-byproperty' { ([pscustomobject]@{Name='A'} | Get-LearningName) -eq 'A' }
    Assert-Learning '10-report-order-and-count' {
        $report = @(& (Join-Path $root 'examples/10/Get-LearningReport.ps1'))
        $report.Count -eq 2 -and $report[0].Name -eq 'C.log' -and $report[1].SizeMB -eq 12
    }
    Assert-Learning '10-boundary' { ((9,10,11 | Where-Object { $_ -ge 10 }) -join ',') -eq '10,11' }
    Assert-Learning '10-empty-input' { @(@() | Where-Object { $_ -gt 0 }).Count -eq 0 }
    Assert-Learning '10-stable-ties' {
        $rows = [pscustomobject]@{Name='B';N=1}, [pscustomobject]@{Name='A';N=1}
        (($rows | Sort-Object N -Stable).Name -join ',') -eq 'B,A'
    }
    Assert-Learning '11-string-vs-number' { ('3' + '2') -eq '32' -and (3+2) -eq 5 }
    Assert-Learning '11-nonempty-bool' { [bool]'False' }
    Assert-Learning '11-tryparse' { $value=0; [int]::TryParse('12',[ref]$value) -and $value -eq 12 }
    Assert-Learning '12-empty-array' { @().Count -eq 0 }
    Assert-Learning '12-negative-index' { @('A','B','C')[-1] -eq 'C' }
    Assert-Learning '12-ordered-keys' { (([ordered]@{Name='A';Count=2}).Keys -join ',') -eq 'Name,Count' }
    Assert-Learning '13-collection-comparison' { ((1,2,3 -gt 1) -join ',') -eq '2,3' }
    Assert-Learning '13-membership' { (1,2,3 -contains 2) -and (2 -in 1,2,3) }
    Assert-Learning '14-loop-control' {
        $values = foreach ($n in 1..5) { if ($n -eq 2) { continue }; if ($n -eq 5) { break }; $n }
        ($values -join ',') -eq '1,3,4'
    }
    Assert-Learning '14-descending-range' { ((1..0) -join ',') -eq '1,0' }
    Assert-Learning '15-script-parameters' { (& (Join-Path $root 'examples/15/Get-LearningTotal.ps1') -Count 4 -UnitPrice 30).Total -eq 120 }
    Assert-Learning '15-reject-negative' {
        $rejected = $false
        try { & (Join-Path $root 'examples/15/Get-LearningTotal.ps1') -Count -1 | Out-Null } catch { $rejected = $_.FullyQualifiedErrorId -like '*Validation*' }
        $rejected
    }
    Assert-Learning '16-splatting' { $options=@{Count=4;UnitPrice=30}; (& (Join-Path $root 'examples/15/Get-LearningTotal.ps1') @options).Total -eq 120 }
    Assert-Learning '17-whatif-no-change' {
        $store=@{Mode='Before'}
        Set-LearningValue -Store $store -Name Mode -Value After -WhatIf
        $store['Mode'] -eq 'Before'
    }
    Assert-Learning '17-normal-inmemory-change' {
        $store=@{Mode='Before'}
        Set-LearningValue -Store $store -Name Mode -Value After -Confirm:$false
        $store['Mode'] -eq 'After'
    }
    Assert-Learning '18-module-exports' { @(Get-Command -Module LearningFunctions).Count -eq 4 }
    Assert-Learning '19-erroraction-stop' {
        $caught=$false
        try { Get-Item -LiteralPath (Join-Path $testDirectory 'missing') -ErrorAction Stop | Out-Null } catch { $caught=$_.FullyQualifiedErrorId -like '*PathNotFound*' }
        $caught
    }
    Assert-Learning '19-finally-executes' {
        $cleaned=$false
        try { throw 'Expected teaching failure' } catch { } finally { $cleaned=$true }
        $cleaned
    }
    Assert-Learning '20-verbose-not-data' { @(Get-LearningStatus -Count 2 -Verbose).Count -eq 1 }
    Assert-Learning '20-json-roundtrip' { ([pscustomobject]@{Success=$true;ItemCount=2} | ConvertTo-Json | ConvertFrom-Json).ItemCount -eq 2 }
} finally {
    Set-Location -LiteralPath $previous.Path
    # Only remove the unique directory created by this test run.
    if (Test-Path -LiteralPath $testDirectory) { Remove-Item -LiteralPath $testDirectory -Recurse -Force }
}
$failed = @($results | Where-Object status -eq failed).Count
$report = [ordered]@{
    run_at_utc = [datetime]::UtcNow.ToString('o')
    powershell = $PSVersionTable.PSVersion.ToString()
    os = $PSVersionTable.OS
    passed = $results.Count - $failed
    failed = $failed
    skipped = 0
    tests = @($results)
}
$report | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $root 'progress/test-results.json') -Encoding utf8
$results | Format-Table name,status
if ($failed -gt 0) { exit 1 }
