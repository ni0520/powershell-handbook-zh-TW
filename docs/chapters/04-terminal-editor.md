<a id="chapter-04"></a>

# 第 4 章：Windows Terminal、VS Code 與設定檔

[返回目錄](../README.md)

## 學習目標

建立適合編寫與偵錯的工作流程；辨識編輯器與殼層版本；理解設定檔載入順序。

## 三種工具分工

Windows Terminal 管理終端機分頁；Visual Studio Code（VS Code，程式碼編輯器）負責編輯檔案與整合開發工具；PowerShell 負責解析與執行指令碼。VS Code 的一般整合終端機與 PowerShell 擴充功能提供的工作階段也可能使用不同版本，不能只看一個視窗標題。

Microsoft 官方推薦以 VS Code 搭配 Microsoft 發布的 PowerShell 擴充功能撰寫指令碼。Windows PowerShell ISE（整合式指令碼環境）支援舊 Windows PowerShell，不支援 PowerShell 7；沒有新增功能開發不等於所有支援立刻終止。

## 桌面操作流程（未在本 Linux 雲端實測）

1. 依官方來源安裝 VS Code 與 Microsoft 的 PowerShell 擴充功能。
2. 開啟專案資料夾，建立 `.ps1` 檔案；先確認工作區內容可信。
3. 開啟命令選擇區，執行 **PowerShell: Show Session Menu**，選擇預定的 PowerShell 版本。
4. 在該 PowerShell 工作階段執行 `$PSVersionTable.PSVersion`；這才是執行時版本證據。
5. 儲存檔案，再執行選取區塊或整個檔案。測試時開新的 `-NoProfile` 工作階段重跑，避免變數殘留。

Breakpoint（中斷點）讓執行停在某一行，方便查看變數。不要把按下 F5 當作「不會執行變更」；偵錯仍會執行程式碼。含刪除或服務操作的腳本，需先改用隔離資料及審查過的測試流程。

## Profile（設定檔）是啟動時執行的指令碼

```powershell
$PROFILE
$PROFILE | Select-Object -Property *
Test-Path -LiteralPath $PROFILE
```

第一行顯示「目前使用者、目前主控程式」的設定檔路徑；第二行展開其他範圍的屬性；第三行檢查檔案是否存在。路徑存在於變數中，不代表檔案已建立。

載入順序從廣到窄：AllUsersAllHosts（所有使用者、所有主控程式）→ AllUsersCurrentHost → CurrentUserAllHosts → CurrentUserCurrentHost。後面的設定可能覆寫前面的結果。VS Code 與一般主控台可使用不同的主控程式專屬設定檔。

不要把 API 金鑰、密碼或固定工作目錄寫進共用設定檔。可先只在當前工作階段練習一個無害函式：

```powershell
function Show-LearningVersion {
    "PowerShell $($PSVersionTable.PSVersion)"
}
Show-LearningVersion
```

這只定義本次工作階段中的函式。`$()` 是子運算式，讓雙引號字串插入完整的屬性運算結果。關閉殼層後函式不會自動保存；本書沒有將它寫入你的個人設定檔。

## 常見問題與修正

「編輯器可執行、排程卻失敗」可能是設定檔載入了模組、建立了變數或改了目前目錄。指令碼應自己宣告依賴，使用明確路徑，並在乾淨工作階段驗證。`-NoProfile` 成功而普通啟動失敗，則應逐項檢查設定檔，不要直接刪掉整份使用者設定。

「編輯器上有紅線」可能來自語法分析或靜態規則，不一定是已執行的錯誤；反過來，沒有紅線也不等於程式正確。語法、靜態分析、實際執行是不同驗證層級。

## 版本與平台、安全及最佳實踐

Windows Terminal 是 Windows 工具；VS Code 與 PowerShell 7 可跨平台，但快捷鍵與擴充功能支援版本會變動。官方 VS Code 文件列出 PowerShell 7.2 以上與 Windows 5.1/.NET Framework 4.8 的條件；支援編輯某個版本，不代表該殼層仍在生命週期內。

先保存再執行、使用完整命令名稱、保留版本記錄；不要把敏感字串放進終端機歷程或螢幕截圖。

## 速查表

| 名稱 | 用途 | 常見誤會 |
|---|---|---|
| Show Session Menu | 選 PowerShell 執行版本 | 不等於更新所有終端機分頁 |
| `$PROFILE` | 取得目前設定檔路徑 | 不代表檔案存在 |
| `Test-Path -LiteralPath $PROFILE` | 檢查實體檔案 | 不會建立它 |
| `pwsh -NoProfile` | 乾淨啟動 | 仍有系統與模組環境影響 |
| 中斷點 | 暫停偵錯 | 之前的變更不會自動回復 |

## 練習題

1. VS Code 與 PowerShell 分別負責什麼？
2. Windows Terminal 是否只能執行 PowerShell？
3. 官方建議的 PowerShell 編輯器組合？
4. ISE 可以執行 PowerShell 7 嗎？
5. 哪個選單可選擴充功能的執行版本？
6. 如何確認目前工作階段實際版本？
7. 為何只執行選取區塊可能掩蓋問題？
8. 偵錯模式會阻止刪檔嗎？
9. Profile 的本質是什麼？
10. `$PROFILE` 有值是否等於檔案存在？
11. 查詢目前設定檔存在與否的安全寫法？
12. 四種設定檔哪一個最後載入？
13. VS Code 與一般主控台設定檔一定相同嗎？
14. `$PROFILE | Select-Object *` 用來看什麼？
15. 函式 Show-LearningVersion 在關閉殼層後會自動保存嗎？
16. 雙引號內 `$()` 的用途？
17. 排程失敗但互動成功，應先查哪些差異？
18. 編輯器沒有紅線能證明實測通過嗎？
19. 設定檔造成錯誤時可以直接覆寫使用者整份檔案嗎？
20. 設計一個可靠的編輯到執行流程。

## 參考答案與解題思路

1. 前者編輯與整合工具，後者解析執行語法。

2. 不是；可承載多種殼層。

3. VS Code 搭配 Microsoft 發布的 PowerShell 擴充功能。

4. 不能；它屬 Windows PowerShell 的工具。

5. PowerShell: Show Session Menu；選擇後仍應查版本。

6. 執行 `$PSVersionTable.PSVersion`。

7. 工作階段可能留有舊變數或函式，獨立執行整份檔案才會暴露依賴缺漏。

8. 不會；偵錯仍執行程式碼。

9. PowerShell 啟動時載入的指令碼，不是單純靜態設定資料。

10. 不是；需用 Test-Path 檢查。

11. `Test-Path -LiteralPath $PROFILE`；不會修改檔案。

12. CurrentUserCurrentHost，可能覆寫較早的設定。

13. 不一定；主控程式專屬檔名可能不同。

14. 目前使用者與各主控程式範圍的設定檔路徑屬性。

15. 不會；此範例只存在當前工作階段。

16. 求出子運算式的結果再插入字串。

17. 版本、身分、工作目錄、設定檔、模組與環境變數。

18. 不能；靜態檢查與實際執行不同。

19. 不應；保留原檔，逐項診斷並作最小變更。

20. 編寫 → 儲存 → 確認殼層版本 → 乾淨工作階段執行 → 檢查輸出與副作用 → 記錄驗證。

## 參考資料與延伸閱讀

- [Using Visual Studio Code for PowerShell Development](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/dev-cross-plat/vscode/using-vscode.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Getting Started with PowerShell](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/learn/ps101/01-getting-started.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Profiles](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Profiles.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
