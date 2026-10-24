<a id="cmdlet-tutorials"></a>

# 命令教學附錄

[返回目錄](../README.md)

本附錄二十個主要命令採十四項教學結構。跨平台命令語法以本機 7.6.8 為基準；Windows命令另依固定官方文件，未執行者明確標示；參數段是教學摘要，完整參數組與必要性另存 `data/runtime-command-metadata.json`。範例中的錯誤案例是刻意示範；不代表要修正後再當成正常輸入。

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

<a id="get-content"></a>

## Get-Content（讀取內容）

### 1. 指令名稱

Get-Content：讀取內容。模組：Microsoft.PowerShell.Management。

### 2. 學習重要程度

★★★★★：資料處理基礎。星級是教材學習優先順序。

### 3. 功能介紹

按行或以 Raw 讀取文字，明確指定編碼並考慮記憶體。

### 4. 使用情境

見[第 22 章](../chapters/22-files-folders.md)的原創資料流程。讀取或寫入的範圍以程式碼註解為準。

### 5. 英文拆解

Get＝取得；Content＝內容。檔案的屬性用 Get-Item，檔案內文字用 Get-Content。

### 6. 指令語法

下列是教學用參數摘要，並非所有參數的完整列表；完整參數組、位置、必要性與管線支援保存在 data/runtime-command-metadata.json。

```text
Get-Content -LiteralPath <String[]> [-Raw] [-Encoding <Encoding>] [-TotalCount <Int64>] [-Tail <Int32>] [<CommonParameters>]
```

### 7. 參數說明

LiteralPath：必要來源之一，按字面解讀；Path 是另一個參數組。Raw：全文單一字串；TotalCount：前幾行；Tail：末幾行；Encoding：文字解碼；AsByteStream：位元組輸出，PowerShell 6 起。Raw、Tail、TotalCount 等不能任意組合，應查本機完整參數組與執行限制。

通用參數另見[參數索引](parameter-reference.md)，同名參數的效果需查命令本身。

### 8. 五類實際範例

下列完整區塊依序標示基礎、進階、實務、故意錯誤與修正。含寫檔的範例只使用自己建立的唯一暫存目錄，結束會實際清理；不要將暫存路徑換成正式資料。

```powershell
$lab = Join-Path ([IO.Path]::GetTempPath()) ('content-' + [guid]::NewGuid())
try {
    New-Item -ItemType Directory -Path $lab | Out-Null
    $file = Join-Path $lab '文字[1].txt'
    Set-Content -LiteralPath $file -Value '第一列','第二列','第三列' -Encoding utf8NoBOM
    # 基礎：逐行讀取
    Get-Content -LiteralPath $file -Encoding utf8
    # 進階：只看最後一行
    Get-Content -LiteralPath $file -Tail 1 -Encoding utf8
    # 實務：取得全文供解析或明確文字檢查
    (Get-Content -LiteralPath $file -Raw -Encoding utf8).Contains('第二列')
    # 常見錯誤：刻意不存在的檔案，在catch保留診斷
    try { Get-Content -LiteralPath (Join-Path $lab 'missing.txt') -ErrorAction Stop }
    catch { Write-Verbose $_.Exception.Message -Verbose }
    # 修正：回到已建立且按字面指定的來源
    @(Get-Content -LiteralPath $file -Encoding utf8).Count
} finally {
    if (Test-Path -LiteralPath $lab) { Remove-Item -LiteralPath $lab -Recurse -Force }
}
```

### 9. 輸出結果

一般讀取每行一個字串，Raw 是全文字串；本例有三行，Tail 讀到「第三列」。空檔案可能沒有成功輸出，應用 @() 處理集合。

### 10. 常見錯誤

PathNotFound 先核對目標與目前位置；帶中括號的檔名應用 LiteralPath。中文錯字先查編碼，不直接覆寫原檔。

### 11. 安全注意事項

唯讀仍可能暴露檔案內容；不要將憑證檔送到日誌。Raw 會一次載入全文。 本版代表性實測環境為7.6.8/Linux；Windows 5.1與macOS尚未實測。

### 12. 相關 Cmdlet

Get-Item、Set-Content、Add-Content、Select-String；查詢入口見[總索引](master-index.md)。

### 13. 記憶技巧

Get＝取得；Content＝內容。檔案的屬性用 Get-Item，檔案內文字用 Get-Content。

### 14. 官方參考資料

[Get-Content](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Content.md) — Microsoft；PowerShell 7.6 文件；查閱 2026-10-24。語法與行為檢查範圍另見驗證紀錄，不以代表性測試推定所有參數組皆已測過。

<a id="select-string"></a>

## Select-String（搜尋文字模式）

### 1. 指令名稱

