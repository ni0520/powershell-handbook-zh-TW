<a id="quick-reference"></a>

# PowerShell 常用指令速查（前 20 章）

[返回目錄](../README.md)

適用：PowerShell 7.6；本機實測 7.6.8 / Debian 13。速查不取代命令的版本、平台與安全說明。

## 先辨識環境

```powershell
$PSVersionTable.PSVersion
Get-Location
Get-Command -Name Get-ChildItem -All
```

依序看版本、位置、命令來源。Windows Terminal 或 VS Code 外觀不代表實際殼層版本。

## 找命令、讀說明、看物件

```powershell
Get-Command -Verb Get -Noun '*Item*'
Get-Help Get-ChildItem -Parameter LiteralPath
Get-Process -Id $PID | Get-Member
```

Command＝命令，Help＝說明，Member＝成員。本機可能未安裝完整說明；需要時讀本書官方來源快照。

## 只列出資料，不修改檔案

```powershell
Get-ChildItem -LiteralPath . -File -Filter '*.md'
Get-ChildItem -LiteralPath . -Directory
```

含方括號的實際路徑用 LiteralPath。Recurse 會深入子資料夾；Force 不會授予權限。

## 篩選、排序、選欄位

```powershell
Get-ChildItem -LiteralPath . -File |
    Where-Object { $_.Length -ge 1024 } |
    Sort-Object Length -Descending |
    Select-Object Name, Length
```

Where 篩列、Sort 排順序、Select 挑欄位。格式化放在最後，避免把 Format-Table 的資料送去匯出。

## 集合與型別

```powershell
$items = @(1, 2, 3)
$items.Count
$settings = @{ Retry = 3 }
$settings.ContainsKey('Retry')
[int]'12' + 3
```

陣列索引從零起算；普通雜湊表不保證順序。`[bool]'False'` 是 True，因為是非空字串。

## 控制流程

```powershell
foreach ($item in 1..3) {
    if ($item -eq 2) { continue }
    $item
}
```

結果 1、3。continue 跳下一輪，break 離開迴圈；`1..0` 不是空集合。

## 錯誤與資料分流

```powershell
try {
    Get-Item -LiteralPath './no-such-handbook-file' -ErrorAction Stop
} catch {
    $_.FullyQualifiedErrorId
}
```

這是刻意示範失敗。日誌不應記錄密碼或權杖；Verbose 不要混成成功報表欄位。

## 安全操作清單

1. 確認版本、平台、來源與目標範圍。
2. 先以唯讀查詢核對資料與數量。
3. 變更前確認授權、備份與回復方式。
4. 只有支援 ShouldProcess 的命令才使用 WhatIf；仍需理解前置副作用。
5. 不把 Execution Policy 當完整安全邊界，不把 Force 當管理員權限。
6. 不直接執行未審閱的下載腳本，保留 TLS、簽章與校驗。
7. 保留實際失敗狀態，不以最後一個成功命令掩蓋。

本版完整教學見[命令附錄](../appendices/cmdlet-tutorials.md)，查證來源見[來源清單](../appendices/sources.md)。

## 第21–25章：測試與資料處理

以下都是語法提示，路徑應由讀者明確指定；寫入、壓縮與刪除先在本章唯一暫存範圍練習。

| 需求 | 命令或方法 | 重要限制 |
|---|---|---|
| 測試結果 | Invoke-Pester -PassThru | 檢查Result與TotalCount；不是只看彩色摘要 |
| 靜態分析 | Invoke-ScriptAnalyzer | 規則診斷不能替代執行測試 |
| 文字全文 | Get-Content -LiteralPath … -Raw -Encoding utf8 | Raw一次載入全文 |
| 取代／附加 | Set-Content／Add-Content | 明確編碼，防止覆寫或混合編碼 |
| 字面搜尋 | Select-String -SimpleMatch | Regex模式與固定字串要分開 |
| 行內多次命中 | Select-String -AllMatches | 查看MatchInfo.Matches |
| CSV交換 | Export-Csv／Import-Csv | 不先Format-Table；數字讀回仍需轉型 |
| JSON序列化 | ConvertTo-Json -Depth 5 | 深度依結構選擇並重新讀回驗收 |
| 單元素陣列 | ConvertFrom-Json -NoEnumerate | 保留陣列形狀 |
| XML命名空間 | Select-Xml -Namespace | XPath前綴對應URI |
| ZIP往返 | Compress-Archive／Expand-Archive | 隱藏檔略過，先還原到新位置 |
| 完整性 | Get-FileHash -Algorithm SHA256 | 雜湊不是來源簽章或加密 |
