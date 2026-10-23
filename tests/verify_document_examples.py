"""Run an explicitly reviewed allowlist of self-contained, temporary-data examples.

This is execution smoke testing, separate from Pester's value assertions.
Do not automatically execute every PowerShell block in the handbook.
"""
from pathlib import Path
from datetime import datetime, timezone
import json
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
cases = []
for number in (22, 23, 24):
    path = next((ROOT/'docs/chapters').glob(f'{number}-*.md'))
    for index, code in enumerate(re.findall(r'```powershell\s*\n(.*?)```', path.read_text(), re.S), 1):
        cases.append((f'{path.name}:block-{index}', code))
appendix = (ROOT/'docs/appendices/cmdlet-tutorials.md').read_text()
for anchor in ('get-content', 'select-string', 'export-csv', 'convertfrom-json', 'compress-archive'):
    section = appendix.split(f'<a id="{anchor}"></a>',1)[1].split('<a id=',1)[0]
    blocks = re.findall(r'```powershell\s*\n(.*?)```', section, re.S)
    assert len(blocks) == 1, anchor
    cases.append((anchor, blocks[0]))
results = []
for name, code in cases:
    with tempfile.TemporaryDirectory(prefix='handbook-doc-example-') as temporary:
        script = Path(temporary)/'example.ps1'
        script.write_text("$ErrorActionPreference = 'Stop'\n" + code, encoding='utf-8-sig')
        result = subprocess.run(['bash','scripts/pwsh.sh','-NoProfile','-File',str(script)],cwd=ROOT,text=True,capture_output=True,timeout=30)
        results.append({'name':name,'status':'passed' if result.returncode == 0 else 'failed','exit_code':result.returncode})
        if result.returncode:
            results[-1]['error'] = result.stderr
report = {'run_at_utc':datetime.now(timezone.utc).isoformat(),'kind':'execution smoke; value assertions recorded separately in Pester','passed':sum(x['status']=='passed' for x in results),'failed':sum(x['status']=='failed' for x in results),'cases':results}
(ROOT/'progress/document-execution-results.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(report,ensure_ascii=False,indent=2))
assert not report['failed']
