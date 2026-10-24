<a id="glossary"></a>

# 中英文術語表

[返回目錄](../README.md)

依英文排序；HTML 搜尋可輸入中文或英文。條目列出情境、相關命令與來源，對照版本限制請讀對應章節。

<a id="term-alias"></a>

## Alias（別名）

指向命令的名稱捷徑，不能直接附帶固定參數。

情境：第 7 章的觀念與案例。相關命令：Get-Command, Get-Alias。[對應章節](../../docs/chapters/07-commands-aliases.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Command_Precedence.md)。

<a id="term-archive"></a>

## Archive（封存檔）

把多個項目放進容器，可能壓縮；不等同完整可還原備份。

情境：第 25 章的資料處理與驗證。相關命令：Compress-Archive, Expand-Archive。[對應章節](../../docs/chapters/25-archives-backup.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Archive/Compress-Archive.md)。

<a id="term-argument"></a>

## Argument（引數）

實際傳入參數的值，不等同參數名稱。

情境：第 6 章的觀念與案例。相關命令：Get-Help。[對應章節](../../docs/chapters/06-help-system.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)。

<a id="term-array"></a>

## Array（陣列）

按索引存放多項資料，索引由零開始。

情境：第 12 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/12-collections.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Arrays.md)。

<a id="term-assertion"></a>

## Assertion（斷言）

比較實際與預期行為，失敗時留下可判斷的測試結果。

情境：第 21 章的資料處理與驗證。相關命令：Should。[對應章節](../../docs/chapters/21-testing-pester.md)；[官方來源](https://github.com/pester/docs/blob/a9e301d136ae6d9c9275d07a183bae55f06fe2c3/versioned_docs/version-v5/quick-start.mdx)。

<a id="term-v05-automatic-variable"></a>

## Automatic variable（自動變數）

由PowerShell維護的工作階段與執行資訊。

情境：第40章。相關命令：Get-Command。[對應章節](../../docs/chapters/40-reference-appendices.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Automatic_Variables.md)。

<a id="term-bom"></a>

## BOM（位元組順序標記）

檔案開頭的 Unicode 編碼提示，可協助舊版辨識中文。

情境：第 3 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/03-installation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Character_Encoding.md)。

<a id="term-boolean"></a>

## Boolean（布林值）

真或假的判斷值，與文字 True/False 不同。

情境：第 11 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/11-variables-types.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Variables.md)。

<a id="term-breakpoint"></a>

## Breakpoint（中斷點）

讓偵錯器在指定行、變數或命令暫停以觀察狀態。

情境：第 20 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Debuggers.md)。

<a id="term-bypropertyname"></a>

## ByPropertyName（按屬性名稱繫結）

依輸入物件屬性名稱配給參數，型別也要符合。

情境：第 9 章的觀念與案例。相關命令：Select-Object。[對應章節](../../docs/chapters/09-pipeline.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Pipelines.md)。

<a id="term-byvalue"></a>

## ByValue（按值繫結）

依整個管線輸入物件的型別配給參數。

情境：第 9 章的觀念與案例。相關命令：Select-Object。[對應章節](../../docs/chapters/09-pipeline.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Pipelines.md)。

<a id="term-cim"></a>

## CIM（通用資訊模型）

管理資料類別與實例的模型；CimSession不是PSSession。

情境：第30章系統管理。相關命令：Get-CimInstance。[對應章節](../../docs/chapters/30-cim-remote-management.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Get-CimInstance.md)。

<a id="term-csv"></a>

## CSV（逗號分隔值）

固定欄位表格交換格式；欄位中逗號、引號與換行需正確引用。

情境：第 24 章的資料處理與驗證。相關命令：Export-Csv, Import-Csv。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-Csv.md)。

<a id="term-capture-group"></a>

## Capture Group（擷取群組）

在符合的文字中擷取子片段，可用具名群組提升可讀性。

情境：第 23 章的資料處理與驗證。相關命令：Select-String。[對應章節](../../docs/chapters/23-text-regex.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Regular_Expressions.md)。

