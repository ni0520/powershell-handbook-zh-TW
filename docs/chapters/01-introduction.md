<a id="chapter-01"></a>

# 第 1 章：先理解 PowerShell 能做什麼

[返回目錄](../README.md)

## 學習目標

能區分 Terminal（終端機）、Shell（命令殼層）與 Script（指令碼）；執行第一個唯讀命令；說明為什麼 PowerShell 的 Object（物件）適合自動化。

## 從日常工作認識自動化

假設每週都要查看資料夾、找出大檔案、整理成報表。手動操作容易漏看，也難以留下可重複的步驟。PowerShell 讓你把動作寫成命令，再將命令組合成指令碼。第一次應先確認結果，之後才考慮排程執行。

PowerShell 同時是一種互動式殼層、指令碼語言與自動化平台。Cmdlet（PowerShell 命令）通常以「動詞-名詞」命名，例如 `Get-Process` 的 Get 是取得、Process 是處理程序；它取得正在執行的程式資訊，不是開啟新程式。

終端機負責顯示文字與接收鍵盤輸入，殼層負責理解命令。Windows Terminal 可以在不同分頁執行 PowerShell、命令提示字元或其他殼層。換終端機不等於升級 PowerShell；這個區別在[第 2 章](02-powershell-versions.md)與[第 4 章](04-terminal-editor.md)會再次使用。

## 第一個安全工作階段

在已安裝 PowerShell 的環境中開啟 `pwsh`，只輸入程式碼，不要把文件中的提示符號 `PS>` 一起貼上。

```powershell
$PSVersionTable.PSVersion
Get-Location
Get-Process -Id $PID
```

第一行顯示目前殼層版本。第二行回傳目前位置。第三行透過 `-Id` 指定處理程序識別碼，`$PID` 是目前 PowerShell 自己的識別碼。這三行不刪檔、不停止程式，也不需要為教學特別取得管理員權限。

你可能看到版本的 Major（主要）、Minor（次要）、Patch（修補）欄位。處理程序的 Id、ProcessName、CPU 等值會依執行當時改變；不要用別人的 PID 當成自己的。`CPU` 通常是累積處理器使用秒數，不是「此刻 CPU 百分比」。

## 物件不是螢幕上的那幾欄

物件把資料與可用操作放在一起。Property（屬性）是資料，例如處理程序名稱；Method（方法）是操作，例如字串轉大寫。畫面上的表格只是物件的一種呈現，不代表物件只有那些欄位。

```powershell
$process = Get-Process -Id $PID
$process.ProcessName
$process.GetType().FullName
```

`$process` 是變數，保留查詢結果。第二行取出名稱；第三行查詢物件型別，通常是 `System.Diagnostics.Process`。變數與型別將在後續章節深入介紹；現在只需要理解「先取得資料，再選擇要看的部分」。

## 第一次組合命令

Pipeline（管線）把前一個命令的結果送給下一個命令。這裡只選取兩個欄位：

```powershell
Get-Process -Id $PID |
    Select-Object -Property Id, ProcessName
```

原創資料流程：

```text
取得目前處理程序
        ↓ 物件
選擇 Id、ProcessName
        ↓ 新的精簡物件
畫面顯示兩個欄位
```

`Select-Object` 不會改掉正在執行的程式。它建立選定屬性的輸出；[第 9 章](09-pipeline.md)會說明管線與輸出型別。

## 常見錯誤、版本與平台

- 出現找不到 `pwsh`：可能尚未安裝或 PATH（可執行檔搜尋路徑）未更新；先看第 3 章，不要下載來路不明的修復工具。
- 在 Bash 輸入 `$PSVersionTable`：Bash 不理解 PowerShell 語法；先進入 `pwsh`。
- 教材有 `Get-Service`，Linux 找不到：Windows 服務命令不代表跨平台皆有；先查平台限制。
- 按 Ctrl+C 可中斷目前命令，但不保證回復命令已做的變更。

