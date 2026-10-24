<a id="master-index"></a>

# 總索引

[返回目錄](../README.md)

本版54個命令索引：25個十四項教學、29個速查。500+仍是未完成目標；索引不代表全部平台已測。

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
- [Get-CimInstance（取得CIM實例）](cmdlet-tutorials.md#get-ciminstance)：唯讀取得管理實例快照；本版命令Windows專用。
- [Get-Command（取得命令）](cmdlet-tutorials.md#get-command)：找出可用命令、種類與來源；適合不確定模組或參數的時候。
- [Get-ComputerInfo（取得Windows系統資訊）](cmdlet-quick-index.md#get-computerinfo)：整合系統資訊，使用Property選擇必要欄位。
- [Get-Content（讀取內容）](cmdlet-tutorials.md#get-content)：按行或以 Raw 讀取文字，明確指定編碼並考慮記憶體。
- [Get-FileHash（計算檔案雜湊）](../chapters/32-security.md#get-filehash)：以SHA256等演算法核對位元組內容，不單獨證明來源身分。
- [Get-Help（取得說明）](cmdlet-tutorials.md#get-help)：閱讀命令參數與概念，排查參數組合及管線支援。
- [Get-Item（取得項目）](cmdlet-quick-index.md#get-item)：讀取精確檔案或資料夾的中繼資料，不列出全部子項目。
- [Get-ItemProperty（取得項目屬性）](cmdlet-tutorials.md#get-itemproperty)：在Registry情境讀機碼的值；與列出子機碼不同。
- [Get-ItemPropertyValue（取得指定屬性值）](cmdlet-quick-index.md#get-itempropertyvalue)：取得值本身；Registry情境僅Windows，不把值當子路徑。
- [Get-Location（取得目前位置）](cmdlet-tutorials.md#get-location)：在相對路徑操作前確認目前提供者與路徑。
- [Get-Member（取得物件成員）](cmdlet-tutorials.md#get-member)：發現輸入物件的屬性、方法及型別。
- [Get-Process（取得處理程序）](cmdlet-tutorials.md#get-process)：查目前程序或指定PID，CPU是累計秒數，不是即時百分比。
- [Get-Service（取得Windows服務）](cmdlet-quick-index.md#get-service)：查服務名稱、狀態與相依性；Windows專用。
- [Get-WinEvent（讀取Windows事件）](cmdlet-tutorials.md#get-winevent)：按來源、時間與層級讀事件；查詢失敗不能當零事件。
- [Import-Csv（匯入CSV）](cmdlet-quick-index.md#import-csv)：由CSV建立欄位物件，數值欄位通常仍需驗證與轉型。
- [Join-Path（組合路徑）](cmdlet-quick-index.md#join-path)：依提供者組合父子路徑，不會建立檔案或驗證安全邊界。
- [Move-Item（移動項目）](cmdlet-quick-index.md#move-item)：搬移項目，成功後原位置不再保留該項目。
- [New-CimSession（建立CIM工作階段）](cmdlet-quick-index.md#new-cimsession)：本機預設DCOM，指定主機預設WSMan；連線需合法授權。
- [New-CimSessionOption（建立CIM工作階段選項）](cmdlet-quick-index.md#new-cimsessionoption)：建立WSMan或DCOM選項，不代表已建立成功連線。
- [New-Item（建立項目）](cmdlet-quick-index.md#new-item)：在指定提供者建立檔案或資料夾；先確認 ItemType 與目標。
- [New-ItemProperty（建立項目屬性）](cmdlet-quick-index.md#new-itemproperty)：建立指定型別的Registry值；限定自建HKCU練習範圍。
- [Remove-CimSession（移除CIM工作階段）](cmdlet-quick-index.md#remove-cimsession)：清理本機CIM工作階段物件，不刪除遠端主機資料。
- [Remove-Item（移除項目）](cmdlet-quick-index.md#remove-item)：刪除明確指定項目；先用 WhatIf 核對且不要假設可從回收筒還原。
- [Remove-ItemProperty（移除項目屬性）](cmdlet-quick-index.md#remove-itemproperty)：刪除機碼內的指定值，不等於刪整個機碼。
- [Rename-Item（重新命名項目）](cmdlet-quick-index.md#rename-item)：在原位置改名稱，不能用 NewName 跨目錄搬移。
- [Resolve-DnsName（解析DNS名稱）](cmdlet-quick-index.md#resolve-dnsname)：Windows DNS查詢，區分紀錄型別、快取與實際解析。
- [Restart-Service（重新啟動Windows服務）](cmdlet-quick-index.md#restart-service)：送出停止與啟動要求；停止的服務也可能被啟動，先核對影響。
- [Select-Object（選取物件或屬性）](cmdlet-tutorials.md#select-object)：精簡報表欄位或只取前幾筆資料。
- [Select-String（搜尋文字模式）](cmdlet-tutorials.md#select-string)：按 Regex 或字面文字搜尋，回傳命中行與擷取資訊。
- [Select-Xml（查詢XML）](cmdlet-quick-index.md#select-xml)：以XPath查詢節點，命名空間需設定前綴對應。
- [Set-Content（設定內容）](cmdlet-quick-index.md#set-content)：以新文字取代檔案內容；和附加寫入不同。
- [Set-ItemProperty（設定項目屬性）](cmdlet-quick-index.md#set-itemproperty)：修改項目屬性；Registry要記錄原值與型別並核對權限。
- [Set-Location（切換目前位置）](cmdlet-tutorials.md#set-location)：互動巡覽資料夾；腳本需注意後續相對路徑的目標。
- [Sort-Object（依屬性排序物件）](cmdlet-tutorials.md#sort-object)：排行、同值次序與依多欄位整理報表。
- [Start-Process（啟動處理程序）](cmdlet-quick-index.md#start-process)：啟動明確程式；PassThru回傳程序物件，Wait等待結束。
- [Stop-Process（停止處理程序）](cmdlet-quick-index.md#stop-process)：以保存的程序物件終止自建練習子程序，避免廣泛名稱匹配。
- [Test-Connection（測試連線）](cmdlet-tutorials.md#test-connection)：以ICMP或支援版本的TCP參數測明確目標；失敗不等於主機關機。
- [Test-NetConnection（診斷網路連線）](cmdlet-quick-index.md#test-netconnection)：Windows TCP與路由診斷，明確指定ComputerName及Port。
- [Test-Path（檢查路徑）](cmdlet-quick-index.md#test-path)：檢查路徑存在與 Leaf／Container；不保證下一步存取成功。
- [Wait-Process（等待處理程序）](cmdlet-quick-index.md#wait-process)：等待指定程序結束；官方文件明示不適用Linux或macOS。
- [Where-Object（依條件篩選物件）](cmdlet-tutorials.md#where-object)：以屬性比較、複合條件挑出報表資料。

## 依功能與情境

### CIM管理

- [Get-CimInstance（取得CIM實例）](cmdlet-tutorials.md#get-ciminstance)
- [New-CimSession（建立CIM工作階段）](cmdlet-quick-index.md#new-cimsession)
- [New-CimSessionOption（建立CIM工作階段選項）](cmdlet-quick-index.md#new-cimsessionoption)
- [Remove-CimSession（移除CIM工作階段）](cmdlet-quick-index.md#remove-cimsession)

### Registry值

- [Get-ItemProperty（取得項目屬性）](cmdlet-tutorials.md#get-itemproperty)
- [Get-ItemPropertyValue（取得指定屬性值）](cmdlet-quick-index.md#get-itempropertyvalue)
- [New-ItemProperty（建立項目屬性）](cmdlet-quick-index.md#new-itemproperty)
- [Set-ItemProperty（設定項目屬性）](cmdlet-quick-index.md#set-itemproperty)
- [Remove-ItemProperty（移除項目屬性）](cmdlet-quick-index.md#remove-itemproperty)

### 事件與系統資訊

- [Get-WinEvent（讀取Windows事件）](cmdlet-tutorials.md#get-winevent)
- [Get-ComputerInfo（取得Windows系統資訊）](cmdlet-quick-index.md#get-computerinfo)

### 封存與驗收

- [Compress-Archive（建立ZIP封存）](cmdlet-tutorials.md#compress-archive)
- [Expand-Archive（展開ZIP封存）](cmdlet-quick-index.md#expand-archive)
- [Get-FileHash（計算檔案雜湊）](../chapters/32-security.md#get-filehash)

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

### 程序與服務

- [Get-Process（取得處理程序）](cmdlet-tutorials.md#get-process)
- [Start-Process（啟動處理程序）](cmdlet-quick-index.md#start-process)
- [Stop-Process（停止處理程序）](cmdlet-quick-index.md#stop-process)
- [Wait-Process（等待處理程序）](cmdlet-quick-index.md#wait-process)
- [Get-Service（取得Windows服務）](cmdlet-quick-index.md#get-service)
- [Restart-Service（重新啟動Windows服務）](cmdlet-quick-index.md#restart-service)

### 網路診斷

- [Test-Connection（測試連線）](cmdlet-tutorials.md#test-connection)
- [Resolve-DnsName（解析DNS名稱）](cmdlet-quick-index.md#resolve-dnsname)
- [Test-NetConnection（診斷網路連線）](cmdlet-quick-index.md#test-netconnection)

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

### CimCmdlets

- [Get-CimInstance（取得CIM實例）](cmdlet-tutorials.md#get-ciminstance)
- [New-CimSession（建立CIM工作階段）](cmdlet-quick-index.md#new-cimsession)
- [New-CimSessionOption（建立CIM工作階段選項）](cmdlet-quick-index.md#new-cimsessionoption)
- [Remove-CimSession（移除CIM工作階段）](cmdlet-quick-index.md#remove-cimsession)

### DnsClient

- [Resolve-DnsName（解析DNS名稱）](cmdlet-quick-index.md#resolve-dnsname)

### Microsoft.PowerShell.Archive

- [Compress-Archive（建立ZIP封存）](cmdlet-tutorials.md#compress-archive)
- [Expand-Archive（展開ZIP封存）](cmdlet-quick-index.md#expand-archive)

### Microsoft.PowerShell.Core

- [Get-Command（取得命令）](cmdlet-tutorials.md#get-command)
- [Get-Help（取得說明）](cmdlet-tutorials.md#get-help)
- [Where-Object（依條件篩選物件）](cmdlet-tutorials.md#where-object)

### Microsoft.PowerShell.Diagnostics

- [Get-WinEvent（讀取Windows事件）](cmdlet-tutorials.md#get-winevent)

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
- [Get-Process（取得處理程序）](cmdlet-tutorials.md#get-process)
- [Start-Process（啟動處理程序）](cmdlet-quick-index.md#start-process)
- [Stop-Process（停止處理程序）](cmdlet-quick-index.md#stop-process)
- [Wait-Process（等待處理程序）](cmdlet-quick-index.md#wait-process)
- [Get-Service（取得Windows服務）](cmdlet-quick-index.md#get-service)
- [Restart-Service（重新啟動Windows服務）](cmdlet-quick-index.md#restart-service)
- [Get-ItemProperty（取得項目屬性）](cmdlet-tutorials.md#get-itemproperty)
- [Get-ItemPropertyValue（取得指定屬性值）](cmdlet-quick-index.md#get-itempropertyvalue)
- [New-ItemProperty（建立項目屬性）](cmdlet-quick-index.md#new-itemproperty)
- [Set-ItemProperty（設定項目屬性）](cmdlet-quick-index.md#set-itemproperty)
- [Remove-ItemProperty（移除項目屬性）](cmdlet-quick-index.md#remove-itemproperty)
- [Get-ComputerInfo（取得Windows系統資訊）](cmdlet-quick-index.md#get-computerinfo)
- [Test-Connection（測試連線）](cmdlet-tutorials.md#test-connection)

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
- [Get-FileHash（計算檔案雜湊）](../chapters/32-security.md#get-filehash)

### NetTCPIP

- [Test-NetConnection（診斷網路連線）](cmdlet-quick-index.md#test-netconnection)

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
- [Get-FileHash（計算檔案雜湊）](../chapters/32-security.md#get-filehash)
- [Get-Process（取得處理程序）](cmdlet-tutorials.md#get-process)
- [Get-Service（取得Windows服務）](cmdlet-quick-index.md#get-service)
- [Get-ItemProperty（取得項目屬性）](cmdlet-tutorials.md#get-itemproperty)
- [Get-ItemPropertyValue（取得指定屬性值）](cmdlet-quick-index.md#get-itempropertyvalue)
- [Get-WinEvent（讀取Windows事件）](cmdlet-tutorials.md#get-winevent)
- [Get-ComputerInfo（取得Windows系統資訊）](cmdlet-quick-index.md#get-computerinfo)
- [Get-CimInstance（取得CIM實例）](cmdlet-tutorials.md#get-ciminstance)

### Import

- [Import-Csv（匯入CSV）](cmdlet-quick-index.md#import-csv)

### Join

- [Join-Path（組合路徑）](cmdlet-quick-index.md#join-path)

### Move

- [Move-Item（移動項目）](cmdlet-quick-index.md#move-item)

### New

- [New-Item（建立項目）](cmdlet-quick-index.md#new-item)
- [New-ItemProperty（建立項目屬性）](cmdlet-quick-index.md#new-itemproperty)
- [New-CimSession（建立CIM工作階段）](cmdlet-quick-index.md#new-cimsession)
- [New-CimSessionOption（建立CIM工作階段選項）](cmdlet-quick-index.md#new-cimsessionoption)

### Remove

- [Remove-Item（移除項目）](cmdlet-quick-index.md#remove-item)
- [Remove-ItemProperty（移除項目屬性）](cmdlet-quick-index.md#remove-itemproperty)
- [Remove-CimSession（移除CIM工作階段）](cmdlet-quick-index.md#remove-cimsession)

### Rename

- [Rename-Item（重新命名項目）](cmdlet-quick-index.md#rename-item)

### Resolve

- [Resolve-DnsName（解析DNS名稱）](cmdlet-quick-index.md#resolve-dnsname)

### Restart

- [Restart-Service（重新啟動Windows服務）](cmdlet-quick-index.md#restart-service)

### Select

- [Select-Object（選取物件或屬性）](cmdlet-tutorials.md#select-object)
- [Select-String（搜尋文字模式）](cmdlet-tutorials.md#select-string)
- [Select-Xml（查詢XML）](cmdlet-quick-index.md#select-xml)

### Set

- [Set-Location（切換目前位置）](cmdlet-tutorials.md#set-location)
- [Set-Content（設定內容）](cmdlet-quick-index.md#set-content)
- [Set-ItemProperty（設定項目屬性）](cmdlet-quick-index.md#set-itemproperty)

### Sort

- [Sort-Object（依屬性排序物件）](cmdlet-tutorials.md#sort-object)

### Start

- [Start-Process（啟動處理程序）](cmdlet-quick-index.md#start-process)

### Stop

- [Stop-Process（停止處理程序）](cmdlet-quick-index.md#stop-process)

### Test

- [Test-Path（檢查路徑）](cmdlet-quick-index.md#test-path)
- [Test-Connection（測試連線）](cmdlet-tutorials.md#test-connection)
- [Test-NetConnection（診斷網路連線）](cmdlet-quick-index.md#test-netconnection)

### Wait

- [Wait-Process（等待處理程序）](cmdlet-quick-index.md#wait-process)

### Where

- [Where-Object（依條件篩選物件）](cmdlet-tutorials.md#where-object)

## 其他查詢

- [參數索引](parameter-reference.md)
- [術語表](glossary.md)
- [來源](sources.md)

核准動詞原始資料存於data/approved-verbs.json；完整繁中動詞字典待編。

## Start-Job（啟動背景工作）

[十四項教學](../../docs/chapters/31-jobs-parallel-scheduling.md#start-job)；模組Microsoft.PowerShell.Core；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Start-Job.md)。企業操作未實測；本機驗證見章節。

## Get-FileHash（取得檔案雜湊）

[十四項教學](../../docs/chapters/32-security.md#get-filehash)；模組Microsoft.PowerShell.Utility；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-FileHash.md)。企業操作未實測；本機驗證見章節。

## Invoke-RestMethod（呼叫REST方法）

[十四項教學](../../docs/chapters/33-rest-api.md#invoke-restmethod)；模組Microsoft.PowerShell.Utility；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Invoke-RestMethod.md)。企業操作未實測；本機驗證見章節。

## Get-ADUser（取得AD使用者）

[十四項教學](../../docs/chapters/34-ad-microsoft365.md#get-aduser)；模組ActiveDirectory；[官方來源](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/ActiveDirectory/Get-ADUser.md)。企業操作未實測；本機驗證見章節。

## Get-AzResource（取得Azure資源）

[十四項教學](../../docs/chapters/35-azure-exchange.md#get-azresource)；模組Az.Resources；[官方來源](https://github.com/Azure/azure-powershell/blob/d316163acc7852f89f81a4ca332dc82f65e13b68/src/Resources/Resources/help/Get-AzResource.md)。企業操作未實測；本機驗證見章節。