Select-String：搜尋文字模式。模組：Microsoft.PowerShell.Utility。

### 2. 學習重要程度

★★★★★：資料處理基礎。星級是教材學習優先順序。

### 3. 功能介紹

按 Regex 或字面文字搜尋，回傳命中行與擷取資訊。

### 4. 使用情境

見[第 23 章](../chapters/23-text-regex.md)的原創資料流程。讀取或寫入的範圍以程式碼註解為準。

### 5. 英文拆解

Select＝選取；String＝字串。選出符合模式的文字與所在行資訊。

### 6. 指令語法

下列是教學用參數摘要，並非所有參數的完整列表；完整參數組、位置、必要性與管線支援保存在 data/runtime-command-metadata.json。

```text
Select-String -InputObject <PSObject> -Pattern <String[]> [-SimpleMatch] [-CaseSensitive] [-AllMatches] [<CommonParameters>]
```

### 7. 參數說明

Pattern：必要比對模式；InputObject：此組必要輸入，也可由管線送入。檔案組改用 Path 或 LiteralPath。SimpleMatch：字面搜尋；CaseSensitive：區分大小寫；AllMatches：一行全部 Regex 命中；Quiet：只問是否命中；Context：帶出附近行。不要把所有開關視為能同時使用的組合。

通用參數另見[參數索引](parameter-reference.md)，同名參數的效果需查命令本身。

### 8. 五類實際範例

下列完整區塊依序標示基礎、進階、實務、故意錯誤與修正。含寫檔的範例只使用自己建立的唯一暫存目錄，結束會實際清理；不要將暫存路徑換成正式資料。

```powershell
# 基礎：只選含WARN的行
'INFO ready','WARN slow' | Select-String -Pattern 'WARN' -SimpleMatch
# 進階：一行所有數字
$hits = 'id=12 id=34' | Select-String -Pattern '[0-9]+' -AllMatches
$hits.Matches.Value
# 實務：輸出可再次處理的欄位
'INFO ready','WARN slow' | Select-String -Pattern '^WARN' |
    Select-Object LineNumber, Line
# 常見錯誤：點號是Regex，兩筆都符合
@('a.b','axb' | Select-String -Pattern 'a.b').Count
# 修正：只要字面文字，結果一筆
@('a.b','axb' | Select-String -Pattern 'a.b' -SimpleMatch).Count
```

### 9. 輸出結果

預設 MatchInfo 具有 Line、LineNumber、Matches 等欄位；AllMatches 範例是一筆行資訊與兩筆 Match。Quiet 回傳布林資訊，Raw 改為文字。

### 10. 常見錯誤

把點號當普通字元會多找資料；把 Matches.Count 當行數會多算。要查完整內容時，先選真正的文字欄位。

### 11. 安全注意事項

日誌可能有密碼、權杖與個資；輸出前先限制欄位。外部輸入優先字面比對，避免任意 Regex。 本版代表性實測環境為7.6.8/Linux；Windows 5.1與macOS尚未實測。

### 12. 相關 Cmdlet

Get-Content、Where-Object、Select-Object；查詢入口見[總索引](master-index.md)。

### 13. 記憶技巧

Select＝選取；String＝字串。選出符合模式的文字與所在行資訊。

### 14. 官方參考資料

[Select-String](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-String.md) — Microsoft；PowerShell 7.6 文件；查閱 2026-10-24。語法與行為檢查範圍另見驗證紀錄，不以代表性測試推定所有參數組皆已測過。

<a id="export-csv"></a>

## Export-Csv（匯出CSV）

### 1. 指令名稱

Export-Csv：匯出CSV。模組：Microsoft.PowerShell.Utility。

### 2. 學習重要程度

★★★★★：資料處理基礎。星級是教材學習優先順序。

### 3. 功能介紹

將物件欄位寫為CSV，正確引用逗號、引號及換行。

### 4. 使用情境

見[第 24 章](../chapters/24-csv-json-xml.md)的原創資料流程。讀取或寫入的範圍以程式碼註解為準。

### 5. 英文拆解

Export＝匯出；CSV＝逗號分隔值。把物件欄位送到交換檔案。

### 6. 指令語法

下列是教學用參數摘要，並非所有參數的完整列表；完整參數組、位置、必要性與管線支援保存在 data/runtime-command-metadata.json。

```text
Export-Csv -InputObject <PSObject> -LiteralPath <String> [-Delimiter <Char>] [-Encoding <Encoding>] [-NoTypeInformation] [-NoClobber] [-WhatIf] [<CommonParameters>]
```

### 7. 參數說明

InputObject：必要，通常由管線傳入；LiteralPath：必要輸出位置之一。Delimiter：分隔字元；Encoding：輸出編碼；NoTypeInformation：不輸出型別資訊，6起預設；NoClobber：避免覆寫；Append：附加且需欄位相容；UseCulture 在另一個分隔設定組。

