<a id="chapter-06"></a>

# 第 6 章：用說明系統自行找到答案

[返回目錄](../README.md)

## 學習目標

能讀語法中的方括號與型別，找到單一參數說明，分辨「命令存在」與「完整說明已安裝」。

## Get-Help：命令與觀念的閱讀入口

Help（說明）不只是錯誤時才開啟的功能。開始使用陌生命令前，先查它會做什麼、接受什麼參數、回傳什麼物件。`Get-Help` 的 Get 是取得、Help 是說明；學習優先度為 ★★★★★。完整欄位與範例見[命令教學附錄](../appendices/cmdlet-tutorials.md)。

```powershell
Get-Help -Name Get-ChildItem
Get-Help -Name Get-ChildItem -Examples
Get-Help -Name Get-ChildItem -Parameter LiteralPath
Get-Help -Name Get-ChildItem -Full
```

依序是概要、範例、特定參數、完整說明。這些是替代閱讀方式，不是所有旗標都能一次混用。例如 `-Examples` 與 `-Full` 屬不同參數組合，應分開呼叫。

## 本機說明缺少時怎麼辦

新安裝的 PowerShell 可能只有從命令中繼資料生成的基本語法，沒有完整描述與範例。這時 `Get-Help` 回傳內容不等於完整說明已下載。先用 `Get-Command -Syntax` 查本機實際參數，再查相同版本的官方文件。

`Update-Help`（更新說明）會下載並寫入說明檔；需網路、適用語系與目錄寫入權限。受限制環境可能無法連到說明來源，不能把更新失敗解讀為 Cmdlet 不存在。本專案研究使用官方文件 Git 快照，不依賴 Update-Help 成功。

```powershell
Get-Command -Name Get-ChildItem -Syntax
```

`Get-Help -Online` 可開官方線上說明，但需要瀏覽器與網路；在無桌面雲端不能期待它彈出可用視窗。官方文件的語系、版本選擇器也可能影響內容，引用時要保留版本與日期。

## 讀懂正式語法

```text
Get-Help [[-Name] <String>] [-Full] [<CommonParameters>]
```

這是語法說明，不是直接貼進殼層的命令。`<String>` 表示要填入字串值；`[ ]` 表示可選，內層 `[-Name]` 說明參數名稱可依位置省略。`-Full` 是 Switch Parameter（切換參數），常只寫旗標，不需要附上字串 True。

Parameter（參數）是命令的輸入欄位，如 `-Name`；Argument（引數）是傳入的值，如 `Get-ChildItem`。同名參數在不同命令可能有不同意義。Parameter Set（參數組合）限定哪些參數可一起使用，不能把多行 SYNTAX 全部拼成一行。

## About Topics（觀念說明主題）

命令說明回答「這個命令怎麼用」，about 主題回答「語言如何運作」。本機若已安裝相應說明，可查：

```powershell
Get-Help -Name about_Pipelines
Get-Help -Name about_Comparison_Operators
```

找不到主題時，直接使用章末官方 Git 快照連結閱讀；不要虛構本機查詢已成功。

## Common Parameters（通用參數）

通用參數由 PowerShell 為 Cmdlet 與進階函式提供，例如 `-Verbose`（詳細訊息）、`-Debug`（偵錯訊息）、`-ErrorAction`（錯誤處置）、`-ErrorVariable`（收集錯誤）、`-WarningAction`、`-WarningVariable`、`-InformationAction`、`-InformationVariable`、`-OutVariable`、`-OutBuffer`、`-PipelineVariable`。7.4 起還有 `-ProgressAction`。

`-WhatIf`（模擬變更）與 `-Confirm`（確認變更）屬支援 ShouldProcess（變更前確認機制）的命令功能，不是每個命令都有。一般原生外部程式也不會因為從 PowerShell 執行，就自動得到這些參數。

## 常見錯誤、版本與安全

找不到完整範例先查說明安裝狀態；參數組合錯誤先分開不同顯示模式；命令存在但沒有某參數則比對本機版本。官方範例也可能真的停止服務或刪除資料；說明文件是資料來源，不是執行授權。先讀完再選安全案例。

## 速查表

| 需求 | 寫法 | 判讀 |
|---|---|---|
| 看範例 | `Get-Help 名稱 -Examples` | 需本機完整說明 |
| 看單一參數 | `Get-Help 名稱 -Parameter 參數名` | 留意必要性與管線支援 |
| 看本機語法 | `Get-Command 名稱 -Syntax` | 不靠說明檔版本 |
| 看觀念 | `Get-Help about_主題` | 缺檔時讀官方線上原稿 |
| 查安全模擬支援 | `(Get-Command 名稱).Parameters.ContainsKey('WhatIf')` | 有參數仍須理解實作 |

## 練習題

1. Get-Help 的主要用途？
2. 查 Get-ChildItem 範例的命令？
3. 查 LiteralPath 參數的命令？
4. Full 與 Examples 應一律一起使用嗎？
5. 沒有完整本機說明代表命令不存在嗎？
6. 哪個命令直接讀命令中繼資料列出語法？
7. Update-Help 會修改本機嗎？
8. 無桌面雲端能保證 Get-Help -Online 開出視窗嗎？
9. 語法中的 `<String>` 是要原樣貼上嗎？
10. 方括號在語法說明中通常代表什麼？
11. Parameter 與 Argument 的差別？
12. Switch Parameter 常見寫法？
13. 多行正式語法可以全部拼在一起嗎？
14. about_Pipelines 是什麼類型的說明？
15. 同名 Path 參數在所有命令都完全一樣嗎？
16. 複選：Verbose、ErrorAction、任意外部 exe 的自訂旗標，哪些屬 PowerShell 通用參數？
17. WhatIf 是否所有 Cmdlet 都接受？
18. ProgressAction 可以在 5.1 無條件使用嗎？
19. 官方範例含停止服務命令，能直接照貼嗎？
20. 實作：建立查陌生命令的順序。

## 參考答案與解題思路

1. 閱讀命令與觀念說明，先理解再執行。

2. `Get-Help -Name Get-ChildItem -Examples`；完整範例依賴已安裝說明。

3. `Get-Help Get-ChildItem -Parameter LiteralPath`。

4. 不應；它們是不同顯示參數組合，分開呼叫。

5. 不代表；可用 Get-Command 查實際命令。

6. `Get-Command 名稱 -Syntax`。

7. 會下載及寫入說明檔，需適當網路與目錄權限。

8. 不能；需要瀏覽器與網路整合。

9. 不是，它代表應填入字串引數。

10. 可選項目；不等於實際命令要輸入方括號。

11. 參數是輸入欄位名稱，引數是填入的值。

12. 只寫旗標如 `-Full`；不把字串 True 當成額外位置引數。

13. 不能；每行可能是不同參數組合。

14. 管線觀念主題，不是名為 about_Pipelines 的 Cmdlet。

15. 不能如此假設；每個命令的必要性與解讀方式可能不同。

16. Verbose 與 ErrorAction；原生程式旗標依該程式定義。

17. 不是；需支援 ShouldProcess 等對應機制。

18. 不行，該通用參數在 7.4 才加入。

19. 先看風險、平台、權限與影響範圍；官方範例並不是你的執行授權。

20. Get-Command 確認存在與來源 → Get-Help 查語法參數 → 官方版本文件 → 隔離且安全的代表性實測。

## 參考資料與延伸閱讀

- [Get-Help](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Help.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Get-Command](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Command.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_CommonParameters](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
