<a id="chapter-09"></a>

# 第 9 章：管線與參數繫結

[返回目錄](../README.md)

## 學習目標

追蹤每一段管線的輸入輸出型別，區分按值與按屬性名稱繫結，建立可檢查的資料流程。

## 每一段都只做一件事

Pipeline（管線）使用 `|` 將成功輸出送到下一段。PowerShell Cmdlet 間通常傳物件，不只是畫面文字；外部原生程式的標準輸入輸出另有規則。[第 2 章](02-powershell-versions.md)說明 7.4 位元組重新導向差異。

```powershell
$records = @(
    [pscustomobject]@{ Name = '甲'; Count = 2 }
    [pscustomobject]@{ Name = '乙'; Count = 5 }
    [pscustomobject]@{ Name = '丙'; Count = 3 }
)
$records |
    Where-Object { $_.Count -ge 3 } |
    Sort-Object -Property Count -Descending |
    Select-Object -Property Name, Count
```

輸出順序是乙 5、丙 3。`$_` 是目前正被處理的物件；`-ge` 是大於或等於。每行以管線符號結束後，可接下一行，通常不需要脆弱的反引號續行。

```text
三筆自訂資料
      ↓ 篩選 Count >= 3
兩筆符合條件的物件
      ↓ 按 Count 遞減
乙、丙
      ↓ 選取 Name、Count
報表資料
```

## Parameter Binding（參數繫結）

繫結就是把傳來的值配給命令參數。先處理命令列上的具名、位置引數，再處理管線輸入。接收參數必須宣告支援管線，不能只因型別相近就認為一定可接。

ByValue（按值）依整個輸入物件的型別配對；ByPropertyName（按屬性名稱）依輸入物件的屬性名稱配對。順序概念為：按值不轉型 → 按屬性名不轉型 → 按值轉型 → 按屬性名轉型。參數組、已綁定參數與型別限制仍會影響結果。

```powershell
(Get-Command -Name Get-Item).Parameters['LiteralPath'].Attributes |
    Select-Object -Property ValueFromPipeline, ValueFromPipelineByPropertyName
```

此查詢查看參數屬性；有些屬性物件不具這兩個欄位，會顯示空白，應搭配正式說明與參數組資訊判讀。本書功能測試另使用自訂無副作用的接收函式確認 ByValue 與 ByPropertyName。

## Select-Object：選資料，不是只排版

Select＝選取、Object＝物件。`-Property` 選欄位，`-First` 取前幾筆，`-ExpandProperty` 取出單一屬性的實際值。

```powershell
$records | Select-Object -Property Name
$records | Select-Object -ExpandProperty Name
$records | Select-Object -First 1
```

第一行回傳帶 Name 屬性的物件，第二行回傳名稱字串，第三行保留第一個原始物件。畫面可能很像，但後續能使用的欄位不同。`-First` 在管線中可能讓上游提早停止；當你需要上游全部執行時，應閱讀 `-Wait` 說明並重新設計流程。

## 格式化應放在終點

錯誤的觀念是先 Format-Table 再拿結果當資料。正確順序通常是取得 → 篩選 → 排序 → 選欄位 → 匯出或最後顯示。`Sort-Object` 通常需要看完輸入才能排序；管線不代表每一段都能零等待、固定記憶體逐筆輸出。

錯誤串流與成功串流不同，畫面上有錯誤不表示那筆訊息自動成為下一段的資料。不要為了讓管線看起來乾淨，就全面隱藏錯誤；先診斷再處理。

## 安全、版本與最佳實踐

管線末端可以是刪除或停止命令，所以先單獨執行查詢端，確認目標數量與身分，再考慮有授權的變更。不要將外部輸入管到 Invoke-Expression。這一章全部使用記憶體測試資料，沒有真實系統變更。

## 速查表

| 動作 | 命令片段 | 產生什麼 |
|---|---|---|
| 挑欄位 | `Select-Object -Property Name` | 具 Name 屬性的新物件 |
| 取值 | `Select-Object -ExpandProperty Name` | Name 的實際值 |
| 取一筆 | `Select-Object -First 1` | 可能使上游提早停止 |
| 看目前管線物件 | `$_` | 只在適當指令區塊脈絡使用 |
| 查看接收規則 | `Get-Help 命令 -Parameter 名稱` | 本機說明需完整且版本相符 |

## 練習題

1. 管線運算子是哪個字元？
2. Cmdlet 間管線通常傳送什麼？
3. 本章三筆資料篩選 Count 大於等於 3 後有幾筆？
4. 再按 Count 遞減排序會得到什麼順序？
5. `$_` 在 Where-Object 區塊代表什麼？
6. 繫結的白話意思？
7. 具名引數與管線輸入，哪個先繫結？
8. ByValue 的配對基礎？
9. ByPropertyName 的配對基礎？
10. 只因有相同型別就能任意管到命令嗎？
11. 四階段管線繫結順序？
12. Select-Object -Property Name 回傳名稱字串嗎？
13. 如何直接取得 Name 的值？
14. Select-Object -First 1 有什麼上游影響？
15. 需讓上游處理完整時應查哪個參數？
16. 為什麼 Format-Table 不適合放在資料篩選前？
17. 管線保證每段都逐筆且不緩衝嗎？
18. 錯誤訊息是否自動送到下一個命令的成功輸入？
19. 管線接 Remove 類命令前，至少先做什麼？
20. 實作：把 Name 變成字串後還能取 Count 嗎？

## 參考答案與解題思路

1. 直線 `|`，不是大寫英文字母 I。

2. 物件；不要把螢幕排版當成傳送格式。

3. 兩筆，乙與丙。

4. 乙 5、丙 3。

5. 目前正在處理的輸入物件。

6. 把引數或管線資料配給命令參數。

7. 先處理命令列具名與位置引數，再處理管線輸入。

8. 整個輸入物件的型別是否符合或可轉成接收參數型別。

9. 輸入物件屬性名稱與參數名稱或別名相符，型別仍需符合或可轉換。

10. 不能，接收參數還必須支援管線輸入。

11. 按值不轉型、按屬性名不轉型、按值轉型、按屬性名轉型。

12. 不是，通常是含 Name 屬性的新物件。

13. `Select-Object -ExpandProperty Name`。

14. 可能使產生資料的上游命令提早停止。

15. `-Wait`，並檢查整段流程是否應依賴上游副作用。

16. 它輸出格式指示資料，後續取得的已不是原來欄位。

17. 不保證；排序等操作通常需要完整輸入。

18. 不是，錯誤與成功輸出屬不同串流。

19. 單獨檢查查詢結果、數量與路徑，再確認授權和模擬支援。

20. 不能直接保留原來 Count；要先保留所需欄位或仍傳原始物件。

## 參考資料與延伸閱讀

- [about_Pipelines](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Pipelines.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [about_Parameter_Binding](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Parameter_Binding.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。
- [Select-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Object.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