通用參數另見[參數索引](parameter-reference.md)，同名參數的效果需查命令本身。

### 8. 五類實際範例

下列完整區塊依序標示基礎、進階、實務、故意錯誤與修正。含寫檔的範例只使用自己建立的唯一暫存目錄，結束會實際清理；不要將暫存路徑換成正式資料。

```powershell
$lab = Join-Path ([IO.Path]::GetTempPath()) ('csv-' + [guid]::NewGuid())
try {
    New-Item -ItemType Directory -Path $lab | Out-Null
    $file = Join-Path $lab 'report.csv'
    $rows = [pscustomobject]@{Name='臺北,一組';Count=2}, [pscustomobject]@{Name='臺南';Count=3}
    # 基礎：物件直接匯出
    $rows | Export-Csv -LiteralPath $file -Encoding utf8BOM -NoTypeInformation
    # 進階：改用分號，輸入輸出一致
    $semi = Join-Path $lab 'semicolon.csv'
    $rows | Export-Csv -LiteralPath $semi -Delimiter ';' -Encoding utf8NoBOM
    # 實務：重新讀回驗收筆數與欄位
    @(Import-Csv -LiteralPath $semi -Delimiter ';' -Encoding utf8).Count
    # 常見錯誤：顯示用物件寫到另一個合成檔案，結果不是Name/Count資料
    $bad = Join-Path $lab 'formatted.csv'
    $rows | Format-Table | Export-Csv -LiteralPath $bad
    # 修正：選欄位後才匯出，保持可供後續程式使用的資料
    $rows | Select-Object Name,Count | Export-Csv -LiteralPath $file -Encoding utf8BOM
    Import-Csv -LiteralPath $file -Encoding utf8 | Select-Object Name,Count
} finally {
    if (Test-Path -LiteralPath $lab) { Remove-Item -LiteralPath $lab -Recurse -Force }
}
```

### 9. 輸出結果

通常沒有成功串流資料，實際成果在CSV檔案。Import-Csv 重新讀回可核對兩筆資料與欄位，Count 讀回為字串。

### 10. 常見錯誤

Format-Table 會把顯示用物件送入CSV；改用 Select-Object 選欄位。附加失敗先檢查欄位，不用 Force 掩蓋缺欄。

### 11. 安全注意事項

匯出會寫檔，先用暫存目錄；NoClobber 可避免意外覆寫。CSV 正確引用不等於可防止試算表公式注入。5.1 的預設編碼不同。 本版代表性實測環境為7.6.8/Linux；Windows 5.1與macOS尚未實測。

### 12. 相關 Cmdlet

Import-Csv、ConvertTo-Csv、ConvertFrom-Csv、Select-Object；查詢入口見[總索引](master-index.md)。

### 13. 記憶技巧

Export＝匯出；CSV＝逗號分隔值。把物件欄位送到交換檔案。

### 14. 官方參考資料

[Export-Csv](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-Csv.md) — Microsoft；PowerShell 7.6 文件；查閱 2026-10-24。語法與行為檢查範圍另見驗證紀錄，不以代表性測試推定所有參數組皆已測過。

<a id="convertfrom-json"></a>

## ConvertFrom-Json（解析JSON）

### 1. 指令名稱

ConvertFrom-Json：解析JSON。模組：Microsoft.PowerShell.Utility。

### 2. 學習重要程度

★★★★★：資料處理基礎。星級是教材學習優先順序。

### 3. 功能介紹

解析JSON，控制陣列列舉、鍵值容器與日期轉換。

### 4. 使用情境

見[第 24 章](../chapters/24-csv-json-xml.md)的原創資料流程。讀取或寫入的範圍以程式碼註解為準。

### 5. 英文拆解

Convert＝轉換；From＝從；JSON＝JavaScript物件表示法。從JSON文字還原可查詢的資料。

### 6. 指令語法

下列是教學用參數摘要，並非所有參數的完整列表；完整參數組、位置、必要性與管線支援保存在 data/runtime-command-metadata.json。

```text
ConvertFrom-Json -InputObject <String> [-AsHashtable] [-Depth <Int32>] [-NoEnumerate] [-DateKind <JsonDateKind>] [<CommonParameters>]
```

### 7. 參數說明

InputObject：必要JSON字串；Depth：可處理的最大巢狀深度，不是輸出序列化深度。AsHashtable：6.0加入，7.3起保留鍵順序；NoEnumerate：保留陣列作為單一物件；DateKind：7.5加入，控制日期解析。

通用參數另見[參數索引](parameter-reference.md)，同名參數的效果需查命令本身。

