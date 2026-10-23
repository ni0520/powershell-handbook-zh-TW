<a id="chapter-02"></a>

# 第 2 章：Windows PowerShell 與 PowerShell 7

[返回目錄](../README.md)

## 學習目標

辨識 Desktop（桌面版）與 Core（核心版）執行環境，讀懂版本與支援期限，為舊指令碼選擇測試策略。

## 先看執行環境，再看命令名稱

Windows PowerShell 5.1 使用 .NET Framework，隨 Windows 維護；PowerShell 7 使用現代 .NET，另行安裝，支援符合官方條件的 Windows、Linux、macOS。兩者可在 Windows 並存。`powershell.exe` 通常啟動 5.1，`pwsh.exe` 啟動 7；Linux/macOS 的程式名為 `pwsh`。

```powershell
$PSVersionTable | Select-Object -Property *
[System.Runtime.InteropServices.RuntimeInformation]::FrameworkDescription
```

第二行是本書 7.6 範例；不要假定每個舊 .NET Framework 環境都有相同 API。要讀取雜湊表中的版本，直接用 `$PSVersionTable.PSVersion`，而不是把整張版本表當成單一版本字串。

## 2026 年版本基準與資料差異

查證日期為 **2026-10-24（臺灣）**。官方 GitHub 的 latest 轉向 **v7.6.8**，本書 Linux 實測也使用 7.6.8。生命週期原文仍寫「目前 LTS 7.6.6」，顯示概念文件與發行頁更新時間不同；本書以發行頁判定最新正式修補版本，以生命週期文件判定支援期限，不把兩筆資料混成同一事實。

LTS 是 Long Term Servicing（長期維護版本）。它不是「永遠安全」；仍需安裝安全修補，且作業系統本身也必須受支援。

| 系列 | .NET 基礎 | 首次發行 | 官方支援終止／狀態 |
|---|---|---|---|
| Windows PowerShell 5.1 | .NET Framework | 2016-08 | 跟隨所屬 Windows 生命週期 |
| 7.0 LTS | .NET Core 3.1 | 2020-03-04 | 2022-12-03，已終止 |
| 7.2 LTS | .NET 6 | 2021-11-08 | 2024-11-08，已終止 |
| 7.3 | .NET 7 | 2022-11-09 | 2024-05-08，已終止 |
| 7.4 LTS | .NET 8 | 2023-11-16 | 2026-11-10 |
| 7.5 | .NET 9 | 2025-01-23 | 2026-11-10 |
| 7.6 LTS | .NET 10 | 2026-03-18 | 2028-11-14 |

此表不是永久保證；部署前重新查閱生命週期。7.7 預覽版尚不作為本書生產基準。能安裝成功，不等於該作業系統與架構組合受到官方支援。

## 對日常寫法有什麼影響

- **5.1 → 7.0**：新增三元運算子與管線鏈結運算子等語法，`ForEach-Object -Parallel` 也屬 PowerShell 7 時代功能。5.1 無法因為安裝一個模組就解析所有新語法。
- **7.2**：改用 .NET 6；移轉舊模組仍需檢查 .NET API 與平台需求，不能只看命令名稱相同。
- **7.3**：原生程式引數傳遞行為有變化，與 `$PSNativeCommandArgumentPassing` 有關；呼叫外部 exe 的引號與空字串案例要特別重測。
- **7.4**：原生程式重新導向保留位元組資料；通用參數新增 `-ProgressAction`。這不代表所有 5.1 命令接受該參數。
- **7.5**：.NET 9 與引擎、Cmdlet 修正；不要由版本數字直接推論每個工作負載都更快。
- **7.6**：.NET 10；ThreadJob 模組改為 Microsoft.PowerShell.ThreadJob；`Start-ThreadJob` 命令名不變，但模組限定名稱需調整。`Join-Path -ChildPath` 的型別也有變更。

效能比較需要相同硬體、資料量、模組與多次量測，本書目前沒有跨版本效能實測，因此不列虛構的百分比。

## 相容性不能只靠版本號

`Get-WmiObject` 與舊 Windows 事件記錄命令等不在 PowerShell 7 中，常見移轉方向是 CIM 與 `Get-WinEvent`，但不是只改名就保證語意等價。Windows PowerShell Workflow 也不在 7 中。5.1 的 Snap-in（嵌入式管理單元）依賴需另行檢視。

Windows 專用模組可能透過相容性工作階段載入；其物件經過序列化後，常只保留資料，不能假定方法還可使用。Active Directory、Exchange、Azure 等模組有自己的支援條件，不能只引用 PowerShell 本身的生命週期。

## 版本檢查的可重複步驟

```powershell
$version = $PSVersionTable.PSVersion
[pscustomobject]@{
    Version = $version.ToString()
    Edition = $PSVersionTable.PSEdition
    Platform = $PSVersionTable.Platform
}
Get-Command -Name Get-Command -Syntax
```

前段產生自訂物件，記錄版本、版本種類、平台。5.1 的 Platform 欄位可能不存在，不要把缺欄位解讀為 Linux。最後一行從本機命令取得語法；版本相容性最終仍需要在目標平台實測。

