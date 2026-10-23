"""Rebuild pinned Pester source and verify the signed analyzer without weakening trust."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib
import json
import os
import shutil
import subprocess
import tarfile
import tempfile
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parents[1]
TOOLS = Path('/workspace/handbook-tools')
SOURCES = json.loads((ROOT / 'data/test-tool-sources.json').read_text())


def download(url, target, expected, algorithm='sha256'):
    if not target.exists():
        partial = target.with_suffix('.download')
        with urllib.request.urlopen(url, timeout=120) as response, partial.open('wb') as out:
            shutil.copyfileobj(response, out)
        if hashlib.new(algorithm, partial.read_bytes()).hexdigest() != expected:
            raise RuntimeError(f'Download hash mismatch: {target.name}')
        partial.replace(target)
    if hashlib.new(algorithm, target.read_bytes()).hexdigest() != expected:
        raise RuntimeError(f'Cached hash mismatch: {target.name}')


def main():
    TOOLS.mkdir(exist_ok=True)
    evidence = ROOT / 'progress/tooling'
    evidence.mkdir(exist_ok=True)
    sdk = SOURCES['dotnet']
    archive = TOOLS / 'dotnet-sdk.tar.gz'
    download(sdk['url'], archive, sdk['hash'], 'sha512')
    dotnet = TOOLS / 'dotnet/dotnet'
    if not dotnet.exists():
        with tarfile.open(archive) as package:
            package.extractall(TOOLS / 'dotnet', filter='data')
    env = os.environ.copy()
    env.update({
        'PATH': str(dotnet.parent) + os.pathsep + env['PATH'],
        'DOTNET_CLI_HOME': str(TOOLS / 'dotnet-home'),
        'DOTNET_CLI_TELEMETRY_OPTOUT': '1',
        'DOTNET_GENERATE_ASPNET_CERTIFICATE': 'false',
        'XDG_RUNTIME_DIR': str(TOOLS / 'dotnet-tmp'),
        'XDG_DATA_HOME': str(TOOLS / 'data'),
        'NUGET_PACKAGES': str(TOOLS / 'nuget'),
    })
    Path(env['XDG_RUNTIME_DIR']).mkdir(mode=0o700, exist_ok=True)
    version = subprocess.check_output([str(dotnet), '--version'], env=env, text=True).strip()
    if version != sdk['version']:
        raise RuntimeError(f'Unexpected .NET SDK: {version}')
    analyzer = SOURCES['psscriptanalyzer']
    package_path = TOOLS / f"PSScriptAnalyzer.{analyzer['version']}.nupkg"
    download(analyzer['url'], package_path, analyzer['sha256'])
    verification = subprocess.run([str(dotnet), 'nuget', 'verify', str(package_path), '--all', '--verbosity', 'normal'], env=env, text=True, capture_output=True)
    signature_text = verification.stdout + verification.stderr
    (evidence / 'pssa-signature.txt').write_text('\n'.join(line.rstrip() for line in signature_text.splitlines()) + '\n')
    verification.check_returncode()
    analyzer_path = TOOLS / 'modules/PSScriptAnalyzer' / analyzer['version']
    analyzer_path.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(package_path) as package:
        for member in package.infolist():
            if not (analyzer_path / member.filename).resolve().is_relative_to(analyzer_path.resolve()):
                raise RuntimeError('Unsafe archive member')
        package.extractall(analyzer_path)
    pester = SOURCES['pester']
    source_archive = TOOLS / f"Pester-{pester['version']}.tar.gz"
    download(pester['url'], source_archive, pester['sha256'])
    # Build fresh source so prior generated files cannot silently change the input.
    with tempfile.TemporaryDirectory(prefix='pester-build-', dir=TOOLS) as temporary:
        with tarfile.open(source_archive) as package:
            package.extractall(temporary, filter='data')
        source = next(Path(temporary).iterdir())
        command = ['bash', str(ROOT / 'scripts/pwsh.sh'), '-NoProfile', '-File', str(source / 'build.ps1'), '-Clean', '-Inline', '-LockedRestore']
        with (evidence / 'pester-build.txt').open('w') as log:
            subprocess.run(command, cwd=ROOT, env=env, stdout=log, stderr=subprocess.STDOUT, check=True)
        destination = TOOLS / 'modules/Pester' / pester['version']
        shutil.copytree(source / 'bin', destination, dirs_exist_ok=True)
    receipt = {
        'run_at_utc': datetime.now(timezone.utc).isoformat(),
        'sdk': version,
        'pester_source_sha256': pester['sha256'],
        'pester_build': 'passed; official fixed source, locked restore; not a signed release module',
        'pssa_package_sha256': analyzer['sha256'],
        'signature_exit_code': verification.returncode,
        'revocation_limit': 'revocation status unavailable' if 'RevocationStatusUnknown' in signature_text else 'see signature log',
    }
    (evidence / 'setup-results.json').write_text(json.dumps(receipt, indent=2) + '\n')
    print(json.dumps(receipt, indent=2))


if __name__ == '__main__':
    main()
