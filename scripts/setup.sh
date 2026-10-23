#!/usr/bin/env bash
set -euo pipefail
cd /workspace/powershell-handbook-zh-TW
python3 - <<'PY'
from pathlib import Path
from urllib.request import urlopen
import hashlib, tarfile, shutil, importlib.metadata
for tool in ('pandoc', 'chromium', 'fc-match'):
    if not shutil.which(tool):
        raise SystemExit(f'Missing snapshot prerequisite: {tool}')
for package, expected in [('python-docx','1.2.0'),('pypdf','6.10.0'),('playwright','1.62.0'),('fonttools','4.61.1')]:
    actual = importlib.metadata.version(package)
    if actual != expected:
        raise SystemExit(f'{package}: expected {expected}, got {actual}; review dependency upgrade')
root=Path('/workspace/handbook-tools')
root.mkdir(parents=True,exist_ok=True)
archive=root/'powershell-7.6.8-linux-x64.tar.gz'
expected='59112e38ad83350e4f6dc0195953c66b5926792f300ca2e7691b8242e7a16e7f'
if not archive.exists():
    temporary=archive.with_suffix('.download')
    with urlopen('https://github.com/PowerShell/PowerShell/releases/download/v7.6.8/'+archive.name,timeout=120) as response:
        with temporary.open('wb') as stream:
            shutil.copyfileobj(response,stream)
    if hashlib.sha256(temporary.read_bytes()).hexdigest() != expected:
        raise SystemExit('PowerShell SHA-256 mismatch; do not use downloaded artifact')
    temporary.replace(archive)
if hashlib.sha256(archive.read_bytes()).hexdigest() != expected:
    raise SystemExit('PowerShell archive SHA-256 mismatch')
target=root/'powershell/7.6.8'
if not (target/'pwsh').exists():
    target.mkdir(parents=True,exist_ok=True)
    with tarfile.open(archive) as package:
        package.extractall(target,filter='data')
    (target/'pwsh').chmod(0o755)
print('Verified pinned PowerShell archive and document-tool prerequisites')
PY
bash scripts/pwsh.sh -NoLogo -NoProfile -Command 'if ($PSVersionTable.PSVersion.ToString() -ne "7.6.8") { throw "Unexpected runtime" }; $PSVersionTable.PSVersion'
python3 scripts/prepare_fonts.py
