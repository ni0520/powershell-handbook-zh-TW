<a id="chapter-16"></a>

# 第 16 章：函式與參數設計

[返回目錄](../README.md)

## 學習目標

把重複邏輯封裝為函式，使用可驗證的輸入介面，保持成功輸出只有預期資料。

## Function（函式）是有名字的處理步驟

先把輸入與輸出想清楚，再命名函式。Get-LearningTotal 代表「取得練習總額」，不暗示它會修改帳務。函式在呼叫前必須已經定義；載入檔案不是自動知道所有尚未執行的定義。

```powershell
function Get-LearningTotal {
    [CmdletBinding()]
    param(
        [ValidateRange(0, 1000)]
        [int]$Count,
        [ValidateRange(0, 1000)]
        [int]$UnitPrice = 20
    )
    Write-Verbose "計算 $Count 筆資料"
    [pscustomobject]@{
        Count = $Count
        Total = $Count * $UnitPrice
    }
}
Get-LearningTotal -Count 3
```

回傳 Count=3、Total=60 的物件。`[CmdletBinding()]` 啟用進階函式行為與通用參數，後續可用 `-Verbose`。此例 Count 沒設 Mandatory（必要），省略時 int 預設為 0；若業務要求必填，應明確加 `[Parameter(Mandatory)]`，不要只在說明寫「必填」。

## 不要污染成功輸出

```powershell
function Get-LearningDouble {
    param([int]$Value)
    $Value * 2
}
Get-LearningDouble -Value 4
```

結果 8。PowerShell 函式內未接住的成功輸出都會流出；`return` 是提早離開，不能回溯清除前面已輸出的值。紀錄診斷用 Write-Verbose，資料用物件，避免混合「開始」字串與報表列。

## Splatting（參數展開）

```powershell
$options = @{ Count = 4; UnitPrice = 30 }
Get-LearningTotal @options
```

雜湊表鍵對應參數名稱，使用 `@options` 展開參數而不是 `$options` 當單一值傳入。這讓長命令保持可讀，仍需符合目標命令的參數組與型別。

## Scope（作用域）

函式內變數通常屬函式本身的區域範圍；避免為了共享資料就到處寫 `$global:`。把依賴作為參數傳入，把結果作為物件回傳，較容易測試。若修改的是共享參考物件，其內容仍可能被呼叫端看見，所以「區域變數」不代表所有物件都被複製。

## 錯誤、安全、版本與最佳實踐

參數驗證失敗時先檢查輸入，不用取消限制來讓測試通過。函式命名採核准動詞與具體名詞；別把簡短別名變成公開介面。基本函式與此驗證語法適用 5.1／7，實測以 7.6.8 為準。本例只算記憶體資料，不存檔、不連網。

## 速查表

| 語法 | 意義 | 注意 |
|---|---|---|
| `function 名稱 {}` | 定義函式 | 先定義再呼叫 |
| `param()` | 宣告輸入 | 必填需明確設定 |
| `[CmdletBinding()]` | 進階行為 | 通用參數名稱不可重複宣告 |
| `@options` | 展開參數 | 鍵對應參數名 |
| `return` | 離開函式 | 先前成功輸出仍存在 |

## 練習題

1. Function 的中文與用途？
2. 函式可在定義執行之前任意呼叫嗎？
3. Get-LearningTotal 的命名想表達什麼？
4. Count 3、預設 UnitPrice 20 的 Total？
5. 本例 Count 是否必填？
6. 真正必填參數如何宣告？
7. ValidateRange 會檢查什麼？
8. CmdletBinding 帶來哪些能力？
9. 如何顯示 Write-Verbose 訊息？
10. 為什麼不用普通字串寫「開始」當日誌？
11. 函式只有 return 的值會輸出嗎？
12. return 能撤銷前面輸出的資料嗎？
13. Get-LearningDouble 4 回傳多少？
14. Splatting 的中文與概念？
15. 傳 options 應寫 @options 還是 $options？
16. Count 4、UnitPrice 30 的結果？
17. 函式中到處使用 global 變數有什麼問題？
18. 區域變數是否保證共享物件內容不受影響？
19. 輸入驗證失敗應取消限制嗎？
20. 如何讓函式容易測試？

## 參考答案與解題思路

1. 函式，將可重複的步驟命名並提供輸入輸出介面。

2. 不能；一般腳本需先定義或載入。

3. 取得練習總額，不表示修改真實帳務。

4. 60。

5. 不是；未宣告 Mandatory，int 省略時預設 0。

6. 使用 `[Parameter(Mandatory)]`，並在自動化中明確傳值避免互動提示。

7. 數值是否落在允許範圍。

8. 進階函式行為與通用參數等，詳細選項需依宣告。

9. 呼叫進階函式時加 -Verbose。

10. 它會混入成功輸出，破壞資料介面。

11. 不是，所有未接住的成功輸出也會流出。

12. 不能，只是結束目前函式流程。

13. 8。

14. 參數展開，將字典鍵值映射成具名參數。

15. 參數展開使用 @options；後者是單一變數值。

16. Total 為 120。

17. 隱藏依賴、污染工作階段、增加測試不確定性。

18. 不保證，參考物件內容仍可能被共同修改。

19. 先修正輸入或確認業務規格，不能只為通過測試降低限制。

20. 明確傳入依賴、回傳結構化資料、分離外部副作用，測正常與邊界輸入。

## 參考資料與延伸閱讀

- [about_Functions](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Functions_Advanced](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_Advanced.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Functions_Advanced_Parameters](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_Advanced_Parameters.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
