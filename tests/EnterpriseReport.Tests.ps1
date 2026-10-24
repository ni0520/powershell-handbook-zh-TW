BeforeAll {
    . (Join-Path $PSScriptRoot '../examples/38-enterprise-report/Get-LearningCsvReport.ps1')
    function New-LearningInput {
        param([string]$Text)
        $path = Join-Path $TestDrive ([guid]::NewGuid().ToString() + '[1].csv')
        Set-Content -LiteralPath $path -Value $Text -Encoding utf8
        $path
    }
}
Describe '第38章完整報表契約' {
    It 'decimal金額正確且來源內容不變' {
        $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,3,19.95`nA2,0,5.00"
        $hash = (Get-FileHash -LiteralPath $path).Hash
        $rows = @(Get-LearningCsvReport -LiteralPath $path)
        $rows.Count | Should -Be 2
        $rows[0].Total | Should -Be ([decimal]'59.85')
        $rows[0].Total | Should -BeOfType ([decimal])
        $rows[1].Quantity | Should -Be 0
        (Get-FileHash -LiteralPath $path).Hash | Should -Be $hash
    }
    It '門檻可以產生合法零筆' {
        $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,0,1.00"
        @(Get-LearningCsvReport -LiteralPath $path -MinimumQuantity 1).Count | Should -Be 0
    }
    It '相同輸入重跑結果相同且沒有格式物件' {
        $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,2,1.25"
        $a = Get-LearningCsvReport -LiteralPath $path
        $b = Get-LearningCsvReport -LiteralPath $path
        $a.Total | Should -Be $b.Total
        $a.PSObject.Properties.Name | Should -Contain 'Id'
        $a.PSObject.Properties.Name | Should -Contain 'Total'
    }
    It '只有標頭的輸入拒絕' {
        $path = New-LearningInput 'Id,Quantity,UnitPrice'
        { Get-LearningCsvReport -LiteralPath $path } | Should -Throw '*at least one*'
    }
    It '缺欄位拒絕' {
        $path = New-LearningInput "Id,Quantity`nA1,2"
        { Get-LearningCsvReport -LiteralPath $path } | Should -Throw '*Missing column*'
    }
    It '負數數量拒絕' {
        $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,-1,2.00"
        { Get-LearningCsvReport -LiteralPath $path } | Should -Throw '*Quantity*'
    }
    It '小數數量拒絕而非自動四捨五入' {
        $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,1.5,2.00"
        { Get-LearningCsvReport -LiteralPath $path } | Should -Throw '*Quantity*'
    }
    It '金額公式字串拒絕' {
        $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,1,=1+1"
        { Get-LearningCsvReport -LiteralPath $path } | Should -Throw '*UnitPrice*'
    }
    It '重複Id拒絕' {
        $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,1,2.00`nA1,2,3.00"
        { Get-LearningCsvReport -LiteralPath $path } | Should -Throw '*unique*'
    }
    It '後段錯誤不洩出前段部分成功資料' {
        $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,1,2.00`nA2,bad,3.00"
        $captured = [Collections.Generic.List[object]]::new()
        $failed = $false
        try { Get-LearningCsvReport -LiteralPath $path | ForEach-Object { $captured.Add($_) } }
        catch { $failed = $true }
        $failed | Should -BeTrue
        $captured.Count | Should -Be 0
    }
    It '非本機小數文化仍依不變文化解析' {
        $original = [Globalization.CultureInfo]::CurrentCulture
        try {
            [Globalization.CultureInfo]::CurrentCulture = [Globalization.CultureInfo]::GetCultureInfo('de-DE')
            $path = New-LearningInput "Id,Quantity,UnitPrice`nA1,3,19.95"
            (Get-LearningCsvReport -LiteralPath $path).Total | Should -Be ([decimal]59.85)
        } finally { [Globalization.CultureInfo]::CurrentCulture = $original }
    }
}
Describe '第37章量測結果不是速度承諾' {
    It '總毫秒與分量不同' {
        $duration = [timespan]::FromMilliseconds(1500)
        $duration.Milliseconds | Should -Be 500
        $duration.TotalMilliseconds | Should -Be 1500
    }
    It '量測前先驗證計算結果' {
        $elapsed = Measure-Command { $sum = 0; foreach ($n in 1..1000) { $sum += $n } }
        $sum | Should -Be 500500
        $elapsed | Should -BeOfType ([timespan])
        $elapsed.TotalMilliseconds | Should -BeGreaterOrEqual 0
    }
}
