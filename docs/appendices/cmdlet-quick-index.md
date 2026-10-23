<a id="cmdlet-quick-index"></a>

# 命令速查索引

[返回目錄](../README.md)

以下 15 筆是經查證的用途與限制摘要，不計為十四項完整教學。適用版本為 7.6 文件，實測基準 7.6.8/Linux；Windows 與 macOS 未實測。

<a id="new-item"></a>

## New-Item（建立項目）

在指定提供者建立檔案或資料夾；先確認 ItemType 與目標。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/New-Item.md) — Microsoft；查閱 2026-10-24。

<a id="get-item"></a>

## Get-Item（取得項目）

讀取精確檔案或資料夾的中繼資料，不列出全部子項目。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Item.md) — Microsoft；查閱 2026-10-24。

<a id="test-path"></a>

## Test-Path（檢查路徑）

檢查路徑存在與 Leaf／Container；不保證下一步存取成功。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Test-Path.md) — Microsoft；查閱 2026-10-24。

<a id="join-path"></a>

## Join-Path（組合路徑）

依提供者組合父子路徑，不會建立檔案或驗證安全邊界。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Join-Path.md) — Microsoft；查閱 2026-10-24。

<a id="copy-item"></a>

## Copy-Item（複製項目）

複製到目的地並保留來源；注意目的地類型與覆寫。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Copy-Item.md) — Microsoft；查閱 2026-10-24。

<a id="move-item"></a>

## Move-Item（移動項目）

搬移項目，成功後原位置不再保留該項目。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Move-Item.md) — Microsoft；查閱 2026-10-24。

<a id="rename-item"></a>

## Rename-Item（重新命名項目）

在原位置改名稱，不能用 NewName 跨目錄搬移。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Rename-Item.md) — Microsoft；查閱 2026-10-24。

<a id="remove-item"></a>

## Remove-Item（移除項目）

刪除明確指定項目；先用 WhatIf 核對且不要假設可從回收筒還原。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Remove-Item.md) — Microsoft；查閱 2026-10-24。

<a id="set-content"></a>

## Set-Content（設定內容）

以新文字取代檔案內容；和附加寫入不同。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-Content.md) — Microsoft；查閱 2026-10-24。

<a id="add-content"></a>

## Add-Content（附加內容）

把文字加到檔案尾端，必須維持既有編碼。

- 模組：Microsoft.PowerShell.Management
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 22 章](../chapters/22-files-folders.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Add-Content.md) — Microsoft；查閱 2026-10-24。

<a id="import-csv"></a>

## Import-Csv（匯入CSV）

由CSV建立欄位物件，數值欄位通常仍需驗證與轉型。

- 模組：Microsoft.PowerShell.Utility
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 24 章](../chapters/24-csv-json-xml.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Import-Csv.md) — Microsoft；查閱 2026-10-24。

<a id="convertto-json"></a>

## ConvertTo-Json（轉為JSON）

序列化巢狀資料，設定足夠Depth並驗收葉節點。

- 模組：Microsoft.PowerShell.Utility
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 24 章](../chapters/24-csv-json-xml.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertTo-Json.md) — Microsoft；查閱 2026-10-24。

<a id="select-xml"></a>

## Select-Xml（查詢XML）

以XPath查詢節點，命名空間需設定前綴對應。

- 模組：Microsoft.PowerShell.Utility
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 24 章](../chapters/24-csv-json-xml.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Xml.md) — Microsoft；查閱 2026-10-24。

<a id="expand-archive"></a>

## Expand-Archive（展開ZIP封存）

將ZIP還原到新位置，避免Force覆寫後再核對內容。

- 模組：Microsoft.PowerShell.Archive
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 25 章](../chapters/25-archives-backup.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Archive/Expand-Archive.md) — Microsoft；查閱 2026-10-24。

<a id="get-filehash"></a>

## Get-FileHash（計算檔案雜湊）

以SHA256等演算法核對位元組內容，不單獨證明來源身分。

- 模組：Microsoft.PowerShell.Utility
- 重要程度：4/5（教材學習順序）
- 情境與限制：見[第 25 章](../chapters/25-archives-backup.md)
- [官方參考](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-FileHash.md) — Microsoft；查閱 2026-10-24。
