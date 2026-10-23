<a id="parameter-reference"></a>

# 常用參數索引

[返回目錄](../README.md)

同名參數不保證跨命令同義；必要性、型別與是否變更系統必須依具體命令確認。

<a id="parameter-path"></a>

## -Path（路徑）

類型：命令專屬參數。一般路徑，是否接受萬用字元及必要性依命令與參數組。

適用：Get-ChildItem, Set-Location。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/05-basic-navigation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

<a id="parameter-literalpath"></a>

## -LiteralPath（字面路徑）

類型：命令專屬參數。把方括號等字元當作實際名稱，不作路徑模式。

適用：Get-ChildItem, Set-Location。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/05-basic-navigation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

<a id="parameter-name"></a>

## -Name（名稱）

類型：命令專屬參數。名稱的對象依命令而異，不可當成通用身分欄位。

適用：Get-Command, Get-Alias, Get-Help。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/07-commands-aliases.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Command.md)，查閱 2026-10-24。

<a id="parameter-filter"></a>

## -Filter（提供者篩選）

類型：命令專屬參數。將篩選交給提供者；支援規則與效能依實作。

適用：Get-ChildItem。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/05-basic-navigation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

<a id="parameter-include"></a>

## -Include（包含模式）

類型：命令專屬參數。包含符合名稱模式的項目，需留意路徑與遞迴脈絡。

適用：Get-ChildItem。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/05-basic-navigation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

<a id="parameter-exclude"></a>

## -Exclude（排除模式）

類型：命令專屬參數。排除符合模式項目；不是全域存取控制。

適用：Get-ChildItem, Get-Alias。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/05-basic-navigation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

<a id="parameter-recurse"></a>

## -Recurse（遞迴）

類型：命令專屬參數。走訪子容器，先限定資料範圍。

適用：Get-ChildItem。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/05-basic-navigation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

<a id="parameter-force"></a>

## -Force（強制相關選項）

類型：命令專屬參數。語意依命令；不等於管理員權限或略過所有限制。

適用：Get-ChildItem, Get-Member。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/05-basic-navigation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，查閱 2026-10-24。

<a id="parameter-whatif"></a>

## -WhatIf（模擬變更）

類型：支援 ShouldProcess 的風險管理參數。僅支援 ShouldProcess 的命令；不能保證所有前置作業零副作用。

適用：Set-LearningValue。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/17-advanced-functions.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_CmdletBindingAttribute.md)，查閱 2026-10-24。

<a id="parameter-confirm"></a>

## -Confirm（確認變更）

類型：支援 ShouldProcess 的風險管理參數。控制變更提示，不是身分授權。

適用：Set-LearningValue。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/17-advanced-functions.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_CmdletBindingAttribute.md)，查閱 2026-10-24。

<a id="parameter-verbose"></a>

## -Verbose（詳細診斷）

類型：通用參數。顯示詳細訊息，維持成功資料與診斷分流。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-debug"></a>

## -Debug（偵錯訊息）

類型：通用參數。顯示偵錯內容，避免在訊息中輸出秘密。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-erroraction"></a>

## -ErrorAction（錯誤處置）

類型：通用參數。控制錯誤行為；Stop 有助必要操作進入 catch。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/19-error-handling.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-errorvariable"></a>

## -ErrorVariable（錯誤收集變數）

類型：通用參數。把錯誤紀錄保留到指定變數以便後續處理。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/19-error-handling.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-warningaction"></a>

## -WarningAction（警告處置）

類型：通用參數。控制警告訊息行為，不等同錯誤處置。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-warningvariable"></a>

## -WarningVariable（警告收集變數）

類型：通用參數。收集警告紀錄；不應把警告直接當失敗或成功。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-informationaction"></a>

## -InformationAction（資訊處置）

類型：通用參數。控制資訊串流顯示與處理，依命令行為判讀。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-informationvariable"></a>

## -InformationVariable（資訊收集變數）

類型：通用參數。保存資訊紀錄；分享前檢查敏感內容。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-outvariable"></a>

## -OutVariable（輸出收集變數）

類型：通用參數。保存成功輸出，同時仍可流向後續管線。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/09-pipeline.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-outbuffer"></a>

## -OutBuffer（輸出緩衝）

類型：通用參數。控制管線傳送前保留的物件數，不是通用效能魔法。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/09-pipeline.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-pipelinevariable"></a>

## -PipelineVariable（管線變數）

類型：通用參數。讓後段引用當前處理脈絡中的值，需理解列舉與作用域。

適用：進階函式與 Cmdlet。版本：依命令與版本；以 7.6 文件為基準。[對應章節](../../docs/chapters/09-pipeline.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-progressaction"></a>

## -ProgressAction（進度處置）

類型：通用參數。PowerShell 7.4 起，控制進度顯示行為。

適用：進階函式與 Cmdlet。版本：7.4+。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)，查閱 2026-10-24。

<a id="parameter-raw"></a>

## -Raw（全文／原始輸出）

類型：命令專屬參數。在Get-Content表示單一全文字串；在Select-String表示輸出命中文字，不能跨命令類推。

適用：Get-Content, Select-String。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Content.md)，查閱 2026-10-24。

<a id="parameter-encoding"></a>

## -Encoding（字元編碼）

類型：命令專屬參數。明確指定文字讀寫編碼；可用名稱與預設值依版本而異。

適用：Get-Content, Set-Content, Export-Csv。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Character_Encoding.md)，查閱 2026-10-24。

