<a id="master-index"></a>

# 總索引

[返回目錄](../README.md)

本版索引 30 個命令：15 個十四項教學、15 個速查摘要；未達 500+ 目標，也不表示所有參數組均已實測。

## 依英文名稱

- [Add-Content（附加內容）](cmdlet-quick-index.md#add-content)：把文字加到檔案尾端，必須維持既有編碼。
- [Compress-Archive（建立ZIP封存）](cmdlet-tutorials.md#compress-archive)：將明確範圍封裝為ZIP；隱藏檔與大小限制使它不能替代完整備份。
- [ConvertFrom-Json（解析JSON）](cmdlet-tutorials.md#convertfrom-json)：解析JSON，控制陣列列舉、鍵值容器與日期轉換。
- [ConvertTo-Json（轉為JSON）](cmdlet-quick-index.md#convertto-json)：序列化巢狀資料，設定足夠Depth並驗收葉節點。
- [Copy-Item（複製項目）](cmdlet-quick-index.md#copy-item)：複製到目的地並保留來源；注意目的地類型與覆寫。
- [Expand-Archive（展開ZIP封存）](cmdlet-quick-index.md#expand-archive)：將ZIP還原到新位置，避免Force覆寫後再核對內容。
- [Export-Csv（匯出CSV）](cmdlet-tutorials.md#export-csv)：將物件欄位寫為CSV，正確引用逗號、引號及換行。
- [Get-Alias（取得別名）](cmdlet-tutorials.md#get-alias)：閱讀舊腳本或診斷同名命令時確認別名指向。
- [Get-ChildItem（取得子項目）](cmdlet-tutorials.md#get-childitem)：盤點目前資料夾，尋找符合副檔名的檔案，建立檔案報表前置資料。
- [Get-Command（取得命令）](cmdlet-tutorials.md#get-command)：找出可用命令、種類與來源；適合不確定模組或參數的時候。
- [Get-Content（讀取內容）](cmdlet-tutorials.md#get-content)：按行或以 Raw 讀取文字，明確指定編碼並考慮記憶體。
- [Get-FileHash（計算檔案雜湊）](cmdlet-quick-index.md#get-filehash)：以SHA256等演算法核對位元組內容，不單獨證明來源身分。
- [Get-Help（取得說明）](cmdlet-tutorials.md#get-help)：閱讀命令參數與概念，排查參數組合及管線支援。
- [Get-Item（取得項目）](cmdlet-quick-index.md#get-item)：讀取精確檔案或資料夾的中繼資料，不列出全部子項目。
- [Get-Location（取得目前位置）](cmdlet-tutorials.md#get-location)：在相對路徑操作前確認目前提供者與路徑。
- [Get-Member（取得物件成員）](cmdlet-tutorials.md#get-member)：發現輸入物件的屬性、方法及型別。
- [Import-Csv（匯入CSV）](cmdlet-quick-index.md#import-csv)：由CSV建立欄位物件，數值欄位通常仍需驗證與轉型。
- [Join-Path（組合路徑）](cmdlet-quick-index.md#join-path)：依提供者組合父子路徑，不會建立檔案或驗證安全邊界。
- [Move-Item（移動項目）](cmdlet-quick-index.md#move-item)：搬移項目，成功後原位置不再保留該項目。
- [New-Item（建立項目）](cmdlet-quick-index.md#new-item)：在指定提供者建立檔案或資料夾；先確認 ItemType 與目標。
- [Remove-Item（移除項目）](cmdlet-quick-index.md#remove-item)：刪除明確指定項目；先用 WhatIf 核對且不要假設可從回收筒還原。
- [Rename-Item（重新命名項目）](cmdlet-quick-index.md#rename-item)：在原位置改名稱，不能用 NewName 跨目錄搬移。
- [Select-Object（選取物件或屬性）](cmdlet-tutorials.md#select-object)：精簡報表欄位或只取前幾筆資料。
- [Select-String（搜尋文字模式）](cmdlet-tutorials.md#select-string)：按 Regex 或字面文字搜尋，回傳命中行與擷取資訊。
- [Select-Xml（查詢XML）](cmdlet-quick-index.md#select-xml)：以XPath查詢節點，命名空間需設定前綴對應。
- [Set-Content（設定內容）](cmdlet-quick-index.md#set-content)：以新文字取代檔案內容；和附加寫入不同。
- [Set-Location（切換目前位置）](cmdlet-tutorials.md#set-location)：互動巡覽資料夾；腳本需注意後續相對路徑的目標。
- [Sort-Object（依屬性排序物件）](cmdlet-tutorials.md#sort-object)：排行、同值次序與依多欄位整理報表。
- [Test-Path（檢查路徑）](cmdlet-quick-index.md#test-path)：檢查路徑存在與 Leaf／Container；不保證下一步存取成功。
- [Where-Object（依條件篩選物件）](cmdlet-tutorials.md#where-object)：以屬性比較、複合條件挑出報表資料。

## 依功能與情境

### 封存與驗收

- [Compress-Archive（建立ZIP封存）](cmdlet-tutorials.md#compress-archive)
- [Expand-Archive（展開ZIP封存）](cmdlet-quick-index.md#expand-archive)
- [Get-FileHash（計算檔案雜湊）](cmdlet-quick-index.md#get-filehash)

### 文字搜尋

- [Select-String（搜尋文字模式）](cmdlet-tutorials.md#select-string)

### 檔案與位置

- [Get-Location（取得目前位置）](cmdlet-tutorials.md#get-location)
- [Set-Location（切換目前位置）](cmdlet-tutorials.md#set-location)
- [Get-ChildItem（取得子項目）](cmdlet-tutorials.md#get-childitem)

### 檔案與路徑

- [New-Item（建立項目）](cmdlet-quick-index.md#new-item)
- [Get-Item（取得項目）](cmdlet-quick-index.md#get-item)
- [Test-Path（檢查路徑）](cmdlet-quick-index.md#test-path)
- [Join-Path（組合路徑）](cmdlet-quick-index.md#join-path)
- [Copy-Item（複製項目）](cmdlet-quick-index.md#copy-item)
- [Move-Item（移動項目）](cmdlet-quick-index.md#move-item)
- [Rename-Item（重新命名項目）](cmdlet-quick-index.md#rename-item)
- [Remove-Item（移除項目）](cmdlet-quick-index.md#remove-item)
- [Get-Content（讀取內容）](cmdlet-tutorials.md#get-content)
- [Set-Content（設定內容）](cmdlet-quick-index.md#set-content)
- [Add-Content（附加內容）](cmdlet-quick-index.md#add-content)

### 語言與資料探索

- [Get-Command（取得命令）](cmdlet-tutorials.md#get-command)
- [Get-Help（取得說明）](cmdlet-tutorials.md#get-help)
- [Get-Alias（取得別名）](cmdlet-tutorials.md#get-alias)
- [Get-Member（取得物件成員）](cmdlet-tutorials.md#get-member)
- [Select-Object（選取物件或屬性）](cmdlet-tutorials.md#select-object)
- [Where-Object（依條件篩選物件）](cmdlet-tutorials.md#where-object)
- [Sort-Object（依屬性排序物件）](cmdlet-tutorials.md#sort-object)

### 資料交換

- [Export-Csv（匯出CSV）](cmdlet-tutorials.md#export-csv)
- [Import-Csv（匯入CSV）](cmdlet-quick-index.md#import-csv)
- [ConvertTo-Json（轉為JSON）](cmdlet-quick-index.md#convertto-json)
- [ConvertFrom-Json（解析JSON）](cmdlet-tutorials.md#convertfrom-json)
- [Select-Xml（查詢XML）](cmdlet-quick-index.md#select-xml)

## 依模組

### Microsoft.PowerShell.Archive

- [Compress-Archive（建立ZIP封存）](cmdlet-tutorials.md#compress-archive)
- [Expand-Archive（展開ZIP封存）](cmdlet-quick-index.md#expand-archive)

### Microsoft.PowerShell.Core

- [Get-Command（取得命令）](cmdlet-tutorials.md#get-command)
- [Get-Help（取得說明）](cmdlet-tutorials.md#get-help)
- [Where-Object（依條件篩選物件）](cmdlet-tutorials.md#where-object)

### Microsoft.PowerShell.Management

- [Get-Location（取得目前位置）](cmdlet-tutorials.md#get-location)
- [Set-Location（切換目前位置）](cmdlet-tutorials.md#set-location)
- [Get-ChildItem（取得子項目）](cmdlet-tutorials.md#get-childitem)
- [New-Item（建立項目）](cmdlet-quick-index.md#new-item)
- [Get-Item（取得項目）](cmdlet-quick-index.md#get-item)
- [Test-Path（檢查路徑）](cmdlet-quick-index.md#test-path)
- [Join-Path（組合路徑）](cmdlet-quick-index.md#join-path)
- [Copy-Item（複製項目）](cmdlet-quick-index.md#copy-item)
- [Move-Item（移動項目）](cmdlet-quick-index.md#move-item)
- [Rename-Item（重新命名項目）](cmdlet-quick-index.md#rename-item)
- [Remove-Item（移除項目）](cmdlet-quick-index.md#remove-item)
- [Get-Content（讀取內容）](cmdlet-tutorials.md#get-content)
- [Set-Content（設定內容）](cmdlet-quick-index.md#set-content)
- [Add-Content（附加內容）](cmdlet-quick-index.md#add-content)

### Microsoft.PowerShell.Utility

- [Get-Alias（取得別名）](cmdlet-tutorials.md#get-alias)
- [Get-Member（取得物件成員）](cmdlet-tutorials.md#get-member)
- [Select-Object（選取物件或屬性）](cmdlet-tutorials.md#select-object)
- [Sort-Object（依屬性排序物件）](cmdlet-tutorials.md#sort-object)
- [Select-String（搜尋文字模式）](cmdlet-tutorials.md#select-string)
- [Export-Csv（匯出CSV）](cmdlet-tutorials.md#export-csv)
- [Import-Csv（匯入CSV）](cmdlet-quick-index.md#import-csv)
- [ConvertTo-Json（轉為JSON）](cmdlet-quick-index.md#convertto-json)
- [ConvertFrom-Json（解析JSON）](cmdlet-tutorials.md#convertfrom-json)
- [Select-Xml（查詢XML）](cmdlet-quick-index.md#select-xml)
- [Get-FileHash（計算檔案雜湊）](cmdlet-quick-index.md#get-filehash)

## 依動詞

### Add

- [Add-Content（附加內容）](cmdlet-quick-index.md#add-content)

### Compress

- [Compress-Archive（建立ZIP封存）](cmdlet-tutorials.md#compress-archive)

### ConvertFrom

- [ConvertFrom-Json（解析JSON）](cmdlet-tutorials.md#convertfrom-json)

### ConvertTo

- [ConvertTo-Json（轉為JSON）](cmdlet-quick-index.md#convertto-json)

### Copy

- [Copy-Item（複製項目）](cmdlet-quick-index.md#copy-item)

### Expand

- [Expand-Archive（展開ZIP封存）](cmdlet-quick-index.md#expand-archive)

### Export

- [Export-Csv（匯出CSV）](cmdlet-tutorials.md#export-csv)

### Get

- [Get-Command（取得命令）](cmdlet-tutorials.md#get-command)
- [Get-Help（取得說明）](cmdlet-tutorials.md#get-help)
- [Get-Location（取得目前位置）](cmdlet-tutorials.md#get-location)
- [Get-ChildItem（取得子項目）](cmdlet-tutorials.md#get-childitem)
- [Get-Alias（取得別名）](cmdlet-tutorials.md#get-alias)
- [Get-Member（取得物件成員）](cmdlet-tutorials.md#get-member)
- [Get-Item（取得項目）](cmdlet-quick-index.md#get-item)
- [Get-Content（讀取內容）](cmdlet-tutorials.md#get-content)
- [Get-FileHash（計算檔案雜湊）](cmdlet-quick-index.md#get-filehash)

### Import

- [Import-Csv（匯入CSV）](cmdlet-quick-index.md#import-csv)

### Join

- [Join-Path（組合路徑）](cmdlet-quick-index.md#join-path)

### Move

- [Move-Item（移動項目）](cmdlet-quick-index.md#move-item)

### New

- [New-Item（建立項目）](cmdlet-quick-index.md#new-item)

### Remove

- [Remove-Item（移除項目）](cmdlet-quick-index.md#remove-item)

### Rename

- [Rename-Item（重新命名項目）](cmdlet-quick-index.md#rename-item)

### Select

- [Select-Object（選取物件或屬性）](cmdlet-tutorials.md#select-object)
- [Select-String（搜尋文字模式）](cmdlet-tutorials.md#select-string)
- [Select-Xml（查詢XML）](cmdlet-quick-index.md#select-xml)

### Set

- [Set-Location（切換目前位置）](cmdlet-tutorials.md#set-location)
- [Set-Content（設定內容）](cmdlet-quick-index.md#set-content)

### Sort

- [Sort-Object（依屬性排序物件）](cmdlet-tutorials.md#sort-object)

### Test

- [Test-Path（檢查路徑）](cmdlet-quick-index.md#test-path)

### Where

- [Where-Object（依條件篩選物件）](cmdlet-tutorials.md#where-object)

## 其他查詢入口

- [參數索引](parameter-reference.md)
- [中英文術語表](glossary.md)
- [完整來源](sources.md)

核准動詞原始資料存於 data/approved-verbs.json，完整繁中動詞字典待編。
