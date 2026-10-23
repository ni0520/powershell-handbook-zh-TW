function Get-LearningSquare {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [int]$Number
    )
    process { $Number * $Number }
}

function Get-LearningName {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]$Name
    )
    process { $Name }
}

function Set-LearningValue {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory)]
        [hashtable]$Store,
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        [string]$Value
    )
    if ($PSCmdlet.ShouldProcess($Name, 'Set learning value')) {
        $Store[$Name] = $Value
    }
}

function Get-LearningStatus {
    [CmdletBinding()]
    param([int]$Count = 2)
    Write-Verbose "Reading $Count synthetic records"
    [pscustomobject]@{ Success = $true; Count = $Count }
}

Export-ModuleMember -Function Get-LearningSquare, Get-LearningName, Set-LearningValue, Get-LearningStatus
