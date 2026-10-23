<a id="chapter-03"></a>

# 第 3 章：安裝、編碼與可重複的環境

[返回目錄](../README.md)

## 學習目標

辨認安裝來源、處理器架構與平台需求；驗證版本；分辨執行原則與檔案編碼問題。

## 安裝前的三個問題

先確認作業系統版本，再確認 x64 或 Arm64 架構，最後選擇正式版或預覽版。套件名稱看似相近，不能隨便互換。應從 Microsoft 官方安裝文件前往下載來源，保留 TLS（傳輸層安全性）、簽章與檔案雜湊檢查。

Windows 的常見方法包括 WinGet（Windows 套件管理器）與 MSI（Windows 安裝套件）；Linux 可使用官方支援的套件來源；macOS 可依官方文件選擇已簽署套件等方式。這些都是安裝選項，不代表本雲端已驗證所有平台。

## Windows 操作步驟

下列是 **Windows 專用、會安裝軟體** 的操作。本書 Linux 環境未執行。先查詢套件身分，確認來源與版本，再執行安裝；企業裝置需遵守管理政策。

```powershell
winget search --id Microsoft.PowerShell --exact
winget install --id Microsoft.PowerShell --exact --source winget
```

安裝後開啟新的終端機分頁，再執行 `pwsh`。PATH 改變可能不會套用到已開啟的程序。如果找不到命令，先重新開啟終端機並檢查官方安裝位置，不要重複安裝不同來源的套件。

## 本書實測的 Linux 方法

本環境是 Debian 13 x64。由官方 Releases 下載 `powershell-7.6.8-linux-x64.tar.gz` 與 `hashes.sha256`，使用 SHA-256（安全雜湊演算法）比對檔案，成功後才解壓縮及啟動。雜湊只能確認與官方清單一致，可信來源與安全傳輸仍不可省略。

在受限制的雲端工作區，家目錄可能唯讀。本專案的 `scripts/pwsh.sh` 將 XDG 快取、設定與資料路徑放到可寫的工作區，沒有修改 `$HOME` 或關閉驗證。一般個人電腦通常不需要這個包裝腳本。

```bash
bash scripts/pwsh.sh -NoLogo -NoProfile -Command '$PSVersionTable.PSVersion'
```

這是 **Bash** 命令，不是 PowerShell 命令；在專案根目錄執行。`-NoProfile` 不載入個人啟動設定，有助於重現問題。標準安裝的電腦可直接使用 `pwsh -NoLogo -NoProfile`。

## 安裝完成後的驗收

```powershell
$PSVersionTable.PSVersion
$PSVersionTable.PSEdition
Get-Command -Name Get-Help
Get-Module -ListAvailable |
    Select-Object -Property Name, Version
```

這些命令確認殼層可執行、基本命令可發現、模組可被列出。`-ListAvailable` 是列出可用模組，不代表每個模組已載入或都能在這個 OS 運作。接著執行[第 1 章](01-introduction.md)的自我查詢，才算完成基本功能驗收。

## 繁體中文編碼

Encoding（編碼）決定文字如何存成位元組；換行 LF／CRLF 是另一件事。PowerShell 7 的文字輸出多採 UTF-8 無 BOM。Windows PowerShell 5.1 的預設編碼依 Cmdlet 而異，含中文的 `.ps1` 若只有 UTF-8 無 BOM，可能被誤認為傳統字碼頁。

跨版本維護時，應明確指定檔案編碼；需要讓 5.1 讀取含中文指令碼時，可另存 UTF-8 with BOM（含位元組順序記號）的副本。本專案主稿與範例以 7.6 為實測基準，沒有宣稱 5.1 中文指令碼已實測。

```powershell
$text = '繁體中文測試'
$text.Length
[System.Text.Encoding]::UTF8.GetByteCount($text)
```

字元數與 UTF-8 位元組數不相同，不能用檔案大小推論文字個數。上述字串有六個中文字，UTF-8 是十八個位元組；這不需要建立任何檔案。

## Execution Policy（執行原則）

執行原則協助防止意外執行指令碼，不是完整安全邊界，也不是檔案權限系統。Windows 可用唯讀命令查看各層設定：

```powershell
Get-ExecutionPolicy -List
```

本書不把 `Bypass` 或 `Unrestricted` 當成安裝的預設解法。遇組織群組原則時應由管理流程處理。非 Windows 的執行原則行為不同，不應用 Linux 的結果推論 Windows 指令碼可否執行。