<a id="term-cmdlet"></a>

## Cmdlet（PowerShell 命令）

參與 PowerShell 管線與參數機制的命令；不要把所有外部程式都叫 Cmdlet。

情境：第 7 章的觀念與案例。相關命令：Get-Command, Get-Alias。[對應章節](../../docs/chapters/07-commands-aliases.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Command_Precedence.md)。

<a id="term-v05-commandtype"></a>

## CommandType（命令類型）

區分Cmdlet、函式、別名與原生程式等來源。

情境：第39章。相關命令：Get-Command。[對應章節](../../docs/chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Command.md)。

<a id="term-v05-container"></a>

## Container（容器）

由容器引擎管理的隔離工作負載，與虛擬機管理邊界不同。

情境：第36章。相關命令：Get-VM。[對應章節](../../docs/chapters/36-infrastructure-services.md)；[官方來源](https://github.com/docker/cli/blob/6d274590f2f63276a54da8adf475a455d21c1fdd/docs/reference/commandline/ps.md)。

<a id="term-dns"></a>

## DNS（網域名稱系統）

解析名稱紀錄；成功不代表TCP或應用程式可用。

情境：第29章系統管理。相關命令：Resolve-DnsName。[對應章節](../../docs/chapters/29-network-diagnostics.md)；[官方來源](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/DnsClient/Resolve-DnsName.md)。

<a id="term-dtd"></a>

## DTD（文件型別定義）

XML文件型別與實體宣告機制；不需要時明確禁止以縮小解析範圍。

情境：第 24 章的資料處理與驗證。相關命令：Select-Xml。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/dotnet/dotnet-api-docs/blob/4f16f542b89a2759c5fb8e569f91d010cc671a6f/xml/System.Xml/XmlReaderSettings.xml)。

<a id="term-debugging"></a>

## Debugging（偵錯）

在可重現案例中觀察執行脈絡與資料以找出問題。

情境：第 20 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Debuggers.md)。

<a id="term-discovery"></a>

## Discovery（探索階段）

Pester先建立測試樹的階段；直接放在Describe內的命令可能此時執行。

情境：第 21 章的資料處理與驗證。相關命令：Invoke-Pester。[對應章節](../../docs/chapters/21-testing-pester.md)；[官方來源](https://github.com/pester/docs/blob/a9e301d136ae6d9c9275d07a183bae55f06fe2c3/versioned_docs/version-v5/usage/discovery-and-run.mdx)。

<a id="term-encoding"></a>

## Encoding（編碼）

文字與位元組之間的表示方式，與換行格式不同。

情境：第 3 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/03-installation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Character_Encoding.md)。

<a id="term-error-handling"></a>

## Error Handling（錯誤處理）

辨認與傳播失敗、清理資源，避免把失敗當成功。

情境：第 19 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/19-error-handling.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Try_Catch_Finally.md)。

<a id="term-event-log"></a>

## Event Log（事件記錄）

具有來源、時間與識別碼的記錄，查詢失敗不等於零事件。

情境：第28章系統管理。相關命令：Get-WinEvent。[對應章節](../../docs/chapters/28-events-system-info.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Diagnostics/Get-WinEvent.md)。

<a id="term-exception"></a>

## Exception（例外）

描述異常執行狀態的物件，可由適當錯誤處理捕捉。

情境：第 19 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/19-error-handling.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Try_Catch_Finally.md)。

<a id="term-execution-policy"></a>

## Execution Policy（執行原則）

協助避免意外執行指令碼的機制，不是完整安全邊界。

情境：第 3 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/03-installation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/install/PowerShell-Support-Lifecycle.md)。

<a id="term-function"></a>

## Function（函式）

具名字、輸入與輸出的可重用程式區塊。

情境：第 16 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/16-functions.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions.md)。

<a id="term-hash"></a>

## Hash（雜湊）

由內容計算摘要以核對完整性；不單獨證明發布者身分。

