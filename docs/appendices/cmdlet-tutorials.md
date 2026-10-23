<a id="cmdlet-tutorials"></a>

# 命令教學附錄

[返回目錄](../README.md)

本附錄十個主要命令採十四項教學結構。語法以本機 7.6.8 為基準；參數段是教學摘要，完整參數組與必要性另存 `data/runtime-command-metadata.json`。範例中的錯誤案例是刻意示範；不代表要修正後再當成正常輸入。

<a id="get-command"></a>

## Get-Command（取得命令）

### 1. 指令名稱

Get-Command：取得命令。模組：Microsoft.PowerShell.Core。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

找出可用命令、種類與來源；適合不確定模組或參數的時候。

### 4. 使用情境

配合第 7 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Get＝取得；Command＝命令。先找命令，再執行動作。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Get-Command [[-ArgumentList] <Object[]>] [-Verb <string[]>] [-Noun <string[]>] [-Module <string[]>] [-ExcludeModule <string[]>] [-FullyQualifiedModule <ModuleSpecification[]>] [-TotalCount <int>] [-Syntax] [-ShowCommandInfo] [-All] [-ListImported] [-ParameterName <string[]>] [-ParameterType <PSTypeName[]>] [<CommonParameters>]
```

### 7. 參數說明

-Name：名稱，選用，可用萬用字元；-Verb/-Noun：動詞名詞查詢，選用；-Module：模組來源，選用；-All：所有同名命令；-ListImported：已匯入；-Syntax：輸出語法；-ParameterName/-ParameterType：按參數探索。-ExcludeModule 為 7.6 功能，舊版需查證。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
Get-Command -Name Get-ChildItem
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
Get-Command -Verb Get -Noun "*Item*"
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
Get-Command -Name Get-ChildItem -All | Select-Object Name, CommandType, Source
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
Get-Command -Name NoSuchHandbookCommand
```

**錯誤修正**：命令不存在時通常是 CommandNotFoundException；先查拼字、模組與平台，別任意安裝同名套件。

```powershell
Get-Command -Name "*ChildItem*"
```

### 9. 輸出結果

CommandInfo 衍生物件；Name 是名稱，CommandType 是種類，Source 是來源。-Syntax 輸出語法字串。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

命令不存在時通常是 CommandNotFoundException；先查拼字、模組與平台，別任意安裝同名套件。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

精確名稱查詢可能自動匯入模組。不可把命令名稱當成可信來源保證。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Get＝取得；Command＝命令。先找命令，再執行動作。

### 14. 官方參考資料

