<a id="chapter-08"></a>

# 第 8 章：物件、屬性與方法

[返回目錄](../README.md)

## 學習目標

以 Get-Member 發現物件能力，區分資料與畫面格式，理解集合展開與直接傳參數的差別。

## 從通訊錄理解物件

一筆聯絡人可有姓名、電話、部門。這些欄位是 Property（屬性）；若程式提供更新、複製等操作，就是 Method（方法）。Type（型別）描述這一類資料的規則。PowerShell 把資料以物件形式傳遞，省去許多從排版文字切割欄位的工作。

先用完全在記憶體中的資料練習，不接觸真實個資：

```powershell
$record = [pscustomobject]@{
    Name = '練習帳號'
    Department = '資訊部'
    Count = 3
}
$record.Name
$record.Count + 2
```

`[pscustomobject]` 建立具名屬性的自訂物件；`@{ }` 在此提供屬性名稱與值。輸出依序為「練習帳號」與數值 5。字串與整數的行為不同：`'3' + '2'` 是文字串接成 32，`3 + 2` 是數值 5。

## Get-Member：看物件有哪些成員

`Get-Member`（取得成員）中 Member 是「成員」，包括屬性與方法。學習優先度 ★★★★★。它查看資料結構，不會逐一執行列出的所有方法。

```powershell
$record | Get-Member
$record | Get-Member -MemberType NoteProperty
'PowerShell'.ToUpperInvariant()
```

第一行列型別與成員；第二行限制 NoteProperty（附加資料屬性）；第三行對字串呼叫不受文化區域影響的轉大寫方法，得到 POWERSHELL。方法後面的括號代表呼叫；只看到名稱不等於方法已執行。

## 畫面欄位不是所有屬性

```powershell
Get-Process -Id $PID | Get-Member -MemberType Property
Get-Process -Id $PID | Select-Object -Property Id, ProcessName
```

第一行探索處理程序物件，第二行選出要傳遞的資料。`Format-Table`（格式化表格）與 `Format-List`（格式化清單）是呈現用命令；若後面還要匯出 CSV，不要先格式化，否則收到的是格式指示資料而非原本業務欄位。

## 集合與單一物件不同

```powershell
$numbers = 1, 2, 3
$numbers | Get-Member
Get-Member -InputObject $numbers
```

管線通常逐項列舉集合，第一種觀察每個整數的型別成員；`-InputObject` 直接傳入整個陣列，第二種觀察陣列本身。這個差異是許多「為什麼 Count 不一樣」問題的根源。`@(...)` 可用來收集零筆、一筆或多筆結果，讓後續按集合處理較一致。

`$null` 表示沒有值。對不存在屬性直接讀取，某些情況可能悄悄得到空值；StrictMode（嚴格模式）可讓部分問題更早失敗，但啟用前仍需了解與測試。不要用「沒出錯」代替資料正確性檢查。

## 常見錯誤與安全提醒

不要對不熟悉物件任意呼叫方法：檔案物件有刪除與移動方法，方法不必叫 Remove 才會改資料。Get-Member 是探索工具，實際呼叫前仍查官方型別文件。遠端回傳的反序列化物件也可能保留屬性而失去方法。

本章使用自訂資料、字串與目前處理程序唯讀查詢，不呼叫處理程序終止方法。5.1 與 7 的 .NET 型別可用方法及多載可能不同，不能只因成員同名就假設參數完全一致。

## 速查表

先決定輸出資料的型別與欄位，再決定畫面格式。參數、英文拆字與五類範例見[命令教學附錄](../appendices/cmdlet-tutorials.md)。

| 需求 | 寫法 | 注意 |
|---|---|---|
| 查看成員 | `物件 \| Get-Member` | 管線可能展開集合 |
| 只看附加資料屬性 | `Get-Member -MemberType NoteProperty` | 常見於自訂物件 |
| 查看集合本身 | `Get-Member -InputObject $numbers` | 與逐項管線不同 |
| 存取屬性 | `$record.Name` | 注意拼字與空值 |
| 呼叫字串方法 | `'abc'.ToUpperInvariant()` | 不代表所有方法都無副作用 |

## 練習題

1. 物件的三個核心觀察面向？
2. Property 與欄位名稱的關係？
3. 如何建立具 Name 屬性的自訂物件？
4. `3 + 2` 與 `'3' + '2'` 結果？
5. Get-Member 的 Member 是什麼？
6. Get-Member 會執行物件列出的刪除方法嗎？
7. 自訂物件欄位常屬哪種成員？
8. 取出 `$record` 的 Name 如何寫？
9. 方法呼叫如何辨認？
10. ToUpperInvariant 的範例結果？
11. 為何不要從 Get-Process 螢幕表格切文字欄位？
12. Select-Object 與 Format-Table 的用途差異？
13. 匯出 CSV 前先 Format-Table 可能出什麼問題？
14. `1,2,3 | Get-Member` 主要觀察什麼？
15. `Get-Member -InputObject (1,2,3)` 主要觀察什麼？
16. `@(...)` 在收集結果時有何用途？
17. `$null` 表示什麼？
18. 屬性拼錯卻沒有例外，可以視為正確嗎？
19. 遠端反序列化物件能保證保留原本方法嗎？
20. 情境：看到 FileInfo 有 Delete 方法，應直接試嗎？

## 參考答案與解題思路

1. 型別、屬性、方法；分別是資料種類、資料內容與可用操作。

2. 畫面欄位常對應屬性，但預設畫面不一定顯示全部屬性。

3. `[pscustomobject]@{ Name = '練習' }`；適合建立結構化測試資料。

4. 前者是數值 5，後者是字串 32；型別影響運算。

5. 成員，包含屬性與方法。

6. 不會；它列出成員資訊，但之後自行呼叫方法可能有副作用。

7. NoteProperty；可用 -MemberType NoteProperty 篩選。

8. `$record.Name`；不需要加方法呼叫括號。

9. 名稱後有括號，例如 `'abc'.ToUpperInvariant()`。

10. 把 abc 轉成 ABC，避免依文化區域改變大小寫規則。

11. 原始物件已有屬性，切排版文字容易受寬度與語系影響。

12. 前者選擇資料屬性，後者產生顯示格式指示。

13. 輸出格式內部資料，失去預期業務欄位。

14. 管線逐項送出的整數物件成員。

15. 整個陣列本身的成員，而非每個整數。

16. 把結果當成陣列處理，減少零筆與單筆的形狀差異。

17. 沒有值，不等於空字串一定具有相同意義。

18. 不能；可能只是取得空值，應檢查欄位與預期結果。

19. 不能；通常需重新在目標端執行操作。

20. 不應；先查文件與影響，只在隔離測試檔案且有明確需求時操作。

## 參考資料與延伸閱讀

- [about_Objects](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Objects.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Properties](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Properties.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Methods](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Methods.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Get-Member](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-Member.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Select-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Object.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