情境：第 25 章的資料處理與驗證。相關命令：Get-FileHash。[對應章節](../../docs/chapters/25-archives-backup.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-FileHash.md)。

<a id="term-hashtable"></a>

## Hashtable（雜湊表）

以鍵值對查找資料，一般不保證列舉順序。

情境：第 12 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/12-collections.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Arrays.md)。

<a id="term-icmp"></a>

## ICMP（網際網路控制訊息協定）

回應測試使用的協定；被阻擋不代表主機關機。

情境：第29章系統管理。相關命令：Test-Connection。[對應章節](../../docs/chapters/29-network-diagnostics.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Test-Connection.md)。

<a id="term-v05-invariantculture"></a>

## InvariantCulture（不變文化）

使用固定文化規則處理交換資料，仍需明確的業務契約。

情境：第38章。相關命令：Import-Csv。[對應章節](../../docs/chapters/38-enterprise-report.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Import-Csv.md)。

<a id="term-json"></a>

## JSON（JavaScript物件表示法）

以物件、陣列與純量表示資料；注意深度、陣列形狀與重複鍵。

情境：第 24 章的資料處理與驗證。相關命令：ConvertTo-Json, ConvertFrom-Json。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-Json.md)。

<a id="term-lts"></a>

## LTS（長期維護版本）

有較長維護期限的發行系列，仍需更新安全修補。

情境：第 2 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/02-powershell-versions.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/install/PowerShell-Support-Lifecycle.md)。

<a id="term-logging"></a>

## Logging（記錄日誌）

留下可追蹤的事件與結果，需去除秘密與控制保存期限。

情境：第 20 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Debuggers.md)。

<a id="term-method"></a>

## Method（方法）

物件提供的操作，呼叫時可能有副作用。

情境：第 8 章的觀念與案例。相關命令：Get-Member。[對應章節](../../docs/chapters/08-objects.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Objects.md)。

<a id="term-module"></a>

## Module（模組）

封裝函式、Cmdlet、提供者及資源的可重用單位。

情境：第 18 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/18-modules.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Modules.md)。

<a id="term-namespace"></a>

## Namespace（命名空間）

XML以URI區分元素名稱範圍；XPath查詢須設定前綴對應。

情境：第 24 章的資料處理與驗證。相關命令：Select-Xml。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Xml.md)。

<a id="term-object"></a>

## Object（物件）

以型別、屬性與方法表達資料及可用操作。

情境：第 8 章的觀念與案例。相關命令：Get-Member。[對應章節](../../docs/chapters/08-objects.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Objects.md)。

<a id="term-v05-ordinal-comparison"></a>

## Ordinal comparison（序數比較）

依字元序數比較，本例Id區分大小寫。

情境：第38章。相關命令：Import-Csv。[對應章節](../../docs/chapters/38-enterprise-report.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Comparison_Operators.md)。

<a id="term-pid"></a>

## PID（處理程序識別碼）

識別目前程序；長時間後可能被系統重複使用。

情境：第26章系統管理。相關命令：Get-Process。[對應章節](../../docs/chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Process.md)。

<a id="term-parameter"></a>

## Parameter（參數）

命令輸入介面的欄位，例如 LiteralPath。

情境：第 6 章的觀念與案例。相關命令：Get-Help。[對應章節](../../docs/chapters/06-help-system.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)。

<a id="term-parameter-binding"></a>

## Parameter Binding（參數繫結）

將命令列引數或管線資料配給接收參數的過程。

情境：第 9 章的觀念與案例。相關命令：Select-Object。[對應章節](../../docs/chapters/09-pipeline.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Pipelines.md)。

<a id="term-parameter-set"></a>

## Parameter Set（參數組合）

定義哪些參數可一起呼叫及各自必要性。

情境：第 6 章的觀念與案例。相關命令：Get-Help。[對應章節](../../docs/chapters/06-help-system.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)。

<a id="term-v05-partial-success"></a>

## Partial success（部分成功）

只有部分輸入完成，不能直接標記全批成功。