## 安全提醒與最佳實踐

先查詢，再確認範圍，最後才改動資料。不要一開始就以系統管理員身分操作。保持一個普通權限的練習視窗；程式碼中出現 Remove、Stop、Set、Restart 等動詞時，先閱讀風險說明。名稱只是提示，不是完整安全判定，函式也可能有副作用。

## 速查表

| 寫法 | 中文用途 | 記憶與注意 |
|---|---|---|
| `$PSVersionTable.PSVersion` | 看殼層版本 | 視窗標題不能取代版本檢查 |
| `Get-Location` | 看目前位置 | Location＝位置 |
| `Get-Process -Id $PID` | 查自己這個處理程序 | Process＝處理程序 |
| `Get-Help Get-Process` | 查命令說明 | Help＝說明 |
| `exit` | 離開目前殼層 | 先保存尚未存檔的內容 |

## 練習題

1. 單選：Windows Terminal 主要是終端機、資料庫，還是套件管理器？
2. 是非：安裝 Windows Terminal 就一定有最新版 PowerShell。
3. 填空：PowerShell 命令常用「____-____」命名。
4. Get-Process 的 Get 表達什麼動作？
5. Object 的中文與用途是什麼？
6. Property 與 Method 有何差別？
7. 哪個變數顯示目前 PowerShell 版本資訊？
8. `$PID` 指的是教材作者的處理程序嗎？
9. 請寫出只查目前處理程序的命令。
10. `Get-Location` 會切換資料夾嗎？
11. 複選：物件、普通文字、畫面截圖，何者通常是 Cmdlet 管線中傳送的資料？
12. 解讀 `$process.ProcessName`。
13. 為什麼每台電腦的 PID 不必相同？
14. 是非：CPU 欄位一定是即時百分比。
15. 在 Bash 中執行 PowerShell 語法失敗，第一步應檢查什麼？
16. 複製範例時要包含 `PS>` 嗎？
17. `Select-Object -Property Id, ProcessName` 的作用？
18. Ctrl+C 可以保證取消所有已完成的檔案變更嗎？
19. 情境：朋友要你用管理員視窗貼上不明腳本，應如何處理？
20. 實作：列出一個可重複練習的安全流程。

## 參考答案與解題思路

1. 終端機。它承載殼層，不決定 PowerShell 版本。

2. 錯。終端機與殼層分開安裝、更新。

3. 動詞-名詞，例如 Get-Process。

4. 取得資訊；不表示啟動程式。

5. 物件；把相關資料及可用操作組織在一起。

6. 屬性描述資料，方法執行操作；不要把兩者都當成欄位。

7. `$PSVersionTable`；其中 PSVersion 屬性是版本號。

8. 不是，是目前執行的 PowerShell 處理程序識別碼。

9. `Get-Process -Id $PID`；以當前 PID 限定查詢範圍。

10. 不會，它只回傳目前位置；切換位置使用 Set-Location。

11. 物件；字串也是物件。螢幕截圖不是一般管線資料。

12. 讀取變數所保存物件的 ProcessName 屬性，不是再次啟動程式。

13. PID 由作業系統配置，會隨工作階段與時間改變。

14. 錯；Get-Process 的 CPU 通常是累積處理器時間秒數。

15. 目前殼層；先確認已進入 pwsh，而不是修改系統安全設定。

16. 不要；它只是互動提示符號。

17. 建立只含選定屬性的輸出；不修改處理程序本身。

18. 不能。它中斷執行，並非交易回復工具。

19. 先閱讀腳本、確認來源與權限需求，於隔離環境測試；不直接提高權限執行。

20. 查版本 → Get-Location → Get-Process -Id $PID → Select-Object；全部以唯讀查詢開始。

## 參考資料與延伸閱讀

- [What is PowerShell?](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/overview.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Getting Started with PowerShell](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/learn/ps101/01-getting-started.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Get-Location](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Location.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Select-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Object.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