[Get-Command](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Command.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="get-help"></a>

## Get-Help（取得說明）

### 1. 指令名稱

Get-Help：取得說明。模組：Microsoft.PowerShell.Core。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

閱讀命令參數與概念，排查參數組合及管線支援。

### 4. 使用情境

配合第 6 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Get＝取得；Help＝說明。Help 幫你理解命令，而不是替你執行命令。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Get-Help [[-Name] <string>] [-Path <string>] [-Category <string[]>] [-Full] [-Component <string[]>] [-Functionality <string[]>] [-Role <string[]>] [<CommonParameters>]
```

### 7. 參數說明

-Name：主題，選用；-Full/-Detailed/-Examples：替代顯示模式；-Parameter：指定參數，該組必要；-Online：開線上說明；-Path：提供者動態參數脈絡；-Category/-Component/-Functionality/-Role：篩選。-ShowWindow 是 Windows 桌面相關功能，本 Linux 不提供。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
Get-Help -Name Get-ChildItem
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
Get-Help -Name Get-ChildItem -Parameter LiteralPath
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
Get-Help -Name Get-ChildItem -Examples
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
Get-Help -Name Get-ChildItem -Full -Examples
```

**錯誤修正**：Full 與 Examples 混用會造成參數組無法解析；分開查閱。基本說明不代表已安裝完整說明。

```powershell
Get-Help -Name Get-ChildItem -Full
```

### 9. 輸出結果

說明物件依說明來源與顯示模式不同；不要把它當作可直接執行的命令清單。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

Full 與 Examples 混用會造成參數組無法解析；分開查閱。基本說明不代表已安裝完整說明。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

Online 需要瀏覽器與網路；文件中的變更範例須先讀風險。本機完整說明未下載。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Get＝取得；Help＝說明。Help 幫你理解命令，而不是替你執行命令。

### 14. 官方參考資料

[Get-Help](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Help.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="get-location"></a>

## Get-Location（取得目前位置）

### 1. 指令名稱

Get-Location：取得目前位置。模組：Microsoft.PowerShell.Management。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

在相對路徑操作前確認目前提供者與路徑。

### 4. 使用情境

配合第 5 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Get＝取得；Location＝位置。先問自己在哪裡。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Get-Location [-PSProvider <string[]>] [-PSDrive <string[]>] [<CommonParameters>]
```

### 7. 參數說明

-PSProvider/-PSDrive：限制提供者或磁碟，選用；-Stack：查堆疊模式；-StackName：堆疊名稱，選用。一般呼叫不需參數。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
Get-Location
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
Get-Location -PSProvider FileSystem
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
(Get-Location).Path
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
Get-Location -LiteralPath .
```

**錯誤修正**：Get-Location 不接受 LiteralPath；該參數屬其他命令。不可因參數同名就假定通用。

```powershell
Get-Location
```

### 9. 輸出結果

PathInfo，常見 Path、Drive、Provider；查位置堆疊時輸出不同。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

Get-Location 不接受 LiteralPath；該參數屬其他命令。不可因參數同名就假定通用。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

唯讀；顯示的路徑可能含個人資訊，分享日誌前檢查。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Get＝取得；Location＝位置。先問自己在哪裡。

### 14. 官方參考資料

[Get-Location](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Location.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="set-location"></a>

## Set-Location（切換目前位置）

### 1. 指令名稱

Set-Location：切換目前位置。模組：Microsoft.PowerShell.Management。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

互動巡覽資料夾；腳本需注意後續相對路徑的目標。

### 4. 使用情境

配合第 5 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Set＝設定；Location＝位置。換位置，不搬檔案。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Set-Location [[-Path] <string>] [-PassThru] [<CommonParameters>]
```

### 7. 參數說明

-Path：可選、解讀模式；-LiteralPath：字面路徑組必要；-PassThru：切換後回傳位置；-StackName：選擇位置堆疊。Path 的 + / - 歷史巡覽是 6.2 起功能。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
Set-Location -LiteralPath .
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
Set-Location -LiteralPath . -PassThru
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
$old = Get-Location; try { Set-Location -LiteralPath $HOME; Get-Location } finally { Set-Location -LiteralPath $old.Path }
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
Set-Location -LiteralPath ./no-such-handbook-directory
```

**錯誤修正**：PathNotFound 表示無法解析目標；確認目前位置與路徑，不用 Force 解決。

```powershell
Test-Path -LiteralPath ./no-such-handbook-directory
```

### 9. 輸出結果

預設無成功輸出；-PassThru 回傳新位置的 PathInfo。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

PathNotFound 表示無法解析目標；確認目前位置與路徑，不用 Force 解決。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

修改工作階段位置但不改檔；會影響後續相對路徑。可用 try/finally 回復。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Set＝設定；Location＝位置。換位置，不搬檔案。

### 14. 官方參考資料

[Set-Location](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-Location.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="get-childitem"></a>

## Get-ChildItem（取得子項目）

### 1. 指令名稱

Get-ChildItem：取得子項目。模組：Microsoft.PowerShell.Management。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

盤點目前資料夾，尋找符合副檔名的檔案，建立檔案報表前置資料。

### 4. 使用情境

配合第 5 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Get＝取得；Child＝子；Item＝項目。看容器裡的孩子。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Get-ChildItem [[-Path] <string[]>] [[-Filter] <string>] [-Include <string[]>] [-Exclude <string[]>] [-Recurse] [-Depth <uint>] [-Force] [-Name] [-Attributes <FlagsExpression[FileAttributes]>] [-FollowSymlink] [-Directory] [-File] [-Hidden] [-ReadOnly] [-System] [<CommonParameters>]
```

### 7. 參數說明

-Path/-LiteralPath：替代參數組，後者必要；-Filter：提供者篩選；-Include/-Exclude：包含排除模式；-Recurse/-Depth：遞迴與上限；-Force：包含隱藏等項目；-Name：僅名稱。File、Directory、Attributes、Hidden、ReadOnly 等為檔案系統動態參數。FollowSymlink 為 6.0 起。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
Get-ChildItem -LiteralPath .
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
Get-ChildItem -LiteralPath . -File -Filter "*.md"
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
Get-ChildItem -LiteralPath . -File | Select-Object Name, Length
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
Get-ChildItem -LiteralPath ./no-such-handbook-directory
```

**錯誤修正**：PathNotFound 先查根路徑；UnauthorizedAccess 先查權限。隱藏錯誤會讓盤點不完整。

```powershell
Get-ChildItem -LiteralPath . -File
```

### 9. 輸出結果

FileInfo 或 DirectoryInfo，依提供者而變；Name 名稱、FullName 完整路徑、Length 位元組數、LastWriteTime 最後寫入時間。-Name 改輸出字串。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

PathNotFound 先查根路徑；UnauthorizedAccess 先查權限。隱藏錯誤會讓盤點不完整。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

預設唯讀；遞迴可能耗時或碰敏感位置。Force 不越過 ACL（存取控制清單）。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Get＝取得；Child＝子；Item＝項目。看容器裡的孩子。

### 14. 官方參考資料

[Get-ChildItem](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="get-alias"></a>

## Get-Alias（取得別名）

### 1. 指令名稱

Get-Alias：取得別名。模組：Microsoft.PowerShell.Utility。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

閱讀舊腳本或診斷同名命令時確認別名指向。

### 4. 使用情境

配合第 7 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Get＝取得；Alias＝別名。從捷徑回到完整名字。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Get-Alias [[-Name] <string[]>] [-Exclude <string[]>] [-Scope <string>] [<CommonParameters>]
```

### 7. 參數說明

-Name：別名，選用；-Definition：目標命令名，定義參數組使用；-Exclude：排除模式；-Scope：作用域。Name 與 Definition 是不同查詢方向。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
Get-Alias -Name gci
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
Get-Alias -Definition Get-ChildItem
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
Get-Alias -Name gci | Select-Object Name, Definition
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
Get-Alias -Name NoSuchHandbookAlias
```

**錯誤修正**：找不到別名不代表完整命令不存在；可改查 Get-Command。

```powershell
Get-Command -Name Get-ChildItem
```

### 9. 輸出結果

AliasInfo；Name 是別名，Definition 是指向名稱，ResolvedCommand 可進一步查看解析命令。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

找不到別名不代表完整命令不存在；可改查 Get-Command。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

唯讀；別名會受工作階段與使用者設定影響。正式腳本優先寫全名。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Get＝取得；Alias＝別名。從捷徑回到完整名字。

### 14. 官方參考資料

[Get-Alias](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Alias.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="get-member"></a>

## Get-Member（取得物件成員）

### 1. 指令名稱

Get-Member：取得物件成員。模組：Microsoft.PowerShell.Utility。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

發現輸入物件的屬性、方法及型別。

### 4. 使用情境

配合第 8 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Get＝取得；Member＝成員。先看有哪些能力，再決定怎麼使用。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Get-Member [[-Name] <string[]>] [-InputObject <psobject>] [-MemberType <PSMemberTypes>] [-View <PSMemberViewTypes>] [-Static] [-Force] [<CommonParameters>]
```

### 7. 參數說明

-InputObject：選用，直接傳入整個物件；-Name：成員模式；-MemberType：屬性／方法種類；-Static：靜態成員；-View：Base/Adapted/Extended/All 檢視；-Force：顯示更多成員，不授予權限。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
"abc" | Get-Member
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
"abc" | Get-Member -MemberType Property
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
[pscustomobject]@{ Name = "練習"; Count = 2 } | Get-Member -MemberType NoteProperty
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
$null | Get-Member
```

**錯誤修正**：沒有輸入物件時無法列成員；先檢查前段查詢是否為空，不要假造物件掩蓋缺資料。

```powershell
"abc" | Get-Member
```

### 9. 輸出結果

MemberDefinition；Name 成員名、MemberType 成員種類、Definition 定義。畫面另標型別名稱。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

沒有輸入物件時無法列成員；先檢查前段查詢是否為空，不要假造物件掩蓋缺資料。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

探索本身不呼叫列出的所有方法；方法實際執行仍可能改動資料。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Get＝取得；Member＝成員。先看有哪些能力，再決定怎麼使用。

### 14. 官方參考資料

[Get-Member](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Member.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="select-object"></a>

## Select-Object（選取物件或屬性）

### 1. 指令名稱

Select-Object：選取物件或屬性。模組：Microsoft.PowerShell.Utility。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

精簡報表欄位或只取前幾筆資料。

### 4. 使用情境

配合第 9 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Select＝選取；Object＝物件。挑欄位、挑筆數，不是任意條件篩選。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Select-Object [[-Property] <Object[]>] [-InputObject <psobject>] [-ExcludeProperty <string[]>] [-ExpandProperty <string>] [-Unique] [-CaseInsensitive] [-Last <int>] [-First <int>] [-Skip <int>] [-Wait] [<CommonParameters>]
```

### 7. 參數說明

-Property：欄位，選用；-ExcludeProperty：排除欄位；-ExpandProperty：單一屬性值；-First/-Last/-Skip/-SkipLast：筆數；-Index/-SkipIndex：零起算索引；-Unique：去重；-CaseInsensitive：7.4 起與 Unique 搭配；-Wait：等待完整輸入；-InputObject：直接傳入。參數組互斥限制見正式語法。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
Get-Process -Id $PID | Select-Object Id, ProcessName
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
Get-Process -Id $PID | Select-Object -ExpandProperty ProcessName
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
1,2,3,4 | Select-Object -First 2
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
[pscustomobject]@{ Name = "甲" } | Select-Object -ExpandProperty Missing
```

**錯誤修正**：ExpandProperty 指向不存在屬性會報錯；先用 Get-Member 確認名稱。

```powershell
[pscustomobject]@{ Name = "甲" } | Select-Object -ExpandProperty Name
```

### 9. 輸出結果

-Property 通常建立選取屬性的新物件；-ExpandProperty 回傳屬性值；只取筆數則保留選定物件。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

ExpandProperty 指向不存在屬性會報錯；先用 Get-Member 確認名稱。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

通常只操作資料，但 First/Index 可令上游提早停止；不要依賴未執行的上游副作用。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Select＝選取；Object＝物件。挑欄位、挑筆數，不是任意條件篩選。

### 14. 官方參考資料

[Select-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Object.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="where-object"></a>

## Where-Object（依條件篩選物件）

### 1. 指令名稱

Where-Object：依條件篩選物件。模組：Microsoft.PowerShell.Core。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

以屬性比較、複合條件挑出報表資料。

### 4. 使用情境

配合第 10 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Where＝哪些符合條件；Object＝物件。留下需要的資料列。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Where-Object [-Property] <string> [[-Value] <Object>] [-InputObject <psobject>] [-EQ] [<CommonParameters>]
```

### 7. 參數說明

-FilterScript：指令區塊組必要；-Property：簡化語法的屬性名必要；-Value：比較值；-InputObject：直接傳物件。EQ/NE/GT/GE/LT/LE、Like/Match、Contains/In、Is/IsNot、Not 等各有組合；C 前綴比較區分大小寫。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
1,2,3 | Where-Object { $_ -ge 2 }
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
1,2,3,4 | Where-Object { $_ -ge 2 -and $_ -lt 4 }
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
"a.log","b.txt" | Where-Object { $_ -like "*.log" }
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
1,2,3 | Where-Object -Property Length -GT 1 -LT 3
```

**錯誤修正**：簡化語法混用比較旗標可能造成參數組錯誤；複合條件改用指令區塊。

```powershell
1,2,3 | Where-Object { $_ -gt 1 -and $_ -lt 3 }
```

### 9. 輸出結果

輸入物件符合條件者原樣留下；不是改成 True/False 清單。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

簡化語法混用比較旗標可能造成參數組錯誤；複合條件改用指令區塊。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

區塊可含任意程式碼；只有本範例純比較可視為無系統變更。避免把 = 指派寫成比較。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Where＝哪些符合條件；Object＝物件。留下需要的資料列。

### 14. 官方參考資料

[Where-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Where-Object.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。

<a id="sort-object"></a>

## Sort-Object（依屬性排序物件）

### 1. 指令名稱

Sort-Object：依屬性排序物件。模組：Microsoft.PowerShell.Utility。

### 2. 學習重要程度

★★★★★ 必學；星級是本教材的學習優先順序，不是官方品質評分。

### 3. 功能介紹

排行、同值次序與依多欄位整理報表。

### 4. 使用情境

配合第 10 章的學習流程，先在測試資料或目前工作區練習。

### 5. 英文拆解

Sort＝排序；Object＝物件。決定次序，不改原始系統項目。

### 6. 指令語法

以下是一個正式參數組摘要，不應把尖括號占位文字原樣執行。其他參數組請查本機語法與官方原文。

```text
Sort-Object [[-Property] <Object[]>] [-Stable] [-Descending] [-Unique] [-InputObject <psobject>] [-Culture <string>] [-CaseSensitive] [<CommonParameters>]
```

### 7. 參數說明

-Property：排序鍵，選用，可用計算屬性；-Descending：遞減；-Unique：依比較鍵去重；-Culture/-CaseSensitive：文字規則；-Stable：6.2 起穩定排序；-Top/-Bottom：6.0 起取排序頂端／底端筆數；-InputObject：直接物件。

通用參數另見[參數索引](parameter-reference.md)。必要性取決於參數組；機器可讀中繼資料保留每組 Mandatory、Position、管線支援，不以單一布林值概括所有組合。

### 8. 五類實際範例

**基礎**：先觀察最小輸入與回傳內容。

```powershell
3,1,2 | Sort-Object
```

**進階**：加入參數，觀察與基礎呼叫的差異。

```powershell
3,1,2 | Sort-Object -Descending
```

**實務**：以唯讀或記憶體資料組合成可重複查詢。

```powershell
[pscustomobject]@{Name="甲";Count=2}, [pscustomobject]@{Name="乙";Count=5} | Sort-Object Count -Descending
```

**常見錯誤**：刻意的失敗或邏輯錯誤；需與下一段修正比較，不應當成正常工作流程。

```powershell
"10","2" | Sort-Object
```

**錯誤修正**：字串排序 10、2 未必符合數值直覺；檢查來源型別並明確轉換。這是邏輯錯誤，不一定產生例外。

```powershell
10,2 | Sort-Object
```

### 9. 輸出結果

排序後的原輸入物件；結果順序依屬性型別、文化區域與比較選項。 更多屬性可用 Get-Member 探索；環境資料與語系會改變實際值。

### 10. 常見錯誤

字串排序 10、2 未必符合數值直覺；檢查來源型別並明確轉換。這是邏輯錯誤，不一定產生例外。 錯誤文字可能隨版本與語系改變，診斷時保留錯誤種類與命令脈絡。

### 11. 安全注意事項

通常需收集輸入才能排序；大量資料注意記憶體。自訂 Expression 也可有副作用。 以上範例無需為教學特別提升管理員權限。Windows PowerShell 5.1 尚未在本專案實測。

### 12. 相關 Cmdlet

參考[總索引](master-index.md)的同章命令；Get-Command 查可用性，Get-Help 查說明，Get-Member 查輸出結構。

### 13. 記憶技巧

Sort＝排序；Object＝物件。決定次序，不改原始系統項目。

### 14. 官方參考資料

[Sort-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Sort-Object.md)，Microsoft，7.6 文件快照，查閱 2026-10-24。
