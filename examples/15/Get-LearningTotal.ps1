[CmdletBinding()]
param(
    [ValidateRange(0, 1000)]
    [int]$Count = 3,
    [ValidateRange(0, 1000)]
    [int]$UnitPrice = 20
)
[pscustomobject]@{
    Count = $Count
    UnitPrice = $UnitPrice
    Total = $Count * $UnitPrice
}
