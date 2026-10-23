[CmdletBinding()]
param()
$files = @(
    [pscustomobject]@{ Name = 'A.log'; SizeMB = 12; Owner = 'IT' }
    [pscustomobject]@{ Name = 'B.txt'; SizeMB = 3; Owner = 'HR' }
    [pscustomobject]@{ Name = 'C.log'; SizeMB = 20; Owner = 'IT' }
    [pscustomobject]@{ Name = 'D.csv'; SizeMB = 12; Owner = 'HR' }
)
$files |
    Where-Object { $_.Owner -eq 'IT' -and $_.SizeMB -ge 10 } |
    Sort-Object -Property SizeMB -Descending |
    Select-Object -Property Name, SizeMB