## 錯誤修正與最佳實踐

找不到 `pwsh` 時檢查安裝與 PATH；出現無法寫入快取時檢查該工具支援的設定目錄；出現中文亂碼先檢查原始檔編碼與終端機字型；雜湊不符時停止使用下載檔並重新從官方來源取得，絕不修改預期雜湊湊成通過。

## 速查表

| 項目 | 用途 | 避免的誤判 |
|---|---|---|
| `pwsh -NoProfile` | 排除個人設定干擾 | 不會繞過所有安全政策 |
| `Get-Module -ListAvailable` | 找可用模組 | 可發現不等於可用於所有 OS |
| `Get-ExecutionPolicy -List` | 看原則層級 | 不是權限清單 |
| UTF-8 with BOM | 協助 5.1 辨識中文指令碼 | BOM 與換行不同 |
| SHA-256 | 檢查下載內容一致性 | 不能取代來源信任 |

## 練習題

1. 安裝前為什麼要查 x64 或 Arm64？
2. WinGet 範例應在哪個平台執行？
3. `winget search` 與 `winget install` 哪個會安裝軟體？
4. 安裝後舊分頁找不到 pwsh，先試什麼？
5. 為什麼要從官方文件前往下載位置？
6. 下載雜湊不符時可以改掉清單嗎？
7. SHA-256 完全相同是否就可忽略下載來源？
8. 本書實際使用哪個 Linux？
9. `-NoProfile` 的用途？
10. XDG 快取路徑為何需要調整？
11. 可以把 HOME 任意改成專案資料夾嗎？
12. `Get-Module -ListAvailable` 會證明模組已載入嗎？
13. BOM 與 CRLF 是否相同？
14. UTF-8 無 BOM 的中文指令碼在 5.1 有何風險？
15. 字串「繁體中文測試」的字元數與 UTF-8 位元組數？
16. 執行原則是否是完整安全邊界？
17. 查看執行原則各層的唯讀命令？
18. Linux 執行原則結果能證明 Windows 可執行同一腳本嗎？
19. 中文亂碼時應檢查哪兩類因素？
20. 實作：安裝後如何驗證不是只有檔案存在？

## 參考答案與解題思路

1. 二進位檔有架構限制；檔名相近不表示可通用。

2. Windows；本書 Debian 環境未實測安裝操作。

3. install；search 先查身分與來源，有助避免裝錯套件。

4. 新開終端機，再檢查 PATH；既有程序可能尚未取得新設定。

5. 降低取到同名惡意套件的風險，並取得適用平台說明。

6. 不可以；停止使用該檔，重新驗證來源與下載。

7. 不可以；若來源與清單同時不可信，比對仍無法建立信任。

8. Debian 13 x64，PowerShell 7.6.8。

9. 不載入個人啟動指令碼，減少環境差異；不是安全繞過旗標。

10. 此雲端家目錄唯讀，需使用工具支援的可寫設定路徑。

11. 不建議；會影響多種工具。這裡使用 XDG 支援的個別設定。

12. 不會，它列出可發現的模組。

13. 不同；BOM 是編碼記號，CRLF 是換行方式。

14. 可能被當成傳統字碼頁讀取而亂碼，需測試或另存含 BOM 副本。

15. 六個字元、十八個位元組；中文字元在此各占三個 UTF-8 位元組。

16. 不是；不能取代應用程式控制、權限與來源審查。

17. `Get-ExecutionPolicy -List`；不需先修改原則。

18. 不能；平台的執行原則行為不同。

19. 檔案實際編碼與顯示端字型／文字處理流程，不要直接歸咎 PowerShell 版本。

20. 啟動殼層，讀版本、查 Get-Help、執行 Get-Process -Id $PID，確認實際命令可運作。

## 參考資料與延伸閱讀

- [Install PowerShell 7 on Windows](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/install/install-powershell-on-windows.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Install PowerShell 7 on Debian](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/install/install-debian.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Install PowerShell 7 on macOS](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/install/install-powershell-on-macos.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [debian-support](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/includes/debian-support.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Character_Encoding](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Character_Encoding.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Execution_Policies](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Execution_Policies.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [PowerShell v7.6.8 release](https://github.com/PowerShell/PowerShell/releases/tag/v7.6.8) — Microsoft / PowerShell；7.6.8；查閱：2026-10-24。用途：最新正式發行及安裝檔核對。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
