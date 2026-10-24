Describe 'v0.6新增速查的代表性契約' {
    It 'Clear-Host的主機函式來源不捏造為文件模組' {
        $command = Get-Command Clear-Host -ErrorAction Stop
        $command.CommandType.ToString() | Should -Be 'Function'
        $command.ModuleName | Should -BeNullOrEmpty
        $metadata = Get-Content (Join-Path $PSScriptRoot '../data/runtime-command-metadata.json') -Raw | ConvertFrom-Json
        $record = $metadata | Where-Object Name -eq 'Clear-Host'
        $record.Module | Should -BeNullOrEmpty
        $record.DocumentationModule | Should -Be 'Microsoft.PowerShell.Core'
        $record.Observation | Should -Match 'not proof of source identity'
    }
    It '安全隨機單一候選仍只回傳該候選' {
        Get-SecureRandom -InputObject @('only-candidate') | Should -BeExactly 'only-candidate'
    }
    It '文字鍵值資料保留值而不當程式執行' {
        $result = "Name=Learning`nEnabled=false" | ConvertFrom-StringData
        $result.Name | Should -BeExactly 'Learning'
        $result.Enabled | Should -BeOfType ([string])
        $result.Enabled | Should -BeExactly 'false'
    }
    It 'Test-Json區分合法與破損JSON' {
        Test-Json -Json '{"count":0}' -ErrorAction Stop | Should -BeTrue
        Test-Json -Json '{broken' -ErrorAction SilentlyContinue | Should -BeFalse
    }
    It '工作階段事件不等於Windows事件且只清理自己的事件' {
        $source = 'Learning.' + [guid]::NewGuid().ToString('N')
        try {
            $null = New-Event -SourceIdentifier $source -MessageData 'sample'
            $events = @(Get-Event -SourceIdentifier $source -ErrorAction Stop)
            $events.Count | Should -Be 1
            $events[0].MessageData | Should -BeExactly 'sample'
        } finally {
            Remove-Event -SourceIdentifier $source -ErrorAction SilentlyContinue
        }
        @(Get-Event -SourceIdentifier $source -ErrorAction SilentlyContinue).Count | Should -Be 0
    }
    It '自建提供者磁碟對應不刪除底層檔案' {
        $driveName = 'Learning' + [guid]::NewGuid().ToString('N')
        $path = Join-Path $TestDrive 'file.txt'
        Set-Content -LiteralPath $path -Value 'data'
        try {
            $null = New-PSDrive -Name $driveName -PSProvider FileSystem -Root $TestDrive
            (Get-Item -LiteralPath ($driveName + ':\file.txt')).Name | Should -Be 'file.txt'
        } finally { Remove-PSDrive -Name $driveName -ErrorAction SilentlyContinue }
        Test-Path -LiteralPath $path | Should -BeTrue
    }
    It 'Remove-Module移出工作階段而不卸載檔案套件' {
        $name = 'Learning' + [guid]::NewGuid().ToString('N')
        $module = $null
        try {
            $module = New-Module -Name $name -ScriptBlock { function Get-LearningValue { 42 }; Export-ModuleMember Get-LearningValue }
            Import-Module $module -ErrorAction Stop
            Get-LearningValue | Should -Be 42
            Remove-Module $module -ErrorAction Stop
            Get-Module -Name $name | Should -BeNullOrEmpty
        } finally {
            if ($null -ne $module) { Remove-Module $module -ErrorAction SilentlyContinue }
        }
    }
    It '設定嚴格模式只在隔離子範圍執行' {
        { & { Set-StrictMode -Version 3.0; $object = [pscustomobject]@{Known=1}; $object.Missing } } | Should -Throw
    }
}
