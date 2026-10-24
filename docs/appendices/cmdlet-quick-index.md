<a id="cmdlet-quick-index"></a>

# 命令速查索引

[返回目錄](../README.md)

本版223筆僅速查條目（另保留已升級Get-FileHash摘要供交叉參照），不計為十四項完整教學。各命令的用途、平台與版本分開記錄；Windows專用命令尚未實測。

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

## 第39章新增速查條目

下列44筆僅完成用途、來源與限制查讀，非十四項詳解，未逐命令功能實測。

<a id="clear-content"></a>

## Clear-Content（清空內容）

保留檔案項目但清除內容；可能破壞資料，先備份並確認提供者。

模組：Microsoft.PowerShell.Management；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Clear-Content.md)，查閱2026-10-24。

<a id="get-date"></a>

## Get-Date（取得日期）

產生日期時間或格式字串；區分本機時間、UTC與固定格式。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Date.md)，查閱2026-10-24。

<a id="new-timespan"></a>

## New-TimeSpan（建立時間間隔）

由起迄時間或分量建立TimeSpan；總量與分量不同。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/New-TimeSpan.md)，查閱2026-10-24。

<a id="get-random"></a>

## Get-Random（取得隨機值）

抽樣或產生隨機數；不把一般隨機抽樣當秘密產生方案。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Random.md)，查閱2026-10-24。

<a id="get-unique"></a>

## Get-Unique（取得相鄰唯一值）

從已排序清單移除相鄰重複；先理解排序與比較規則。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Unique.md)，查閱2026-10-24。

<a id="group-object"></a>

## Group-Object（物件分組）

依屬性分組並取得數量；分組結果不是原始資料列。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Group-Object.md)，查閱2026-10-24。

<a id="measure-object"></a>

## Measure-Object（物件統計）

計算數量與數值摘要；缺值與型別需先驗證。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Measure-Object.md)，查閱2026-10-24。

<a id="compare-object"></a>

## Compare-Object（比較物件）

比較兩組資料的差異；順序與型別契約需額外驗收。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Compare-Object.md)，查閱2026-10-24。

<a id="foreach-object"></a>

## ForEach-Object（逐一處理物件）

依管線項目執行區塊；Parallel參數組需要PowerShell7。

模組：Microsoft.PowerShell.Core；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/ForEach-Object.md)，查閱2026-10-24。

<a id="add-member"></a>

## Add-Member（加入物件成員）

向物件加入延伸屬性等成員；不等於修改遠端管理實體。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Add-Member.md)，查閱2026-10-24。

<a id="tee-object"></a>

## Tee-Object（分流物件）

保存到檔案或變數並繼續輸出；檔案內容與編碼需確認。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Tee-Object.md)，查閱2026-10-24。

<a id="write-output"></a>

## Write-Output（輸出成功資料）

將物件寫入成功串流；不要混入操作日誌。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Write-Output.md)，查閱2026-10-24。

<a id="write-error"></a>

## Write-Error（輸出錯誤）

寫入錯誤串流；預設非終止行為需與ErrorAction一起理解。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Write-Error.md)，查閱2026-10-24。

<a id="write-warning"></a>

## Write-Warning（輸出警告）

寫入警告串流；警告不自動等於程序失敗。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Write-Warning.md)，查閱2026-10-24。

<a id="write-verbose"></a>

## Write-Verbose（輸出詳細訊息）

寫入詳細串流；由Verbose設定控制可見性，勿包含秘密。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Write-Verbose.md)，查閱2026-10-24。

<a id="write-debug"></a>

## Write-Debug（輸出偵錯訊息）

寫入偵錯串流；依Debug設定可能改變互動行為。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Write-Debug.md)，查閱2026-10-24。

<a id="write-information"></a>

## Write-Information（輸出資訊訊息）

寫入資訊串流並可附標籤；避免把資訊當業務結果。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Write-Information.md)，查閱2026-10-24。

<a id="out-string"></a>

## Out-String（轉成顯示字串）

將格式化結果轉成文字；不保留原始物件結構。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Out-String.md)，查閱2026-10-24。

<a id="out-file"></a>

## Out-File（輸出文字檔）

將格式化文字寫到檔案；檢查覆寫、編碼與Width。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Out-File.md)，查閱2026-10-24。

<a id="out-null"></a>

## Out-Null（捨棄成功輸出）

捨棄成功串流物件；不代表錯誤已處理。

模組：Microsoft.PowerShell.Core；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Out-Null.md)，查閱2026-10-24。

<a id="format-table"></a>

## Format-Table（表格顯示）

產生表格格式指令；不放在CSV資料匯出的前面。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Format-Table.md)，查閱2026-10-24。

<a id="format-list"></a>

## Format-List（清單顯示）

以清單格式顯示屬性；不是資料投影的替代品。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Format-List.md)，查閱2026-10-24。

