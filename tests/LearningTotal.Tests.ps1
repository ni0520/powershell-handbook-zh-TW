BeforeAll {
    $scriptPath = Join-Path $PSScriptRoot '../examples/15/Get-LearningTotal.ps1'
}
Describe '第21章：訂單總額與邊界' {
    It '數量 <Count> 的總額是 <Expected>' -TestCases @(
        @{ Count = 0; Expected = 0 }
        @{ Count = 1; Expected = 30 }
        @{ Count = 4; Expected = 120 }
    ) {
        param($Count, $Expected)
        (& $scriptPath -Count $Count -UnitPrice 30).Total | Should -Be $Expected
    }
    It '拒絕負數數量' {
        { & $scriptPath -Count -1 } | Should -Throw
    }
    It '拒絕超出範圍的數量' {
        { & $scriptPath -Count 1000001 } | Should -Throw
    }
    It '拒絕負數單價' {
        { & $scriptPath -Count 3 -UnitPrice -1 } | Should -Throw
    }
}
