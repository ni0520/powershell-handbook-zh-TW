function Get-LearningCsvReport {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidateNotNullOrEmpty()][string]$LiteralPath,
        [ValidateRange(0, [long]::MaxValue)][long]$MinimumQuantity = 0
    )
    $ErrorActionPreference = 'Stop'
    $rows = @(Import-Csv -LiteralPath $LiteralPath -Encoding utf8 -ErrorAction Stop)
    if ($rows.Count -eq 0) { throw 'Input must contain at least one data row.' }
    foreach ($required in 'Id','Quantity','UnitPrice') {
        if ($required -cnotin $rows[0].PSObject.Properties.Name) { throw "Missing column: $required" }
    }
    $ids = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    $validated = [Collections.Generic.List[object]]::new()
    foreach ($row in $rows) {
        if ([string]::IsNullOrWhiteSpace($row.Id) -or -not $ids.Add($row.Id)) {
            throw 'Id must be non-empty and unique.'
        }
        $quantity = 0L
        $price = [decimal]0
        $culture = [Globalization.CultureInfo]::InvariantCulture
        if (-not [long]::TryParse($row.Quantity, [Globalization.NumberStyles]::Integer, $culture, [ref]$quantity) -or $quantity -lt 0) {
            throw 'Quantity must be a non-negative integer.'
        }
        if (-not [decimal]::TryParse($row.UnitPrice, [Globalization.NumberStyles]::AllowDecimalPoint, $culture, [ref]$price) -or $price -lt 0) {
            throw 'UnitPrice must be a non-negative invariant decimal.'
        }
        $validated.Add([pscustomobject]@{Id=$row.Id;Quantity=$quantity;UnitPrice=$price;Total=([decimal]$quantity * $price)})
    }
    $validated | Where-Object { $_.Quantity -ge $MinimumQuantity } | Sort-Object Id
}