<a id="format-wide"></a>

## Format-Wide（寬欄顯示）

以寬欄顯示選定屬性；適用畫面閱讀而非資料交換。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Format-Wide.md)，查閱2026-10-24。

<a id="convertto-csv"></a>

## ConvertTo-Csv（轉換CSV文字）

將物件轉為CSV字串；與Export-Csv直接寫檔不同。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertTo-Csv.md)，查閱2026-10-24。

<a id="convertfrom-csv"></a>

## ConvertFrom-Csv（解析CSV文字）

將CSV字串轉成物件；欄位值仍需按契約轉型。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-Csv.md)，查閱2026-10-24。

<a id="export-clixml"></a>

## Export-Clixml（匯出CLI XML）

以CLI XML格式序列化物件；憑證加密限Windows，非Windows不以此保護秘密。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-Clixml.md)，查閱2026-10-24。

<a id="import-clixml"></a>

## Import-Clixml（匯入CLI XML）

重建序列化資料；複雜型別不保證保有原始方法。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Import-Clixml.md)，查閱2026-10-24。

<a id="convertto-xml"></a>

## ConvertTo-Xml（轉成XML表示）

建立物件的XML表示；不等同任意業務XML結構。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertTo-Xml.md)，查閱2026-10-24。

<a id="get-culture"></a>

## Get-Culture（取得文化設定）

讀取目前文化資訊；數值與日期解析需明確契約。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Culture.md)，查閱2026-10-24。

<a id="get-uiculture"></a>

## Get-UICulture（取得介面文化）

讀取介面語言文化；與資料格式文化分開理解。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-UICulture.md)，查閱2026-10-24。

<a id="get-verb"></a>

## Get-Verb（取得核准動詞）

列出核准PowerShell動詞；名稱中的其他字不一定核准。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Verb.md)，查閱2026-10-24。

<a id="get-host"></a>

## Get-Host（取得主機資訊）

讀取PowerShell主機資訊；主機版本不等於所有模組版本。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Host.md)，查閱2026-10-24。

<a id="read-host"></a>

## Read-Host（讀取互動輸入）

從終端機讀取文字或安全字串；不適合直接放入無人值守排程。

模組：Microsoft.PowerShell.Utility；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Read-Host.md)，查閱2026-10-24。

<a id="get-psdrive"></a>

## Get-PSDrive（取得磁碟對應）

列出目前工作階段的提供者磁碟；不限實體磁碟。

模組：Microsoft.PowerShell.Management；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-PSDrive.md)，查閱2026-10-24。

<a id="get-psprovider"></a>

## Get-PSProvider（取得提供者）

列出提供者能力；命令存在不代表Registry提供者存在。

模組：Microsoft.PowerShell.Management；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-PSProvider.md)，查閱2026-10-24。

<a id="push-location"></a>

## Push-Location（推入位置堆疊）

保存目前位置並切換；搭配Pop-Location與finally恢復。

模組：Microsoft.PowerShell.Management；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Push-Location.md)，查閱2026-10-24。

<a id="pop-location"></a>

## Pop-Location（彈出位置堆疊）

回到先前保存的位置；確認使用的堆疊與作用範圍。

模組：Microsoft.PowerShell.Management；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Pop-Location.md)，查閱2026-10-24。

<a id="resolve-path"></a>

## Resolve-Path（解析存在路徑）

將存在的提供者路徑解析為完整形式；不是任意目標的安全驗證器。

模組：Microsoft.PowerShell.Management；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Resolve-Path.md)，查閱2026-10-24。

<a id="split-path"></a>

## Split-Path（拆分路徑）

取得父路徑、葉節點等部分；不等於驗證檔案存在。

模組：Microsoft.PowerShell.Management；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Split-Path.md)，查閱2026-10-24。

<a id="get-module"></a>

## Get-Module（取得模組資訊）

區分已載入與ListAvailable可用模組；不等於命令已測。

模組：Microsoft.PowerShell.Core；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Module.md)，查閱2026-10-24。

<a id="import-module"></a>

## Import-Module（匯入模組）

把模組命令載入工作階段；可能執行模組初始化程式。

模組：Microsoft.PowerShell.Core；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Import-Module.md)，查閱2026-10-24。

<a id="remove-module"></a>

## Remove-Module（移除已載入模組）

從工作階段移除模組；不卸載磁碟上的套件。

模組：Microsoft.PowerShell.Core；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Remove-Module.md)，查閱2026-10-24。

<a id="get-job"></a>

## Get-Job（取得工作）

查詢目前工作階段背景工作；不代表全系統排程。

模組：Microsoft.PowerShell.Core；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Job.md)，查閱2026-10-24。

<a id="receive-job"></a>

## Receive-Job（接收工作結果）

接收彙總串流；需要重讀時使用Keep或先存變數。

