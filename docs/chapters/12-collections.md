<a id="chapter-12"></a>

# 第 12 章：陣列與雜湊表

[返回目錄](../README.md)

## 學習目標

以順序存放多筆資料、以鍵快速查值，處理空集合與單筆結果，避免誤解雜湊表的列舉順序。

## Array（陣列）：按位置排列

```powershell
$names = @('甲', '乙', '丙')
$names[0]
$names[-1]
$names.Count
```

索引從 0 開始，`[0]` 是甲，`[-1]` 是最後一項丙，Count 為 3。`@()` 是空陣列；`@(命令)` 收集命令的零筆、一筆或多筆結果。陣列可以包含不同型別，但報表資料通常維持一致型別較容易處理。

```powershell
$empty = @()
$single = @('唯一')
$empty.Count
$single.Count
```

輸出 0、1。不要依賴互動顯示判斷集合形狀；一筆資料看起來像單一物件。若大量反覆追加，陣列 `+=` 可能產生配置成本，應量測並考慮泛型 List（清單）。

## Hashtable（雜湊表）：按鍵取值

```powershell
$settings = @{
    Name = '練習環境'
    RetryCount = 3
}
$settings['Name']
$settings.ContainsKey('RetryCount')
$settings['RetryCount'] = 4
```

Key（鍵）用來找到 Value（值）。這只修改記憶體中的設定，不會更動真實系統。一般雜湊表不保證列舉順序；若輸出順序有意義，建立 `[ordered]@{}`，其型別是 OrderedDictionary（有序字典），不是普通 Hashtable。

```powershell
$row = [ordered]@{ Name = '甲'; Count = 2 }
[pscustomobject]$row
```

此方式適合建立欄位順序清楚的報表物件。對字典內容列舉，使用 `.GetEnumerator()` 明確取得鍵值項目，再選 Key、Value；不要假設管線會像陣列一樣自動逐鍵展開。

## 巢狀資料與空值

```powershell
$config = @{ Service = @{ Port = 8080 } }
$config['Service']['Port']
```

輸出 8080，並沒有開啟網路埠。缺少鍵與鍵存在但值為 `$null` 不完全相同，使用 ContainsKey 判斷。索引超界在某些情境可能回傳空值而非立刻報錯，因此迴圈使用 `< Count`，不要用 `<= Count`。

## 常見錯誤、安全、版本與最佳實踐

複製集合參考不一定複製內容：把同一雜湊表指派給另一變數後修改，可能影響共同物件。要獨立快照時先定義複製需求；巢狀物件尤其不能只做淺層複製。不要在列舉時直接增刪同一集合，先記下要變更的鍵再執行。

本章僅記憶體操作，無外部權限需求；5.1 可用基本陣列、雜湊表與 ordered，但本次僅 7.6.8 實測。參考[第 8 章](08-objects.md)區分集合本身與集合元素。

## 速查表

| 寫法 | 中文用途 | 陷阱 |
|---|---|---|
| `@()` | 空陣列 | 不等於 `$null` |
| `$items[0]` | 第一項 | 先確認有資料 |
| `$items[-1]` | 最後一項 | 空集合需另處理 |
| `@{ Name = '甲' }` | 雜湊表 | 順序不保證 |
| `[ordered]@{}` | 有序字典 | 型別不同 |
| `.ContainsKey('Name')` | 檢查普通雜湊表鍵 | 不等於值非空 |

## 練習題

1. 陣列索引從哪個數字開始？
2. 三項陣列的 [-1] 代表什麼？
3. 空陣列如何建立？
4. `@('唯一')` 的 Count？
5. 陣列是否只能存相同型別？
6. 大量陣列 += 可能有什麼成本？
7. Hashtable 的中文？
8. 本章 settings 的 RetryCount 修改後是多少？
9. 普通雜湊表保證鍵依建立順序輸出嗎？
10. ordered 字典與普通 Hashtable 型別相同嗎？
11. 如何明確存取 Name 鍵？
12. 如何分辨缺鍵與值為 null？
13. 列舉雜湊表鍵值配對的方法？
14. `[pscustomobject]$row` 的用途？
15. 巢狀 Service 的 Port 如何讀取？
16. 資料中 Port=8080 會開網路服務嗎？
17. Count 為 3 的有效正索引是哪些？
18. 把雜湊表指派給另一變數一定複製內容嗎？
19. 列舉同時增刪集合為何危險？
20. 情境：命令回傳零、一、多筆，如何統一處理筆數？

## 參考答案與解題思路

1. 0；第三項的索引是 2。

2. 最後一項，而非倒數第二項。

3. `@()`，其 Count 為 0。

4. 1；明確表示集合。

5. 不是，但一致型別通常較易處理。

6. 可能反覆配置及複製，應量測並考慮 List。

7. 雜湊表，以鍵值配對存資料。

8. 4；只改記憶體資料。

9. 不保證；需要順序時使用 ordered。

10. 不同，前者是 OrderedDictionary。

11. `$settings['Name']`；對特殊鍵名也較清楚。

12. 先用 ContainsKey，再檢查對應值。

13. `.GetEnumerator()`，每項可看 Key、Value。

14. 將合適字典轉為具名屬性的報表物件。

15. `$config['Service']['Port']`。

16. 不會；只是記憶體中的數值。

17. 0、1、2；迴圈上限用小於 Count。

18. 不一定；可能仍指向同一物件。

19. 可能使列舉失效或結果混亂，先記錄變更清單。

20. 先以 `@(命令)` 收集，再讀 Count 並測試三種情況。

## 參考資料與延伸閱讀

- [about_Arrays](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Arrays.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Hash_Tables](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Hash_Tables.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
