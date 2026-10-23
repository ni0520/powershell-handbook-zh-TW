BeforeDiscovery {
    $windowsAvailable = $env:OS -eq 'Windows_NT'
    $pingAvailable = $windowsAvailable -or [bool](Get-Command ping -CommandType Application -ErrorAction SilentlyContinue)
}
Describe '第26至30章：Linux可驗證的有限行為' {
    It '查詢目前程序而非所有程序' {
        (Get-Process -Id $PID).Id | Should -Be $PID
    }
    It '工作集是非負位元組觀察值' {
        (Get-Process -Id $PID).WorkingSet64 | Should -BeGreaterThan 0
    }
    It '只終止自己啟動的子程序且WhatIf不終止' {
        $child = $null
        try {
            $child = Start-Process -FilePath (Get-Process -Id $PID).Path -ArgumentList '-NoProfile','-NonInteractive','-Command','Start-Sleep -Seconds 30' -PassThru -ErrorAction Stop
            Stop-Process -InputObject $child -WhatIf
            $child.Refresh()
            $child.HasExited | Should -BeFalse
            Stop-Process -InputObject $child -ErrorAction Stop
            $child.WaitForExit(5000) | Should -BeTrue
        } finally {
            if ($null -ne $child) {
                $child.Refresh()
                if (-not $child.HasExited) { Stop-Process -InputObject $child -ErrorAction Stop }
                $child.Dispose()
            }
        }
    }
    It '相同事件Id不同提供者必須分組' {
        $sample = @(
            [pscustomobject]@{ProviderName='Learning.App';Id=100}
            [pscustomobject]@{ProviderName='Learning.App';Id=100}
            [pscustomobject]@{ProviderName='Learning.Backup';Id=100}
        )
        $groups = @($sample | Group-Object ProviderName,Id | Sort-Object Count -Descending)
        $groups.Count | Should -Be 2
        $groups[0].Count | Should -Be 2
        $groups[1].Count | Should -Be 1
    }
    It '固定UTC時間保留時區標示' {
        $time = [datetime]::new(2026,1,1,0,0,0,[DateTimeKind]::Utc)
        $time.ToUniversalTime().ToString('o') | Should -BeExactly '2026-01-01T00:00:00.0000000Z'
    }
    It 'IPv4格式解析與回送辨識不產生網路查詢' {
        $address = $null
        [Net.IPAddress]::TryParse('127.0.0.1',[ref]$address) | Should -BeTrue
        [Net.IPAddress]::IsLoopback($address) | Should -BeTrue
    }
    It 'IPv6回送辨識' {
        [Net.IPAddress]::IsLoopback([Net.IPAddress]::Parse('::1')) | Should -BeTrue
    }
    It '無效位址不當成可用目標' {
        $address = $null
        [Net.IPAddress]::TryParse('999.999.999.999',[ref]$address) | Should -BeFalse
    }
    It '合成CIM形狀資料只驗證欄位整理' {
        $source = [pscustomobject]@{Caption='Learning OS';Version='1.0';BuildNumber='100'}
        $result = $source | Select-Object Caption,Version
        @($result.PSObject.Properties.Name).Count | Should -Be 2
        ($result | ConvertTo-Json | ConvertFrom-Json).Caption | Should -Be 'Learning OS'
    }
    It '目前PID組成整數WQL條件而非執行查詢' {
        ('ProcessId = {0}' -f $PID) | Should -Match '^ProcessId = [0-9]+$'
    }
}
Describe '需要平台能力的實際查詢；本Linux不以模擬替代' {
    It 'Windows服務唯讀查詢' -Skip:(-not $windowsAvailable) {
        @(Get-Service -ErrorAction Stop).Count | Should -BeGreaterThan 0
    }
    It 'Windows Registry唯讀查詢' -Skip:(-not $windowsAvailable) {
        (Get-Item -LiteralPath 'HKCU:\Software' -ErrorAction Stop).Name | Should -Match 'Software$'
    }
    It 'Windows事件記錄中繼資料唯讀查詢' -Skip:(-not $windowsAvailable) {
        (Get-WinEvent -ListLog Application -ErrorAction Stop).LogName | Should -Be 'Application'
    }
    It 'Windows本機CIM唯讀查詢' -Skip:(-not $windowsAvailable) {
        (Get-CimInstance -ClassName Win32_OperatingSystem -Property Caption -ErrorAction Stop).Caption | Should -Not -BeNullOrEmpty
    }
    It '回送ICMP需要系統ping能力' -Skip:(-not $pingAvailable) {
        Test-Connection -TargetName 127.0.0.1 -Count 1 -TimeoutSeconds 1 -Quiet -ErrorAction Stop | Should -BeTrue
    }
}
