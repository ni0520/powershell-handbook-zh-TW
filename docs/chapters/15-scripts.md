<a id="chapter-15"></a>

# 第 15 章：把命令保存成指令碼

[返回目錄](../README.md)

## 學習目標

建立可重複執行的 `.ps1`，使用參數而非硬編碼資料，區分執行、呼叫運算子與點來源。

## Script（指令碼）是可以版本管理的步驟

互動操作適合探索；指令碼把檢查過的步驟保存下來。把下列內容存成自己的 `Get-LearningTotal.ps1`，只會計算記憶體資料，不修改系統。

```powershell
[CmdletBinding()]
param(
    [ValidateRange(0, 1000)]
    [int]$Count = 3,
    [ValidateRange(0, 1000)]
    [int]$UnitPrice = 20
)
[pscustomobject]@{
    Count = $Count
    UnitPrice = $UnitPrice
    Total = $Count * $UnitPrice
}
```

`param()` 宣告輸入，ValidateRange（範圍驗證）拒絕不合理值；回傳物件包含輸入與 Total（總額）。這是整數教學模型，真實金額需另外處理小數與稅務規則。

## 執行方式

```powershell
./Get-LearningTotal.ps1 -Count 4 -UnitPrice 30
```

預期 Total 為 120。這個檔名是讀者練習要自行保存的檔案；專案已另提供對應範例於 examples，測試使用實際檔案，不宣稱上述檔名預先存在。

路徑含空格時可用 Call Operator（呼叫運算子）`&` 加字串路徑。單獨輸入引號包住的路徑只會產生字串，並不執行它。Dot Sourcing（點來源）使用 `. ./檔案.ps1`，會在目前作用域執行，常用來載入函式；不適合隨意對不明腳本使用。

## 可攜路徑與依賴

`$PSScriptRoot` 是指令碼所在目錄，`Get-Location` 是目前工作位置，兩者不保證相同。讀取隨腳本附帶的檔案時可由 PSScriptRoot 搭配 Join-Path 組成路徑；使用者提供的路徑則要驗證用途與存在性。

`#Requires -Version` 與 `#Requires -Modules` 可宣告最低要求；它們不會自動安裝缺失依賴。最低版本通過也不是全部功能相容保證。

## 成功輸出與錯誤

函式與腳本中未被接住的成功輸出都可能成為結果，不是只有 return 才算輸出。不要在資料輸出中夾雜「開始處理」等字串；可用 Write-Verbose 輸出診斷訊息，再以 `-Verbose` 按需顯示。

`exit` 會影響宿主程序或指令碼結束狀態，應在確定的命令列入口謹慎使用；可重複利用的函式通常用例外或回傳物件表達結果。不要用零退出碼包住失敗再宣稱完成。

## 安全、版本與最佳實踐

執行前先審閱原始碼與參數，使用測試資料；不要把下載與執行串成不可檢查的一行。Windows 的執行原則、檔案標記與組織政策會影響執行；依[第 3 章](03-installation.md)診斷，不將降低安全設定當預設解法。含中文且需 5.1 的腳本另查編碼。

## 速查表

| 項目 | 用途 | 注意 |
|---|---|---|
| `.ps1` | PowerShell 指令碼 | 純文字仍可執行高風險動作 |
| `param()` | 明確輸入介面 | 放在合法開頭位置 |
| `& '路徑'` | 呼叫字串表示的命令 | 不等同 Invoke-Expression |
| `. ./檔案.ps1` | 在目前作用域載入 | 可能改變當前變數與函式 |
| `$PSScriptRoot` | 腳本所在目錄 | 不等於目前工作位置 |
| `#Requires` | 需求宣告 | 不安裝依賴 |

## 練習題

1. PowerShell 指令碼常見副檔名？
2. param 區塊的目的？
3. ValidateRange 在本例限制什麼？
4. 預設 Count 3、UnitPrice 20 的總額？
5. Count 4、UnitPrice 30 的總額？
6. Count -1 應當成正常輸入嗎？
7. 回傳物件比只回傳排版文字有何好處？
8. 含空格的腳本路徑如何呼叫？
9. 單獨輸入引號路徑會執行檔案嗎？
10. 點來源與一般執行的作用域差異？
11. 對未知腳本任意點來源有何風險？
12. PSScriptRoot 與 Get-Location 一定相同嗎？
13. 附帶資料檔適合如何定位？
14. Requires 會替你安裝缺少模組嗎？
15. 只有 return 之後的值才會成為輸出嗎？
16. 診斷文字可用哪個串流工具避免混入資料？
17. exit 為何要謹慎？
18. 測試失敗卻回傳零退出碼有何問題？
19. 下載後直接串接執行為何不好？
20. 實作：從不同工作目錄執行腳本應測什麼？

## 參考答案與解題思路

1. .ps1，是保存命令的文字檔。

2. 定義輸入參數，避免把所有資料硬編碼。

3. Count、UnitPrice 必須在 0 到 1000 之間。

4. 60；這是整數模型。

5. 120。

6. 不應，範圍驗證應拒絕它。

7. 後續可按欄位篩選、測試與匯出。

8. 使用 `&` 加引號包住的路徑，另傳參數。

9. 不會，只產生字串。

10. 點來源在目前作用域執行，可能留下函式與變數。

11. 可能修改目前工作階段及執行未審閱操作。

12. 不一定，前者是腳本所在目錄，後者是工作位置。

13. 由 PSScriptRoot 配合 Join-Path 組路徑，避免依賴啟動目錄。

14. 不會，只宣告並檢查要求。

15. 不是，未接住的成功輸出也會流出。

16. Write-Verbose，讓使用者按需啟用詳細訊息。

17. 它可能終止程序並設定退出碼，不適合任意放進可重用函式。

18. 自動化系統可能誤判成功，需保留真實失敗狀態。

19. 缺乏審閱、來源與完整性檢查機會。

20. 參數結果一致、相對資料路徑正確、沒有意外寫入啟動目錄。

## 參考資料與延伸閱讀

- [about_Scripts](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Scripts.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Execution_Policies](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Execution_Policies.md) — Microsoft；PowerShell 7.6；歷史版本依原文；查閱：2026-10-24。用途：技術事實、平台與版本查證。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
