<a id="chapter-35"></a>

# 第 35 章：Azure、Exchange 與雲端管理

[返回目錄](../README.md)

## 學習目標

把雲端管理拆成認證、目標情境、授權、查詢與清理；分清Azure資源管理與Exchange Online工作負載。以有限範圍的唯讀查詢設計報表，不把成功登入當成已選對訂用帳戶或已具足夠權限。

## 先建立目標情境

Azure的Tenant（租戶）與Subscription（訂用帳戶）是不同層次；Resource Group（資源群組）是管理資源的容器，不是額外的租戶。Az模組管理Azure資源，ExchangeOnlineManagement模組管理Exchange Online；兩者不共用一個能代表所有服務授權成功的連線。

執行前記錄模組與PowerShell版本、雲端環境、租戶、訂用帳戶、資源群組或工作負載，以及授權角色。Azure RBAC（角色型存取控制）依作用範圍授予權限；資源查詢成功也不能代表能讀取所有資料平面內容，例如儲存體內的物件資料。

以下認證與服務查詢範例均為**未執行範本**，本環境未設定Azure／Exchange帳戶，不發起互動登入、不建立應用程式或角色指派。各模組版本須在目標環境另行記錄與驗證，不能把原始碼文件快照當成已安裝模組。

<a id="get-azresource"></a>

## 主要指令教學

### 1. 名稱

Get-AzResource（取得Azure資源），Az.Resources模組。

### 2. 重要程度

雲端盤點常用；必須先理解目標情境與RBAC。

### 3. 功能

查詢Azure資源管理資訊。此命令不是所有服務內部資料的通用讀取器。

### 4. 使用情境

核准訂用帳戶與資源群組內的資源清單，作為維運報表的輸入；不建立、修改或刪除資源。

### 5. 英文拆解

Az指Azure，Resource是資源。先確定「在哪個訂用帳戶」，再問「有什麼資源」。

### 6. 語法

本章使用Get-AzResource -ResourceGroupName 名稱；也可依ResourceId或ResourceType查詢，實際參數組以目標模組版本的Get-Command與官方文件為準。

### 7. 主要參數

| 參數 | 功能 | 注意 |
|---|---|---|
| -ResourceGroupName | 限定群組 | 部分查詢支援萬用字元，不能把任意輸入當精確範圍 |
| -ResourceType | 限定資源類型 | 必須使用正確的供應者／類型名稱 |
| -ResourceId | 指定資源識別碼 | 需確認訂用帳戶與完整路徑 |
| -DefaultProfile | 指定使用的認證情境 | 依模組與命令支援檢查 |

### 8. 五類範例

**基本：在已核准且確認的情境中查詢單一群組。** 未執行：

```powershell
Get-AzResource -ResourceGroupName 'rg-learning' -ErrorAction Stop |
    Select-Object ResourceId, Name, ResourceType, Location
```

預期是資源清單或合法的空集合；本章沒有虛構資源數量。失敗必須保留為失敗，不能當空集合。

**參數化：先驗證受控群組名稱。** 僅定義與查詢範本，未執行：

```powershell
$group = 'rg-learning'
if ($group -notmatch '^rg-[a-z0-9-]+$') { throw '不在教材允許的群組命名範圍' }
Get-AzResource -ResourceGroupName $group -ErrorAction Stop
```

這是教材較嚴的白名單，不是Azure所有合法命名的完整規格。不要把它當成供應者通用驗證器。

**實務：固定欄位輸出。** 未執行：

```powershell
$resources = @(Get-AzResource -ResourceGroupName 'rg-learning' -ErrorAction Stop)
$resources | Sort-Object ResourceId |
    Select-Object ResourceId, Name, ResourceType, Location
```

先取得資料再整理；不要先Format-Table再Export-Csv，那會匯出格式物件而不是原始欄位。

**錯誤示範與修正：只看顯示名稱。** 本機合成資料，未呼叫雲端：

```powershell
$sample = @(
    [pscustomobject]@{Id='/subscriptions/S1/resourceGroups/rg-a/providers/Learning/items/demo';Name='demo';Type='Learning/items'}
    [pscustomobject]@{Id='/subscriptions/S1/resourceGroups/rg-b/providers/Learning/items/demo';Name='demo';Type='Learning/items'}
)
# 相同名稱不表示同一資源；修正為保留完整Id
$sample | Select-Object Id, Name, Type
```

預期兩列名稱相同、Id不同；只用Name去重會錯誤丟掉一筆。

**進階：按類型彙總合成資料。** 與上一區塊可獨立執行：