情境：第38章。相關命令：Import-Csv。[對應章節](../../docs/chapters/38-enterprise-report.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Try_Catch_Finally.md)。

<a id="term-pipeline"></a>

## Pipeline（管線）

把前段成功輸出送到後段處理；接收參數必須支援該輸入。

情境：第 9 章的觀念與案例。相關命令：Select-Object。[對應章節](../../docs/chapters/09-pipeline.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Pipelines.md)。

<a id="term-v05-preference-variable"></a>

## Preference variable（偏好設定變數）

影響PowerShell處理行為，不是業務驗收資料。

情境：第40章。相關命令：Get-Command。[對應章節](../../docs/chapters/40-reference-appendices.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Preference_Variables.md)。

<a id="term-process"></a>

## Process（處理程序）

執行中的程式實例，同一程式可有多個程序。

情境：第26章系統管理。相關命令：Get-Process。[對應章節](../../docs/chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Process.md)。

<a id="term-profile"></a>

## Profile（設定檔）

啟動時載入的 PowerShell 指令碼，依使用者與主控程式範圍區分。

情境：第 4 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/04-terminal-editor.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/learn/ps101/01-getting-started.md)。

<a id="term-property"></a>

## Property（屬性）

物件的一項資料，例如 Name；畫面不一定顯示全部屬性。

情境：第 8 章的觀念與案例。相關命令：Get-Member。[對應章節](../../docs/chapters/08-objects.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Objects.md)。

<a id="term-provider"></a>

## Provider（提供者）

讓檔案、登錄等資料以一致巡覽方式呈現的機制。

情境：第 5 章的觀念與案例。相關命令：Get-Location, Set-Location, Get-ChildItem。[對應章節](../../docs/chapters/05-basic-navigation.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/learn/ps101/01-getting-started.md)。

<a id="term-registry"></a>

## Registry（登錄）

Windows階層式設定資料；機碼形成路徑，值為機碼屬性。

情境：第27章系統管理。相關命令：Get-ItemProperty。[對應章節](../../docs/chapters/27-windows-registry.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Registry_Provider.md)。

<a id="term-regular-expression"></a>

## Regular Expression（正規表示式）

用模式描述文字；PowerShell的match與split使用.NET Regex。

情境：第 23 章的資料處理與驗證。相關命令：Select-String。[對應章節](../../docs/chapters/23-text-regex.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Regular_Expressions.md)。

<a id="term-scope"></a>

## Scope（作用域）

變數與函式可見及生效的範圍。

情境：第 16 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/16-functions.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions.md)。

<a id="term-script"></a>

## Script（指令碼）

保存一或多個命令的文字檔，可重複執行與版本管理。

情境：第 15 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/15-scripts.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Scripts.md)。

<a id="term-v05-serialization"></a>

## Serialization（序列化）

將物件表示為可保存或傳遞的格式，不保證恢復原始方法。

情境：第39章。相關命令：Get-Command。[對應章節](../../docs/chapters/39-command-index.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-Clixml.md)。

<a id="term-service"></a>

## Service（服務）

由Windows服務控制管理員管理的工作，與程序並非必然一對一。

情境：第26章系統管理。相關命令：Get-Service。[對應章節](../../docs/chapters/26-processes-services.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Service.md)。

<a id="term-session"></a>

## Session（工作階段）

一次執行脈絡，包含載入模組、變數與設定。

情境：第 4 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/04-terminal-editor.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/learn/ps101/01-getting-started.md)。

<a id="term-shell"></a>

## Shell（命令殼層）

理解使用者命令並啟動執行的環境。

情境：第 1 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/01-introduction.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/overview.md)。

<a id="term-shouldprocess"></a>

## ShouldProcess（變更前確認機制）

讓變更命令配合 WhatIf 與 Confirm，副作用須放在受保護分支。

情境：第 17 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/17-advanced-functions.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_Advanced.md)。

<a id="term-splatting"></a>

## Splatting（參數展開）