模組：Microsoft.PowerShell.Core；基準：PowerShell7.6文件，實際提供者／服務／權限仍需驗證。[查詢與驗證方法](../chapters/39-command-index.md)；[官方文件](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Receive-Job.md)，查閱2026-10-24。

<!-- reviewed-v06-commands -->

## v0.6新增速查

本節150筆為用途與限制查讀，未逐命令功能實測；查不到的命令與Windows能力另行記錄。

<a id="get-history"></a>

## Get-History（取得工作階段歷程）

讀取目前工作階段命令紀錄；可能含敏感引數，不能任意公開。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-History.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="add-history"></a>

## Add-History（加入歷程紀錄）

把歷程資料加入工作階段；不會執行其中命令。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Add-History.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="clear-history"></a>

## Clear-History（清除工作階段歷程）

清除指定記憶體歷程；不等於清除PSReadLine持久歷程或秘密暴露。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Clear-History.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="invoke-history"></a>

## Invoke-History（執行歷程命令）

重新執行歷程中的命令；會再次產生原命令的副作用。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Invoke-History.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="clear-host"></a>

## Clear-Host（清除主機畫面）

要求主機清理畫面；不刪除日誌、歷程或敏感資料副本。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Clear-Host.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-experimentalfeature"></a>

## Get-ExperimentalFeature（取得實驗功能）

列出實驗功能及啟用狀態；不代表穩定介面或跨版本相容。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-ExperimentalFeature.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-pshostprocessinfo"></a>

## Get-PSHostProcessInfo（取得主機程序資訊）

列出可辨識的PowerShell主機程序；偵錯附加仍需適當權限。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-PSHostProcessInfo.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-pssession"></a>

## Get-PSSession（取得遠端工作階段）

查詢PSSession物件；連線狀態不等於所有遠端命令已授權。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-PSSession.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-pssession"></a>

## New-PSSession（建立遠端工作階段）

建立可重用的遠端工作階段；需核准端點、傳輸與認證。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/New-PSSession.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="enter-pssession"></a>

## Enter-PSSession（進入互動遠端工作階段）

開始互動遠端操作；不適合當成批次腳本的通用執行方式。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Enter-PSSession.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="exit-pssession"></a>

## Exit-PSSession（離開互動遠端工作階段）

結束互動遠端情境；與刪除持久工作階段的責任不同。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Exit-PSSession.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-pssession"></a>

## Remove-PSSession（移除遠端工作階段）

關閉指定工作階段並釋放資源；僅處理自己建立的參照。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Remove-PSSession.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="invoke-command"></a>

## Invoke-Command（呼叫指令區塊）

可本機或遠端執行區塊；參數組、資料序列化與授權需分別確認。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Invoke-Command.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-pssessionoption"></a>

## New-PSSessionOption（建立遠端選項）

建立工作階段選項物件；建立設定不證明連線成功，不用來降低驗證。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/New-PSSessionOption.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-module"></a>

## New-Module（建立動態模組）

在工作階段建立動態模組；定義區塊會執行，不是純資料載入。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/New-Module.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-modulemanifest"></a>

## New-ModuleManifest（建立模組資訊檔）

產生模組清單檔；確認路徑與相容性欄位，不自動保證模組安全。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/New-ModuleManifest.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="test-modulemanifest"></a>

## Test-ModuleManifest（檢查模組資訊檔）

檢查模組清單及相關參照；通過不代表所有命令功能已測。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Test-ModuleManifest.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="export-modulemember"></a>

## Export-ModuleMember（指定模組匯出成員）

控制模組提供的函式與別名等成員；不等同寫入模組套件。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Export-ModuleMember.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="save-help"></a>

## Save-Help（保存離線說明）

下載可供離線更新的說明內容；目標來源、語言與網路權限需核准。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Save-Help.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="update-help"></a>

## Update-Help（更新本機說明）

更新模組說明檔；可能下載並寫入資料，不能當唯讀操作。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Update-Help.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-strictmode"></a>

## Set-StrictMode（設定嚴格模式）

啟用範圍內的額外程式檢查；選定版本，不把Latest當固定契約。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Set-StrictMode.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-psdebug"></a>

## Set-PSDebug（設定腳本偵錯）

控制追蹤、逐步與嚴格檢查；追蹤可能曝露程式與資料。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Set-PSDebug.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="wait-job"></a>

## Wait-Job（等待背景工作）

等待指定工作進入適當狀態；Timeout逾時不自動取消工作。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Wait-Job.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="stop-job"></a>

## Stop-Job（停止背景工作）

停止指定背景工作；不能回滾工作已造成的外部變更。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Stop-Job.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-job"></a>

## Remove-Job（移除背景工作紀錄）

移除指定工作物件；不刪除該工作已產生的實體檔案。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Remove-Job.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="debug-job"></a>

## Debug-Job（偵錯背景工作）