```powershell
$sample = @(
    [pscustomobject]@{Type='Learning/items'}
    [pscustomobject]@{Type='Learning/items'}
    [pscustomobject]@{Type='Learning/reports'}
)
$sample | Group-Object Type | Sort-Object Name | Select-Object Name, Count
```

預期Learning/items=2、Learning/reports=1。只證明彙總邏輯，不代表Azure資源提供者存在或帳戶已獲授權。

### 9. 輸出判讀

Name不是全雲端唯一識別碼，盤點應保留ResourceId、資源類型、範圍與查詢時間。資源管理回應不保證包含每個服務的所有內部屬性，需使用服務專屬命令查必要內容。

### 10. 常見錯誤

找不到命令先查Az.Resources；清單不符預期先查目前Tenant／Subscription／Environment；拒絕存取查角色與作用範圍。不要用Owner高權限處理所有讀取問題，也不要自動切到任何可用訂用帳戶。

### 11. 安全提醒

唯讀清單仍可能揭露架構與標籤資料。避免直接匯出所有Tags、認證情境或完整錯誤本文；先明確定義報表欄位及資料存取對象。

### 12. 相關指令

Connect-AzAccount建立認證情境，Get-AzContext檢查目前情境；服務專屬查詢和Exchange Online連線有不同權限模型。

### 13. 記憶技巧

「身分、租戶、訂閱、範圍、資料」逐層確認，不只看到登入成功就開始盤點。

### 14. 官方來源

Connect-AzAccount與Get-AzResource使用Azure官方原始碼倉庫內固定文件快照，Exchange命令使用Microsoft文件倉庫；版本與未實測範圍見本章末。

## Azure認證範本與清理責任

下列使用隔離PowerShell工作階段，示意明確指定租戶與訂用帳戶並檢查情境。範例GUID皆是占位值，必須替換成核准目標；本章未執行。

```powershell
$tenant = '00000000-0000-0000-0000-000000000000'
$subscription = '11111111-1111-1111-1111-111111111111'
try {
    Connect-AzAccount -Tenant $tenant -Subscription $subscription -Scope Process -ErrorAction Stop | Out-Null
    $context = Get-AzContext
    if ($null -eq $context -or $context.Tenant.Id -ne $tenant -or
        $context.Subscription.Id -ne $subscription) { throw '情境不符核准目標' }
    Get-AzResource -ResourceGroupName 'rg-learning' -ErrorAction Stop |
        Select-Object ResourceId, Name, ResourceType
} finally {
    Disconnect-AzAccount -Scope Process -ErrorAction SilentlyContinue | Out-Null
}
```

Process範圍限定本次情境修改，不表示雲端所有權杖已被全域撤銷；Disconnect也不代表撤銷應用程式權限。隔離工作階段可避免清理動作干擾既有工作。正式無人值守任務應依平台支援選用受控識別、工作負載身分或組織核准的憑證流程，不把互動登入腳本原封不動放進排程。

## Exchange Online：另一個工作負載

Connect-ExchangeOnline使用ExchangeOnlineManagement模組與現代認證。Graph登入或Azure登入成功，不代表Exchange管理角色已授權。讀取信箱清單仍需適當角色，不能以「只讀」忽略權限與個資責任。

以下為未執行範本。核准的UPN與信箱地址需由使用者環境提供；使用隔離工作階段，避免斷開既有Exchange連線。

```powershell
$adminUpn = 'operator@example.test'
$mailbox = 'learning@example.test'
if ([string]::IsNullOrWhiteSpace($mailbox) -or $mailbox.Contains('*')) {
    throw '必須明確指定核准信箱'
}
try {
    Connect-ExchangeOnline -UserPrincipalName $adminUpn -ErrorAction Stop
    Get-EXOMailbox -Identity $mailbox -ErrorAction Stop |
        Select-Object DisplayName, PrimarySmtpAddress, ExternalDirectoryObjectId
} finally {
    Disconnect-ExchangeOnline -Confirm:$false -ErrorAction SilentlyContinue
}
```

官方Get-EXOMailbox的Identity文件特別警告：null或不存在的值可能導致取得所有物件。**本章範本只先阻擋空白與星號，不保證非空但不存在的地址一定不擴大結果**。正式程式必須在核准環境採用適當的精確查詢策略，驗證回傳數量與身分都符合原先核准的信箱；不符時停止處理，不自動匯出或繼續變更。本章不執行匯出、郵件搜尋、信箱修改或寄送。

## 雲端自動化的最佳實踐