用字典或陣列整理呼叫引數，減少長單行命令。

情境：第 16 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/16-functions.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions.md)。

<a id="term-string"></a>

## String（字串）

文字資料；引號與編碼規則會影響使用方式。

情境：第 11 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/11-variables-types.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Variables.md)。

<a id="term-switch-parameter"></a>

## Switch Parameter（切換參數）

通常以旗標啟用的參數，不是額外傳入文字 True。

情境：第 6 章的觀念與案例。相關命令：Get-Help。[對應章節](../../docs/chapters/06-help-system.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md)。

<a id="term-terminal"></a>

## Terminal（終端機）

顯示文字並接收輸入的介面，不等同殼層版本。

情境：第 4 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/04-terminal-editor.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/learn/ps101/01-getting-started.md)。

<a id="term-testdrive"></a>

## TestDrive（測試磁碟）

Pester提供的暫存檔案範圍，不是網路或權限沙箱。

情境：第 21 章的資料處理與驗證。相關命令：Invoke-Pester。[對應章節](../../docs/chapters/21-testing-pester.md)；[官方來源](https://github.com/pester/docs/blob/a9e301d136ae6d9c9275d07a183bae55f06fe2c3/versioned_docs/version-v5/usage/testdrive.mdx)。

<a id="term-v05-timespan"></a>

## TimeSpan（時間間隔）

表示經過時間；TotalMilliseconds與Milliseconds分量不同。

情境：第37章。相關命令：Measure-Command。[對應章節](../../docs/chapters/37-performance-design.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Measure-Command.md)。

<a id="term-transcript"></a>

## Transcript（工作階段逐字紀錄）

保存互動內容，可能含敏感資訊，分享前要檢查。

情境：第 20 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/20-debugging-logging.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Debuggers.md)。

<a id="term-type"></a>

## Type（型別）

定義資料種類與可用操作的規則。

情境：第 11 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/11-variables-types.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Variables.md)。

<a id="term-v05-vm"></a>

## VM（虛擬機）

具獨立客體環境的虛擬機器；開機不代表應用服務健康。

情境：第36章。相關命令：Get-VM。[對應章節](../../docs/chapters/36-infrastructure-services.md)；[官方來源](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/Hyper-V/Get-VM.md)。

<a id="term-variable"></a>

## Variable（變數）

保存值的具名位置，以美元符號開頭。

情境：第 11 章的觀念與案例。相關命令：。[對應章節](../../docs/chapters/11-variables-types.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Variables.md)。

<a id="term-wmi"></a>

## WMI（Windows管理規範）

Windows管理基礎設施，提供類別與實例查詢。

情境：第30章系統管理。相關命令：Get-CimInstance。[對應章節](../../docs/chapters/30-cim-remote-management.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_WMI.md)。

<a id="term-wsman"></a>

## WSMan（Web服務管理協定）

指定遠端ComputerName時CIM工作階段預設使用的協定。

情境：第30章系統管理。相關命令：New-CimSession。[對應章節](../../docs/chapters/30-cim-remote-management.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/New-CimSession.md)。

<a id="term-v05-wall-clock-time"></a>

## Wall-clock time（實際經過時間）

區塊從開始到結束經過的時間，不等同CPU累計時間。

情境：第37章。相關命令：Measure-Command。[對應章節](../../docs/chapters/37-performance-design.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Measure-Command.md)。

<a id="term-v05-warm-up"></a>

## Warm-up（暖機）

在正式量測前以一致方式執行工作，避免混比冷啟動。

情境：第37章。相關命令：Measure-Command。[對應章節](../../docs/chapters/37-performance-design.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/dev-cross-plat/performance/script-authoring-considerations.md)。

<a id="term-xml"></a>

## XML（可延伸標記語言）

以元素、屬性及命名空間表達文件結構。

情境：第 24 章的資料處理與驗證。相關命令：Select-Xml。[對應章節](../../docs/chapters/24-csv-json-xml.md)；[官方來源](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Xml.md)。