進入支援的工作偵錯情境；依工作類型與互動主機能力驗證。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Debug-Job.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="register-argumentcompleter"></a>

## Register-ArgumentCompleter（註冊引數補全）

為命令引數加入補全邏輯；補全區塊是會執行的程式。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Register-ArgumentCompleter.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-pssessionconfiguration"></a>

## Get-PSSessionConfiguration（取得端點設定）

查詢遠端處理端點設定；Windows與WSMan條件需另外確認。

模組：Microsoft.PowerShell.Core。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-PSSessionConfiguration.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="test-pssessionconfigurationfile"></a>

## Test-PSSessionConfigurationFile（驗證端點設定檔）

檢查工作階段設定檔有效性；不自動證明部署後權限符合需求。

模組：Microsoft.PowerShell.Core。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Test-PSSessionConfigurationFile.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-pssessionconfigurationfile"></a>

## New-PSSessionConfigurationFile（建立端點設定檔）

產生工作階段設定檔；允許命令與語言限制需安全審閱。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/New-PSSessionConfigurationFile.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-psrolecapabilityfile"></a>

## New-PSRoleCapabilityFile（建立角色能力檔）

產生JEA角色能力範本；不代表最小權限設計已驗收。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/New-PSRoleCapabilityFile.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-error"></a>

## Get-Error（取得詳細錯誤）

顯示最近或指定錯誤的詳細資料；分享前去除權杖與個資。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Error.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-variable"></a>

## Get-Variable（取得變數）

讀取範圍內的變數與值；可能包含秘密，不列印整個環境。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Variable.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-variable"></a>

## New-Variable（建立變數）

建立指定名稱與範圍的變數；避免覆寫系統或共用設定名稱。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/New-Variable.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-variable"></a>

## Set-Variable（設定變數）

設定變數值與選項；先確認範圍，避免影響呼叫端。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Set-Variable.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="clear-variable"></a>

## Clear-Variable（清空變數值）

保留變數但清除值；不證明所有秘密記憶體副本已抹除。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Clear-Variable.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-variable"></a>

## Remove-Variable（移除變數）

移除指定範圍的變數；不等於撤銷已外洩的秘密。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Remove-Variable.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-alias"></a>

## New-Alias（建立別名）

新增命令別名；正式腳本仍優先使用清楚的完整名稱。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/New-Alias.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-alias"></a>

## Set-Alias（設定別名）

建立或更新別名對應；可能改變同名命令的解析結果。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Set-Alias.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-alias"></a>

## Remove-Alias（移除別名）

移除指定別名；只影響對應範圍，不卸載原始命令。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Remove-Alias.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="export-alias"></a>

## Export-Alias（匯出別名）

將別名定義保存到檔案；確認輸出格式、路徑與覆寫行為。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-Alias.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="import-alias"></a>

## Import-Alias（匯入別名）

從檔案載入別名定義；先審查是否改變熟悉命令的解析。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Import-Alias.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-formatdata"></a>

## Get-FormatData（取得格式定義）

查詢工作階段中的顯示格式資訊；不是讀取業務資料列。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-FormatData.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="export-formatdata"></a>

## Export-FormatData（匯出格式定義）

保存格式定義供其他情境使用；格式與原始資料分開管理。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-FormatData.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="update-formatdata"></a>

## Update-FormatData（載入格式定義）

將格式檔載入工作階段；先審閱來源，避免意外顯示或執行行為。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Update-FormatData.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-typedata"></a>

## Get-TypeData（取得延伸型別資料）

讀取PowerShell延伸型別定義；不同於物件當下的每個值。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-TypeData.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="update-typedata"></a>

## Update-TypeData（更新延伸型別資料）

載入或定義延伸型別成員；可能改變工作階段物件行為。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Update-TypeData.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-typedata"></a>

## Remove-TypeData（移除延伸型別資料）

移除指定型別延伸資料；可能改變既有物件的呈現與成員。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Remove-TypeData.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-object"></a>

## New-Object（建立物件）

建立.NET或適用平台的COM物件；型別建構可能產生副作用。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/New-Object.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="add-type"></a>

## Add-Type（加入型別）

編譯或載入.NET型別；來源程式與組件必須可信。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Add-Type.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-guid"></a>

## New-Guid（建立GUID）

產生識別碼；不可直接把一般識別碼當秘密或授權憑證。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/New-Guid.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-temporaryfile"></a>

## New-TemporaryFile（建立暫存檔）

在暫存位置建立空檔並回傳項目；使用後需明確清理。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/New-TemporaryFile.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-securerandom"></a>

## Get-SecureRandom（取得安全隨機值）

使用適合安全用途的隨機來源；輸出長度與秘密格式仍需設計。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-SecureRandom.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="start-sleep"></a>

## Start-Sleep（暫停執行）

暫停目前執行流程；不是服務重試、排程或健康驗收的替代品。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Start-Sleep.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-uptime"></a>

