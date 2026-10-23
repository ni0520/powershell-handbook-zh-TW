<a id="chapter-05"></a>

# 第 5 章：基本操作、路徑與資料夾巡覽

[返回目錄](../README.md)

## 學習目標

使用完整命令巡覽工作區，區分相對路徑與絕對路徑，理解萬用字元與 LiteralPath（字面路徑）。

## 先知道自己在哪裡

`Get-Location`（取得位置）回傳 PathInfo（路徑資訊）物件。`Set-Location`（設定位置）改變目前工作階段的位置；它不會搬移檔案。Location 是「位置」，與 Item（項目）不同。

```powershell
$startingLocation = Get-Location
Set-Location -LiteralPath $HOME
Get-Location
Set-Location -LiteralPath $startingLocation.Path
```

這段只切換位置，最後回到起點。`$HOME` 是系統提供的家目錄，本書只讀取它，不重新指派。若要在容易出錯的流程保證回復，應用 `try/finally`；詳細錯誤處理留待後續章節。

## 列出第一層內容

`Get-ChildItem`（取得子項目）：Get＝取得、Child＝子、Item＝項目。記憶方式是「先看位置，再看位置裡的孩子」。它可透過 Provider（提供者）存取檔案系統等不同資料來源，不只是固定的列檔指令。

```powershell
Get-ChildItem -LiteralPath . -File
Get-ChildItem -LiteralPath . -Directory
Get-ChildItem -LiteralPath . -Filter '*.md' -File
```

`.` 表示目前位置。`-File` 與 `-Directory` 是檔案系統提供者的動態參數；不要假設登錄等提供者也支援它們。`-Filter` 將篩選交給提供者，通常比先取回大量資料再篩選更有效率，但實際支援與規則依提供者而定。

輸出的檔案通常是 FileInfo（檔案資訊），資料夾通常是 DirectoryInfo（目錄資訊）。Name 是名稱，FullName 是完整路徑，Length 是檔案大小位元組，LastWriteTime 是最後寫入時間。資料夾不能用 Length 當成整個樹狀內容大小。

## 遞迴必須有範圍

```powershell
Get-ChildItem -LiteralPath . -File -Recurse -Depth 1
```

`-Recurse` 往子資料夾尋找，`-Depth` 限制深度；不要從整個系統根目錄做第一個練習。可能碰到權限不足、連結、網路磁碟與大量資料。`-Force` 可顯示某些隱藏項目，但不會授予原本沒有的檔案權限。

## Path 與 LiteralPath

`-Path` 會解讀萬用字元，例如 `*`、`?`、`[ab]`；`-LiteralPath` 把輸入當成實際名稱。若真的有 `report[1].txt`，使用字面路徑可避免方括號被當成模式。

```powershell
Test-Path -LiteralPath './report[1].txt'
```

回傳 Boolean（布林值）True 或 False；False 只表示該路徑未通過此檢查，不會替你建立檔案。對含空格的路徑加引號；引號保留字串邊界，但 `-Path` 仍可能解讀字串內萬用字元。

## 主要指令、參數與延伸閱讀

三個命令的十四項完整教學、五類範例與正式語法摘要見[命令教學附錄](../appendices/cmdlet-tutorials.md)。本章先掌握操作順序，遇參數組合問題再回查附錄與本機 `Get-Command -Syntax`。

| 參數 | 中文與必要性 | 影響與版本 |
|---|---|---|
| `-LiteralPath` | 明確指定字面位置；依參數組必要 | 5.1／7 基本支援；命令各自定義 |
| `-Filter` | 提供者篩選條件，選用 | Get-ChildItem，不通用於所有命令 |
| `-File`／`-Directory` | 只列檔案／資料夾，選用 | 檔案系統動態參數 |
| `-Depth` | 遞迴深度，選用 | 5.0 起；先限小範圍 |
| `-PassThru` | 切換後輸出位置，選用 | Set-Location 預設不輸出 |

## 常見錯誤、安全與最佳實踐

