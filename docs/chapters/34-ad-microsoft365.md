<a id="chapter-34"></a>

# 第 34 章：Active Directory 與 Microsoft 365

[返回目錄](../README.md)

## 學習目標

區分地端AD DS（Active Directory網域服務）、Microsoft Entra ID（雲端身分服務）與Microsoft 365工作負載；選擇正確模組、租戶與查詢範圍，先建立最小資料需求，再進行唯讀盤點。不把雲端登入當成地端網域管理授權。

## 身分資料在哪裡

地端AD使用網域、OU（組織單位）、DN（辨別名稱）、SID（安全識別碼）等概念。Entra ID使用Tenant（租戶）與雲端物件識別碼；Microsoft 365還包括Exchange等不同工作負載。同步身分可能跨系統對應，但不保證SamAccountName、UPN（使用者主體名稱）與郵件地址永遠相同，也不應以顯示名稱作唯一鍵。

ActiveDirectory模組通常需Windows與適當RSAT／伺服器管理工具、可達的網域服務及授權；安裝PowerShell7不會自動提供它。Microsoft Graph PowerShell SDK則有自己的模組、API權限與認證流程。安裝模組、成功登入與取得資料是三個不同驗收階段。

<a id="get-aduser"></a>

## 主要指令教學

### 1. 名稱

Get-ADUser（取得AD使用者），ActiveDirectory模組。

### 2. 重要程度

Windows網域管理必學；只在有核准環境與權限時實測。

### 3. 功能

依Identity查一個使用者，或使用Filter／LDAPFilter查多個物件。預設只取部分屬性，額外屬性應以Properties指定。

### 4. 使用情境

核准OU中的唯讀帳號盤點。正式大量匯出前需確認查詢範圍、個資用途、存放權限與保留期限。

### 5. 英文拆解

AD指Active Directory，User是使用者；先問「哪個目錄、哪個物件」。

### 6. 語法

本章使用Get-ADUser -Identity 識別碼，或Get-ADUser -Filter 查詢字串 -SearchBase DN。Identity與Filter是不同查詢形式，不能隨意混成同一參數組。

### 7. 主要參數

| 參數 | 用途 | 注意 |
|---|---|---|
| -Identity | 指定單一物件 | 支援DN、GUID、SID、SAM名稱等官方格式 |
| -Filter | AD查詢條件 | 不是任意PowerShell程式 |
| -LDAPFilter | LDAP查詢字串 | 與Filter語法不同 |
| -SearchBase | 查詢起點DN | OU範圍要核准 |
| -Properties | 額外屬性 | 避免無目的的星號全取 |
| -Server | 目標網域服務 | 需先確認目標與連線 |

### 8. 五類範例

下列前四個查詢皆為**未執行的Windows網域範本**。learn.user、OU與伺服器是示意值，不能直接用於真實目錄。所有範例只查詢，不建立、停用或刪除帳號。

**基本：查一個核准帳號。**

```powershell
Get-ADUser -Identity 'learn.user' -ErrorAction Stop |
    Select-Object ObjectGUID, SamAccountName, Enabled
```

輸出以實際物件為準；查不到或無權限應區分記錄，不填入虛構使用者。

**參數化：只取必要屬性。**

```powershell
Get-ADUser -Identity 'learn.user' -Properties mail -ErrorAction Stop |
    Select-Object ObjectGUID, SamAccountName, mail
```

mail為空不等於查詢失敗；它也不是所有服務的權威唯一識別碼。

**實務：限定核准OU的啟用帳號。**

```powershell
Get-ADUser -Filter 'Enabled -eq $true' `
    -SearchBase 'OU=Learning,DC=example,DC=test' -Properties mail -ErrorAction Stop |
    Select-Object ObjectGUID, SamAccountName, mail