## Get-Uptime（取得系統運作時間）

查詢自開機經過時間或開機時間；不代表應用程式可用性。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Uptime.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="invoke-webrequest"></a>

## Invoke-WebRequest（呼叫網頁請求）

取得HTTP回應與內容；狀態、TLS與本文仍需按契約驗收。

模組：Microsoft.PowerShell.Utility。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Invoke-WebRequest.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="invoke-expression"></a>

## Invoke-Expression（以文字執行程式）

將字串當PowerShell程式執行；不把不可信輸入直接傳入。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Invoke-Expression.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="test-json"></a>

## Test-Json（檢查JSON）

檢查JSON及適用的結構描述；語法通過不等於業務資料正確。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Test-Json.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="join-string"></a>

## Join-String（合併物件字串）

將輸入組合成文字；引用與分隔不自動符合SQL或其他格式。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Join-String.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="convertto-html"></a>

## ConvertTo-Html（轉換HTML）

將物件轉成HTML表示；不直接當任意外來HTML的安全清理器。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertTo-Html.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="convertfrom-stringdata"></a>

## ConvertFrom-StringData（解析文字鍵值對）

將鍵值文字轉為雜湊表；先確認分隔與字元逸出規則。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-StringData.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="convertfrom-markdown"></a>

## ConvertFrom-Markdown（轉換Markdown）

將Markdown轉成HTML或終端機呈現；來源與呈現端安全需分開評估。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-Markdown.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="show-markdown"></a>

## Show-Markdown（顯示Markdown）

依主機能力顯示Markdown內容；不代表已產生可攜文件。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Show-Markdown.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-markdownoption"></a>

## Get-MarkdownOption（取得Markdown顯示選項）

讀取Markdown終端機呈現設定；不同於文件內容本身。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-MarkdownOption.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-markdownoption"></a>

## Set-MarkdownOption（設定Markdown顯示）

修改Markdown呈現選項；只在適用主機與範圍驗證。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Set-MarkdownOption.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="format-hex"></a>

## Format-Hex（十六進位顯示）

檢查檔案或資料的位元組；與文字編碼後的畫面顯示不同。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Format-Hex.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="format-custom"></a>

## Format-Custom（自訂格式顯示）

依自訂視圖顯示物件；不要將格式物件當原始資料匯出。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Format-Custom.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="write-host"></a>

## Write-Host（主機顯示）

向主機呈現資訊；不當成函式成功資料的通用輸出方式。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Write-Host.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="write-progress"></a>

## Write-Progress（顯示進度）

向支援主機回報進度；進度完成不代表業務驗收成功。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Write-Progress.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="import-powershelldatafile"></a>

## Import-PowerShellDataFile（匯入PowerShell資料檔）

讀取受限制的資料檔表示；不能將任意腳本當資料直接執行。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Import-PowerShellDataFile.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="import-localizeddata"></a>

## Import-LocalizedData（匯入本地化資料）

依文化設定載入本地化字串；業務資料格式不應跟著任意改變。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Import-LocalizedData.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-event"></a>

## Get-Event（取得事件佇列項目）

讀取目前工作階段事件；不是Windows事件記錄查詢。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Event.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-event"></a>

## New-Event（產生工作階段事件）

將自訂事件加入工作階段事件佇列；不寫入Windows事件記錄。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/New-Event.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-event"></a>

## Remove-Event（移除事件佇列項目）

移除指定事件；不等於取消事件訂閱。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Remove-Event.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="wait-event"></a>

## Wait-Event（等待事件）

等待工作階段事件；需定義等待上限與取消策略。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Wait-Event.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-eventsubscriber"></a>

## Get-EventSubscriber（取得事件訂閱）

列出目前工作階段訂閱；與佇列中已產生事件不同。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-EventSubscriber.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="register-engineevent"></a>

## Register-EngineEvent（訂閱引擎事件）

註冊PowerShell引擎事件處理；處理區塊可能執行額外程式。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Register-EngineEvent.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="register-objectevent"></a>

## Register-ObjectEvent（訂閱物件事件）

訂閱.NET物件事件；需保留參照並清理訂閱與相關工作。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Register-ObjectEvent.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="unregister-event"></a>

## Unregister-Event（取消事件訂閱）

取消指定訂閱；佇列中既有事件需另行處理。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Unregister-Event.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-psbreakpoint"></a>

## Get-PSBreakpoint（取得中斷點）

列出工作階段中斷點；不代表偵錯目標目前停在該位置。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-PSBreakpoint.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-psbreakpoint"></a>

## Set-PSBreakpoint（建立中斷點）

設定行、命令或變數中斷點；可能改變互動執行流程。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Set-PSBreakpoint.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="enable-psbreakpoint"></a>

## Enable-PSBreakpoint（啟用中斷點）

啟用既有中斷點；確認作用的腳本與工作階段。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Enable-PSBreakpoint.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="disable-psbreakpoint"></a>

