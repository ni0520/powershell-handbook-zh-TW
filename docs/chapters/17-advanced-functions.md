<a id="chapter-17"></a>

# 第 17 章：進階函式與安全模擬

[返回目錄](../README.md)

## 學習目標

實作管線接收與逐筆處理，理解 SupportsShouldProcess 不會自動保護所有變更，設計可驗證的 WhatIf 行為。

## begin、process、end

```powershell
function Get-LearningSquare {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [int]$Number
    )
    process { $Number * $Number }
}
1, 2, 3 | Get-LearningSquare
```

結果 1、4、9。`process` 對每筆管線資料執行；`begin` 適合初始化，`end` 適合收尾。只寫一般函式主體不會自動變成理想的逐筆管線處理器。ByPropertyName 可讓輸入物件同名屬性繫結，需明確宣告並測試型別。

## ShouldProcess（變更前確認機制）

以下是**只在記憶體修改字典**的安全模型，並非真實系統設定：

```powershell
function Set-LearningValue {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory)]
        [hashtable]$Store,
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        [string]$Value
    )
    if ($PSCmdlet.ShouldProcess($Name, '設定練習值')) {
        $Store[$Name] = $Value
    }
}
$store = @{ Mode = 'Before' }
Set-LearningValue -Store $store -Name Mode -Value After -WhatIf
$store['Mode']
```

WhatIf 顯示模擬訊息，最後仍為 Before。實際變更需在 ShouldProcess 回傳 True 的分支內；只有宣告 SupportsShouldProcess、卻把變更寫在 if 外面，是危險的錯誤實作。

## Confirm 與權限不同

`-Confirm` 控制是否詢問，ConfirmImpact 與 `$ConfirmPreference` 共同影響提示。它不是授權機制，不能替代檔案或 API 權限。`-WhatIf` 也不是交易：前置查詢、參數驗證或放在保護區外的副作用仍可能發生。

本例可用另一份測試字典驗證正常路徑，再檢查 WhatIf 路徑不改資料。不要用真實刪檔、格式化或服務停機來證明模擬功能存在。

## 參數驗證與輸出契約

必要參數、ValidateSet（允許值集合）、ValidateRange 與自訂驗證應反映真實需求。進階函式不能重複宣告 Verbose、ErrorAction 等通用參數名稱。OutputType（輸出型別註記）協助工具，但不會強制把每個輸出轉成宣告型別，仍要測試實際物件。

## 錯誤、版本與最佳實踐

漏寫 process 可能只處理非預期的一筆資料；空管線、單筆、多筆都要測。PowerShell 7.3 加入 clean 區塊供清理用途，不能放進要支援 5.1 的腳本。本章不使用 clean，使用可清楚閱讀的基本區塊。

## 速查表

| 機制 | 用途 | 不能保證什麼 |
|---|---|---|
| ValueFromPipeline | 按值接管線 | 不等於所有型別都接受 |
| process | 每筆處理 | 仍需測空輸入 |
| SupportsShouldProcess | 提供 WhatIf/Confirm | 不會自動包住副作用 |
| ShouldProcess | 在變更前判斷 | 不授予權限 |
| OutputType | 描述預期型別 | 不強制執行轉型 |

## 練習題

1. process 區塊的主要用途？
2. begin 適合做什麼？
3. end 適合做什麼？
4. 本章平方函式對 1、2、3 的結果？
5. ValueFromPipeline 依什麼繫結？
6. ByPropertyName 需什麼條件？
7. SupportsShouldProcess 會加入哪些常見參數？
8. 只宣告 SupportsShouldProcess 就能保證不改資料嗎？
9. 本章 WhatIf 後 Mode 的值？
10. ShouldProcess 的兩個字串引數在範例表示什麼？
11. ConfirmImpact 的作用？
12. Confirm 提示能替代系統權限嗎？
13. WhatIf 是完整交易回復機制嗎？
14. 為何用記憶體字典測試？
15. 如何驗證正常與模擬兩條路徑？
16. 可以自己宣告名為 Verbose 的進階函式參數嗎？
17. OutputType 會強制回傳型別嗎？
18. 漏掉 process 應測哪些情境才能發現？
19. clean 區塊可以在 5.1 使用嗎？
20. 情境：模擬時檔案仍被修改，先查哪裡？

## 參考答案與解題思路

1. 對每筆管線輸入執行處理。

2. 一次性的初始化，而非逐筆結果處理。

3. 輸入結束後收尾或彙整。

4. 1、4、9。

5. 依整個輸入物件的值與型別。

6. 明確宣告，且物件屬性名稱與可接受型別符合接收參數。

7. WhatIf 與 Confirm。

8. 不能，實際副作用必須放在 ShouldProcess 同意後的分支。

9. Before，字典不應被修改。

10. 目標名稱與動作描述，讓提示能清楚表達影響。

11. 與 ConfirmPreference 等設定影響是否提示確認。

12. 不能；它是確認互動，不是授權。

13. 不是，保護區外的副作用仍可能發生。

14. 可驗證變更分支而不碰真實系統資料。

15. 各用獨立字典，正常呼叫應改值，WhatIf 呼叫應保持原值。

16. 不能與自動加入的通用參數名稱衝突。

17. 不會，仍需檢查實際結果。

18. 零筆、一筆與多筆管線輸入，核對輸出數與值。

19. 不行，這是 PowerShell 7.3 起功能。

20. 是否把寫入放在 ShouldProcess 判斷之外，或前置／巢狀操作有副作用。

## 參考資料與延伸閱讀

- [about_Functions_Advanced](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_Advanced.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Functions_Advanced_Parameters](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_Advanced_Parameters.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Functions_CmdletBindingAttribute](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Functions_CmdletBindingAttribute.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