## 安全提醒、錯誤修正與最佳實踐

不把更換殼層當成「修復所有問題」。先列出模組依賴、外部程式、編碼、路徑、認證方式，再在副本測試。新語法造成 ParserError（解析錯誤）時，先查執行版本，不要降低執行原則。`$PSVersionTable.PSCompatibleVersions` 不是第三方模組相容保證。

## 速查表

| 問題 | 檢查方式 | 判讀 |
|---|---|---|
| 現在是 5.1 還是 7？ | `$PSVersionTable.PSVersion` | 看目前程序，不看視窗外觀 |
| Desktop 或 Core？ | `$PSVersionTable.PSEdition` | 仍需另外確認 OS |
| 實際參數有哪些？ | `Get-Command 名稱 -Syntax` | 本機命令中繼資料 |
| 最新正式版本？ | 官方 GitHub Releases | 不以預覽版取代正式版 |
| 是否還受支援？ | 官方生命週期與 OS 清單 | 同時檢查模組生命週期 |

## 練習題

1. Windows PowerShell 5.1 主要使用哪個 .NET 家族？
2. PowerShell 7 是否內建於每一台 Windows？
3. Windows 上兩個常見啟動檔名是什麼？
4. LTS 的意思是什麼？
5. 7.0 是否適合作為本書 2026 年新部署基準？
6. 7.2 與 7.3 何者在本書查證日期仍受支援？
7. 7.4 LTS 的官方支援終止日？
8. 7.6 LTS 的 .NET 基礎與支援終止日？
9. 為什麼本書使用 7.6.8 而生命週期文件提到 7.6.6？
10. 本書使用 7.7 預覽版當正式基準嗎？
11. `$PSVersionTable.PSEdition` 可以完全判定作業系統嗎？
12. 是非：5.1 能直接執行 `ForEach-Object -Parallel`。
13. 7.3 移轉時為何要重測外部程式引數？
14. `-ProgressAction` 可以假定存在於 5.1 嗎？
15. 7.6 的 Start-ThreadJob 改名了嗎？
16. 舊指令碼使用 Get-WmiObject，升級後應如何處理？
17. 相容性工作階段回傳的資料一定保留所有方法嗎？
18. 語法解析失敗應先更改執行原則嗎？
19. 為何不能宣稱 7.6 一定比 5.1 快一倍？
20. 設計一次升級測試至少需記錄哪四項？

## 參考答案與解題思路

1. .NET Framework；與 PowerShell 7 的現代 .NET 不同。

2. 不能如此假設；通常需另行安裝。

3. powershell.exe 對應 Windows PowerShell，pwsh.exe 對應 PowerShell 7。

4. 長期維護版本；仍必須持續套用修補。

5. 不適合，官方支援已於 2022-12-03 終止。

6. 兩者均已終止支援，不能只因版本 7 就視為受支援。

7. 2026-11-10；部署前仍應重查官方公告。

8. .NET 10，2028-11-14；也受作業系統生命週期限制。

9. 兩種官方頁面的更新時間不同；發行頁用來判定修補版本，生命週期頁用來判定期限。

10. 沒有；預覽版不作生產基準。

11. 不能；Core 可在多個 OS 執行，需另外看平台。

12. 錯，此參數是 PowerShell 7 功能。

13. 原生引數傳遞行為改變，尤其引號與空字串會影響接收結果。

14. 不能；它在 7.4 成為通用參數。

15. 命令名沒改，承載模組改為 Microsoft.PowerShell.ThreadJob。

16. 評估改用 Get-CimInstance，重查參數、認證與回傳型別，不能只做文字替換。

17. 不一定；遠端序列化可能只留下資料屬性。

18. 不應；先檢查語法與殼層版本，執行原則不會讓舊解析器理解新語法。

19. 沒有同條件量測證據；工作負載與模組可能影響結果。

20. 版本、OS、模組版本、代表性案例與結果；另外記錄編碼、外部程式及回復方式更完整。

## 參考資料與延伸閱讀

- [PowerShell Support Lifecycle](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/install/PowerShell-Support-Lifecycle.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [PowerShell v7.6.8 release](https://github.com/PowerShell/PowerShell/releases/tag/v7.6.8) — Microsoft / PowerShell；7.6.8；查閱：2026-10-24。用途：最新正式發行及安裝檔核對。
- [Differences between Windows PowerShell 5.1 and PowerShell 7.x](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/whats-new/differences-from-windows-powershell.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [What's New in PowerShell 7.2](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/whats-new/What-s-New-in-PowerShell-72.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [What's New in PowerShell 7.3](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/whats-new/What-s-New-in-PowerShell-73.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [What's New in PowerShell 7.4](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/whats-new/What-s-New-in-PowerShell-74.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [What's New in PowerShell 7.5](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/whats-new/What-s-New-in-PowerShell-75.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [What's New in PowerShell 7.6](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/whats-new/What-s-New-in-PowerShell-76.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