## Disable-PSBreakpoint（停用中斷點）

暫停既有中斷點；保留定義，與移除不同。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Disable-PSBreakpoint.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-psbreakpoint"></a>

## Remove-PSBreakpoint（移除中斷點）

刪除指定中斷點定義；不對所有工作階段盲目全選。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Remove-PSBreakpoint.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-pscallstack"></a>

## Get-PSCallStack（取得呼叫堆疊）

檢查函式與腳本呼叫位置；可能包含路徑與引數資訊。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-PSCallStack.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-runspace"></a>

## Get-Runspace（取得執行空間）

列出目前可見執行空間；存取與偵錯需符合主機能力。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Runspace.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-tracesource"></a>

## Get-TraceSource（取得追蹤來源）

查詢PowerShell追蹤來源；不直接啟動產品服務追蹤。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-TraceSource.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="trace-command"></a>

## Trace-Command（追蹤命令執行）

針對指定來源追蹤區塊；會實際執行命令並可能曝露資料。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Trace-Command.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-tracesource"></a>

## Set-TraceSource（設定追蹤來源）

調整追蹤輸出與選項；限制範圍及日誌敏感內容。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Set-TraceSource.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="start-transcript"></a>

## Start-Transcript（開始工作階段轉錄）

記錄支援主機的互動內容；可能包含個資與秘密，不任意上傳。

模組：Microsoft.PowerShell.Host。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Host/Start-Transcript.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="stop-transcript"></a>

## Stop-Transcript（停止轉錄）

結束目前轉錄記錄；不自動刪除已保存的敏感內容。

模組：Microsoft.PowerShell.Host。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Host/Stop-Transcript.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="convert-path"></a>

## Convert-Path（轉換提供者路徑）

將存在的提供者路徑轉成提供者原生表示；不等同Resolve-Path所有功能。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Convert-Path.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-psdrive"></a>

## New-PSDrive（建立提供者磁碟）

建立工作階段磁碟對應；持久化與平台權限依提供者而異。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/New-PSDrive.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-psdrive"></a>

## Remove-PSDrive（移除提供者磁碟）

移除指定磁碟對應；不等於刪除底層資料。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Remove-PSDrive.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-timezone"></a>

## Get-TimeZone（取得時區）

查詢Windows時區資訊；本機命令可被找到不代表官方已支援Linux功能。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-TimeZone.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-clipboard"></a>

## Get-Clipboard（取得剪貼簿）

讀取支援平台的剪貼簿；可能含秘密，服務環境不保證可用。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Clipboard.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-clipboard"></a>

## Set-Clipboard（設定剪貼簿）

寫入支援平台的剪貼簿；會覆蓋使用者目前內容。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-Clipboard.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="invoke-item"></a>

## Invoke-Item（以預設動作開啟項目）

呼叫項目的預設動作；可能啟動程式，不作不可信檔案預覽器。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Invoke-Item.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-executionpolicy"></a>

## Get-ExecutionPolicy（取得執行原則）

查詢有效或各範圍原則；非Windows與Windows語意不同。

模組：Microsoft.PowerShell.Security。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Get-ExecutionPolicy.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-authenticodesignature"></a>

## Get-AuthenticodeSignature（取得Authenticode簽章）

檢查支援平台的檔案簽章；有效簽章不等於程式無漏洞。

模組：Microsoft.PowerShell.Security。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Get-AuthenticodeSignature.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-credential"></a>

## Get-Credential（取得認證物件）

以支援的提示流程建立PSCredential；不代表已向服務驗證成功。

模組：Microsoft.PowerShell.Security。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Get-Credential.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="convertto-securestring"></a>

## ConvertTo-SecureString（轉成安全字串）

建立SecureString；不能保護已硬編碼的秘密，非Windows保障不同。

模組：Microsoft.PowerShell.Security。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/ConvertTo-SecureString.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="convertfrom-securestring"></a>

## ConvertFrom-SecureString（輸出安全字串表示）

將SecureString轉成可保存表示；金鑰、平台與明文選項需審查。

模組：Microsoft.PowerShell.Security。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/ConvertFrom-SecureString.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-acl"></a>

## Get-Acl（取得存取控制清單）

讀取支援平台資源ACL；檔案與Registry等提供者條件不同。

模組：Microsoft.PowerShell.Security。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Get-Acl.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-acl"></a>

## Set-Acl（設定存取控制清單）

修改支援資源的ACL；可能使資料曝露或失去存取，需核准與備份。

模組：Microsoft.PowerShell.Security。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Set-Acl.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-cmsmessage"></a>

## Get-CmsMessage（讀取CMS訊息資訊）

檢查CMS封裝訊息資訊；不等於取得受保護內容或私密金鑰。

模組：Microsoft.PowerShell.Security。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Get-CmsMessage.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="protect-cmsmessage"></a>

