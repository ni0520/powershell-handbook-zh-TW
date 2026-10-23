<a id="chapter-21"></a>

# 第 21 章：程式碼測試與 Pester

[返回目錄](../README.md)

## 學習目標

把「看起來能用」改成可重跑的斷言；分辨語法解析、靜態分析與實際執行；用 Pester 5 管理正常、邊界及失敗案例，讓自動化流程正確回報失敗。

## 三層檢查回答不同問題

Parser（語法解析器）檢查程式是否能被解析，不會替你確認路徑存在。PSScriptAnalyzer（PowerShell 靜態分析器）檢查規則，例如未核准動詞、可能洩漏密碼的參數設計；沒有診斷不代表業務邏輯正確。Pester 是測試框架，會執行測試內容，因此也可能寫檔或呼叫服務。測試檔不是安全沙箱。

本專案固定 Pester 5.7.1 進行相容性驗證，並未宣稱它是最新版本。雲端使用官方儲存庫的固定 commit 建置，依賴以 lock file（鎖定檔）還原；來源、雜湊及套件驗證限制見驗證紀錄。讀者應使用組織核准的取得方式，不要為安裝模組關閉 TLS、簽章或執行原則。

## 從一個有業務意義的斷言開始

第 15 章的 `Get-LearningTotal.ps1` 接受數量與單價。本章測試檔位於 `tests/LearningTotal.Tests.ps1`，從儲存庫根目錄執行。`BeforeAll` 準備被測腳本路徑，`Describe` 分組，`It` 說明一個可觀察行為，`Should` 比較實際與預期。

```powershell
BeforeAll {
    $scriptPath = Join-Path $PSScriptRoot '../examples/15/Get-LearningTotal.ps1'
}
Describe '學習訂單總額' {
    It '四份單價三十的總額為一百二十' {
        $actual = & $scriptPath -Count 4 -UnitPrice 30
        $actual.Total | Should -Be 120
    }
    It '拒絕負數數量' {
        { & $scriptPath -Count -1 } | Should -Throw
    }
}
```

這是 `.Tests.ps1` 檔案內容，應由 Pester 執行，不是逐行貼到未載入模組的終端機。正常案例檢查回傳物件的 `Total`；錯誤案例把可能拋錯的呼叫放在 ScriptBlock（指令碼區塊）內，交給 `Should -Throw` 執行。只測「沒有拋錯」會漏掉錯誤總額。

```powershell
Import-Module Pester -RequiredVersion 5.7.1 -ErrorAction Stop
$result = Invoke-Pester -Path './tests/LearningTotal.Tests.ps1' -PassThru
$result | Select-Object Result, TotalCount, PassedCount, FailedCount
```

一般安裝位置可用上述載入方法；本雲端的來源建置版由 `scripts/Invoke-Checks.ps1` 依固定路徑載入。`-PassThru` 才會把結果物件傳到成功串流；畫面上的彩色摘要不是可供後續程式使用的結果物件。

## Discovery（探索）與 Run（執行）的時間差

Pester 5 先執行探索，建立測試樹，再執行測試。直接寫在檔案頂層、`Describe` 或 `Context` 裡的普通命令可能在探索時執行。`BeforeAll`、`BeforeEach`、`It`、`AfterEach`、`AfterAll` 裡的測試操作屬於執行階段。

因此不要在 `Describe` 裡直接建立正式資料夾，也不要假設只探索就完全沒有副作用。測試資料若是拿來「產生測試案例」，可放在 `BeforeDiscovery`；若是供測試操作使用，放在 `BeforeAll` 或 `BeforeEach`。`-TestCases` 在探索時求值，無法依賴稍後才執行的 `BeforeAll` 變數。

```powershell
Describe '數量邊界' {
    It '數量 <Count> 的總額是 <Expected>' -TestCases @(
        @{ Count = 0; Expected = 0 }
        @{ Count = 1; Expected = 30 }
        @{ Count = 4; Expected = 120 }
    ) {
        param($Count, $Expected)
        $path = Join-Path $PSScriptRoot '../examples/15/Get-LearningTotal.ps1'
        (& $path -Count $Count -UnitPrice 30).Total | Should -Be $Expected
    }
}
```

