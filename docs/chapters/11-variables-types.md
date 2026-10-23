<a id="chapter-11"></a>

# 第 11 章：變數與資料型別

[返回目錄](../README.md)

## 學習目標

保存命令結果，區分字串與數值，理解明確轉型與型別限制，避免自動轉型造成錯誤報表。

## Variable（變數）是有名字的資料位置

變數名稱前加 `$`，例如 `$itemCount`。命名不區分大小寫，但應保持一致，使用描述用途的名稱。不要重新指派 `$HOME`、`$PID` 等系統提供的變數；本書使用 `$learningCount` 等專用名稱。

```powershell
$learningCount = 3
$learningCount = $learningCount + 2
$learningCount
$learningCount.GetType().FullName
```

結果是 5，型別通常為 System.Int32（32 位元整數）。沒有型別限制的變數稍後可以保存另一種資料，這是彈性，也是需要仔細檢查輸入的原因。

## 字串插值與單雙引號

```powershell
$name = '小安'
"你好，$name"
'你好，$name'
"共有 $($name.Length) 個字元"
```

雙引號會展開變數；單引號保留原文字。屬性運算放進 `$()`。不要把來自使用者的文字交給 Invoke-Expression；資料應保持為資料。

## 明確轉型與限制型別

```powershell
$quantity = [int]'12'
[int]$limit = 20
$limit = '30'
$quantity + $limit
```

`[int]'12'` 是這次運算轉型；`[int]$limit` 是對變數設型別限制，後續指派會嘗試轉型。結果 42。無法轉成數字的文字會失敗；整數也有範圍限制。金額可考慮 `[decimal]`，浮點運算則需理解精度與四捨五入，不要隨意用等號比較近似值。

```powershell
$parsed = 0
if ([int]::TryParse('12', [ref]$parsed)) {
    $parsed * 2
}
```

TryParse（嘗試解析）回傳成功與否，成功時透過 `[ref]` 參考參數寫入結果。這裡應得到 24；對外部輸入先驗證比讓大量例外淹沒流程更清楚。

## 布林值、空值與陷阱

`$true`、`$false` 是 Boolean（布林值）。非空字串 `'False'` 轉成布林值仍是 True，因為它是有內容的文字，不是布林常值。`$null` 代表沒有值，空字串代表存在但長度為零，兩者業務意義可能不同。

比較時左方型別可影響右方轉型。不要讓 `'10'` 與 `2` 混雜後才猜比較規則；先定義資料模型，把「數量」轉成數值。日期處理也需考慮文化區域，外部交換優先明確格式。

## 常見錯誤與安全、版本

`Cannot convert value` 先檢查原始資料、格式與範圍；不要直接把所有失敗轉成零，否則會掩蓋資料品質。5.1 與 7 基本變數語法相同，但 .NET 型別與轉型細節仍可能不同；本章代表性範例在 7.6.8 驗證。

## 速查表

| 寫法 | 意義 | 注意 |
|---|---|---|
| `$count = 3` | 保存數值 | 不覆寫系統變數 |
| `[int]'3'` | 轉型這個值 | 錯誤輸入會失敗 |
| `[int]$count = 3` | 限制變數型別 | 後續指派仍受限制 |
| `'文字 $count'` | 原樣文字 | 不插值 |
| `"文字 $count"` | 插入變數值 | 複雜運算用 `$()` |
| `[bool]'False'` | 非空字串為 True | 不是解析布林文字 |

## 練習題

1. 變數名稱前面的符號？
2. 變數名稱是否區分大小寫？
3. 為什麼不使用 HOME 當自己的暫存變數？
4. `$learningCount = 3` 後加 2 的結果？
5. 查資料型別的常見方法？
6. 單引號字串會展開 `$name` 嗎？
7. 雙引號中如何插入屬性運算？
8. `[int]'12'` 表示什麼？
9. `[int]$limit = 20` 有何額外效果？
10. 把文字 30 指派給 int 變數一定失敗嗎？
11. 本章 quantity 12 加 limit 30 的結果？
12. 整數型別是否沒有範圍上限？
13. 金額為何常考慮 decimal？
14. TryParse 回傳什麼？
15. `[ref]$parsed` 的用途？
16. `[bool]'False'` 是 True 還是 False？
17. `$null` 與空字串相同嗎？
18. 比較兩種型別資料前建議做什麼？
19. 轉型失敗一律替換為 0 有何問題？
20. 情境：使用者傳入一段命令文字，怎樣當資料處理？

## 參考答案與解題思路

1. `$`；例如 $learningCount。

2. 不區分，但應維持一致寫法增加可讀性。

3. 它有系統意義，覆寫會影響其他命令與工具。

4. 數值 5，前提是變數仍保存數值。

5. `.GetType().FullName`；空值需先檢查，否則不能呼叫方法。

6. 不會，保留原樣文字。

7. 使用 `$($name.Length)` 這類子運算式。

8. 把字串 12 明確轉成整數。

9. 限制變數型別，後續指派仍會檢查／轉換。

10. 不一定，可成功轉成 30；不能轉的文字才失敗。

11. 42，是數值相加。

12. 不是，例如 Int32 有固定範圍；超出應選擇適合型別或拒絕輸入。

13. 十進位表示較符合多數金額運算，但仍需明確捨入規則。

14. 表示解析成功與否的布林值，結果透過參考參數輸出。

15. 讓方法能回寫解析後的值。

16. True，非空字串不是布林常值的文字解析。

17. 不相同；一個沒有值，一個有字串但長度零。

18. 先定義並驗證型別，避免隱含轉型左右結果。

19. 把無效資料混成合法零值，掩蓋資料品質問題。

20. 保持為字串並驗證格式，不交給 Invoke-Expression 執行。

## 參考資料與延伸閱讀

- [about_Variables](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Variables.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Type_Conversion](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Type_Conversion.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
