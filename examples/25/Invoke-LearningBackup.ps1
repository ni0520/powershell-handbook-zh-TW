[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$lab = Join-Path ([IO.Path]::GetTempPath()) ('ps-backup-' + [guid]::NewGuid())
try {
    $source = Join-Path $lab 'input'
    New-Item -ItemType Directory -Path $source -ErrorAction Stop | Out-Null
    Set-Content -LiteralPath (Join-Path $source '臺灣.txt') -Value '合成教材資料' -Encoding utf8NoBOM
    Set-Content -LiteralPath (Join-Path $source 'counts.csv') -Value 'Name,Count','Learning,2' -Encoding utf8NoBOM
    $files = @(Get-ChildItem -LiteralPath $source -File)
    $manifest = @($files | ForEach-Object {
        [pscustomobject]@{ Name=$_.Name; Hash=(Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash }
    })
    $zip = Join-Path $lab 'backup.zip'
    $restore = Join-Path $lab 'restore'
    Compress-Archive -LiteralPath $source -DestinationPath $zip -ErrorAction Stop
    Expand-Archive -LiteralPath $zip -DestinationPath $restore -ErrorAction Stop
    $restoredRoot = Join-Path $restore 'input'
    $restoredFiles = @(Get-ChildItem -LiteralPath $restoredRoot -File)
    if ($restoredFiles.Count -ne $manifest.Count) { throw 'Restored file count mismatch' }
    foreach ($entry in $manifest) {
        $path = Join-Path $restoredRoot $entry.Name
        $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256 -ErrorAction Stop).Hash
        if ($hash -ne $entry.Hash) { throw "Restored content mismatch: $($entry.Name)" }
    }
    [pscustomobject]@{
        Success = $true
        FileCount = $manifest.Count
        Algorithm = 'SHA256'
        LabPath = $lab
        Manifest = $manifest
    }
} finally {
    # This script accepts no user path; only its own unique lab directory is removed.
    if (Test-Path -LiteralPath $lab) {
        Remove-Item -LiteralPath $lab -Recurse -Force -ErrorAction Stop
    }
}
