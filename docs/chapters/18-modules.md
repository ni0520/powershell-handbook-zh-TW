<a id="chapter-18"></a>

# 第 18 章：模組管理與依賴邊界

[返回目錄](../README.md)

## 學習目標

分辨已安裝、已載入與已支援的模組，使用明確版本，理解卸載工作階段與移除套件的差別。

## Module（模組）是可重用功能單位

模組可包含函式、Cmdlet、提供者與其他資源。`.psm1` 常是指令碼模組，`.psd1` 可作模組資訊清單；二進位模組則包含編譯組件。檔案存在不代表可在任何作業系統載入。

```powershell
Get-Module
Get-Module -ListAvailable |
    Select-Object -Property Name, Version
Get-Command -Module Microsoft.PowerShell.Utility |
    Select-Object -First 5 -Property Name
```

第一行只列目前工作階段已載入模組；第二行查可發現模組；第三行看指定模組命令。第一次使用某命令可觸發自動載入，所以兩次 Get-Module 的結果可能不同。

## Import 與 Remove

Import＝匯入，`Import-Module` 將模組載入工作階段；Remove＝移除，`Remove-Module` 卸載工作階段中的模組，不等於從磁碟解除安裝套件。模組初始化與卸載程式碼可能有副作用，應先信任來源。

```powershell
Import-Module -Name Microsoft.PowerShell.Utility
Get-Module -Name Microsoft.PowerShell.Utility
```

這是已隨 PowerShell 提供的模組，不會從網路下載。版本選擇可用 `-RequiredVersion`，但要先確認該版本可用；教材不硬填不存在的版本號讓讀者照貼。

## 套件下載與載入是兩個階段

PowerShellGet、Microsoft.PowerShell.PSResourceGet 是套件管理相關模組，不能假定所有 PowerShell 版本預裝相同管理器。先用 Get-Command 查 `Install-PSResource` 或 `Install-Module` 是否存在，再依官方文件選方法。安裝第三方模組之前查作者、來源、版本、授權與組織政策。

本書不把 PowerShell Gallery 中任何同名套件當成 Microsoft 官方保證，也不把「設為信任」當作解決所有安裝問題。代理、TLS 信任、權限或平台不符應分別診斷。

## 最小模組的概念

```powershell
function Get-LearningGreeting {
    param([string]$Name)
    "你好，$Name"
}
```

把函式存入 `.psm1` 可形成簡單指令碼模組；正式專案仍應用資訊清單限制匯出與宣告依賴。此區塊只定義函式，沒有在讀者機器建立或安裝模組。模組製作與測試將在後續完整開發案例擴充。

## 版本、平台、錯誤與安全

找不到模組先看 PSModulePath 與實際安裝位置；載入失敗再查 .NET、架構、作業系統與模組版本。Windows 的 ActiveDirectory 等管理模組不是 Linux 安裝 PowerShell 後就會出現。不要為了載入舊模組盲目改全域執行原則或替換注入的認證。

## 速查表

| 需求 | 命令 | 意義 |
|---|---|---|
| 看已載入 | `Get-Module` | 目前工作階段 |
| 看可用 | `Get-Module -ListAvailable` | 搜尋路徑可發現 |
| 載入 | `Import-Module 名稱` | 可能執行初始化 |
| 卸載工作階段 | `Remove-Module 名稱` | 不等於解除安裝 |
| 看模組命令 | `Get-Command -Module 名稱` | 檢查實際來源 |

## 練習題

1. Module 的中文與用途？
2. psm1 常代表什麼？
3. psd1 在模組中常作什麼？
4. Get-Module 不帶參數列什麼？
5. ListAvailable 的意義？
6. 第一次使用命令可能造成什麼變化？
7. Import-Module 的 Import 是什麼？
8. Import-Module 一定從網路下載嗎？
9. Remove-Module 會解除安裝磁碟上的套件嗎？
10. 模組載入是否保證零副作用？
11. 指定確切載入版本常用哪個參數？
12. 所有 PowerShell 版本預裝同一套套件管理器嗎？
13. Install-PSResource 與 Install-Module 可以混為相同命令嗎？
14. Gallery 同名套件一定由 Microsoft 發布嗎？
15. 把來源設為信任會解決平台不相容嗎？
16. 找不到模組應先檢查什麼？
17. Linux 裝 PowerShell 就會有 ActiveDirectory 嗎？
18. 最小函式存成 psm1 就等於完整企業模組嗎？
19. 為何正式專案應固定依賴版本？
20. 情境：模組可發現卻載入失敗，下一步？

## 參考答案與解題思路

1. 模組，封裝可重用命令與資源。

2. PowerShell 指令碼模組。

3. 資訊清單，描述版本、匯出與依賴等中繼資料。

4. 目前工作階段已載入的模組。

5. 列出搜尋路徑可發現的模組，不表示都已載入或可在當前平台運作。

6. 其模組自動載入，Get-Module 結果因此改變。

7. 匯入，將模組載入工作階段。

8. 不一定也通常不是；它載入可用模組，套件下載是另一階段。

9. 不會，主要是卸載目前工作階段模組。

10. 不保證，初始化程式碼可執行操作。

11. RequiredVersion，前提是該版本存在且適用。

12. 不是，需查 Get-Command 與模組版本。

13. 不應，它們來自不同管理工具，行為與參數依文件。

14. 不是，需檢查發布者、來源、版本與授權。

15. 不會，信任設定與平台相容是不同問題。

16. PSModulePath、安裝位置、名稱與版本。

17. 不會，該類 Windows／企業模組有額外條件。

18. 不是，還需匯出、依賴、版本、測試與維護設計。

19. 增加可重現性，減少上游更新突然改變行為。

20. 讀錯誤並檢查 .NET、OS、架構與模組支援，不盲目降低安全設定。

## 參考資料與延伸閱讀

- [about_Modules](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Modules.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
