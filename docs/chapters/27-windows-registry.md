<a id="chapter-27"></a>

# 第 27 章：Windows Registry：機碼與值

[返回目錄](../README.md)

## 學習目標

分辨 Registry（登錄）的 Key（機碼）與 Value（值），選擇 Item 或 ItemProperty 命令；在隔離 Windows 的自建 HKCU 練習機碼測型別、預覽與清理，不修改系統設定。

## 階層的成員是機碼，值是機碼的屬性

Registry 提供者只存在於 Windows。`HKCU:` 映射目前使用者的 HKEY_CURRENT_USER，`HKLM:` 映射 HKEY_LOCAL_MACHINE。排程帳戶、服務帳戶與互動使用者可能不同，HKCU 不一定是你以為的那位桌面使用者。

`Get-Item` 取得機碼；`Get-ChildItem` 列子機碼；`Get-ItemProperty` 讀取機碼的值；`Get-ItemPropertyValue` 直接取指定值內容。不能用 `Test-Path HKCU:\Software\SomeKey\SomeValue` 當成一般值的存在性檢查，因為值不是下一層路徑項目。

```powershell
if ($env:OS -ne 'Windows_NT') { throw 'Registry 提供者需要 Windows' }
Get-PSDrive -PSProvider Registry | Select-Object Name, Root
Get-Item -LiteralPath 'HKCU:\Software' | Select-Object Name
```

這是唯讀觀察，輸出依目前帳戶而異，不應照抄機器名稱或帳戶資訊。本雲端為 Linux，這段只完成語法與來源查證。

## 型別是資料契約

| Registry 型別 | PowerShell建立時的PropertyType | 常見用途 |
|---|---|---|
| REG_SZ | String | 一般字串 |
| REG_EXPAND_SZ | ExpandString | 可展開環境變數的字串 |
| REG_DWORD | DWord | 32位元數值 |
| REG_QWORD | QWord | 64位元數值 |
| REG_MULTI_SZ | MultiString | 多個字串 |
| REG_BINARY | Binary | 位元組資料 |

型別名稱不代表你可以任意改應用程式的設定。某個程式期望 DWORD 的值，寫成文字「1」可能得到不同效果。查詢既有資料時先確認值種類與應用程式規格，不依畫面看起來相同就認定型別相同。

## 隔離練習：只操作新建立的HKCU機碼

下列完整區塊**僅供隔離 Windows**；它會真實建立、修改並刪除自己唯一的練習機碼。HKCU通常不需系統管理員，但組織原則仍可能限制。不要替換成HKLM或既有產品機碼。

```powershell
if ($env:OS -ne 'Windows_NT') { throw '此練習需要 Windows' }
$labKey = 'HKCU:\Software\PowerShellHandbookLab-' + [guid]::NewGuid()
$created = $false
try {
    New-Item -Path $labKey -ErrorAction Stop | Out-Null
    $created = $true
    New-ItemProperty -LiteralPath $labKey -Name 'RetryCount' -PropertyType DWord -Value 3 -ErrorAction Stop | Out-Null
    Get-ItemPropertyValue -LiteralPath $labKey -Name 'RetryCount' -ErrorAction Stop
    (Get-Item -LiteralPath $labKey).GetValueKind('RetryCount')
    Set-ItemProperty -LiteralPath $labKey -Name 'RetryCount' -Value 5 -WhatIf
    Get-ItemPropertyValue -LiteralPath $labKey -Name 'RetryCount'
    Set-ItemProperty -LiteralPath $labKey -Name 'RetryCount' -Value 5 -ErrorAction Stop
    Get-ItemPropertyValue -LiteralPath $labKey -Name 'RetryCount'
    Remove-ItemProperty -LiteralPath $labKey -Name 'RetryCount' -ErrorAction Stop
    Test-Path -LiteralPath $labKey
} finally {
    if ($created -and (Test-Path -LiteralPath $labKey)) {
        Remove-Item -LiteralPath $labKey -Recurse -Force -ErrorAction Stop
    }
}
```

按文件預期依序看到3、DWord、WhatIf訊息、3、5、True。最後的True表示移除「值」後「機碼」仍存在；finally才刪除此機碼。這是預期輸出說明，**本輪沒有Windows實測**。

`$created` 只在建立成功後設為True，清理不應在未成功取得範圍時誤刪既有目標。唯一名稱降低衝突，不是對惡意並行程序的安全隔離保證。正式變更須使用組織核准流程與適當權限邊界。

## 不要混淆機碼不存在與值不存在

```powershell
# 僅Windows；labKey由上一個練習的建立階段提供
try {
    $value = Get-ItemPropertyValue -LiteralPath $labKey -Name 'OptionalValue' -ErrorAction Stop
    [pscustomobject]@{Found=$true;Value=$value}
} catch {
    # 此處保留錯誤；正式程式應辨識缺值、缺機碼與拒絕存取
    Write-Error -ErrorRecord $_
}
```