先將認證、目標驗證、查詢、轉換、輸出與清理分層；只對暫時性錯誤做有限重試。跨訂用帳戶或跨租戶盤點需有明確清單與每個範圍的成功／失敗結果，不能把部分成功當全量成功。建立或刪除雲端資源可能產生費用與中斷，本章沒有執行這些操作，也沒有拿WhatIf當成本預測或授權驗證。

## 速查表

| 需求 | 方法 | 必要檢查 |
|---|---|---|
| Azure登入 | Connect-AzAccount | 核准Tenant／Subscription |
| 情境驗收 | Get-AzContext | 不符目標立即停止 |
| 資源清單 | Get-AzResource | 限定群組與欄位 |
| Exchange登入 | Connect-ExchangeOnline | 工作負載角色另行驗證 |
| 信箱查詢 | Get-EXOMailbox | 防範空白／不存在Identity擴大查詢 |

## 練習題

1. Tenant與Subscription是同一層嗎？
2. Resource Group是另一個租戶嗎？
3. Az與Exchange模組連線可互相取代嗎？
4. 登入成功代表已選對訂用帳戶嗎？
5. Get-AzResource可以讀取所有儲存體內容嗎？
6. ResourceGroupName可不驗證任意輸入嗎？
7. Name可當全域唯一鍵嗎？
8. 為何保留ResourceId？
9. Format-Table後匯出CSV有何問題？
10. 合成資料彙總預期兩種類型的數量？
11. 遇到情境不符應自動切到任何可用訂閱嗎？
12. Process範圍代表所有權杖已全域撤銷嗎？
13. Disconnect等於移除應用程式權限嗎？
14. 排程可直接沿用需要互動的登入流程嗎？
15. Graph登入代表Exchange管理授權嗎？
16. Get-EXOMailbox空白Identity可能有何風險？
17. 只檢查非空就完全安全嗎？
18. 唯讀雲端盤點需要保護輸出嗎？
19. 跨範圍部分失敗可標全量成功嗎？
20. WhatIf能當成本預測與授權驗證嗎？

## 參考答案與解題思路

1. 不是；租戶與訂用帳戶是不同管理層次。
2. 不是；它是訂用帳戶內管理資源的容器。
3. 不能；服務、模組與授權模型不同。
4. 不代表；需核對Tenant、Subscription與Environment。
5. 不能；資源管理資訊與資料平面權限不同。
6. 不應；萬用字元可能擴大範圍，需核准並驗證。
7. 不能；不同群組或範圍可能同名。
8. 保留完整識別與範圍，避免依名稱誤合併。
9. 會取得格式物件；先Select-Object整理原始欄位。
10. Learning/items為2、Learning/reports為1，僅測本機合成資料。
11. 不應；應停止並回報，避免盤點錯誤範圍。
12. 不代表；作用範圍與全域權杖撤銷不同。
13. 不等於；應用程式授權需另行管理。
14. 不適合；需平台支援的非互動認證與最小權限。
15. 不代表；Exchange工作負載的角色需另驗證。
16. 可能擴大到所有物件；應先拒絕空值並驗收實際結果。
17. 不夠；不存在的非空值也需防範，核對數量與身分。
18. 需要；可能包含架構、資源與個資。
19. 不可；每個目標範圍分別記錄完整性與失敗。
20. 不能；它不是計費估算器，也不能取代權限與實際執行驗收。

## 參考資料與延伸閱讀

- [Connect-AzAccount](https://github.com/Azure/azure-powershell/blob/d316163acc7852f89f81a4ca332dc82f65e13b68/src/Accounts/Accounts/help/Connect-AzAccount.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [Get-AzResource](https://github.com/Azure/azure-powershell/blob/d316163acc7852f89f81a4ca332dc82f65e13b68/src/Resources/Resources/help/Get-AzResource.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [Connect-ExchangeOnline](https://github.com/MicrosoftDocs/office-docs-powershell/blob/76520496eb2c92838db597bea9cdd8b6d21e36b0/exchange/exchange-ps/ExchangePowerShell/Connect-ExchangeOnline.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [Get-EXOMailbox](https://github.com/MicrosoftDocs/office-docs-powershell/blob/76520496eb2c92838db597bea9cdd8b6d21e36b0/exchange/exchange-ps/ExchangePowerShell/Get-EXOMailbox.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。

## 驗證狀態

已完成教材使用段落的官方來源查讀；語法、實際測試、文件產出分層紀錄見[驗證紀錄](../../progress/VALIDATION.md)。企業登入、帳戶／權限與Windows管理未執行；合成資料不代表遠端整合成功。
