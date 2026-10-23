Describe '第22章：限定暫存範圍的檔案操作' {
    It 'UTF-8無BOM保留繁中與中括號檔名' {
        $file = Join-Path $TestDrive '報表[1].txt'
        Set-Content -LiteralPath $file -Value '臺灣' -Encoding utf8NoBOM -NoNewline
        Get-Content -LiteralPath $file -Raw -Encoding utf8 | Should -BeExactly '臺灣'
        [Convert]::ToHexString([IO.File]::ReadAllBytes($file)) | Should -Be 'E887BAE781A3'
    }
    It '逐行與Raw維持各自的資料形狀' {
        $file = Join-Path $TestDrive 'lines.txt'
        Set-Content -LiteralPath $file -Value '一','二' -Encoding utf8NoBOM
        Add-Content -LiteralPath $file -Value '三' -Encoding utf8NoBOM
        @(Get-Content -LiteralPath $file).Count | Should -Be 3
        Get-Content -LiteralPath $file -Raw | Should -BeOfType string
    }
    It '空檔與單行不被誤當多筆資料' {
        $file = Join-Path $TestDrive 'empty.txt'
        [IO.File]::WriteAllText($file, '')
        @(Get-Content -LiteralPath $file).Count | Should -Be 0
        Set-Content -LiteralPath $file -Value '單行' -NoNewline
        @(Get-Content -LiteralPath $file).Count | Should -Be 1
    }
    It '複製保留來源而移動移除原位置' {
        $source = Join-Path $TestDrive 'source.txt'
        $copy = Join-Path $TestDrive 'copy.txt'
        Set-Content -LiteralPath $source -Value '合成資料'
        Copy-Item -LiteralPath $source -Destination $copy -ErrorAction Stop
        Test-Path -LiteralPath $source -PathType Leaf | Should -BeTrue
        (Get-FileHash -LiteralPath $source).Hash | Should -Be (Get-FileHash -LiteralPath $copy).Hash
        Rename-Item -LiteralPath $copy -NewName 'renamed.txt' -ErrorAction Stop
        $renamed = Join-Path $TestDrive 'renamed.txt'
        $moved = Join-Path $TestDrive 'moved.txt'
        Move-Item -LiteralPath $renamed -Destination $moved -ErrorAction Stop
        Test-Path -LiteralPath $renamed | Should -BeFalse
        Test-Path -LiteralPath $moved | Should -BeTrue
    }
    It 'WhatIf不刪除資料且正常刪除僅影響指定檔案' {
        $file = Join-Path $TestDrive 'remove.txt'
        Set-Content -LiteralPath $file -Value '練習'
        Remove-Item -LiteralPath $file -WhatIf
        Test-Path -LiteralPath $file | Should -BeTrue
        Remove-Item -LiteralPath $file -ErrorAction Stop
        Test-Path -LiteralPath $file | Should -BeFalse
    }
    It '錯誤路徑可由Stop轉為可捕捉錯誤' {
        { Get-Content -LiteralPath (Join-Path $TestDrive 'missing.txt') -ErrorAction Stop } | Should -Throw
    }
}
Describe '第23章：文字比對與正規表示式' {
    It '預設忽略大小寫而cmatch區分大小寫' {
        'WARN' -match '^warn$' | Should -BeTrue
        'WARN' -cmatch '^warn$' | Should -BeFalse
    }
    It '使用具名群組解析日誌與數值' {
        $matched = 'level=WARN count=12' -match '^level=(?<Level>[A-Z]+) count=(?<Count>[0-9]+)$'
        $matched | Should -BeTrue
        $Matches.Level | Should -BeExactly 'WARN'
        [int]$Matches.Count | Should -Be 12
    }
    It '失敗後不可把舊Matches當成新結果' {
        'count=12' -match '^count=(?<Value>[0-9]+)$' | Should -BeTrue
        'invalid' -match '^count=(?<Value>[0-9]+)$' | Should -BeFalse
        $Matches.Value | Should -Be '12'
    }
    It '集合的match回傳符合的元素' {
        $found = @('info','WARN','warning' -match '^warn$')
        $found.Count | Should -Be 1
        $found[0] | Should -BeExactly 'WARN'
    }
    It 'SimpleMatch把點號當普通字元' {
        @('a.b','axb' | Select-String -Pattern 'a.b' -SimpleMatch).Count | Should -Be 1
        @('a.b','axb' | Select-String -Pattern 'a.b').Count | Should -Be 2
    }
    It 'AllMatches把同一行所有命中放在Matches' {
        $result = 'id=12 id=34' | Select-String -Pattern '[0-9]+' -AllMatches
        @($result).Count | Should -Be 1
        $result.Matches.Count | Should -Be 2
        ($result.Matches.Value -join ',') | Should -Be '12,34'
    }
    It '替換群組使用單引號避免PowerShell先展開' {
        'Chen,Lin' -replace '^([^,]+),([^,]+)$','$2 $1' | Should -BeExactly 'Lin Chen'
    }
    It 'Escape與split分別處理字面內容與模式' {
        'report[1].txt' -match ([regex]::Escape('report[1].txt')) | Should -BeTrue
        ('A.B' -split '\.').Count | Should -Be 2
    }
}
Describe '第24章：CSV、JSON、XML資料往返' {
    It 'CSV保留逗號引號換行與繁中但數字讀回為字串' {
        $file = Join-Path $TestDrive 'data.csv'
        $rows = @([pscustomobject]@{Name='臺北,一組';Note=('引號"測試' + "`n" + '換行');Count=12})
        $rows | Export-Csv -LiteralPath $file -NoTypeInformation -Encoding utf8BOM
        $read = @(Import-Csv -LiteralPath $file -Encoding utf8)
        $read.Count | Should -Be 1
        $read[0].Name | Should -BeExactly $rows[0].Name
        $read[0].Note | Should -BeExactly $rows[0].Note
        $read[0].Count | Should -BeOfType string
        [int]$read[0].Count | Should -Be 12
    }
    It 'CSV使用明確分隔符號' {
        $file = Join-Path $TestDrive 'semicolon.csv'
        [pscustomobject]@{Name='甲';Count=2} | Export-Csv -LiteralPath $file -Delimiter ';'
        (Import-Csv -LiteralPath $file -Delimiter ';').Count | Should -Be '2'
    }
    It 'JSON足夠Depth保留巢狀資料' {
        $obj = [pscustomobject]@{Name='臺灣';Config=@{Labels=@{Primary='學習'}}}
        $text = $obj | ConvertTo-Json -Depth 5 -WarningAction Stop
        ($text | ConvertFrom-Json).Config.Labels.Primary | Should -BeExactly '學習'
    }
    It '深度不足時警告可使流程失敗' {
        { @{a=@{b=@{c=1}}} | ConvertTo-Json -Depth 1 -WarningAction Stop } | Should -Throw
    }
    It '單元素JSON陣列可往返保持陣列' {
        '[1]' | ConvertFrom-Json -NoEnumerate | ConvertTo-Json -Compress | Should -BeExactly '[1]'
    }
    It '空JSON陣列與空物件是不同形狀' {
        $array = ConvertFrom-Json -InputObject '[]' -NoEnumerate
        $array.Count | Should -Be 0
        $object = ConvertFrom-Json -InputObject '{}' -AsHashtable
        $object | Should -BeOfType System.Collections.IDictionary
    }
    It 'AsHashtable保留大小寫不同鍵' {
        $obj = '{"key":1,"Key":2}' | ConvertFrom-Json -AsHashtable
        $obj.Count | Should -Be 2
        $obj['key'] | Should -Be 1
        $obj['Key'] | Should -Be 2
    }
    It '相同JSON鍵只保留最後值' {
        ('{"x":1,"x":2}' | ConvertFrom-Json).x | Should -Be 2
    }
    It '無效JSON會失敗而不是得到空的成功結果' {
        { '{broken' | ConvertFrom-Json -ErrorAction Stop } | Should -Throw
    }
    It 'DateKind String保留時間欄位原字串' {
        $obj = '{"time":"2026-01-01T00:00:00Z"}' | ConvertFrom-Json -DateKind String
        $obj.time | Should -BeOfType string
        $obj.time | Should -BeExactly '2026-01-01T00:00:00Z'
    }
    It 'XML預設命名空間需要XPath前綴' {
        [xml]$xml = '<inventory xmlns="urn:learning"><item code="A">臺灣</item></inventory>'
        @(Select-Xml -Xml $xml -XPath '//item').Count | Should -Be 0
        $found = Select-Xml -Xml $xml -XPath '//i:item' -Namespace @{i='urn:learning'}
        $found.Node.InnerText | Should -BeExactly '臺灣'
        $found.Node.GetAttribute('code') | Should -BeExactly 'A'
    }
    It '禁止DTD的XmlReader拒絕外部實體宣告' {
        $settings = [Xml.XmlReaderSettings]::new()
        $settings.DtdProcessing = [Xml.DtdProcessing]::Prohibit
        $settings.XmlResolver = $null
        $reader = [Xml.XmlReader]::Create([IO.StringReader]::new('<!DOCTYPE x [<!ENTITY a "test">]><x>&a;</x>'),$settings)
        try { { $doc = [Xml.XmlDocument]::new(); $doc.Load($reader) } | Should -Throw }
        finally { $reader.Dispose() }
    }
}
Describe '第25章：壓縮與還原驗收' {
    It '完整範例核對兩個檔案並清理自己的暫存目錄' {
        $script = Join-Path $PSScriptRoot '../examples/25/Invoke-LearningBackup.ps1'
        $result = & $script
        $result.Success | Should -BeTrue
        $result.FileCount | Should -Be 2
        $result.Manifest.Count | Should -Be 2
        Test-Path -LiteralPath $result.LabPath | Should -BeFalse
    }
    It 'ZIP還原後的SHA256與來源一致' {
        $source = Join-Path $TestDrive 'archive-source.txt'
        $zip = Join-Path $TestDrive 'backup.zip'
        $restore = Join-Path $TestDrive 'restored'
        Set-Content -LiteralPath $source -Value '備份學習資料' -Encoding utf8NoBOM
        Compress-Archive -LiteralPath $source -DestinationPath $zip -ErrorAction Stop
        Expand-Archive -LiteralPath $zip -DestinationPath $restore -ErrorAction Stop
        (Get-FileHash -LiteralPath $source).Hash | Should -Be (Get-FileHash -LiteralPath (Join-Path $restore 'archive-source.txt')).Hash
    }
    It 'WhatIf不建立ZIP' {
        $source = Join-Path $TestDrive 'simulation.txt'
        $zip = Join-Path $TestDrive 'simulation.zip'
        Set-Content -LiteralPath $source -Value '測試'
        Compress-Archive -LiteralPath $source -DestinationPath $zip -WhatIf
        Test-Path -LiteralPath $zip | Should -BeFalse
    }
    It '目錄壓縮不應被誤認為包含Linux點號檔案' -Skip:(-not $IsLinux) {
        $source = Join-Path $TestDrive 'hidden-source'
        New-Item -ItemType Directory -Path $source | Out-Null
        Set-Content -LiteralPath (Join-Path $source 'visible.txt') -Value '保留'
        Set-Content -LiteralPath (Join-Path $source '.hidden') -Value '點號'
        $zip = Join-Path $TestDrive 'hidden.zip'
        Compress-Archive -LiteralPath $source -DestinationPath $zip
        $archive = [IO.Compression.ZipFile]::OpenRead($zip)
        try {
            @($archive.Entries | Where-Object FullName -Like '*.hidden').Count | Should -Be 0
            @($archive.Entries | Where-Object FullName -Like '*visible.txt').Count | Should -Be 1
        } finally { $archive.Dispose() }
    }
    It '被修改的還原檔不會通過雜湊核對' {
        $a = Join-Path $TestDrive 'before.txt'; $b = Join-Path $TestDrive 'after.txt'
        Set-Content -LiteralPath $a -Value '原文'
        Copy-Item -LiteralPath $a -Destination $b
        Add-Content -LiteralPath $b -Value '改動'
        (Get-FileHash -LiteralPath $a).Hash | Should -Not -Be (Get-FileHash -LiteralPath $b).Hash
    }
}