使用單引號保存測試名稱中的 `<Count>`，讓 Pester 在適當階段填入案例值。這三筆資料代表零值、單筆及多筆情境，不是重複呼叫同一條件湊測試數。

## TestDrive（測試磁碟）隔離檔案

Pester 提供 `TestDrive:` 與 `$TestDrive`，資料放在暫存位置，結束後清理。`.NET` 檔案 API 不認得 PowerShell 的虛擬磁碟，應使用 `$TestDrive` 組成實體路徑。每個測試自行建立不同檔案，避免互相依賴執行順序。

```powershell
Describe 'UTF-8 往返' {
    It '保留繁體中文與中括號檔名' {
        $file = Join-Path $TestDrive '報表[1].txt'
        Set-Content -LiteralPath $file -Value '臺灣' -Encoding utf8NoBOM -NoNewline
        Get-Content -LiteralPath $file -Raw -Encoding utf8 | Should -BeExactly '臺灣'
    }
}
```

TestDrive 不是交易回復機制。子區塊改動父區塊已存在檔案的內容，離開子區塊時不保證還原舊內容。也不能因為使用 TestDrive，就把檔案之外的網路或系統變更視為已隔離。

## 讓失敗能傳到自動化流程

在專用測試腳本末尾檢查結果，再回傳退出碼；不要在互動終端機隨意貼上 `exit`。下面的設定屬於 Pester 5，不能直接套用舊版 Pester 4 教學。

```powershell
$configuration = New-PesterConfiguration
$configuration.Run.Path = './tests/LearningTotal.Tests.ps1'
$configuration.Run.PassThru = $true
$configuration.Output.Verbosity = 'Detailed'
$result = Invoke-Pester -Configuration $configuration
if ($result.Result -ne 'Passed' -or $result.TotalCount -eq 0) {
    exit 1
}
exit 0
```

檢查總數可避免「路徑錯誤、沒有測到任何東西」被誤認為成功。本專案另以子程序執行故意失敗案例，確認退出碼是 1；它不混入正式通過數。若要讓 Pester 自動結束專用程序，可使用設定 `Run.Exit`；需先理解它會結束目前 PowerShell 程序。

## 靜態分析與常見錯誤

```powershell
Import-Module PSScriptAnalyzer -RequiredVersion 1.25.0 -ErrorAction Stop
Invoke-ScriptAnalyzer -Path './examples' -Recurse -Severity Warning, Error
```

分析範圍在此是可執行範例，不是全書每個故意錯誤的教學片段。修正診斷後重跑測試；不要一開始把所有規則關掉。常見錯誤包括未加 `-PassThru` 卻讀結果、把測試資料放錯階段、直接執行會拋錯的呼叫才接 `Should`，以及只統計測試數而沒有檢查失敗或空集合。

## 安全、版本與最佳實踐

範例以 PowerShell 7.6.8、Pester 5.7.1、PSScriptAnalyzer 1.25.0 為基準。Windows PowerShell 5.1 的編碼、模組依賴與平台差異仍需另外測試。Mock（模擬替身）可替代外部服務，但模擬通過不代表真實服務可用；本章未宣稱任何雲端整合測試完成。

一個好的測試名稱要讓維護者知道失敗影響，例如「空輸入產生零筆結果」。測試可觀察的輸出與副作用，避免只複製函式內的算式來比較同一算式。覆蓋率（Coverage）只說哪些程式碼被走到，不保證所有條件正確；本輪未量測覆蓋率。

## 速查表

| 工具／欄位 | 用途 | 易錯點 |
|---|---|---|
| BeforeAll／BeforeEach | 一組／每次測試準備 | 不供探索階段使用 |
| It／Should | 描述行為／斷言 | 不能只看畫面沒有紅字 |
| TestDrive | 暫存檔案 | 不是權限或網路沙箱 |
| Invoke-Pester -PassThru | 取得結果 | 檢查 Result 與 TotalCount |
| Invoke-ScriptAnalyzer | 規則診斷 | 不執行業務邏輯驗證 |

## 練習題