`PathNotFound` 多半是目前位置、拼字或平台路徑不符。先執行 Get-Location，再使用 Test-Path。Linux 通常區分大小寫，不要將 Windows 的檔名比較習慣直接套用。找不到 C: 不代表 PowerShell 壞了；Linux 本來沒有 Windows 磁碟代號。

正式腳本使用完整命令名稱與明確路徑，不依賴 `ls` 在各平台的意義。Set-Location 雖不改檔案，卻會影響後續相對路徑命令的目標，因此仍要避免無意切換。檔案變更課程會另外使用隔離測試資料。

## 速查表

| 需求 | 寫法 | 陷阱 |
|---|---|---|
| 看位置 | `Get-Location` | 非固定啟動目錄 |
| 換位置 | `Set-Location -LiteralPath 路徑` | 不會搬移檔案 |
| 列 Markdown | `Get-ChildItem -Filter '*.md' -File` | 只目前層，除非加遞迴 |
| 找實際名稱 | `Test-Path -LiteralPath 路徑` | 引號不等於停用萬用字元 |
| 看更深一層 | `Get-ChildItem -Recurse -Depth 1` | 先限制工作資料夾 |

## 練習題

1. Get-Location 回傳什麼類型的資訊？
2. Set-Location 會搬動檔案嗎？
3. `.` 與 `..` 分別代表什麼？
4. 絕對路徑與相對路徑的差別？
5. Get-ChildItem 的英文拆解？
6. 只列檔案應使用哪個參數？
7. `-Directory` 能假定在所有提供者存在嗎？
8. 列出目前位置的 Markdown 檔案。
9. `-Recurse` 的用途與風險？
10. `-Depth 1` 的目的？
11. 檔案資訊的 Length 通常代表什麼？
12. `-Force` 會授予系統管理員權限嗎？
13. 真實檔名 report[1].txt 應優先使用哪個路徑參數？
14. 字串加引號是否讓 `-Path` 完全不解讀萬用字元？
15. Test-Path 回傳 False 時會建立檔案嗎？
16. Set-Location 預設會回傳新位置物件嗎？
17. Linux 找不到 C: 時第一個判斷？
18. 為什麼腳本不要依賴 ls？
19. 把目前路徑保存後切換，如何回到起點？
20. 情境：大量查詢遇權限不足，應直接加 Force 嗎？

## 參考答案與解題思路

1. 目前位置的 PathInfo 物件，不只是畫面上的一行文字。

2. 不會，只改變工作階段的目前位置。

3. 目前位置與上一層位置；實際解析依目前提供者。

4. 前者明確定位，後者依目前位置解讀。

5. Get 取得、Child 子、Item 項目，合起來是取得子項目。

6. 檔案系統提供者下使用 `-File`。

7. 不能；它是檔案系統的動態參數。

8. `Get-ChildItem -LiteralPath . -Filter '*.md' -File`；不自動走遍子目錄。

9. 遞迴走入子資料夾，可能遇大量資料或無權限位置，應限定範圍。

10. 限制遞迴深度；避免無意走訪整棵資料樹。

11. 檔案長度，單位為位元組；不是資料夾總大小。

12. 不會；它不能越過檔案存取控制。

13. `-LiteralPath`，避免方括號被解讀成萬用字元。

14. 不會；引號主要處理字串邊界，萬用字元由參數接收端解讀。

15. 不會；它是檢查，不是建立命令。

16. 不會；需要輸出時使用 `-PassThru`。

17. 檢查平台與提供者；Linux 沒有 Windows 磁碟配置是正常情況。

18. 別名與外部命令解析可能因平台不同，完整名稱較易重現。

19. 保存 `$startingLocation = Get-Location`，再用 `Set-Location -LiteralPath $startingLocation.Path`。

20. 不應當成萬用解法；確認範圍與身分，保留錯誤並取得必要授權，Force 不會繞過權限。

## 參考資料與延伸閱讀

- [Get-Location](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Location.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Set-Location](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Set-Location.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Get-ChildItem](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ChildItem.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