這是錯誤處理片段，不應在完整練習已清理後直接執行。不要把所有例外都轉成「值不存在」，否則拒絕存取、提供者不存在與路徑拼錯會被掩蓋。需要預設值時，僅針對已確認的缺值情況套用預設。

## 備份、復原與32／64位元檢視

修改正式值前至少記錄原值、型別、是否原本不存在、所用帳戶與程序位元數。只有匯出文字並不等於完整保存機碼權限，也不保證匯入能回復所有相關應用程式狀態。登錄變更可能被原則、服務或應用程式快取覆寫，必要時需依該產品文件驗證生效。

在64位元Windows，32位元與64位元程序看到的部分登錄檢視可能不同。先確認 `[Environment]::Is64BitProcess`；不要隨意把Wow6432Node硬編碼到所有路徑。本章沒有實測登錄重新導向、遠端Registry或權限復原。

## 常見錯誤與最佳實踐

New-Item建立機碼，New-ItemProperty建立值；Remove-ItemProperty只刪值，Remove-Item -Recurse刪機碼及子機碼。命令名稱只差Property，影響範圍可能差很多。Force不等於取得權限，WhatIf也不是備份。

查詢時使用精確LiteralPath並選必要欄位，避免把整個使用者設定樹匯出。不要把Registry當成明文密碼儲存處；這裡不要求繞過ACL、關閉安全功能或修改開機／登入設定。

## 速查表

| 需求 | 命令 | 範圍 |
|---|---|---|
| 機碼本身 | Get-Item | RegistryKey |
| 機碼內的值 | Get-ItemProperty | 值及提供者屬性 |
| 單一值內容 | Get-ItemPropertyValue | 回傳值本身 |
| 建立有型別的值 | New-ItemProperty -PropertyType | 明確String／DWord等 |
| 移除值／機碼 | Remove-ItemProperty／Remove-Item | 不可混用 |

## 練習題

1. Registry提供者在哪個平台？
2. HKCU對應哪個帳戶？
3. HKLM代表什麼？
4. Key與Value有何不同？
5. 如何列出子機碼？
6. Get-ItemPropertyValue回傳什麼？
7. 為何Test-Path不能把值當子路徑查？
8. REG_DWORD對應哪個PropertyType？
9. 字串1與DWORD1一定相同嗎？
10. 練習機碼為何放HKCU且使用GUID？
11. New-Item與New-ItemProperty差異？
12. GetValueKind的用途？
13. WhatIf後RetryCount預期多少？
14. 真正修改後RetryCount預期多少？
15. 刪除RetryCount後機碼是否還在？
16. created旗標為何在建立成功後才設定？
17. 拒絕存取可以一律當值不存在嗎？
18. 正式修改前至少保存什麼？
19. 32／64位元程序可能看到不同內容嗎？
20. Force或WhatIf可以取代備份嗎？

## 參考答案與解題思路

1. Windows；Linux沒有HKCU與HKLM提供者。

2. 執行目前程序的使用者，不一定是桌面互動使用者。

3. HKEY_LOCAL_MACHINE，機器範圍的登錄區。

4. 機碼形成階層，值是機碼的屬性。

5. Get-ChildItem，並限制精確路徑。

6. 指定值的內容，與機碼物件不同。

7. 值不是Registry階層中的獨立子項目。

8. DWord，表示32位元值。

9. 不相同，應遵循應用程式要求的型別。

10. 限定為目前帳戶新建範圍並降低名稱衝突。

11. 前者建立機碼，後者建立機碼內的值。

12. 查值的Registry型別。

13. 仍為3，因為沒有執行修改。

14. 5；本輪為文件預期，Windows未實測。

15. 仍在，Remove-ItemProperty只刪值。

16. 避免未建立成功時仍進行不適當的清理。

17. 不能，必須區分錯誤種類。

18. 原值、型別、原本是否存在、帳戶與程序位元數，並有核准的復原流程。

19. 部分登錄檢視可能不同，需確認程序位元數及官方重新導向規則。

20. 不可以；Force不提升權限，WhatIf只預覽受支援動作。

## 參考資料與延伸閱讀

- [about_Registry_Provider](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Registry_Provider.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Get-ItemProperty](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ItemProperty.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Get-ItemPropertyValue](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ItemPropertyValue.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [New-ItemProperty](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/New-ItemProperty.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Set-ItemProperty](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-ItemProperty.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Remove-ItemProperty](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Remove-ItemProperty.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。

## 驗證狀態

本章全部Registry操作未執行；已完成官方使用段落查證與語法解析。Linux合成資料不能替代Registry提供者行為。 詳見[驗證紀錄](../../progress/VALIDATION.md)。
