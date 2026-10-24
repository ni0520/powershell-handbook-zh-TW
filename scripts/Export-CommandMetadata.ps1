[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$entries = Get-Content -LiteralPath (Join-Path $root 'data/cmdlet-index.json') -Raw | ConvertFrom-Json
$metadata = foreach ($entry in $entries) {
    $command = Get-Command -Name $entry.name -ErrorAction SilentlyContinue
    if ($null -eq $command) {
        [ordered]@{ Name=$entry.name; Module=$null; DocumentationModule=$entry.module; CommandType=$null; Available=$false; Observation='Not available on this runtime; consult official source, no platform execution implied'; Syntax=$null; Parameters=@() }
        continue
    }
    # Clear-Host is a host-supplied function whose runtime ModuleName is empty.
    # Record that observation instead of fabricating the documentation module.
    $hostFunction = $entry.name -eq 'Clear-Host' -and
        $command.CommandType -eq 'Function' -and [string]::IsNullOrEmpty($command.ModuleName)
    if ($command.ModuleName -ne $entry.module -and -not $hostFunction) {
        throw "Unexpected module for $($entry.name)"
    }
    [ordered]@{
        Name = $command.Name
        Module = $command.ModuleName
        DocumentationModule = $entry.module
        CommandType = $command.CommandType.ToString()
        Observation = $(if ($hostFunction) { 'Host function; empty runtime module is preserved, not proof of source identity' } else { 'Command discovery only; not a platform or service execution result' })
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
