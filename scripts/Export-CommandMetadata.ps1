[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$entries = Get-Content -LiteralPath (Join-Path $root 'data/cmdlet-index.json') -Raw | ConvertFrom-Json
$metadata = foreach ($entry in $entries) {
    $command = Get-Command -Name $entry.name -ErrorAction SilentlyContinue
    if ($null -eq $command) {
        [ordered]@{ Name=$entry.name; Module=$entry.module; Available=$false; Observation='Not available on this runtime; consult official source, no platform execution implied'; Syntax=$null; Parameters=@() }
        continue
    }
    if ($command.ModuleName -ne $entry.module) { throw "Unexpected module for $($entry.name)" }
    [ordered]@{
        Name = $command.Name
        Module = $command.ModuleName
        Available = $true
        Syntax = (Get-Command -Name $entry.name -Syntax | Out-String).Trim()
        Parameters = @($command.Parameters.Values | ForEach-Object {
            $parameter = $_
            [ordered]@{
                Name = $parameter.Name
                Type = $parameter.ParameterType.FullName
                Sets = @($parameter.ParameterSets.GetEnumerator() | ForEach-Object {
                    [ordered]@{ Name=$_.Key; Mandatory=$_.Value.IsMandatory; Position=$_.Value.Position; ByValue=$_.Value.ValueFromPipeline; ByProperty=$_.Value.ValueFromPipelineByPropertyName }
                })
            }
        })
    }
}
$metadata | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $root 'data/runtime-command-metadata.json') -Encoding utf8
