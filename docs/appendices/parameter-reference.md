<a id="parameter-reference"></a>

# 常用參數索引

[返回目錄](../README.md)

同名參數不保證跨命令同義；必要性、型別與是否變更系統必須依具體命令確認。

## -Path（路徑）

類型：specific。一般路徑，是否接受萬用字元及必要性依命令與參數組。

適用：Get-ChildItem, Set-Location。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

## -LiteralPath（字面路徑）

類型：specific。把方括號等字元當作實際名稱，不作路徑模式。

適用：Get-ChildItem, Set-Location。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

## -Name（名稱）

類型：specific。名稱的對象依命令而異，不可當成通用身分欄位。

適用：Get-Command, Get-Alias, Get-Help。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Command.md)，查閱 2026-10-24。

## -Filter（提供者篩選）

類型：specific。將篩選交給提供者；支援規則與效能依實作。

適用：Get-ChildItem。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

## -Include（包含模式）

類型：specific。包含符合名稱模式的項目，需留意路徑與遞迴脈絡。

適用：Get-ChildItem。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

## -Exclude（排除模式）

類型：specific。排除符合模式項目；不是全域存取控制。

適用：Get-ChildItem, Get-Alias。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

## -Recurse（遞迴）

類型：specific。走訪子容器，先限定資料範圍。

適用：Get-ChildItem。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

## -Force（強制相關選項）

類型：specific。語意依命令；不等於管理員權限或略過所有限制。

適用：Get-ChildItem, Get-Member。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

## -WhatIf（模擬變更）

類型：should-process。僅支援 ShouldProcess 的命令；不能保證所有前置作業零副作用。

適用：Set-LearningValue。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_CmdletBindingAttribute.md)，查閱 2026-10-24。

## -Confirm（確認變更）

類型：should-process。控制變更提示，不是身分授權。

適用：Set-LearningValue。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_CmdletBindingAttribute.md)，查閱 2026-10-24。

## -Verbose（詳細診斷）

類型：common。顯示詳細訊息，維持成功資料與診斷分流。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -Debug（偵錯訊息）

類型：common。顯示偵錯內容，避免在訊息中輸出秘密。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -ErrorAction（錯誤處置）

類型：common。控制錯誤行為；Stop 有助必要操作進入 catch。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -ErrorVariable（錯誤收集變數）

類型：common。把錯誤紀錄保留到指定變數以便後續處理。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -WarningAction（警告處置）

類型：common。控制警告訊息行為，不等同錯誤處置。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -WarningVariable（警告收集變數）

類型：common。收集警告紀錄；不應把警告直接當失敗或成功。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -InformationAction（資訊處置）

類型：common。控制資訊串流顯示與處理，依命令行為判讀。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -InformationVariable（資訊收集變數）

類型：common。保存資訊紀錄；分享前檢查敏感內容。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -OutVariable（輸出收集變數）

類型：common。保存成功輸出，同時仍可流向後續管線。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -OutBuffer（輸出緩衝）

類型：common。控制管線傳送前保留的物件數，不是通用效能魔法。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -PipelineVariable（管線變數）

類型：common。讓後段引用當前處理脈絡中的值，需理解列舉與作用域。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

## -ProgressAction（進度處置）

類型：common。PowerShell 7.4 起，控制進度顯示行為。

適用：進階函式與 Cmdlet。版本：7.4+。[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。
