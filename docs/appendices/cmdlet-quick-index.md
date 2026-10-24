<a id="cmdlet-quick-index"></a>

# 命令速查索引

[返回目錄](../README.md)

本版29筆僅速查條目（另保留已升級Get-FileHash摘要供交叉參照），不計為十四項完整教學。各命令的用途、平台與版本分開記錄；Windows專用命令尚未實測。

<a id="new-item"></a>

## New-Item（建立項目）

在指定提供者建立檔案或資料夾；先確認 ItemType 與目標。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/New-Item.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="get-item"></a>

## Get-Item（取得項目）

讀取精確檔案或資料夾的中繼資料，不列出全部子項目。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Item.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="test-path"></a>

## Test-Path（檢查路徑）

檢查路徑存在與 Leaf／Container；不保證下一步存取成功。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Test-Path.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="join-path"></a>

## Join-Path（組合路徑）

依提供者組合父子路徑，不會建立檔案或驗證安全邊界。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Join-Path.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="copy-item"></a>

## Copy-Item（複製項目）

複製到目的地並保留來源；注意目的地類型與覆寫。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Copy-Item.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="move-item"></a>

## Move-Item（移動項目）

搬移項目，成功後原位置不再保留該項目。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Move-Item.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="rename-item"></a>

## Rename-Item（重新命名項目）

在原位置改名稱，不能用 NewName 跨目錄搬移。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Rename-Item.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="remove-item"></a>

## Remove-Item（移除項目）

刪除明確指定項目；先用 WhatIf 核對且不要假設可從回收筒還原。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Remove-Item.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="set-content"></a>

## Set-Content（設定內容）

以新文字取代檔案內容；和附加寫入不同。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-Content.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="add-content"></a>

## Add-Content（附加內容）

把文字加到檔案尾端，必須維持既有編碼。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/22-files-folders.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Add-Content.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="import-csv"></a>

## Import-Csv（匯入CSV）

由CSV建立欄位物件，數值欄位通常仍需驗證與轉型。

- 模組：Microsoft.PowerShell.Utility
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Import-Csv.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="convertto-json"></a>

## ConvertTo-Json（轉為JSON）

序列化巢狀資料，設定足夠Depth並驗收葉節點。

- 模組：Microsoft.PowerShell.Utility
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertTo-Json.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="select-xml"></a>

## Select-Xml（查詢XML）

以XPath查詢節點，命名空間需設定前綴對應。

- 模組：Microsoft.PowerShell.Utility
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Xml.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="expand-archive"></a>

## Expand-Archive（展開ZIP封存）

將ZIP還原到新位置，避免Force覆寫後再核對內容。

- 模組：Microsoft.PowerShell.Archive
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/25-archives-backup.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Archive/Expand-Archive.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="get-filehash-summary"></a>

## Get-FileHash（計算檔案雜湊）

以SHA256等演算法核對位元組內容，不單獨證明來源身分。

- 模組：Microsoft.PowerShell.Utility
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/25-archives-backup.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-FileHash.md)，查閱2026-10-24。
- 驗證範圍：官方使用段落與本機代表性行為；非所有參數組或平台已實測

<a id="start-process"></a>

## Start-Process（啟動處理程序）

啟動明確程式；PassThru回傳程序物件，Wait等待結束。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Start-Process.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="stop-process"></a>

## Stop-Process（停止處理程序）

以保存的程序物件終止自建練習子程序，避免廣泛名稱匹配。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows, Linux, macOS；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Stop-Process.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="wait-process"></a>

## Wait-Process（等待處理程序）

等待指定程序結束；官方文件明示不適用Linux或macOS。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Wait-Process.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="get-service"></a>

## Get-Service（取得Windows服務）

查服務名稱、狀態與相依性；Windows專用。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Service.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="restart-service"></a>

## Restart-Service（重新啟動Windows服務）

送出停止與啟動要求；停止的服務也可能被啟動，先核對影響。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Restart-Service.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="get-itempropertyvalue"></a>

## Get-ItemPropertyValue（取得指定屬性值）

取得值本身；Registry情境僅Windows，不把值當子路徑。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/27-windows-registry.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ItemPropertyValue.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="new-itemproperty"></a>

## New-ItemProperty（建立項目屬性）

建立指定型別的Registry值；限定自建HKCU練習範圍。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/27-windows-registry.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/New-ItemProperty.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="set-itemproperty"></a>

## Set-ItemProperty（設定項目屬性）

修改項目屬性；Registry要記錄原值與型別並核對權限。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/27-windows-registry.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-ItemProperty.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="remove-itemproperty"></a>

## Remove-ItemProperty（移除項目屬性）

刪除機碼內的指定值，不等於刪整個機碼。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/27-windows-registry.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Remove-ItemProperty.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="get-computerinfo"></a>

## Get-ComputerInfo（取得Windows系統資訊）

整合系統資訊，使用Property選擇必要欄位。

- 模組：Microsoft.PowerShell.Management
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/28-events-system-info.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ComputerInfo.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="resolve-dnsname"></a>

## Resolve-DnsName（解析DNS名稱）

Windows DNS查詢，區分紀錄型別、快取與實際解析。

- 模組：DnsClient
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/29-network-diagnostics.md)；[官方來源](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/DnsClient/Resolve-DnsName.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="test-netconnection"></a>

## Test-NetConnection（診斷網路連線）

Windows TCP與路由診斷，明確指定ComputerName及Port。

- 模組：NetTCPIP
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/29-network-diagnostics.md)；[官方來源](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/NetTCPIP/Test-NetConnection.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="new-cimsession"></a>

## New-CimSession（建立CIM工作階段）

本機預設DCOM，指定主機預設WSMan；連線需合法授權。

- 模組：CimCmdlets
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/30-cim-remote-management.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/New-CimSession.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="new-cimsessionoption"></a>

## New-CimSessionOption（建立CIM工作階段選項）

建立WSMan或DCOM選項，不代表已建立成功連線。

- 模組：CimCmdlets
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/30-cim-remote-management.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/New-CimSessionOption.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

<a id="remove-cimsession"></a>

## Remove-CimSession（移除CIM工作階段）

清理本機CIM工作階段物件，不刪除遠端主機資料。

- 模組：CimCmdlets
- 情境平台：Windows；命令實際提供者支援依官方文件
- 學習重要程度：4/5
- [對應章節](../chapters/30-cim-remote-management.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Remove-CimSession.md)，查閱2026-10-24。
- 驗證範圍：文件與語法查證；Windows功能未執行；Get-Process及自建子程序另有Linux實測，ICMP缺ping未完成

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