## Protect-CmsMessage（保護CMS訊息）

以收件者憑證加密訊息；確認用途與私密金鑰管理。

模組：Microsoft.PowerShell.Security。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Protect-CmsMessage.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="unprotect-cmsmessage"></a>

## Unprotect-CmsMessage（解除CMS保護）

以適當私密金鑰解密訊息；輸出可能是敏感明文。

模組：Microsoft.PowerShell.Security。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Unprotect-CmsMessage.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-pfxcertificate"></a>

## Get-PfxCertificate（讀取PFX憑證）

載入憑證資料；注意私密金鑰與密碼，不記錄秘密內容。

模組：Microsoft.PowerShell.Security。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Get-PfxCertificate.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-filecatalog"></a>

## New-FileCatalog（建立檔案目錄雜湊）

為指定檔案集合建立目錄檔；建立本身不代表來源已簽署可信。

模組：Microsoft.PowerShell.Security。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/New-FileCatalog.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="test-filecatalog"></a>

## Test-FileCatalog（檢查檔案目錄雜湊）

核對檔案與目錄摘要；不取代發布者簽章與來源審閱。

模組：Microsoft.PowerShell.Security。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/Test-FileCatalog.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-cimsession"></a>

## Get-CimSession（取得CIM工作階段）

取得目前CIM工作階段物件；不等於新建連線或查詢成功。

模組：CimCmdlets。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Get-CimSession.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-cimclass"></a>

## Get-CimClass（取得CIM類別）

查詢管理類別中繼資料；類別存在不代表每個方法都已授權。

模組：CimCmdlets。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Get-CimClass.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-cimassociatedinstance"></a>

## Get-CimAssociatedInstance（取得關聯CIM實例）

依關聯查詢管理實例；限制類別與目標避免過量盤點。

模組：CimCmdlets。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Get-CimAssociatedInstance.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="invoke-cimmethod"></a>

## Invoke-CimMethod（呼叫CIM方法）

執行類別或實例方法；可能重啟或變更系統，需審查方法副作用。

模組：CimCmdlets。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Invoke-CimMethod.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-ciminstance"></a>

## New-CimInstance（建立CIM實例）

建立適用管理實例；ClientOnly與實際寫入行為需分開理解。

模組：CimCmdlets。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/New-CimInstance.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-ciminstance"></a>

## Set-CimInstance（設定CIM實例）

修改管理實例屬性；需要適當授權並說明影響範圍。

模組：CimCmdlets。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Set-CimInstance.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-ciminstance"></a>

## Remove-CimInstance（移除CIM實例）

刪除管理實例；可能影響系統資源，不能當清理工作階段。

模組：CimCmdlets。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Remove-CimInstance.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="register-cimindicationevent"></a>

## Register-CimIndicationEvent（訂閱CIM事件）

建立管理事件訂閱；需核准目標並清理訂閱與事件資料。

模組：CimCmdlets。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Register-CimIndicationEvent.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-counter"></a>

## Get-Counter（取得效能計數器）

查詢Windows效能計數器；取樣區間與權限會影響結果。

模組：Microsoft.PowerShell.Diagnostics。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Diagnostics/Get-Counter.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-hotfix"></a>

## Get-HotFix（取得Windows修正資訊）

查詢支援的已安裝修正資訊；不等於完整軟體更新盤點。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-HotFix.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="start-service"></a>

## Start-Service（啟動服務）

啟動Windows服務；先確認服務名稱、相依與影響範圍。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Start-Service.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="stop-service"></a>

## Stop-Service（停止服務）

停止Windows服務；可能影響使用者與相依服務，需核准。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Stop-Service.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-service"></a>

## Set-Service（設定服務）

變更Windows服務設定或狀態；不同參數有不同副作用。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-Service.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="suspend-service"></a>

## Suspend-Service（暫停服務）

暫停支援此能力的服務；不等於終止程序或任何服務都可暫停。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Suspend-Service.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="resume-service"></a>

## Resume-Service（繼續服務）

恢復已暫停且支援的服務；驗收服務與應用程式狀態。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Resume-Service.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-service"></a>

## New-Service（建立服務）

註冊Windows服務；執行檔、身分與啟動方式需安全審閱。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/New-Service.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-service"></a>

## Remove-Service（移除服務）

移除Windows服務註冊；不等於安全刪除執行檔或資料。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Remove-Service.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="clear-item"></a>

## Clear-Item（清空項目）

依提供者清除項目內容；不同於移除項目，仍可能破壞資料。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Clear-Item.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-item"></a>

## Set-Item（設定項目）

依提供者修改項目值；不能假設所有提供者具相同語意。

模組：Microsoft.PowerShell.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-Item.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="clear-itemproperty"></a>

## Clear-ItemProperty（清空項目屬性）

清除支援提供者的屬性值；不同於移除屬性。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Clear-ItemProperty.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="copy-itemproperty"></a>