```

Filter中的布林條件是AD篩選語言；外層單引號保留查詢文字，不在父工作階段先展開。實際盤點還需記錄目標、時間及完整性。

**錯誤示範與修正：AD Filter不是Where-Object。** 以下只保存兩種字串，不送出錯誤查詢。

```powershell
$wrong = '$_.Enabled -eq $true'
$correct = 'Enabled -eq $true'
[pscustomobject]@{ Wrong=$wrong; Correct=$correct }
```

不要把Where-Object中的$_語法直接貼入AD查詢。任意使用者文字也不能未驗證地串進Filter或LDAPFilter；應以固定查詢與核准識別碼為主。

**進階：只在本機整理合成盤點資料。**

```powershell
$sample = @(
    [pscustomobject]@{Id='A1';Enabled=$true;Mail='a@example.test'}
    [pscustomobject]@{Id='A2';Enabled=$false;Mail=$null}
)
$sample | Where-Object Enabled | Select-Object Id, Mail
```

預期僅A1。這只測篩選與欄位整理，不代表Get-ADUser、LDAP或帳戶權限成功。

### 9. 輸出判讀

先檢查物件識別碼，再檢查需要的屬性是否確實要求並回傳。顯示畫面缺少欄位可能是預設格式或Properties未指定，不能直接宣稱目錄裡沒有資料。

### 10. 常見錯誤

找不到命令先查模組／平台；找不到物件查Identity與Server；權限拒絕查讀取權；Filter失敗查語法。不要以管理員重跑所有問題，也不要把例外吃掉後輸出空CSV。

### 11. 安全提醒

唯讀盤點仍可能曝露個資與組織結構。不要匯出完整屬性當預設，也不向未授權對象分享帳號清單。Get命令不是任何資料範圍都自動核准。

### 12. 相關指令

Get-ADGroup等屬於地端目錄管理；Microsoft Graph的使用者命令屬於另一服務與權限模型，不是Get-ADUser的直接替代名稱。

### 13. 記憶技巧

「地端看網域，雲端看租戶；先確認身分，再確認範圍。」

### 14. 官方來源

本章使用Windows Server2025版Get-ADUser文件及Graph SDK認證文件固定快照；模組實際版本仍須於目標環境記錄，未宣稱所有PowerShell7／RSAT組合已相容實測。

## Microsoft Graph：認證與同意不是同一件事

Delegated（委派）模式代表應用程式以登入使用者情境操作，還受委派權限、使用者角色與服務規則限制。App-only（僅應用程式）模式則由應用程式身分操作，需適當應用程式權限與管理員同意；不是把互動登入拿掉就自動可用。

Connect-MgGraph的Scopes要求不是「任何使用者都能自行授予」。應從實際API需要的最小權限開始，不為了方便要求讀寫整個目錄。不要在教材執行時發起租戶登入或要求管理員同意。

以下為**未執行的互動認證範本**，只示範登入使用者自身資料的User.Read範圍，沒有宣稱能盤點全租戶。先核准目標Tenant與應用程式，再於隔離工作階段操作；本章不執行此範本。

```powershell
$tenantId = '00000000-0000-0000-0000-000000000000' # 替換為核准租戶
try {
    Connect-MgGraph -TenantId $tenantId -Scopes 'User.Read' -ContextScope Process -ErrorAction Stop
    Get-MgContext | Select-Object TenantId, ClientId, AuthType, ContextScope
} finally {
    Disconnect-MgGraph -ErrorAction SilentlyContinue | Out-Null
}
```

Get-MgContext只檢查目前認證情境，不代表後續API都獲授權。Process範圍降低跨工作階段殘留的混淆，但不能當作秘密保管庫。finally會斷開該工作階段連線，故應使用隔離工作階段，避免干擾既有工作。

## 報表、錯誤與最佳實踐

分頁與限流依Graph API契約處理；只收到第一頁不能標成完整全租戶盤點。地端與雲端資料比對需明確的對應規則；缺mail、帳號未同步、停用狀態差異與刪除延遲都是需單獨驗收的狀態，不直接判定成同一個問題。

先寫報表結構與匿名測試資料，再於核准環境取得最小資料。保存目標租戶／網域、查詢、時間、成功／失敗、資料是否完整；不保存Token與全部個資。匯出CSV給試算表使用時，還需評估公式注入與資料消費端的處理方式。

## 速查表

| 需求 | 工具 | 前置條件 |
|---|---|---|
| 地端帳號查詢 | Get-ADUser | Windows、模組、網域與讀取權 |
| 額外屬性 | -Properties | 最小必要欄位 |
| 限定目錄 | -SearchBase | 核准DN |
| Graph登入 | Connect-MgGraph | 核准租戶、應用程式與權限 |
| 查登入情境 | Get-MgContext | 不等於API授權驗證 |

## 練習題

1. AD DS與Entra ID是同一套服務嗎？
2. UPN、mail與SamAccountName必然相同嗎？
3. 顯示名稱可當唯一鍵嗎？
4. PowerShell7自動包含ActiveDirectory模組嗎？
5. Identity與Filter用途差異？
6. 額外的mail欄位如何要求？
7. SearchBase控制什麼？
8. Filter可直接使用$_語法嗎？
9. Filter與LDAPFilter語法一樣嗎？
10. mail空值就代表查詢失敗嗎？
11. 本機合成資料通過能證明AD查詢成功嗎？
12. 登入成功就有全租戶讀取權嗎？
13. 委派與僅應用程式模式差異？
14. Scopes要求是否等於同意已授予？
15. User.Read範本證明可以盤點全租戶嗎？
16. Get-MgContext證明每個API都有權限嗎？
17. 為何使用隔離工作階段？
18. 第一次回應一定包含全部使用者嗎？
19. 唯讀盤點是否仍需個資控管？
20. 查詢失敗時輸出空CSV當正常有何問題？

## 參考答案與解題思路

1. 不是；服務、識別碼與權限模型不同。
2. 不必然；比對需明確規則，不能只依名稱猜測。
3. 不適合；可能重複或改名，應使用適當穩定識別碼。
4. 不會；需另外的工具、平台與目錄環境。
5. Identity查單一物件，Filter查符合條件的物件集合。
6. 以Properties明確要求mail，避免不必要的全屬性讀取。
7. AD查詢起點DN；需先核准範圍。
8. 不可照搬Where-Object的$_；需使用AD篩選語言。
9. 不一樣；LDAP有自己的表達式與轉義規則。
10. 不代表；可能本來就沒有值，需區分錯誤與合法缺值。
11. 不能；只證明本機篩選與資料整理。
12. 不代表；認證與服務授權不同。
13. 委派以使用者情境操作；僅應用程式用應用程式身分與權限。
14. 不等於；還受同意政策、角色與管理員核准影響。
15. 不能；它僅示範自身資料範圍的認證。
16. 不能；仍須對目標API進行實際授權驗證。
17. 避免斷開或混淆既有連線、租戶與身分。
18. 不一定；需依分頁契約取得完整資料並標記完整性。
19. 需要；帳號與組織結構仍可能敏感。
20. 會把失敗誤判成零筆資料，導致錯誤盤點與決策。

## 參考資料與延伸閱讀

- [Get-ADUser](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/ActiveDirectory/Get-ADUser.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [Connect-MgGraph](https://github.com/microsoftgraph/msgraph-sdk-powershell/blob/f85309cb3f770a1583ddc3bd7522f14d23e4a7d0/src/Authentication/docs/Connect-MgGraph.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [authentication](https://github.com/microsoftgraph/msgraph-sdk-powershell/blob/f85309cb3f770a1583ddc3bd7522f14d23e4a7d0/docs/authentication.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。

## 驗證狀態

已完成教材使用段落的官方來源查讀；語法、實際測試、文件產出分層紀錄見[驗證紀錄](../../progress/VALIDATION.md)。企業登入、帳戶／權限與Windows管理未執行；合成資料不代表遠端整合成功。
