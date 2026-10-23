<a id="chapter-14"></a>

# 第 14 章：條件判斷與迴圈

[返回目錄](../README.md)

## 學習目標

依條件選分支、逐項處理集合，理解 break 與 continue，為迴圈設定終止條件。

## if：先判斷，再執行

```powershell
$score = 80
if ($score -ge 90) {
    '優良'
} elseif ($score -ge 60) {
    '通過'
} else {
    '需要練習'
}
```

只執行第一個成立的分支，結果是「通過」。條件順序要從較嚴格到較寬鬆；若先判斷至少 60，90 分也會提早進入該分支。比較使用 `-ge` 等運算子，不把指派 `=` 當相等。

## foreach：處理每一筆資料

```powershell
$counts = 2, 3, 4
$doubled = foreach ($count in $counts) {
    $count * 2
}
$doubled
```

`foreach` 是語言關鍵字；`ForEach-Object` 是管線命令，雖概念相近，語法與資料取得方式不同。此例把每次成功輸出收集成 4、6、8，不必反覆 `$array +=`。

## for：需要索引時使用

```powershell
$names = '甲', '乙', '丙'
for ($i = 0; $i -lt $names.Count; $i++) {
    '{0}: {1}' -f $i, $names[$i]
}
```

初始化做一次，條件每輪檢查，更新在每輪結束執行。`-lt Count` 避免超出索引。只需要逐項值時 foreach 更直觀；需要位置編號時 for 比較合適。

## continue 與 break

```powershell
$result = foreach ($n in 1..5) {
    if ($n -eq 2) { continue }
    if ($n -eq 5) { break }
    $n
}
$result
```

結果 1、3、4。continue 跳過本輪剩餘部分，break 離開迴圈。不要把它們放到不清楚控制脈絡的管線指令區塊中，避免意外影響外層執行。

## while 與重試上限

```powershell
$attempt = 0
while ($attempt -lt 3) {
    $attempt++
    "第 $attempt 次練習"
}
```

while 在每輪前檢查條件；do/while 至少先做一次。真實網路重試需上限、等待間隔與可安全重試的操作，不能將付款、刪檔或不具冪等性的變更無限制重送。本例沒有網路，只說明終止條件。

## 錯誤、安全、版本與最佳實踐

忘記更新變數可能無限迴圈；邊界 `<= Count` 可能多跑一次；範圍 `1..0` 不會變成空集合，而是 1、0，需特別防範。先用少量合成資料核對次數，再套用真實資料。基本控制流程可用於 5.1／7，實際驗證仍以本書環境為準。

## 速查表

| 寫法 | 用途 | 選擇時機 |
|---|---|---|
| if/elseif/else | 選分支 | 第一個成立者執行 |
| foreach | 逐項迭代 | 只需要資料值 |
| for | 索引迭代 | 需要位置或步進 |
| while | 條件迴圈 | 先檢查再執行 |
| continue | 下一輪 | 跳過本輪剩餘 |
| break | 離開迴圈 | 達成停止條件 |

## 練習題

1. if/elseif 會執行所有成立分支嗎？
2. 本章 score 80 的結果？
3. 為何嚴格條件常放前面？
4. foreach 關鍵字與 ForEach-Object 是同一語法嗎？
5. 2、3、4 逐項乘 2 後結果？
6. 如何收集 foreach 的成功輸出？
7. for 的三段依序是什麼？
8. 初始化每輪都執行嗎？
9. Count 為 3，條件應使用 i 小於 3 還是小於等於 3？
10. 只有資料值不需位置時可優先選什麼？
11. continue 的作用？
12. break 的作用？
13. 本章跳過 2、遇 5 結束的結果？
14. while 何時檢查條件？
15. do/while 有什麼不同？
16. 忘記更新 while 的控制變數可能造成什麼？
17. `1..0` 是空集合嗎？
18. 網路重試為何需要上限？
19. 在未知管線區塊任意寫 break 有何風險？
20. 實作：測試迴圈至少涵蓋哪些資料量？

## 參考答案與解題思路

1. 不會，只執行第一個成立的分支。

2. 通過，因為不滿 90 但至少 60。

3. 避免寬鬆條件提早攔下本應屬於更高等級的資料。

4. 不是，前者語言迴圈，後者管線命令。

5. 4、6、8。

6. 把整個 foreach 運算結果指派給變數，如 `$doubled = foreach (...) { ... }`。

7. 初始化、條件、每輪更新。

8. 不會，只在迴圈開始時執行一次。

9. 小於 3，索引為 0、1、2。

10. foreach，意圖較清楚。

11. 跳過本輪剩餘內容，進入下一輪。

12. 離開目前對應迴圈。

13. 1、3、4。

14. 每輪執行前。

15. 先執行一次，再檢查是否繼續。

16. 條件永遠成立，形成無限迴圈。

17. 不是，它包含 1 與 0。

18. 避免持續施壓或重複變更，還需等待策略與冪等性考量。

19. 控制流程可能影響非預期的外層執行，應先理解脈絡。

20. 零筆、一筆、多筆，另測邊界條件與提前停止次數。

## 參考資料與延伸閱讀

- [about_If](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_If.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_For](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_For.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Foreach](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Foreach.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