<a id="parameter-simplematch"></a>

## -SimpleMatch（字面比對）

類型：命令專屬參數。讓Pattern作固定字串搜尋，不當成Regex。

適用：Select-String。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/23-text-regex.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-String.md)，查閱 2026-10-24。

<a id="parameter-allmatches"></a>

## -AllMatches（全部命中）

類型：命令專屬參數。把一行內所有Regex命中放在Matches，不增加命中行數。

適用：Select-String。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/23-text-regex.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-String.md)，查閱 2026-10-24。

<a id="parameter-delimiter"></a>

## -Delimiter（分隔字元）

類型：命令專屬參數。CSV匯入與匯出必須使用相同分隔規格。

適用：Export-Csv, Import-Csv。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-Csv.md)，查閱 2026-10-24。

<a id="parameter-depth"></a>

## -Depth（巢狀深度）

類型：命令專屬參數。ConvertTo-Json控制輸出序列化深度；ConvertFrom-Json限制可剖析深度，作用不同。

適用：ConvertTo-Json, ConvertFrom-Json。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertTo-Json.md)，查閱 2026-10-24。

<a id="parameter-ashashtable"></a>

## -AsHashtable（轉為雜湊表）

類型：命令專屬參數。JSON解析為字典；6.0加入，7.3起保留順序；同名重複鍵仍只留下最後值。

適用：ConvertFrom-Json。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-Json.md)，查閱 2026-10-24。

<a id="parameter-noenumerate"></a>

## -NoEnumerate（不列舉陣列）

類型：命令專屬參數。讓JSON陣列以單一物件傳出，保留單元素陣列往返形狀。

適用：ConvertFrom-Json。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-Json.md)，查閱 2026-10-24。

<a id="parameter-destinationpath"></a>

## -DestinationPath（目的路徑）

類型：命令專屬參數。Compress-Archive的ZIP輸出與Expand-Archive的還原資料夾，語意依命令。

適用：Compress-Archive, Expand-Archive。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/25-archives-backup.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Archive/Compress-Archive.md)，查閱 2026-10-24。

<a id="parameter-algorithm"></a>

## -Algorithm（雜湊演算法）

類型：命令專屬參數。Get-FileHash預設SHA256；不要把雜湊當成加密或來源簽章。

適用：Get-FileHash。版本：7.6基準；版本差異見描述與章節。[對應章節](../../docs/chapters/25-archives-backup.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-FileHash.md)，查閱 2026-10-24。

<a id="parameter-id"></a>

## -Id（識別碼）

類型：命令專屬參數。Get-Process為PID；事件Id屬於事件查詢條件，不能跨命令混同。

適用：Get-Process。版本：本版7.6文件；依命令參數組。[對應章節](../../docs/chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Process.md)，查閱 2026-10-24。

<a id="parameter-passthru"></a>

## -PassThru（回傳處理結果）

類型：命令專屬參數。Start-Process回傳程序物件；其他命令的回傳型別各自定義。

適用：Start-Process。版本：本版7.6文件；依命令參數組。[對應章節](../../docs/chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Start-Process.md)，查閱 2026-10-24。

<a id="parameter-propertytype"></a>

## -PropertyType（屬性型別）

類型：命令專屬參數。Registry建立值時指定String、DWord等，不能只比對顯示文字。

適用：New-ItemProperty。版本：本版7.6文件；依命令參數組。[對應章節](../../docs/chapters/27-windows-registry.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/New-ItemProperty.md)，查閱 2026-10-24。

<a id="parameter-filterhashtable"></a>

## -FilterHashtable（雜湊表查詢條件）

類型：命令專屬參數。Get-WinEvent支援LogName、Level、StartTime等指定鍵；非任意欄位。

適用：Get-WinEvent。版本：本版7.6文件；依命令參數組。[對應章節](../../docs/chapters/28-events-system-info.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Diagnostics/Get-WinEvent.md)，查閱 2026-10-24。

<a id="parameter-maxevents"></a>

## -MaxEvents（事件筆數上限）

類型：命令專屬參數。限制取得數量，結果不可冒稱完整時間區間總量。

適用：Get-WinEvent。版本：本版7.6文件；依命令參數組。[對應章節](../../docs/chapters/28-events-system-info.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Diagnostics/Get-WinEvent.md)，查閱 2026-10-24。

<a id="parameter-targetname"></a>

## -TargetName（目標名稱）

類型：命令專屬參數。Test-Connection的必要目標，版本與舊ComputerName寫法需區分。

適用：Test-Connection。版本：本版7.6文件；依命令參數組。[對應章節](../../docs/chapters/29-network-diagnostics.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Test-Connection.md)，查閱 2026-10-24。

<a id="parameter-cimsession"></a>

## -CimSession（CIM工作階段）

類型：命令專屬參數。指定已建立的CIM連線物件，查詢後須負責清理。

適用：Get-CimInstance。版本：本版7.6文件；依命令參數組。[對應章節](../../docs/chapters/30-cim-remote-management.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Get-CimInstance.md)，查閱 2026-10-24。

<a id="parameter-classname"></a>

## -ClassName（類別名稱）

類型：命令專屬參數。例如Win32_OperatingSystem；類別與命名空間依目標提供者。

適用：Get-CimInstance。版本：本版7.6文件；依命令參數組。[對應章節](../../docs/chapters/30-cim-remote-management.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Get-CimInstance.md)，查閱 2026-10-24。
