Describe '第31章背景工作的生命週期' {
    It '明確傳入引數並取得資料而不是Job物件' {
        $job = $null
        try {
            $job = Start-Job -ArgumentList 8,5 -ScriptBlock { param($n,$price) $n*$price }
            Wait-Job $job -Timeout 20 | Should -Not -BeNullOrEmpty
            Receive-Job $job -ErrorAction Stop | Should -Be 40
        } finally { if ($null -ne $job) { Stop-Job $job; Remove-Job $job } }
    }
    It 'Keep可重讀而一般接收消耗彙總資料' {
        $job = $null
        try {
            $job = Start-Job { '繁中報表' }
            Wait-Job $job -Timeout 20 | Should -Not -BeNullOrEmpty
            Receive-Job $job -Keep -ErrorAction Stop | Should -BeExactly '繁中報表'
            Receive-Job $job -ErrorAction Stop | Should -BeExactly '繁中報表'
            @(Receive-Job $job -ErrorAction Stop).Count | Should -Be 0
        } finally { if ($null -ne $job) { Stop-Job $job; Remove-Job $job } }
    }
    It '等待逾時不自動終止工作且最後僅移除自己的工作' {
        $job = $null
        try {
            $job = Start-Job { Start-Sleep -Seconds 30 }
            Wait-Job $job -Timeout 1 | Should -BeNullOrEmpty
            $job.State | Should -Be 'Running'
            Stop-Job $job
            $job.State | Should -Be 'Stopped'
            $id = $job.InstanceId
            Remove-Job $job
            $job = $null
            Get-Job -InstanceId $id -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
        } finally { if ($null -ne $job) { Stop-Job $job; Remove-Job $job } }
    }
    It '非終止錯誤不使Completed等同業務成功' {
        $job = $null
        try {
            $job = Start-Job { Write-Error 'expected learning error'; 42 }
            Wait-Job $job -Timeout 20 | Should -Not -BeNullOrEmpty
            $job.State | Should -Be 'Completed'
            $observed = @()
            Receive-Job $job -ErrorAction SilentlyContinue -ErrorVariable observed | Should -Be 42
            $observed.Count | Should -BeGreaterThan 0
        } finally { if ($null -ne $job) { Stop-Job $job; Remove-Job $job } }
    }
    It '平行結果以識別碼排序驗收' {
        $factor = 3
        $result = @(1..4 | ForEach-Object -Parallel {
            [pscustomobject]@{ Item=$_; Product=$_*$using:factor }
        } -ThrottleLimit 2 | Sort-Object Item)
        ($result.Product -join ',') | Should -BeExactly '3,6,9,12'
    }
}