### 8. 五類實際範例

下列完整區塊依序標示基礎、進階、實務、故意錯誤與修正。含寫檔的範例只使用自己建立的唯一暫存目錄，結束會實際清理；不要將暫存路徑換成正式資料。

```powershell
# 基礎：讀取屬性
('{"name":"臺灣","count":2}' | ConvertFrom-Json).name
# 進階：保留大小寫不同的鍵
$map = '{"key":1,"Key":2}' | ConvertFrom-Json -AsHashtable
$map['key']; $map['Key']
# 實務：往返單元素陣列
'[1]' | ConvertFrom-Json -NoEnumerate | ConvertTo-Json -Compress
# 常見錯誤：無效JSON，明確捕捉並記錄
try { '{broken' | ConvertFrom-Json -ErrorAction Stop }
catch { Write-Verbose $_.Exception.Message -Verbose }
# 修正：合法JSON加上欄位驗收
$value = '{"count":2}' | ConvertFrom-Json -ErrorAction Stop
if ($value.count -ne 2) { throw '資料不符預期' }
$value.count
```

### 9. 輸出結果

預設可得到自訂物件、陣列或純量，取決於JSON根節點。AsHashtable 回傳字典容器。單元素陣列若被管線列舉，往返形狀可能改變。

### 10. 常見錯誤

無效JSON必須回報剖析錯誤；不要自動吞掉當空物件。完全同名重複鍵只留下最後值，AsHashtable也不保留所有同名鍵。

### 11. 安全注意事項

只解析資料，不把欄位傳給 Invoke-Expression。限制輸入大小與深度；解析成功仍需檢查必要欄位、數值範圍與業務規則。 本版代表性實測環境為7.6.8/Linux；Windows 5.1與macOS尚未實測。

### 12. 相關 Cmdlet

ConvertTo-Json、Get-Content、Test-Json；查詢入口見[總索引](master-index.md)。

### 13. 記憶技巧

Convert＝轉換；From＝從；JSON＝JavaScript物件表示法。從JSON文字還原可查詢的資料。

### 14. 官方參考資料

[ConvertFrom-Json](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-Json.md) — Microsoft；PowerShell 7.6 文件；查閱 2026-10-24。語法與行為檢查範圍另見驗證紀錄，不以代表性測試推定所有參數組皆已測過。

<a id="compress-archive"></a>

## Compress-Archive（建立ZIP封存）

### 1. 指令名稱

Compress-Archive：建立ZIP封存。模組：Microsoft.PowerShell.Archive。

### 2. 學習重要程度

★★★★★：資料處理基礎。星級是教材學習優先順序。

### 3. 功能介紹

將明確範圍封裝為ZIP；隱藏檔與大小限制使它不能替代完整備份。

### 4. 使用情境

見[第 25 章](../chapters/25-archives-backup.md)的原創資料流程。讀取或寫入的範圍以程式碼註解為準。

### 5. 英文拆解

Compress＝壓縮；Archive＝封存。將明確範圍裝進ZIP，之後仍要還原驗收。

### 6. 指令語法

下列是教學用參數摘要，並非所有參數的完整列表；完整參數組、位置、必要性與管線支援保存在 data/runtime-command-metadata.json。