## Copy-ItemProperty（複製項目屬性）

複製支援提供者的屬性；確認目的地與覆寫條件。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Copy-ItemProperty.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="move-itemproperty"></a>

## Move-ItemProperty（搬移項目屬性）

搬移支援提供者屬性；來源與目的地都可能改變。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Move-ItemProperty.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="rename-itemproperty"></a>

## Rename-ItemProperty（重新命名項目屬性）

依提供者變更屬性名稱；應先盤點依賴此名稱的設定。

模組：Microsoft.PowerShell.Management。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Rename-ItemProperty.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-psreadlineoption"></a>

## Get-PSReadLineOption（取得PSReadLine選項）

讀取互動編輯與歷程設定；不代表非互動工作階段已載入模組。

模組：PSReadLine。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/PSReadLine/Get-PSReadLineOption.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-psreadlinekeyhandler"></a>

## Get-PSReadLineKeyHandler（取得按鍵處理）

檢視PSReadLine按鍵繫結；模式與終端機可能影響實際行為。

模組：PSReadLine。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/PSReadLine/Get-PSReadLineKeyHandler.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-psreadlineoption"></a>

## Set-PSReadLineOption（設定PSReadLine）

調整互動編輯、預測與歷程選項；審查敏感歷程保存策略。

模組：PSReadLine。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/PSReadLine/Set-PSReadLineOption.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="set-psreadlinekeyhandler"></a>

## Set-PSReadLineKeyHandler（設定按鍵處理）

變更PSReadLine按鍵繫結；區塊處理器會執行程式。

模組：PSReadLine。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/PSReadLine/Set-PSReadLineKeyHandler.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="remove-psreadlinekeyhandler"></a>

## Remove-PSReadLineKeyHandler（移除按鍵處理）

移除指定按鍵繫結；不等於卸載PSReadLine或清除歷程。

模組：PSReadLine。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/PSReadLine/Remove-PSReadLineKeyHandler.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="test-wsman"></a>

## Test-WSMan（測試WSMan服務）

檢查目標WSMan回應；成功不代表可執行所有遠端命令。

模組：Microsoft.WSMan.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.WSMan.Management/Test-WSMan.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="new-wsmansessionoption"></a>

## New-WSManSessionOption（建立WSMan選項）

建立WSMan連線選項；不以降低TLS或驗證處理連線失敗。

模組：Microsoft.WSMan.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.WSMan.Management/New-WSManSessionOption.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-wsmaninstance"></a>

## Get-WSManInstance（取得WSMan實例）

查詢WSMan資源；需核准端點、資源URI與讀取權限。

模組：Microsoft.WSMan.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.WSMan.Management/Get-WSManInstance.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="connect-wsman"></a>

## Connect-WSMan（連接WSMan管理）

建立WSMan提供者可使用的連接；不是通用PSSession替代品。

模組：Microsoft.WSMan.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.WSMan.Management/Connect-WSMan.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="disconnect-wsman"></a>

## Disconnect-WSMan（中斷WSMan連接）

移除WSMan管理連接；不等於撤銷遠端帳戶權限。

模組：Microsoft.WSMan.Management。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.WSMan.Management/Disconnect-WSMan.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="get-pssessioncapability"></a>

## Get-PSSessionCapability（取得端點使用者能力）

檢查指定使用者在遠端端點可見能力；需核准端點與身分。

模組：Microsoft.PowerShell.Core。平台：Windows。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-PSSessionCapability.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="enter-pshostprocess"></a>

## Enter-PSHostProcess（進入PowerShell主機程序）

連接另一個支援的本機PowerShell程序；偵錯附加可能影響目標。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Enter-PSHostProcess.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="exit-pshostprocess"></a>

## Exit-PSHostProcess（離開主機程序偵錯）

離開以Enter-PSHostProcess進入的情境；不等於終止目標程序。

模組：Microsoft.PowerShell.Core。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Exit-PSHostProcess.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="debug-runspace"></a>

## Debug-Runspace（偵錯執行空間）

附加至適當執行空間進行互動偵錯；不在正式負載任意使用。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Debug-Runspace.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="enable-runspacedebug"></a>

## Enable-RunspaceDebug（啟用執行空間偵錯）

開啟指定執行空間的偵錯能力；限制作用範圍與附加權限。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Enable-RunspaceDebug.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。

<a id="disable-runspacedebug"></a>

## Disable-RunspaceDebug（停用執行空間偵錯）

停用執行空間偵錯並釋放待附加的偵錯停止；可能改變目標執行狀態。

模組：Microsoft.PowerShell.Utility。平台：Windows、Linux、macOS。版本：PowerShell7.6文件；本機中繼資料7.6.8。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Disable-RunspaceDebug.md)。查閱2026-10-24；本機命令發現不等於服務、權限或功能已通過。
