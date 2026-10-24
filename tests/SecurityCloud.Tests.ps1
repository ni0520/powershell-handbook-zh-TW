Describe '第32至35章有限資料契約；不代表企業整合' {
    It '檔案內容變更會使SHA256不符且精確處理中括號' {
        $path = Join-Path $TestDrive '教材[1].txt'
        Set-Content -LiteralPath $path -Value '原稿' -NoNewline
        $expected = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash
        $expected | Should -Match '^[0-9A-F]{64}$'
        Add-Content -LiteralPath $path -Value '修改'
        (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash | Should -Not -Be $expected
    }
    It '查詢值編碼避免&分割參數' {
        [uri]::EscapeDataString('台北 & 報表') | Should -Match '%26'
    }
    It 'JSON零值不同於null' {
        $row = '{"count":0}' | ConvertFrom-Json
        ($null -eq $row.count) | Should -BeFalse
        ($row.count -is [long]) | Should -BeTrue
        $row.count | Should -Be 0
    }
    It '繁中與布林JSON往返保留型別' {
        $row = @{name='繁體中文';enabled=$true} | ConvertTo-Json | ConvertFrom-Json
        $row.name | Should -BeExactly '繁體中文'
        $row.enabled | Should -BeOfType [bool]
    }
    It 'AD形狀合成資料只選啟用帳號' {
        $rows = @([pscustomobject]@{Id='A1';Enabled=$true},[pscustomobject]@{Id='A2';Enabled=$false})
        @($rows | Where-Object Enabled).Count | Should -Be 1
    }
    It '同名資源必須以完整Id區分' {
        $rows = @([pscustomobject]@{Id='/groups/A/demo';Name='demo'},[pscustomobject]@{Id='/groups/B/demo';Name='demo'})
        @($rows | Select-Object -ExpandProperty Id -Unique).Count | Should -Be 2
        @($rows | Select-Object -ExpandProperty Name -Unique).Count | Should -Be 1
    }
}