```text
Compress-Archive -LiteralPath <String[]> -DestinationPath <String> [-CompressionLevel <String>] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### 7. 參數說明

LiteralPath：必要來源之一，字面路徑；DestinationPath：必要ZIP目的地；CompressionLevel：Optimal、Fastest、NoCompression；PassThru：回傳封存檔物件；WhatIf：模擬。Force與Update屬不同參數組，不可當成能一起加的萬用開關。

通用參數另見[參數索引](parameter-reference.md)，同名參數的效果需查命令本身。

### 8. 五類實際範例

下列完整區塊依序標示基礎、進階、實務、故意錯誤與修正。含寫檔的範例只使用自己建立的唯一暫存目錄，結束會實際清理；不要將暫存路徑換成正式資料。

```powershell
$lab = Join-Path ([IO.Path]::GetTempPath()) ('zip-' + [guid]::NewGuid())
try {
    New-Item -ItemType Directory -Path $lab | Out-Null
    $source = Join-Path $lab 'learning.txt'
    Set-Content -LiteralPath $source -Value '臺灣學習資料' -Encoding utf8NoBOM
    $zip = Join-Path $lab 'learning.zip'
    # 基礎：先模擬，沒有建立ZIP
    Compress-Archive -LiteralPath $source -DestinationPath $zip -WhatIf
    # 進階：實際建立並取得封存檔資訊
    Compress-Archive -LiteralPath $source -DestinationPath $zip -CompressionLevel Fastest -PassThru
    # 實務：還原後核對位元組內容
    $restore = Join-Path $lab 'restore'
    Expand-Archive -LiteralPath $zip -DestinationPath $restore
    (Get-FileHash -LiteralPath $source).Hash -eq (Get-FileHash -LiteralPath (Join-Path $restore 'learning.txt')).Hash
    # 常見錯誤：不存在來源；錯誤需回報，不能當空備份成功
    try { Compress-Archive -LiteralPath (Join-Path $lab 'missing.txt') -DestinationPath (Join-Path $lab 'bad.zip') -ErrorAction Stop }
    catch { Write-Verbose $_.Exception.Message -Verbose }
    # 修正：確認已存在的來源，使用另一個新目的地
    Compress-Archive -LiteralPath $source -DestinationPath (Join-Path $lab 'second.zip') -ErrorAction Stop
} finally {
    if (Test-Path -LiteralPath $lab) { Remove-Item -LiteralPath $lab -Recurse -Force }
}
```

### 9. 輸出結果

通常只產生ZIP；PassThru 才回傳檔案物件。完整練習回報的是腳本自行整理的Success/FileCount，不是Compress-Archive本身的標準欄位。

### 10. 常見錯誤

來源不存在、目的地已存在、磁碟空間不足都可能失敗。根目錄與星號來源產生的還原結構不同，先核對來源方式。

### 11. 安全注意事項

寫入ZIP需限定範圍。官方文件列出隱藏檔略過及單檔2GB限制；不代表完整系統備份。目的地放在來源之外；不以Force繞過權限。 本版代表性實測環境為7.6.8/Linux；Windows 5.1與macOS尚未實測。

### 12. 相關 Cmdlet

Expand-Archive、Get-FileHash、Get-ChildItem；查詢入口見[總索引](master-index.md)。

### 13. 記憶技巧

Compress＝壓縮；Archive＝封存。將明確範圍裝進ZIP，之後仍要還原驗收。

### 14. 官方參考資料

[Compress-Archive](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Archive/Compress-Archive.md) — Microsoft；PowerShell 7.6 文件；查閱 2026-10-24。語法與行為檢查範圍另見驗證紀錄，不以代表性測試推定所有參數組皆已測過。

<a id="get-process"></a>

## Get-Process（取得處理程序）

### 1. 指令名稱

Get-Process，取得處理程序；模組Microsoft.PowerShell.Management。

### 2. 學習重要程度

★★★★★：系統管理核心，星級為教材學習順序。

### 3. 功能介紹

查目前程序或指定PID，CPU是累計秒數，不是即時百分比。

### 4. 使用情境

見[第26章](../chapters/26-processes-services.md)。Windows範例及遠端範本不得在缺少平台／授權時照貼執行。

### 5. 英文拆解

Get＝取得；Process＝正在執行的程序。

### 6. 指令語法

以下為教學摘要，完整參數組查官方來源；data/runtime-command-metadata.json將本機可用與缺少命令分開記錄，存在命令不等於該提供者操作已測。

```text
Get-Process -Id <Int32[]> [<CommonParameters>]
```

### 7. 參數說明

Id：精確PID；Name：另一參數組，可接受名稱模式；InputObject：已取得程序物件。Module與FileVersionInfo改變回傳資料種類；IncludeUserName有平台與權限限制。 通用參數見[參數索引](parameter-reference.md)。

### 8. 五類實際範例

下列是獨立教學片段，含刻意錯誤；變數的建立條件如註解所述。除Get-Process本機查詢外，平台與連線未執行限制見第11節。

**基礎**

```powershell
Get-Process -Id $PID
```

**進階**

```powershell
Get-Process -Id $PID | Select-Object Id,ProcessName,WorkingSet64,CPU
```

**實務**

```powershell
Get-Process -Id $PID | Select-Object Id,@{Name='MemoryMB';Expression={[math]::Round($_.WorkingSet64 / 1MB,2)}}
```

**常見錯誤**

```powershell
# 故意查不存在的識別碼，不停止任何程序
Get-Process -Id 2147483647 -ErrorAction Stop
```

**錯誤修正**

```powershell
# 回到已確認屬於目前工作階段的PID
Get-Process -Id $PID -ErrorAction Stop
```

### 9. 輸出結果

Process物件的Id、ProcessName、WorkingSet64及CPU；CPU是累計秒數。

### 10. 常見錯誤

程序可能在查詢間退出；找不到PID不等於權限不足。Name可匹配多筆，避免直接接到廣泛Stop-Process。

### 11. 安全注意事項

只查必要欄位；Module、完整路徑與帳戶資訊可能敏感。Linux僅對目前程序與自建子程序實測。

### 12. 相關 Cmdlet

Start-Process、Stop-Process、Wait-Process；入口見[總索引](master-index.md)。

### 13. 記憶技巧

Get＝取得；Process＝正在執行的程序。

### 14. 官方參考資料

[Get-Process](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Process.md) — Microsoft；查閱2026-10-24。文件查證、語法與平台實測分開記錄。

<a id="get-itemproperty"></a>

## Get-ItemProperty（取得項目屬性）

### 1. 指令名稱

Get-ItemProperty，取得項目屬性；模組Microsoft.PowerShell.Management。

### 2. 學習重要程度

★★★★★：系統管理核心，星級為教材學習順序。

### 3. 功能介紹

在Registry情境讀機碼的值；與列出子機碼不同。

### 4. 使用情境

見[第27章](../chapters/27-windows-registry.md)。Windows範例及遠端範本不得在缺少平台／授權時照貼執行。

### 5. 英文拆解

Get＝取得；Item＝項目；Property＝屬性。Registry值是機碼的屬性。

### 6. 指令語法

以下為教學摘要，完整參數組查官方來源；data/runtime-command-metadata.json將本機可用與缺少命令分開記錄，存在命令不等於該提供者操作已測。

```text
Get-ItemProperty -LiteralPath <String[]> [-Name <String[]>] [<CommonParameters>]
```

### 7. 參數說明

LiteralPath：精確項目路徑，與Path參數組擇一；Name：要取得的屬性名稱；ErrorAction Stop用於區分失敗。不同提供者支援的屬性不同，Credential不能被理解為任意提供者都可替換身分。 通用參數見[參數索引](parameter-reference.md)。

### 8. 五類實際範例

下列是獨立教學片段，含刻意錯誤；變數的建立條件如註解所述。除Get-Process本機查詢外，平台與連線未執行限制見第11節。

**基礎**

```powershell
# 僅Windows；讀目前帳戶Software機碼的屬性
Get-ItemProperty -LiteralPath 'HKCU:\Software'
```

**進階**

```powershell
# labKey須由第27章練習建立且尚未清理
Get-ItemProperty -LiteralPath $labKey -Name RetryCount
```

**實務**

```powershell
Get-ItemProperty -LiteralPath $labKey -Name RetryCount | Select-Object RetryCount
```

**常見錯誤**

```powershell
# 值不是子路徑，此寫法無法取代屬性查詢
Get-Item -LiteralPath ($labKey + '\RetryCount') -ErrorAction Stop
```

**錯誤修正**

```powershell
Get-ItemPropertyValue -LiteralPath $labKey -Name RetryCount -ErrorAction Stop
```

### 9. 輸出結果

Registry情境回傳包含值及PSPath等提供者欄位的物件；不是子機碼清單。

### 10. 常見錯誤

機碼不存在、值不存在、提供者缺少與拒絕存取應分開診斷；不要一律當預設值。

### 11. 安全注意事項

本段Registry情境僅Windows且未實測；不要匯出整個使用者設定樹。命令本身在其他提供者可用不代表Registry也可用。

### 12. 相關 Cmdlet

Get-ItemPropertyValue、New-ItemProperty、Set-ItemProperty、Remove-ItemProperty；入口見[總索引](master-index.md)。

### 13. 記憶技巧

Get＝取得；Item＝項目；Property＝屬性。Registry值是機碼的屬性。

### 14. 官方參考資料

[Get-ItemProperty](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ItemProperty.md) — Microsoft；查閱2026-10-24。文件查證、語法與平台實測分開記錄。

<a id="get-winevent"></a>

## Get-WinEvent（讀取Windows事件）

### 1. 指令名稱

Get-WinEvent，讀取Windows事件；模組Microsoft.PowerShell.Diagnostics。

### 2. 學習重要程度

★★★★★：系統管理核心，星級為教材學習順序。

### 3. 功能介紹

按來源、時間與層級讀事件；查詢失敗不能當零事件。

### 4. 使用情境

見[第28章](../chapters/28-events-system-info.md)。Windows範例及遠端範本不得在缺少平台／授權時照貼執行。

### 5. 英文拆解

Get＝取得；Win＝Windows；Event＝事件。先選記錄來源，再讀事件。

### 6. 指令語法

以下為教學摘要，完整參數組查官方來源；data/runtime-command-metadata.json將本機可用與缺少命令分開記錄，存在命令不等於該提供者操作已測。

```text
Get-WinEvent -FilterHashtable <Hashtable[]> [-MaxEvents <Int64>] [<CommonParameters>]
```

### 7. 參數說明

FilterHashtable：此參數組的必要查詢條件，可含LogName、ProviderName、Id、Level、StartTime、EndTime等支援鍵；MaxEvents：上限；ListLog：不同參數組，用於記錄中繼資料；Oldest：反向時間順序。 通用參數見[參數索引](parameter-reference.md)。

### 8. 五類實際範例

下列是獨立教學片段，含刻意錯誤；變數的建立條件如註解所述。除Get-Process本機查詢外，平台與連線未執行限制見第11節。

**基礎**

```powershell
Get-WinEvent -ListLog Application | Select-Object LogName,RecordCount
```

**進階**

```powershell
Get-WinEvent -FilterHashtable @{LogName='Application';Level=2} -MaxEvents 10
```

**實務**

```powershell
$filter = @{LogName='Application';StartTime=(Get-Date).AddHours(-1)}
Get-WinEvent -FilterHashtable $filter -MaxEvents 50 | Select-Object TimeCreated,ProviderName,Id
```

**常見錯誤**

```powershell
# 只依Id分組會混淆不同提供者
$events | Group-Object Id
```

**錯誤修正**

```powershell
# events由先前成功的查詢提供，仍受MaxEvents上限限制
$events | Group-Object ProviderName,Id
```

### 9. 輸出結果

事件物件可含TimeCreated、ProviderName、Id、Level、RecordId；ListLog回傳記錄設定，兩者不是同一型別。

### 10. 常見錯誤

NoMatchingEventsFound、記錄不存在與Access denied需分開。MaxEvents限制後不能宣稱完整事件總數。

### 11. 安全注意事項

Windows專用，本輪未執行。Message可能有帳戶、路徑或產品資料；本章不清除記錄、不修改ACL。

### 12. 相關 Cmdlet

Get-ComputerInfo、Group-Object、Select-Object；入口見[總索引](master-index.md)。

### 13. 記憶技巧

Get＝取得；Win＝Windows；Event＝事件。先選記錄來源，再讀事件。

### 14. 官方參考資料

[Get-WinEvent](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Diagnostics/Get-WinEvent.md) — Microsoft；查閱2026-10-24。文件查證、語法與平台實測分開記錄。

<a id="test-connection"></a>

## Test-Connection（測試連線）

### 1. 指令名稱

Test-Connection，測試連線；模組Microsoft.PowerShell.Management。

### 2. 學習重要程度

★★★★★：系統管理核心，星級為教材學習順序。

### 3. 功能介紹

以ICMP或支援版本的TCP參數測明確目標；失敗不等於主機關機。

### 4. 使用情境

見[第29章](../chapters/29-network-diagnostics.md)。Windows範例及遠端範本不得在缺少平台／授權時照貼執行。

### 5. 英文拆解

Test＝測試；Connection＝連線。一次測試只回答指定協定及目標的問題。

### 6. 指令語法

以下為教學摘要，完整參數組查官方來源；data/runtime-command-metadata.json將本機可用與缺少命令分開記錄，存在命令不等於該提供者操作已測。

```text
Test-Connection -TargetName <String[]> [-Count <Int32>] [-Quiet] [-TimeoutSeconds <Int32>] [<CommonParameters>]
```

### 7. 參數說明

TargetName：必要目標；Count：次數；Quiet：布林結果；TimeoutSeconds：等待上限；TcpPort：另一參數組測TCP；Detailed：TCP詳細物件，需查版本。5.1與7語法不同。 通用參數見[參數索引](parameter-reference.md)。

### 8. 五類實際範例

下列是獨立教學片段，含刻意錯誤；變數的建立條件如註解所述。除Get-Process本機查詢外，平台與連線未執行限制見第11節。

**基礎**

```powershell
Test-Connection -TargetName 127.0.0.1 -Count 1 -TimeoutSeconds 1
```

**進階**

```powershell
Test-Connection -TargetName 127.0.0.1 -Count 1 -TimeoutSeconds 1 -Quiet
```

**實務**

```powershell
# approvedHost必須是已授權的單一目標，本輪未執行
Test-Connection -TargetName $approvedHost -TcpPort 443 -Count 1 -TimeoutSeconds 3
```

**常見錯誤**

```powershell
# 邏輯錯誤：不能用ICMP成功直接證明HTTPS登入正常
$icmpOk = Test-Connection -TargetName 127.0.0.1 -Count 1 -Quiet
```

**錯誤修正**

```powershell
# 分開記錄各層結果；未測欄位保持null
[pscustomobject]@{Icmp=$icmpOk;Tcp=$null;Tls=$null;Application=$null}
```

### 9. 輸出結果

預設PingStatus；Quiet為布林值。TCP物件與ICMP物件不同；錯誤或工具缺少不能一律化成False。

### 10. 常見錯誤

ICMP失敗不等於關機；TCP成功也不代表TLS或應用程式成功。雲端缺少ping工具的實際錯誤已記錄，未宣稱連線通過。

### 11. 安全注意事項

只測明確核准目標，不以迴圈掃描網段。保留代理、TLS與網路政策；不能為消除錯誤而關閉驗證。

### 12. 相關 Cmdlet

Resolve-DnsName、Test-NetConnection；入口見[總索引](master-index.md)。

### 13. 記憶技巧

Test＝測試；Connection＝連線。一次測試只回答指定協定及目標的問題。

### 14. 官方參考資料

[Test-Connection](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Test-Connection.md) — Microsoft；查閱2026-10-24。文件查證、語法與平台實測分開記錄。

<a id="get-ciminstance"></a>

## Get-CimInstance（取得CIM實例）

### 1. 指令名稱

Get-CimInstance，取得CIM實例；模組CimCmdlets。

### 2. 學習重要程度

★★★★★：系統管理核心，星級為教材學習順序。

### 3. 功能介紹

唯讀取得管理實例快照；本版命令Windows專用。

### 4. 使用情境

見[第30章](../chapters/30-cim-remote-management.md)。Windows範例及遠端範本不得在缺少平台／授權時照貼執行。

### 5. 英文拆解

Get＝取得；CIM＝通用資訊模型；Instance＝類別的實例。

### 6. 指令語法

以下為教學摘要，完整參數組查官方來源；data/runtime-command-metadata.json將本機可用與缺少命令分開記錄，存在命令不等於該提供者操作已測。

```text
Get-CimInstance -ClassName <String> [-Filter <String>] [-Property <String[]>] [-CimSession <CimSession[]>] [<CommonParameters>]
```

### 7. 參數說明

ClassName：必要類別名稱之一，Query是另一查詢形式；Filter：WQL條件；Property：選屬性；Namespace：命名空間；CimSession或ComputerName：目標連線。不要把PowerShell區塊當WQL。 通用參數見[參數索引](parameter-reference.md)。

### 8. 五類實際範例

下列是獨立教學片段，含刻意錯誤；變數的建立條件如註解所述。除Get-Process本機查詢外，平台與連線未執行限制見第11節。

**基礎**

```powershell
Get-CimInstance -ClassName Win32_OperatingSystem -Property Caption,Version
```

**進階**

```powershell
Get-CimInstance -ClassName Win32_Process -Filter ('ProcessId = {0}' -f $PID) -Property ProcessId,Name
```

**實務**

```powershell
# session由第30章的核准遠端範本建立
Get-CimInstance -CimSession $session -ClassName Win32_OperatingSystem -Property Caption,Version | Select-Object Caption,Version
```

**常見錯誤**

```powershell
# 故意錯誤的WQL：-eq是PowerShell運算子，不是這裡的WQL比較
Get-CimInstance -ClassName Win32_Process -Filter 'ProcessId -eq 1' -ErrorAction Stop
```

**錯誤修正**

```powershell
Get-CimInstance -ClassName Win32_Process -Filter ('ProcessId = {0}' -f $PID) -Property ProcessId,Name
```

### 9. 輸出結果

CimInstance快照，不是持續更新的監視器。Win32_OperatingSystem的Caption、Version等依目標實機而異。

### 10. 常見錯誤

查無實例、類別缺少、命名空間錯誤與連線授權失敗應分開記錄。Get-WmiObject舊腳本不能只改名而不查回傳型別。

### 11. 安全注意事項

本版CimCmdlets僅Windows，遠端範例未執行；不把合成PSCustomObject當整合測試，不執行修改或重新開機方法。

### 12. 相關 Cmdlet

New-CimSession、New-CimSessionOption、Remove-CimSession；入口見[總索引](master-index.md)。

### 13. 記憶技巧

Get＝取得；CIM＝通用資訊模型；Instance＝類別的實例。

### 14. 官方參考資料

[Get-CimInstance](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Get-CimInstance.md) — Microsoft；查閱2026-10-24。文件查證、語法與平台實測分開記錄。

## 第31–35章內的完整教學

本附錄保留原有20項詳解；全書另有5項章內十四項教學，總計25項。

- [Start-Job](../chapters/31-jobs-parallel-scheduling.md#start-job)
- [Get-FileHash](../chapters/32-security.md#get-filehash)
- [Invoke-RestMethod](../chapters/33-rest-api.md#invoke-restmethod)
- [Get-ADUser](../chapters/34-ad-microsoft365.md#get-aduser)
- [Get-AzResource](../chapters/35-azure-exchange.md#get-azresource)

## 第36–37章完整教學

全書現在27項十四節教學，另有73項僅速查。

- [Get-VM](../chapters/36-infrastructure-services.md#get-vm)
- [Measure-Command](../chapters/37-performance-design.md#measure-command)

第38章Get-LearningCsvReport是教材函式，未計入官方索引。
