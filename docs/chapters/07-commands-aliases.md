<a id="chapter-07"></a>

# 第 7 章：Cmdlet、Alias 與命名規則

[返回目錄](../README.md)

## 學習目標

從用途找到命令，查出命令來源與種類，避免別名與同名命令造成誤用。

## Get-Command 是命令搜尋工具

`Get-Command`（取得命令）中的 Command 是「命令」，不是只指編譯過的 Cmdlet。它能發現 Alias（別名）、Function（函式）、Cmdlet、Script（指令碼）與 Application（外部程式）等種類。學習優先度為 ★★★★★。

```powershell
Get-Command -Name Get-ChildItem
Get-Command -Verb Get -Noun '*Item*'
Get-Command -Module Microsoft.PowerShell.Utility |
    Select-Object -Property Name, CommandType
```

`-Verb` 按動詞查、`-Noun` 按名詞查；兩者的值不是中文翻譯。第一行精確查某命令，可能觸發模組自動載入；查詢工具不是保證完全沒有載入行為。一般查詢不需要系統管理員身分。

預設無參數列出安裝的 Cmdlet、函式、別名；`Get-Command *` 則包含 PATH 中的外部程式。`-ListImported` 可限制已匯入的命令。要辨認實際執行者，查看 Name、CommandType、Source、Version。

## Verb-Noun 的記憶方式

Get＝取得，Set＝設定，New＝建立，Remove＝移除，Test＝測試，Import＝匯入，Export＝匯出。這些是理解命令的線索；不能因命令以 Get 開頭就跳過來源審查，尤其是第三方函式。

`Get-Verb` 列出官方核准動詞。命名函式時優先用核准動詞與具體單數名詞，例如 `Get-LearningRecord`。不要把所有英文動詞都當成核准動詞，也不要把別名當成正式命名規則。

```powershell
Get-Verb -Verb Get, Set, New, Remove, Test
```

## Alias 只是名稱捷徑

`Get-Alias`（取得別名）中 Alias 是「同一命令的另一個名字」。別名不像函式，不能直接附帶固定參數。互動時可用簡短名稱，但教材與可維護指令碼保留完整名稱。

```powershell
Get-Alias -Name gci
Get-Alias -Definition Get-ChildItem
Get-Alias -Name cd
```

第一行從別名找定義；第二行從命令找有哪些別名；第三行查看 cd。在 Windows 中熟悉的 `ls`、`curl`、`wget` 不可假設在 Linux 或其他 PowerShell 版本有同一解析結果。

## 同名命令與優先順序

對已載入且可用的命令，一般解析順序為別名、函式、Cmdlet、外部可執行檔。模組自動載入與路徑解析另有細節，診斷時不要只憑背下順序。

```powershell
Get-Command -Name Get-ChildItem -All
Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath .
```

`-All` 可找出同名結果；`模組\命令` 限定來源。執行目前目錄中的腳本通常使用 `./script.ps1` 或 `&` 加明確路徑，避免誤執行搜尋路徑中的同名程式。這裡只是語法說明，不會建立或執行未知檔案。

## 常見錯誤、參數與安全

「The term ... is not recognized」可能是拼字、模組未安裝、PATH 或平台差異；先查完整名稱，不要任意安裝網路同名套件。參數 `-Module` 限制來源，`-CommandType` 限制種類，`-Syntax` 顯示語法。7.6 新增的 `-ExcludeModule` 不可套用到所有舊版。

完整十四項命令教學見[附錄](../appendices/cmdlet-tutorials.md)。本章主要命令為 Get-Command 與 Get-Alias；模組安裝與正式函式設計於後續章節展開。

## 速查表

先查來源、再查語法、再執行。共用腳本不要建立容易遮蔽系統命令的別名，也不要依賴個人設定檔中的捷徑。

| 需求 | 命令 | 限制 |
|---|---|---|
| 找取得項目的命令 | `Get-Command -Verb Get -Noun '*Item*'` | 只查本環境可發現項目 |
| 查所有同名結果 | `Get-Command 名稱 -All` | 注意 CommandType、Source |
| 別名找命令 | `Get-Alias -Name gci` | 每個工作階段可不同 |
| 命令找別名 | `Get-Alias -Definition Get-ChildItem` | 沒結果不等於命令不存在 |
| 核准動詞 | `Get-Verb` | 不保證任意動詞都是核准項目 |

## 練習題

1. Get-Command 只會列出 Cmdlet 嗎？
2. 按動詞 Get 與名詞 Item 模糊搜尋如何寫？
3. CommandType 欄位有何用途？
4. Source 欄位通常幫助判定什麼？
5. Get-Command 精確查命令可能觸發什麼？
6. 無參數與 `Get-Command *` 有何重要差異？
7. 只看已匯入命令用哪個參數？
8. 官方核准動詞如何查？
9. Set、New、Test 分別表示什麼？
10. Alias 的中文與意義？
11. 從 gci 找完整命令如何寫？
12. 從 Get-ChildItem 找所有別名如何寫？
13. 別名能直接包含固定參數嗎？
14. 為何教材不用 ls 取代 Get-ChildItem？
15. 同名已載入命令的一般優先順序？
16. 如何查看同名命令被遮蔽的可能性？
17. 如何限定使用 Management 模組的 Get-ChildItem？
18. 當前目錄腳本為何常寫 `./script.ps1`？
19. 找不到命令是否應立刻安裝同名網路套件？
20. 情境：腳本在同事機器失敗，你使用了自訂別名；如何改善？

## 參考答案與解題思路

1. 不會，也可列函式、別名、腳本與外部應用程式。

2. `Get-Command -Verb Get -Noun '*Item*'`。

3. 分辨別名、函式、Cmdlet 與外部程式等種類。

4. 命令所屬模組或來源，搭配種類與版本判讀。

5. 模組自動載入；查詢不等於永遠零載入行為。

6. 後者也包含 PATH 可找到的非 PowerShell 外部檔案。

7. `-ListImported`。

8. `Get-Verb`；不要憑英文直覺自行假設。

9. 設定、建立、測試；名稱只是用途線索。

10. 別名，指向另一命令的名稱捷徑。

11. `Get-Alias -Name gci`；一般指向 Get-ChildItem，仍以本機結果為準。

12. `Get-Alias -Definition Get-ChildItem`。

13. 不能以普通別名定義做到；需要封裝函式等方式。

14. ls 解析可能因平台與工作階段不同，完整名稱較清楚。

15. 別名、函式、Cmdlet、外部程式；還需考慮路徑與模組載入細節。

16. `Get-Command -Name 名稱 -All`。

17. `Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath .`。

18. 明確指定位置，避免搜尋路徑中的同名程式。

19. 不應；先查拼字、平台、模組與官方來源。

20. 改用完整命令並明確宣告模組依賴，在 -NoProfile 工作階段重測。

## 參考資料與延伸閱讀

- [Get-Command](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Command.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Get-Alias](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Alias.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Aliases](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Aliases.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Command_Precedence](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Command_Precedence.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
