"""Exercise the real runner's process status; expected failures stay outside the suite."""
from pathlib import Path
from datetime import datetime, timezone
import json
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
results = []
for name, code, expected in [
    ('passing', "Describe 'control' { It 'passes' { 1 | Should -Be 1 } }", 0),
    ('failing', "Describe 'control' { It 'fails intentionally' { 1 | Should -Be 2 } }", 1),
    ('empty', "# Intentionally no tests: this must not report success.\n", 1),
]:
    with tempfile.TemporaryDirectory(prefix='handbook-runner-') as temporary:
        fixture = Path(temporary)/'Control.Tests.ps1'
        fixture.write_text(code)
        result = subprocess.run(['bash', 'scripts/pwsh.sh', '-NoProfile', '-File', 'scripts/Invoke-Checks.ps1', '-TestPath', str(fixture), '-ReportDirectory', temporary], cwd=ROOT, text=True, capture_output=True)
        report = json.loads((Path(temporary)/'pester-results.json').read_text())
        results.append({'case':name, 'expected_exit':expected, 'actual_exit':result.returncode, 'total':report['total'], 'pester_result':report['result']})
        assert result.returncode == expected, (name,result.stdout,result.stderr)
        assert report['total'] == (0 if name == 'empty' else 1), report
with tempfile.TemporaryDirectory(prefix='handbook-discovery-') as temporary:
    folder = Path(temporary)
    fixture = folder/'Discovery.Tests.ps1'
    fixture.write_text("BeforeAll { Set-Content -LiteralPath (Join-Path $PSScriptRoot 'run-marker.txt') -Value 'ran' }\nDescribe 'phase' { It 'runs' { 1 | Should -Be 1 } }\n")
    driver = folder/'Check-Phases.ps1'
    driver.write_text("""$ErrorActionPreference = 'Stop'
Import-Module /workspace/handbook-tools/modules/Pester/5.7.1/Pester.psd1 -RequiredVersion 5.7.1
$configuration = New-PesterConfiguration
$configuration.Run.Path = Join-Path $PSScriptRoot 'Discovery.Tests.ps1'
$configuration.Run.PassThru = $true
$configuration.Run.SkipRun = $true
$configuration.Output.Verbosity = 'None'
$marker = Join-Path $PSScriptRoot 'run-marker.txt'
$discovery = Invoke-Pester -Configuration $configuration
if ($discovery.TotalCount -ne 1 -or (Test-Path -LiteralPath $marker)) { throw 'Discovery unexpectedly executed BeforeAll or found wrong test count' }
$configuration.Run.SkipRun = $false
$run = Invoke-Pester -Configuration $configuration
if ($run.Result -ne 'Passed' -or -not (Test-Path -LiteralPath $marker)) { throw 'Run did not execute BeforeAll' }
""")
    result = subprocess.run(['bash','scripts/pwsh.sh','-NoProfile','-File',str(driver)],cwd=ROOT,text=True,capture_output=True)
    assert result.returncode == 0, (result.stdout,result.stderr)
    results.append({'case':'discovery-vs-run','actual_exit':result.returncode,'discovery_beforeall_executed':False,'run_beforeall_executed':True})
(ROOT/'progress/runner-results.json').write_text(json.dumps({'run_at_utc':datetime.now(timezone.utc).isoformat(),'status':'passed','cases':results},indent=2)+'\n')
print(json.dumps(results,indent=2))
