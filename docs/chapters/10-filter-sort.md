<a id="chapter-10"></a>

# 第 10 章：資料篩選、排序與第一份小報表

[返回目錄](../README.md)

## 學習目標

分清篩選列、選取欄位與排序，處理數值／字串差異，使用人工可核對的輸入驗證結果。

## 準備一份不用碰真實系統的資料

下面四筆是合成練習資料，不代表任何企業設備。SizeMB 是數值，Owner 是文字。先固定資料，才能算出預期答案。

```powershell
$files = @(
    [pscustomobject]@{ Name = '甲.log'; SizeMB = 12; Owner = 'IT' }
    [pscustomobject]@{ Name = '乙.txt'; SizeMB = 3; Owner = 'HR' }
    [pscustomobject]@{ Name = '丙.log'; SizeMB = 20; Owner = 'IT' }
    [pscustomobject]@{ Name = '丁.csv'; SizeMB = 12; Owner = 'HR' }
)
```

## Where-Object：挑出符合條件的物件

Where＝符合哪個條件，Object＝物件；可記作「哪些資料要留下」。學習優先度 ★★★★★。它篩選列，不替你刪掉原始檔案。

```powershell
$files | Where-Object { $_.SizeMB -ge 10 }
$files | Where-Object SizeMB -GE 10
$files | Where-Object {
    $_.SizeMB -ge 10 -and $_.Owner -eq 'IT'
}
```

前兩行等價，得到甲、丙、丁。第三行有兩個條件，得到甲、丙。複合條件使用 ScriptBlock（指令區塊）較清楚；不要把多個簡化語法的比較旗標任意拼成同一參數組。

`-eq` 相等、`-ne` 不等、`-gt` 大於、`-ge` 大於等於、`-lt` 小於、`-le` 小於等於。`=` 是指派，不是相等比較；篩選區塊寫錯可能修改記憶體中的物件。

## 萬用字元與正規表示式不是同一種規則

```powershell
$files | Where-Object { $_.Name -like '*.log' }
$files | Where-Object { $_.Name -match '\.log$' }
```

`-like` 使用萬用字元；`-match` 使用 Regular Expression（正規表示式）。正規表示式中的點原本表示任意字元，因此 `\.` 才是字面點，`$` 表示結尾。不要將 `*.log` 直接當成相同意思的正規表示式。

一般字串比較預設不區分大小寫；`-ceq` 等以 c 開頭的比較運算子可區分大小寫。資料來源若有特殊文化區域需求，仍需明確測試。

## Sort-Object：調整順序

Sort＝排序。`-Property` 指定排序欄位，`-Descending` 改為遞減。先排序再取前三筆，才是「最大的三筆」。

```powershell
$files |
    Sort-Object -Property SizeMB -Descending |
    Select-Object -First 3 -Property Name, SizeMB
```

最大的值是丙 20；甲與丁同為 12。若需要同值時也穩定呈現，可加入第二排序鍵 Name，或在支援版本使用 `-Stable` 保持原輸入順序。`-Stable` 在 6.2 起提供，5.1 不支援。

```powershell
$files | Sort-Object -Property @(
    @{ Expression = 'SizeMB'; Descending = $true }
    @{ Expression = 'Name'; Descending = $false }
)
```

字串排序與數值排序不同：字串 '10'、'2' 可能按字典順序，而數值 10、2 按數量大小。CSV 匯入值通常是字串，後續資料章會處理型別轉換；現在先養成用 Get-Member 檢查型別的習慣。

## 實務小報表與核對

```powershell
$report = $files |
    Where-Object { $_.Owner -eq 'IT' -and $_.SizeMB -ge 10 } |
    Sort-Object -Property SizeMB -Descending |
    Select-Object -Property Name, SizeMB
$report
@($report).Count
```

預期兩筆：丙 20、甲 12，Count 為 2。這段尚未寫入檔案；在輸出 CSV 前應先核對資料與欄位。零筆結果也是需要測試的情境，不能只驗證有資料時的漂亮畫面。

