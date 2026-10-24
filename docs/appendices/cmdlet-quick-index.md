<a id="cmdlet-quick-index"></a>

# 命令速查索引

[返回目錄](../README.md)

本版73筆僅速查條目（另保留已升級Get-FileHash摘要供交叉參照），不計為十四項完整教學。各命令的用途、平台與版本分開記錄；Windows專用命令尚未實測。

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
