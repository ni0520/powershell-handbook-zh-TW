<a id="master-index"></a>

# 總索引

[返回目錄](../README.md)

本版250個命令索引：27個十四項教學、223個速查。500+仍是未完成目標；索引不代表全部平台已測。

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

## 第36–40章索引增量

- [Get-VM（取得Hyper-V虛擬機）](../../docs/chapters/36-infrastructure-services.md#get-vm)：查詢核准Hyper-V主機的虛擬機，保留主機與VMId。
- [Measure-Command（量測命令時間）](../../docs/chapters/37-performance-design.md#measure-command)：執行區塊並量測時間；真實執行且不代表完整效能剖析。
- [Clear-Content（清空內容）](../../docs/appendices/cmdlet-quick-index.md#clear-content)：保留檔案項目但清除內容；可能破壞資料，先備份並確認提供者。
- [Get-Date（取得日期）](../../docs/appendices/cmdlet-quick-index.md#get-date)：產生日期時間或格式字串；區分本機時間、UTC與固定格式。
- [New-TimeSpan（建立時間間隔）](../../docs/appendices/cmdlet-quick-index.md#new-timespan)：由起迄時間或分量建立TimeSpan；總量與分量不同。
- [Get-Random（取得隨機值）](../../docs/appendices/cmdlet-quick-index.md#get-random)：抽樣或產生隨機數；不把一般隨機抽樣當秘密產生方案。
- [Get-Unique（取得相鄰唯一值）](../../docs/appendices/cmdlet-quick-index.md#get-unique)：從已排序清單移除相鄰重複；先理解排序與比較規則。
- [Group-Object（物件分組）](../../docs/appendices/cmdlet-quick-index.md#group-object)：依屬性分組並取得數量；分組結果不是原始資料列。
- [Measure-Object（物件統計）](../../docs/appendices/cmdlet-quick-index.md#measure-object)：計算數量與數值摘要；缺值與型別需先驗證。
- [Compare-Object（比較物件）](../../docs/appendices/cmdlet-quick-index.md#compare-object)：比較兩組資料的差異；順序與型別契約需額外驗收。
- [ForEach-Object（逐一處理物件）](../../docs/appendices/cmdlet-quick-index.md#foreach-object)：依管線項目執行區塊；Parallel參數組需要PowerShell7。
- [Add-Member（加入物件成員）](../../docs/appendices/cmdlet-quick-index.md#add-member)：向物件加入延伸屬性等成員；不等於修改遠端管理實體。
- [Tee-Object（分流物件）](../../docs/appendices/cmdlet-quick-index.md#tee-object)：保存到檔案或變數並繼續輸出；檔案內容與編碼需確認。
- [Write-Output（輸出成功資料）](../../docs/appendices/cmdlet-quick-index.md#write-output)：將物件寫入成功串流；不要混入操作日誌。
- [Write-Error（輸出錯誤）](../../docs/appendices/cmdlet-quick-index.md#write-error)：寫入錯誤串流；預設非終止行為需與ErrorAction一起理解。
- [Write-Warning（輸出警告）](../../docs/appendices/cmdlet-quick-index.md#write-warning)：寫入警告串流；警告不自動等於程序失敗。
- [Write-Verbose（輸出詳細訊息）](../../docs/appendices/cmdlet-quick-index.md#write-verbose)：寫入詳細串流；由Verbose設定控制可見性，勿包含秘密。
- [Write-Debug（輸出偵錯訊息）](../../docs/appendices/cmdlet-quick-index.md#write-debug)：寫入偵錯串流；依Debug設定可能改變互動行為。
- [Write-Information（輸出資訊訊息）](../../docs/appendices/cmdlet-quick-index.md#write-information)：寫入資訊串流並可附標籤；避免把資訊當業務結果。
- [Out-String（轉成顯示字串）](../../docs/appendices/cmdlet-quick-index.md#out-string)：將格式化結果轉成文字；不保留原始物件結構。
- [Out-File（輸出文字檔）](../../docs/appendices/cmdlet-quick-index.md#out-file)：將格式化文字寫到檔案；檢查覆寫、編碼與Width。
- [Out-Null（捨棄成功輸出）](../../docs/appendices/cmdlet-quick-index.md#out-null)：捨棄成功串流物件；不代表錯誤已處理。
- [Format-Table（表格顯示）](../../docs/appendices/cmdlet-quick-index.md#format-table)：產生表格格式指令；不放在CSV資料匯出的前面。
- [Format-List（清單顯示）](../../docs/appendices/cmdlet-quick-index.md#format-list)：以清單格式顯示屬性；不是資料投影的替代品。
- [Format-Wide（寬欄顯示）](../../docs/appendices/cmdlet-quick-index.md#format-wide)：以寬欄顯示選定屬性；適用畫面閱讀而非資料交換。
- [ConvertTo-Csv（轉換CSV文字）](../../docs/appendices/cmdlet-quick-index.md#convertto-csv)：將物件轉為CSV字串；與Export-Csv直接寫檔不同。
- [ConvertFrom-Csv（解析CSV文字）](../../docs/appendices/cmdlet-quick-index.md#convertfrom-csv)：將CSV字串轉成物件；欄位值仍需按契約轉型。
- [Export-Clixml（匯出CLI XML）](../../docs/appendices/cmdlet-quick-index.md#export-clixml)：以CLI XML格式序列化物件；憑證加密限Windows，非Windows不以此保護秘密。
- [Import-Clixml（匯入CLI XML）](../../docs/appendices/cmdlet-quick-index.md#import-clixml)：重建序列化資料；複雜型別不保證保有原始方法。
- [ConvertTo-Xml（轉成XML表示）](../../docs/appendices/cmdlet-quick-index.md#convertto-xml)：建立物件的XML表示；不等同任意業務XML結構。
- [Get-Culture（取得文化設定）](../../docs/appendices/cmdlet-quick-index.md#get-culture)：讀取目前文化資訊；數值與日期解析需明確契約。
- [Get-UICulture（取得介面文化）](../../docs/appendices/cmdlet-quick-index.md#get-uiculture)：讀取介面語言文化；與資料格式文化分開理解。
- [Get-Verb（取得核准動詞）](../../docs/appendices/cmdlet-quick-index.md#get-verb)：列出核准PowerShell動詞；名稱中的其他字不一定核准。
- [Get-Host（取得主機資訊）](../../docs/appendices/cmdlet-quick-index.md#get-host)：讀取PowerShell主機資訊；主機版本不等於所有模組版本。
- [Read-Host（讀取互動輸入）](../../docs/appendices/cmdlet-quick-index.md#read-host)：從終端機讀取文字或安全字串；不適合直接放入無人值守排程。
- [Get-PSDrive（取得磁碟對應）](../../docs/appendices/cmdlet-quick-index.md#get-psdrive)：列出目前工作階段的提供者磁碟；不限實體磁碟。
- [Get-PSProvider（取得提供者）](../../docs/appendices/cmdlet-quick-index.md#get-psprovider)：列出提供者能力；命令存在不代表Registry提供者存在。
- [Push-Location（推入位置堆疊）](../../docs/appendices/cmdlet-quick-index.md#push-location)：保存目前位置並切換；搭配Pop-Location與finally恢復。
- [Pop-Location（彈出位置堆疊）](../../docs/appendices/cmdlet-quick-index.md#pop-location)：回到先前保存的位置；確認使用的堆疊與作用範圍。
- [Resolve-Path（解析存在路徑）](../../docs/appendices/cmdlet-quick-index.md#resolve-path)：將存在的提供者路徑解析為完整形式；不是任意目標的安全驗證器。
- [Split-Path（拆分路徑）](../../docs/appendices/cmdlet-quick-index.md#split-path)：取得父路徑、葉節點等部分；不等於驗證檔案存在。
- [Get-Module（取得模組資訊）](../../docs/appendices/cmdlet-quick-index.md#get-module)：區分已載入與ListAvailable可用模組；不等於命令已測。
- [Import-Module（匯入模組）](../../docs/appendices/cmdlet-quick-index.md#import-module)：把模組命令載入工作階段；可能執行模組初始化程式。
- [Remove-Module（移除已載入模組）](../../docs/appendices/cmdlet-quick-index.md#remove-module)：從工作階段移除模組；不卸載磁碟上的套件。
- [Get-Job（取得工作）](../../docs/appendices/cmdlet-quick-index.md#get-job)：查詢目前工作階段背景工作；不代表全系統排程。
- [Receive-Job（接收工作結果）](../../docs/appendices/cmdlet-quick-index.md#receive-job)：接收彙總串流；需要重讀時使用Keep或先存變數。

<!-- reviewed-v06-index -->

## v0.6新增命令索引

- [Add-History（加入歷程紀錄）](../../docs/appendices/cmdlet-quick-index.md#add-history)：把歷程資料加入工作階段；不會執行其中命令。
- [Add-Type（加入型別）](../../docs/appendices/cmdlet-quick-index.md#add-type)：編譯或載入.NET型別；來源程式與組件必須可信。
- [Clear-History（清除工作階段歷程）](../../docs/appendices/cmdlet-quick-index.md#clear-history)：清除指定記憶體歷程；不等於清除PSReadLine持久歷程或秘密暴露。
- [Clear-Host（清除主機畫面）](../../docs/appendices/cmdlet-quick-index.md#clear-host)：要求主機清理畫面；不刪除日誌、歷程或敏感資料副本。
- [Clear-Item（清空項目）](../../docs/appendices/cmdlet-quick-index.md#clear-item)：依提供者清除項目內容；不同於移除項目，仍可能破壞資料。
- [Clear-ItemProperty（清空項目屬性）](../../docs/appendices/cmdlet-quick-index.md#clear-itemproperty)：清除支援提供者的屬性值；不同於移除屬性。
- [Clear-Variable（清空變數值）](../../docs/appendices/cmdlet-quick-index.md#clear-variable)：保留變數但清除值；不證明所有秘密記憶體副本已抹除。
- [Connect-WSMan（連接WSMan管理）](../../docs/appendices/cmdlet-quick-index.md#connect-wsman)：建立WSMan提供者可使用的連接；不是通用PSSession替代品。
- [Convert-Path（轉換提供者路徑）](../../docs/appendices/cmdlet-quick-index.md#convert-path)：將存在的提供者路徑轉成提供者原生表示；不等同Resolve-Path所有功能。
- [ConvertFrom-Markdown（轉換Markdown）](../../docs/appendices/cmdlet-quick-index.md#convertfrom-markdown)：將Markdown轉成HTML或終端機呈現；來源與呈現端安全需分開評估。
- [ConvertFrom-SecureString（輸出安全字串表示）](../../docs/appendices/cmdlet-quick-index.md#convertfrom-securestring)：將SecureString轉成可保存表示；金鑰、平台與明文選項需審查。
- [ConvertFrom-StringData（解析文字鍵值對）](../../docs/appendices/cmdlet-quick-index.md#convertfrom-stringdata)：將鍵值文字轉為雜湊表；先確認分隔與字元逸出規則。
- [ConvertTo-Html（轉換HTML）](../../docs/appendices/cmdlet-quick-index.md#convertto-html)：將物件轉成HTML表示；不直接當任意外來HTML的安全清理器。
- [ConvertTo-SecureString（轉成安全字串）](../../docs/appendices/cmdlet-quick-index.md#convertto-securestring)：建立SecureString；不能保護已硬編碼的秘密，非Windows保障不同。
- [Copy-ItemProperty（複製項目屬性）](../../docs/appendices/cmdlet-quick-index.md#copy-itemproperty)：複製支援提供者的屬性；確認目的地與覆寫條件。
- [Debug-Job（偵錯背景工作）](../../docs/appendices/cmdlet-quick-index.md#debug-job)：進入支援的工作偵錯情境；依工作類型與互動主機能力驗證。
- [Debug-Runspace（偵錯執行空間）](../../docs/appendices/cmdlet-quick-index.md#debug-runspace)：附加至適當執行空間進行互動偵錯；不在正式負載任意使用。
- [Disable-PSBreakpoint（停用中斷點）](../../docs/appendices/cmdlet-quick-index.md#disable-psbreakpoint)：暫停既有中斷點；保留定義，與移除不同。
- [Disable-RunspaceDebug（停用執行空間偵錯）](../../docs/appendices/cmdlet-quick-index.md#disable-runspacedebug)：停用執行空間偵錯並釋放待附加的偵錯停止；可能改變目標執行狀態。
- [Disconnect-WSMan（中斷WSMan連接）](../../docs/appendices/cmdlet-quick-index.md#disconnect-wsman)：移除WSMan管理連接；不等於撤銷遠端帳戶權限。
- [Enable-PSBreakpoint（啟用中斷點）](../../docs/appendices/cmdlet-quick-index.md#enable-psbreakpoint)：啟用既有中斷點；確認作用的腳本與工作階段。
- [Enable-RunspaceDebug（啟用執行空間偵錯）](../../docs/appendices/cmdlet-quick-index.md#enable-runspacedebug)：開啟指定執行空間的偵錯能力；限制作用範圍與附加權限。
- [Enter-PSHostProcess（進入PowerShell主機程序）](../../docs/appendices/cmdlet-quick-index.md#enter-pshostprocess)：連接另一個支援的本機PowerShell程序；偵錯附加可能影響目標。
- [Enter-PSSession（進入互動遠端工作階段）](../../docs/appendices/cmdlet-quick-index.md#enter-pssession)：開始互動遠端操作；不適合當成批次腳本的通用執行方式。
- [Exit-PSHostProcess（離開主機程序偵錯）](../../docs/appendices/cmdlet-quick-index.md#exit-pshostprocess)：離開以Enter-PSHostProcess進入的情境；不等於終止目標程序。
- [Exit-PSSession（離開互動遠端工作階段）](../../docs/appendices/cmdlet-quick-index.md#exit-pssession)：結束互動遠端情境；與刪除持久工作階段的責任不同。
- [Export-Alias（匯出別名）](../../docs/appendices/cmdlet-quick-index.md#export-alias)：將別名定義保存到檔案；確認輸出格式、路徑與覆寫行為。
- [Export-FormatData（匯出格式定義）](../../docs/appendices/cmdlet-quick-index.md#export-formatdata)：保存格式定義供其他情境使用；格式與原始資料分開管理。
- [Export-ModuleMember（指定模組匯出成員）](../../docs/appendices/cmdlet-quick-index.md#export-modulemember)：控制模組提供的函式與別名等成員；不等同寫入模組套件。
- [Format-Custom（自訂格式顯示）](../../docs/appendices/cmdlet-quick-index.md#format-custom)：依自訂視圖顯示物件；不要將格式物件當原始資料匯出。
- [Format-Hex（十六進位顯示）](../../docs/appendices/cmdlet-quick-index.md#format-hex)：檢查檔案或資料的位元組；與文字編碼後的畫面顯示不同。
- [Get-Acl（取得存取控制清單）](../../docs/appendices/cmdlet-quick-index.md#get-acl)：讀取支援平台資源ACL；檔案與Registry等提供者條件不同。
- [Get-AuthenticodeSignature（取得Authenticode簽章）](../../docs/appendices/cmdlet-quick-index.md#get-authenticodesignature)：檢查支援平台的檔案簽章；有效簽章不等於程式無漏洞。
- [Get-CimAssociatedInstance（取得關聯CIM實例）](../../docs/appendices/cmdlet-quick-index.md#get-cimassociatedinstance)：依關聯查詢管理實例；限制類別與目標避免過量盤點。
- [Get-CimClass（取得CIM類別）](../../docs/appendices/cmdlet-quick-index.md#get-cimclass)：查詢管理類別中繼資料；類別存在不代表每個方法都已授權。
- [Get-CimSession（取得CIM工作階段）](../../docs/appendices/cmdlet-quick-index.md#get-cimsession)：取得目前CIM工作階段物件；不等於新建連線或查詢成功。
- [Get-Clipboard（取得剪貼簿）](../../docs/appendices/cmdlet-quick-index.md#get-clipboard)：讀取支援平台的剪貼簿；可能含秘密，服務環境不保證可用。
- [Get-CmsMessage（讀取CMS訊息資訊）](../../docs/appendices/cmdlet-quick-index.md#get-cmsmessage)：檢查CMS封裝訊息資訊；不等於取得受保護內容或私密金鑰。
- [Get-Counter（取得效能計數器）](../../docs/appendices/cmdlet-quick-index.md#get-counter)：查詢Windows效能計數器；取樣區間與權限會影響結果。
- [Get-Credential（取得認證物件）](../../docs/appendices/cmdlet-quick-index.md#get-credential)：以支援的提示流程建立PSCredential；不代表已向服務驗證成功。
- [Get-Error（取得詳細錯誤）](../../docs/appendices/cmdlet-quick-index.md#get-error)：顯示最近或指定錯誤的詳細資料；分享前去除權杖與個資。
- [Get-Event（取得事件佇列項目）](../../docs/appendices/cmdlet-quick-index.md#get-event)：讀取目前工作階段事件；不是Windows事件記錄查詢。
- [Get-EventSubscriber（取得事件訂閱）](../../docs/appendices/cmdlet-quick-index.md#get-eventsubscriber)：列出目前工作階段訂閱；與佇列中已產生事件不同。
- [Get-ExecutionPolicy（取得執行原則）](../../docs/appendices/cmdlet-quick-index.md#get-executionpolicy)：查詢有效或各範圍原則；非Windows與Windows語意不同。
- [Get-ExperimentalFeature（取得實驗功能）](../../docs/appendices/cmdlet-quick-index.md#get-experimentalfeature)：列出實驗功能及啟用狀態；不代表穩定介面或跨版本相容。
- [Get-FormatData（取得格式定義）](../../docs/appendices/cmdlet-quick-index.md#get-formatdata)：查詢工作階段中的顯示格式資訊；不是讀取業務資料列。
- [Get-History（取得工作階段歷程）](../../docs/appendices/cmdlet-quick-index.md#get-history)：讀取目前工作階段命令紀錄；可能含敏感引數，不能任意公開。
- [Get-HotFix（取得Windows修正資訊）](../../docs/appendices/cmdlet-quick-index.md#get-hotfix)：查詢支援的已安裝修正資訊；不等於完整軟體更新盤點。
- [Get-MarkdownOption（取得Markdown顯示選項）](../../docs/appendices/cmdlet-quick-index.md#get-markdownoption)：讀取Markdown終端機呈現設定；不同於文件內容本身。
- [Get-PSBreakpoint（取得中斷點）](../../docs/appendices/cmdlet-quick-index.md#get-psbreakpoint)：列出工作階段中斷點；不代表偵錯目標目前停在該位置。
- [Get-PSCallStack（取得呼叫堆疊）](../../docs/appendices/cmdlet-quick-index.md#get-pscallstack)：檢查函式與腳本呼叫位置；可能包含路徑與引數資訊。
- [Get-PSHostProcessInfo（取得主機程序資訊）](../../docs/appendices/cmdlet-quick-index.md#get-pshostprocessinfo)：列出可辨識的PowerShell主機程序；偵錯附加仍需適當權限。
- [Get-PSReadLineKeyHandler（取得按鍵處理）](../../docs/appendices/cmdlet-quick-index.md#get-psreadlinekeyhandler)：檢視PSReadLine按鍵繫結；模式與終端機可能影響實際行為。
- [Get-PSReadLineOption（取得PSReadLine選項）](../../docs/appendices/cmdlet-quick-index.md#get-psreadlineoption)：讀取互動編輯與歷程設定；不代表非互動工作階段已載入模組。
- [Get-PSSession（取得遠端工作階段）](../../docs/appendices/cmdlet-quick-index.md#get-pssession)：查詢PSSession物件；連線狀態不等於所有遠端命令已授權。
- [Get-PSSessionCapability（取得端點使用者能力）](../../docs/appendices/cmdlet-quick-index.md#get-pssessioncapability)：檢查指定使用者在遠端端點可見能力；需核准端點與身分。
- [Get-PSSessionConfiguration（取得端點設定）](../../docs/appendices/cmdlet-quick-index.md#get-pssessionconfiguration)：查詢遠端處理端點設定；Windows與WSMan條件需另外確認。
- [Get-PfxCertificate（讀取PFX憑證）](../../docs/appendices/cmdlet-quick-index.md#get-pfxcertificate)：載入憑證資料；注意私密金鑰與密碼，不記錄秘密內容。
- [Get-Runspace（取得執行空間）](../../docs/appendices/cmdlet-quick-index.md#get-runspace)：列出目前可見執行空間；存取與偵錯需符合主機能力。
- [Get-SecureRandom（取得安全隨機值）](../../docs/appendices/cmdlet-quick-index.md#get-securerandom)：使用適合安全用途的隨機來源；輸出長度與秘密格式仍需設計。
- [Get-TimeZone（取得時區）](../../docs/appendices/cmdlet-quick-index.md#get-timezone)：查詢Windows時區資訊；本機命令可被找到不代表官方已支援Linux功能。
- [Get-TraceSource（取得追蹤來源）](../../docs/appendices/cmdlet-quick-index.md#get-tracesource)：查詢PowerShell追蹤來源；不直接啟動產品服務追蹤。
- [Get-TypeData（取得延伸型別資料）](../../docs/appendices/cmdlet-quick-index.md#get-typedata)：讀取PowerShell延伸型別定義；不同於物件當下的每個值。
- [Get-Uptime（取得系統運作時間）](../../docs/appendices/cmdlet-quick-index.md#get-uptime)：查詢自開機經過時間或開機時間；不代表應用程式可用性。
- [Get-Variable（取得變數）](../../docs/appendices/cmdlet-quick-index.md#get-variable)：讀取範圍內的變數與值；可能包含秘密，不列印整個環境。
- [Get-WSManInstance（取得WSMan實例）](../../docs/appendices/cmdlet-quick-index.md#get-wsmaninstance)：查詢WSMan資源；需核准端點、資源URI與讀取權限。
- [Import-Alias（匯入別名）](../../docs/appendices/cmdlet-quick-index.md#import-alias)：從檔案載入別名定義；先審查是否改變熟悉命令的解析。
- [Import-LocalizedData（匯入本地化資料）](../../docs/appendices/cmdlet-quick-index.md#import-localizeddata)：依文化設定載入本地化字串；業務資料格式不應跟著任意改變。
- [Import-PowerShellDataFile（匯入PowerShell資料檔）](../../docs/appendices/cmdlet-quick-index.md#import-powershelldatafile)：讀取受限制的資料檔表示；不能將任意腳本當資料直接執行。
- [Invoke-CimMethod（呼叫CIM方法）](../../docs/appendices/cmdlet-quick-index.md#invoke-cimmethod)：執行類別或實例方法；可能重啟或變更系統，需審查方法副作用。
- [Invoke-Command（呼叫指令區塊）](../../docs/appendices/cmdlet-quick-index.md#invoke-command)：可本機或遠端執行區塊；參數組、資料序列化與授權需分別確認。
- [Invoke-Expression（以文字執行程式）](../../docs/appendices/cmdlet-quick-index.md#invoke-expression)：將字串當PowerShell程式執行；不把不可信輸入直接傳入。
- [Invoke-History（執行歷程命令）](../../docs/appendices/cmdlet-quick-index.md#invoke-history)：重新執行歷程中的命令；會再次產生原命令的副作用。
- [Invoke-Item（以預設動作開啟項目）](../../docs/appendices/cmdlet-quick-index.md#invoke-item)：呼叫項目的預設動作；可能啟動程式，不作不可信檔案預覽器。
- [Invoke-WebRequest（呼叫網頁請求）](../../docs/appendices/cmdlet-quick-index.md#invoke-webrequest)：取得HTTP回應與內容；狀態、TLS與本文仍需按契約驗收。
- [Join-String（合併物件字串）](../../docs/appendices/cmdlet-quick-index.md#join-string)：將輸入組合成文字；引用與分隔不自動符合SQL或其他格式。
- [Move-ItemProperty（搬移項目屬性）](../../docs/appendices/cmdlet-quick-index.md#move-itemproperty)：搬移支援提供者屬性；來源與目的地都可能改變。
- [New-Alias（建立別名）](../../docs/appendices/cmdlet-quick-index.md#new-alias)：新增命令別名；正式腳本仍優先使用清楚的完整名稱。
- [New-CimInstance（建立CIM實例）](../../docs/appendices/cmdlet-quick-index.md#new-ciminstance)：建立適用管理實例；ClientOnly與實際寫入行為需分開理解。
- [New-Event（產生工作階段事件）](../../docs/appendices/cmdlet-quick-index.md#new-event)：將自訂事件加入工作階段事件佇列；不寫入Windows事件記錄。
- [New-FileCatalog（建立檔案目錄雜湊）](../../docs/appendices/cmdlet-quick-index.md#new-filecatalog)：為指定檔案集合建立目錄檔；建立本身不代表來源已簽署可信。
- [New-Guid（建立GUID）](../../docs/appendices/cmdlet-quick-index.md#new-guid)：產生識別碼；不可直接把一般識別碼當秘密或授權憑證。
- [New-Module（建立動態模組）](../../docs/appendices/cmdlet-quick-index.md#new-module)：在工作階段建立動態模組；定義區塊會執行，不是純資料載入。
- [New-ModuleManifest（建立模組資訊檔）](../../docs/appendices/cmdlet-quick-index.md#new-modulemanifest)：產生模組清單檔；確認路徑與相容性欄位，不自動保證模組安全。
- [New-Object（建立物件）](../../docs/appendices/cmdlet-quick-index.md#new-object)：建立.NET或適用平台的COM物件；型別建構可能產生副作用。
- [New-PSDrive（建立提供者磁碟）](../../docs/appendices/cmdlet-quick-index.md#new-psdrive)：建立工作階段磁碟對應；持久化與平台權限依提供者而異。
- [New-PSRoleCapabilityFile（建立角色能力檔）](../../docs/appendices/cmdlet-quick-index.md#new-psrolecapabilityfile)：產生JEA角色能力範本；不代表最小權限設計已驗收。
- [New-PSSession（建立遠端工作階段）](../../docs/appendices/cmdlet-quick-index.md#new-pssession)：建立可重用的遠端工作階段；需核准端點、傳輸與認證。
- [New-PSSessionConfigurationFile（建立端點設定檔）](../../docs/appendices/cmdlet-quick-index.md#new-pssessionconfigurationfile)：產生工作階段設定檔；允許命令與語言限制需安全審閱。
- [New-PSSessionOption（建立遠端選項）](../../docs/appendices/cmdlet-quick-index.md#new-pssessionoption)：建立工作階段選項物件；建立設定不證明連線成功，不用來降低驗證。
- [New-Service（建立服務）](../../docs/appendices/cmdlet-quick-index.md#new-service)：註冊Windows服務；執行檔、身分與啟動方式需安全審閱。
- [New-TemporaryFile（建立暫存檔）](../../docs/appendices/cmdlet-quick-index.md#new-temporaryfile)：在暫存位置建立空檔並回傳項目；使用後需明確清理。
- [New-Variable（建立變數）](../../docs/appendices/cmdlet-quick-index.md#new-variable)：建立指定名稱與範圍的變數；避免覆寫系統或共用設定名稱。
- [New-WSManSessionOption（建立WSMan選項）](../../docs/appendices/cmdlet-quick-index.md#new-wsmansessionoption)：建立WSMan連線選項；不以降低TLS或驗證處理連線失敗。
- [Protect-CmsMessage（保護CMS訊息）](../../docs/appendices/cmdlet-quick-index.md#protect-cmsmessage)：以收件者憑證加密訊息；確認用途與私密金鑰管理。
- [Register-ArgumentCompleter（註冊引數補全）](../../docs/appendices/cmdlet-quick-index.md#register-argumentcompleter)：為命令引數加入補全邏輯；補全區塊是會執行的程式。
- [Register-CimIndicationEvent（訂閱CIM事件）](../../docs/appendices/cmdlet-quick-index.md#register-cimindicationevent)：建立管理事件訂閱；需核准目標並清理訂閱與事件資料。
- [Register-EngineEvent（訂閱引擎事件）](../../docs/appendices/cmdlet-quick-index.md#register-engineevent)：註冊PowerShell引擎事件處理；處理區塊可能執行額外程式。
- [Register-ObjectEvent（訂閱物件事件）](../../docs/appendices/cmdlet-quick-index.md#register-objectevent)：訂閱.NET物件事件；需保留參照並清理訂閱與相關工作。
- [Remove-Alias（移除別名）](../../docs/appendices/cmdlet-quick-index.md#remove-alias)：移除指定別名；只影響對應範圍，不卸載原始命令。
- [Remove-CimInstance（移除CIM實例）](../../docs/appendices/cmdlet-quick-index.md#remove-ciminstance)：刪除管理實例；可能影響系統資源，不能當清理工作階段。
- [Remove-Event（移除事件佇列項目）](../../docs/appendices/cmdlet-quick-index.md#remove-event)：移除指定事件；不等於取消事件訂閱。
- [Remove-Job（移除背景工作紀錄）](../../docs/appendices/cmdlet-quick-index.md#remove-job)：移除指定工作物件；不刪除該工作已產生的實體檔案。
- [Remove-PSBreakpoint（移除中斷點）](../../docs/appendices/cmdlet-quick-index.md#remove-psbreakpoint)：刪除指定中斷點定義；不對所有工作階段盲目全選。
- [Remove-PSDrive（移除提供者磁碟）](../../docs/appendices/cmdlet-quick-index.md#remove-psdrive)：移除指定磁碟對應；不等於刪除底層資料。
- [Remove-PSReadLineKeyHandler（移除按鍵處理）](../../docs/appendices/cmdlet-quick-index.md#remove-psreadlinekeyhandler)：移除指定按鍵繫結；不等於卸載PSReadLine或清除歷程。
- [Remove-PSSession（移除遠端工作階段）](../../docs/appendices/cmdlet-quick-index.md#remove-pssession)：關閉指定工作階段並釋放資源；僅處理自己建立的參照。
- [Remove-Service（移除服務）](../../docs/appendices/cmdlet-quick-index.md#remove-service)：移除Windows服務註冊；不等於安全刪除執行檔或資料。
- [Remove-TypeData（移除延伸型別資料）](../../docs/appendices/cmdlet-quick-index.md#remove-typedata)：移除指定型別延伸資料；可能改變既有物件的呈現與成員。
- [Remove-Variable（移除變數）](../../docs/appendices/cmdlet-quick-index.md#remove-variable)：移除指定範圍的變數；不等於撤銷已外洩的秘密。
- [Rename-ItemProperty（重新命名項目屬性）](../../docs/appendices/cmdlet-quick-index.md#rename-itemproperty)：依提供者變更屬性名稱；應先盤點依賴此名稱的設定。
- [Resume-Service（繼續服務）](../../docs/appendices/cmdlet-quick-index.md#resume-service)：恢復已暫停且支援的服務；驗收服務與應用程式狀態。
- [Save-Help（保存離線說明）](../../docs/appendices/cmdlet-quick-index.md#save-help)：下載可供離線更新的說明內容；目標來源、語言與網路權限需核准。
- [Set-Acl（設定存取控制清單）](../../docs/appendices/cmdlet-quick-index.md#set-acl)：修改支援資源的ACL；可能使資料曝露或失去存取，需核准與備份。
- [Set-Alias（設定別名）](../../docs/appendices/cmdlet-quick-index.md#set-alias)：建立或更新別名對應；可能改變同名命令的解析結果。
- [Set-CimInstance（設定CIM實例）](../../docs/appendices/cmdlet-quick-index.md#set-ciminstance)：修改管理實例屬性；需要適當授權並說明影響範圍。
- [Set-Clipboard（設定剪貼簿）](../../docs/appendices/cmdlet-quick-index.md#set-clipboard)：寫入支援平台的剪貼簿；會覆蓋使用者目前內容。
- [Set-Item（設定項目）](../../docs/appendices/cmdlet-quick-index.md#set-item)：依提供者修改項目值；不能假設所有提供者具相同語意。
- [Set-MarkdownOption（設定Markdown顯示）](../../docs/appendices/cmdlet-quick-index.md#set-markdownoption)：修改Markdown呈現選項；只在適用主機與範圍驗證。
- [Set-PSBreakpoint（建立中斷點）](../../docs/appendices/cmdlet-quick-index.md#set-psbreakpoint)：設定行、命令或變數中斷點；可能改變互動執行流程。
- [Set-PSDebug（設定腳本偵錯）](../../docs/appendices/cmdlet-quick-index.md#set-psdebug)：控制追蹤、逐步與嚴格檢查；追蹤可能曝露程式與資料。
- [Set-PSReadLineKeyHandler（設定按鍵處理）](../../docs/appendices/cmdlet-quick-index.md#set-psreadlinekeyhandler)：變更PSReadLine按鍵繫結；區塊處理器會執行程式。
- [Set-PSReadLineOption（設定PSReadLine）](../../docs/appendices/cmdlet-quick-index.md#set-psreadlineoption)：調整互動編輯、預測與歷程選項；審查敏感歷程保存策略。
- [Set-Service（設定服務）](../../docs/appendices/cmdlet-quick-index.md#set-service)：變更Windows服務設定或狀態；不同參數有不同副作用。
- [Set-StrictMode（設定嚴格模式）](../../docs/appendices/cmdlet-quick-index.md#set-strictmode)：啟用範圍內的額外程式檢查；選定版本，不把Latest當固定契約。
- [Set-TraceSource（設定追蹤來源）](../../docs/appendices/cmdlet-quick-index.md#set-tracesource)：調整追蹤輸出與選項；限制範圍及日誌敏感內容。
- [Set-Variable（設定變數）](../../docs/appendices/cmdlet-quick-index.md#set-variable)：設定變數值與選項；先確認範圍，避免影響呼叫端。
- [Show-Markdown（顯示Markdown）](../../docs/appendices/cmdlet-quick-index.md#show-markdown)：依主機能力顯示Markdown內容；不代表已產生可攜文件。
- [Start-Service（啟動服務）](../../docs/appendices/cmdlet-quick-index.md#start-service)：啟動Windows服務；先確認服務名稱、相依與影響範圍。
- [Start-Sleep（暫停執行）](../../docs/appendices/cmdlet-quick-index.md#start-sleep)：暫停目前執行流程；不是服務重試、排程或健康驗收的替代品。
- [Start-Transcript（開始工作階段轉錄）](../../docs/appendices/cmdlet-quick-index.md#start-transcript)：記錄支援主機的互動內容；可能包含個資與秘密，不任意上傳。
- [Stop-Job（停止背景工作）](../../docs/appendices/cmdlet-quick-index.md#stop-job)：停止指定背景工作；不能回滾工作已造成的外部變更。
- [Stop-Service（停止服務）](../../docs/appendices/cmdlet-quick-index.md#stop-service)：停止Windows服務；可能影響使用者與相依服務，需核准。
- [Stop-Transcript（停止轉錄）](../../docs/appendices/cmdlet-quick-index.md#stop-transcript)：結束目前轉錄記錄；不自動刪除已保存的敏感內容。
- [Suspend-Service（暫停服務）](../../docs/appendices/cmdlet-quick-index.md#suspend-service)：暫停支援此能力的服務；不等於終止程序或任何服務都可暫停。
- [Test-FileCatalog（檢查檔案目錄雜湊）](../../docs/appendices/cmdlet-quick-index.md#test-filecatalog)：核對檔案與目錄摘要；不取代發布者簽章與來源審閱。
- [Test-Json（檢查JSON）](../../docs/appendices/cmdlet-quick-index.md#test-json)：檢查JSON及適用的結構描述；語法通過不等於業務資料正確。
- [Test-ModuleManifest（檢查模組資訊檔）](../../docs/appendices/cmdlet-quick-index.md#test-modulemanifest)：檢查模組清單及相關參照；通過不代表所有命令功能已測。
- [Test-PSSessionConfigurationFile（驗證端點設定檔）](../../docs/appendices/cmdlet-quick-index.md#test-pssessionconfigurationfile)：檢查工作階段設定檔有效性；不自動證明部署後權限符合需求。
- [Test-WSMan（測試WSMan服務）](../../docs/appendices/cmdlet-quick-index.md#test-wsman)：檢查目標WSMan回應；成功不代表可執行所有遠端命令。
- [Trace-Command（追蹤命令執行）](../../docs/appendices/cmdlet-quick-index.md#trace-command)：針對指定來源追蹤區塊；會實際執行命令並可能曝露資料。
- [Unprotect-CmsMessage（解除CMS保護）](../../docs/appendices/cmdlet-quick-index.md#unprotect-cmsmessage)：以適當私密金鑰解密訊息；輸出可能是敏感明文。
- [Unregister-Event（取消事件訂閱）](../../docs/appendices/cmdlet-quick-index.md#unregister-event)：取消指定訂閱；佇列中既有事件需另行處理。
- [Update-FormatData（載入格式定義）](../../docs/appendices/cmdlet-quick-index.md#update-formatdata)：將格式檔載入工作階段；先審閱來源，避免意外顯示或執行行為。
- [Update-Help（更新本機說明）](../../docs/appendices/cmdlet-quick-index.md#update-help)：更新模組說明檔；可能下載並寫入資料，不能當唯讀操作。
- [Update-TypeData（更新延伸型別資料）](../../docs/appendices/cmdlet-quick-index.md#update-typedata)：載入或定義延伸型別成員；可能改變工作階段物件行為。
- [Wait-Event（等待事件）](../../docs/appendices/cmdlet-quick-index.md#wait-event)：等待工作階段事件；需定義等待上限與取消策略。
- [Wait-Job（等待背景工作）](../../docs/appendices/cmdlet-quick-index.md#wait-job)：等待指定工作進入適當狀態；Timeout逾時不自動取消工作。
- [Write-Host（主機顯示）](../../docs/appendices/cmdlet-quick-index.md#write-host)：向主機呈現資訊；不當成函式成功資料的通用輸出方式。
- [Write-Progress（顯示進度）](../../docs/appendices/cmdlet-quick-index.md#write-progress)：向支援主機回報進度；進度完成不代表業務驗收成功。

[100項動詞參考](approved-verbs.md)包含保留例外，不能由Get-Verb出現就推定適合新命令命名。