## 常見錯誤、安全、版本與最佳實踐

誤把 `Select-Object` 當篩選條件、把數字保存為字串、把 `=` 當 `-eq`，都可能讓報表錯誤卻沒有明顯例外。應使用小型已知資料核對邊界：9、10、11 是否符合「至少 10」，以及空輸入與同值排序。

`Where-Object` 區塊可執行任意程式碼；本書區塊只有比較，不能因此宣稱任意篩選式都無副作用。完整參數與五類範例見[命令教學附錄](../appendices/cmdlet-tutorials.md)。

## 速查表

| 任務 | 寫法 | 記憶 |
|---|---|---|
| 篩選資料列 | `Where-Object { $_.SizeMB -ge 10 }` | 哪些資料留下 |
| 選欄位 | `Select-Object Name, SizeMB` | 哪些資訊保留 |
| 遞減排序 | `Sort-Object SizeMB -Descending` | 大到小 |
| 檔名模式 | `-like '*.log'` | 萬用字元 |
| 正規式結尾 | `-match '\.log$'` | 點需跳脫 |
| 明確筆數 | `@($report).Count` | 零筆也能核對 |

## 練習題

1. Where-Object 篩選資料列還是選取欄位？
2. 本章 SizeMB 至少 10 的資料有幾筆？
3. 再限制 Owner 為 IT 後剩幾筆？
4. `-ge` 的中文意思？
5. `=` 與 `-eq` 的差異？
6. 簡化寫法 `Where-Object SizeMB -GE 10` 等價於什麼？
7. 複合條件建議使用什麼形式？
8. `-like` 與 `-match` 使用同一種模式嗎？
9. 以 .log 結尾的萬用字元模式？
10. 以 .log 結尾的正規表示式？
11. 一般字串 -eq 是否區分大小寫？
12. Sort-Object 的預設方向？
13. 找最大的三筆，先 First 3 還是先排序？
14. SizeMB 同為 12 時如何定義次要順序？
15. `-Stable` 能在 5.1 使用嗎？
16. 字串 '10'、'2' 為何可能排序不如預期？
17. 如何取得零筆結果也可靠的筆數？
18. 本章報表命令會寫入 CSV 檔案嗎？
19. Where-Object 是否保證沒有副作用？
20. 設計至少三種邊界測試。

## 參考答案與解題思路

1. 篩選符合條件的物件；選欄位用 Select-Object。

2. 三筆：甲 12、丙 20、丁 12。

3. 兩筆：甲、丙。

4. 大於或等於，包含邊界值。

5. 前者指派，後者比較；篩選式寫錯可能改值。

6. `Where-Object { $_.SizeMB -ge 10 }`。

7. 指令區塊搭配 -and 或 -or，避免混用互斥參數組。

8. 不同，前者萬用字元，後者正規表示式。

9. `'*.log'`，搭配 -like。

10. `'\.log$'`，搭配 -match，點要跳脫。

11. 預設不區分；需要時可用 -ceq。

12. 通常遞增；遞減加 -Descending。

13. 先按目標數值排序，再取 First 3；順序反過來只排序原本前三筆。

14. 加第二排序鍵 Name，或在支援版本使用 -Stable 保持輸入順序。

15. 不能；它在 PowerShell 6.2 起提供。

16. 它們按文字規則比較；應依需求轉成數值型別。

17. `@($report).Count`，先把結果視為集合。

18. 不會；只建立記憶體資料，尚未呼叫匯出命令。

19. 不保證，區塊可執行任意操作；本章只使用比較。

20. 空輸入、等於門檻 10、低於門檻 9、同值排序、多種數值型別；確認結果與人工預期一致。

## 參考資料與延伸閱讀

- [Where-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Where-Object.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Sort-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Sort-Object.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Select-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Object.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Comparison_Operators](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Comparison_Operators.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
