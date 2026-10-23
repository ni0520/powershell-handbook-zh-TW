<a id="master-index"></a>

# 總索引

[返回目錄](../README.md)

本版正式索引 10 個核心命令，皆有十四項教學結構；這不表示所有參數組均已實測，也未達 500+ 目標。

## 依英文名稱

- [Get-Alias（取得別名）](cmdlet-tutorials.md#get-alias)：閱讀舊腳本或診斷同名命令時確認別名指向。
- [Get-ChildItem（取得子項目）](cmdlet-tutorials.md#get-childitem)：盤點目前資料夾，尋找符合副檔名的檔案，建立檔案報表前置資料。
- [Get-Command（取得命令）](cmdlet-tutorials.md#get-command)：找出可用命令、種類與來源；適合不確定模組或參數的時候。
- [Get-Help（取得說明）](cmdlet-tutorials.md#get-help)：閱讀命令參數與概念，排查參數組合及管線支援。
- [Get-Location（取得目前位置）](cmdlet-tutorials.md#get-location)：在相對路徑操作前確認目前提供者與路徑。
- [Get-Member（取得物件成員）](cmdlet-tutorials.md#get-member)：發現輸入物件的屬性、方法及型別。
- [Select-Object（選取物件或屬性）](cmdlet-tutorials.md#select-object)：精簡報表欄位或只取前幾筆資料。
- [Set-Location（切換目前位置）](cmdlet-tutorials.md#set-location)：互動巡覽資料夾；腳本需注意後續相對路徑的目標。
- [Sort-Object（依屬性排序物件）](cmdlet-tutorials.md#sort-object)：排行、同值次序與依多欄位整理報表。
- [Where-Object（依條件篩選物件）](cmdlet-tutorials.md#where-object)：以屬性比較、複合條件挑出報表資料。

## 依功能與模組

### Microsoft.PowerShell.Core

- [Get-Command](cmdlet-tutorials.md#get-command) — 取得命令
- [Get-Help](cmdlet-tutorials.md#get-help) — 取得說明
- [Where-Object](cmdlet-tutorials.md#where-object) — 依條件篩選物件
### Microsoft.PowerShell.Management

- [Get-Location](cmdlet-tutorials.md#get-location) — 取得目前位置
- [Set-Location](cmdlet-tutorials.md#set-location) — 切換目前位置
- [Get-ChildItem](cmdlet-tutorials.md#get-childitem) — 取得子項目
### Microsoft.PowerShell.Utility

- [Get-Alias](cmdlet-tutorials.md#get-alias) — 取得別名
- [Get-Member](cmdlet-tutorials.md#get-member) — 取得物件成員
- [Select-Object](cmdlet-tutorials.md#select-object) — 選取物件或屬性
- [Sort-Object](cmdlet-tutorials.md#sort-object) — 依屬性排序物件

## 其他查詢入口

- 參數：見[常用參數](parameter-reference.md)，區分通用參數與命令專屬參數。
- 英文與中文：見[術語表](glossary.md)。
- 別名：見[第 7 章](../chapters/07-commands-aliases.md)，以本機 Get-Alias 確認。
- 提供者／路徑：見[第 5 章](../chapters/05-basic-navigation.md)。
- 版本：見[第 2 章](../chapters/02-powershell-versions.md)。
- 錯誤訊息：見[第 19 章](../chapters/19-error-handling.md)。
- 報表案例：見[第 10 章](../chapters/10-filter-sort.md)。
- 動詞：本版主要為 Get、Set、Select、Where、Sort；完整核准動詞原始資料存於 data/approved-verbs.json，完整繁中動詞字典待編。