1. 語法解析通過代表路徑存在嗎？
2. PSScriptAnalyzer 沒有診斷代表計算正確嗎？
3. Pester 測試能產生副作用嗎？
4. 本章固定哪個 Pester 版本？
5. Describe 與 It 分別負責什麼？
6. 如何檢查總額為 120？
7. 為何 Should -Throw 前要使用指令碼區塊？
8. Invoke-Pester 如何回傳結果物件？
9. Discovery 與 Run 的順序？
10. 直接寫在 Describe 裡的寫檔命令可能何時執行？
11. 為何 TestCases 不應使用 BeforeAll 才建立的變數？
12. 用來產生動態案例的資料適合放哪裡？
13. 三個數量邊界案例涵蓋什麼？
14. .NET 應使用 TestDrive: 還是 $TestDrive 實體路徑？
15. 子區塊改寫父區塊檔案後一定回復嗎？
16. 為何檢查 TotalCount 不為零？
17. exit 1 為何適合專用測試程序？
18. 靜態分析範例分析哪些檔案？
19. 模擬外部服務成功代表實際連線成功嗎？
20. 設計一個本章訂單範例的錯誤案例。

## 參考答案與解題思路

1. 不代表；解析只檢查語法，檔案存在性屬於執行條件。
2. 不代表；需要用已知輸入與預期輸出做功能斷言。
3. 可以；測試內容會執行，必須限制資料與權限範圍。
4. 5.7.1；是固定驗證基準，不是最新版宣稱。
5. Describe 組織測試，It 描述與執行一個測試行為。
6. 將實際回傳物件的 Total 屬性傳給 `Should -Be 120`。
7. 延後呼叫，讓 Pester 能捕捉並斷言錯誤。
8. 使用 `-PassThru` 或設定 `Run.PassThru = $true`。
9. 先探索並建立測試樹，再執行測試。
10. 探索時就可能執行，應移入合適的準備或測試區塊。
11. TestCases 在探索時求值，BeforeAll 尚未執行。
12. BeforeDiscovery；仍要控制探索階段副作用。
13. 零數量、單筆與多筆，而非只有一般正數。
14. 使用 `$TestDrive` 組成實體路徑；.NET 不認得 PowerShell PSDrive 名稱。
15. 不一定；TestDrive 以路徑追蹤，不替既有內容做完整交易回復。
16. 避免測試路徑錯誤或漏掉測試時把空結果當成功。
17. 可讓呼叫端判斷失敗；在互動程序使用會結束目前工作階段。
18. examples 目錄的腳本與模組，遞迴套用 Warning、Error 規則。
19. 不代表；需要另做真實環境整合驗證。
20. 傳入 Count=-1，使用 Should -Throw 驗證參數拒絕，並另測正常邊界 Count=0。

## 參考資料與延伸閱讀

- [Pester 5 Quick Start](https://github.com/pester/docs/blob/a9e301d136ae6d9c9275d07a183bae55f06fe2c3/versioned_docs/version-v5/quick-start.mdx) — Pester 專案；查閱 2026-10-24；測試語法。
- [Discovery and Run](https://github.com/pester/docs/blob/a9e301d136ae6d9c9275d07a183bae55f06fe2c3/versioned_docs/version-v5/usage/discovery-and-run.mdx) — Pester 5；執行階段。
- [TestDrive](https://github.com/pester/docs/blob/a9e301d136ae6d9c9275d07a183bae55f06fe2c3/versioned_docs/version-v5/usage/testdrive.mdx) — Pester 5；隔離範圍。
- [Invoke-Pester](https://github.com/pester/docs/blob/a9e301d136ae6d9c9275d07a183bae55f06fe2c3/versioned_docs/version-v5/commands/Invoke-Pester.mdx) — Pester 5；設定與結果。

- [PSScriptAnalyzer 1.25.0](https://github.com/PowerShell/PSScriptAnalyzer/blob/f05704df81b2aca17dc027ee39b3fce106d418fc/README.md) — Microsoft / .NET；查閱 2026-10-24。

## 驗證狀態

語法、Pester 實測、預期失敗退出碼與靜態分析分開記於 [驗證紀錄](../../progress/VALIDATION.md)。本章例子由 tests 中對應測試驗證；不是所有平台的通過保證。簽章撤銷查詢限制保留於工具紀錄。
