<a id="chapter-19"></a>

# 第 19 章：錯誤處理與可靠的失敗狀態

[返回目錄](../README.md)

## 學習目標

分辨終止與非終止錯誤，讓必要操作進入 catch，使用 finally 清理資源而不掩蓋原始失敗。

## 不是每個紅字都讓腳本停止

Terminating Error（終止錯誤）可被 try/catch 捕捉；Non-terminating Error（非終止錯誤）可能記錄後繼續下一項。命令失敗而腳本仍往下跑，是自動化中常見的誤判來源。

```powershell
try {
    Get-Item -LiteralPath './no-such-handbook-file' -ErrorAction Stop
} catch {
    [pscustomobject]@{
        Success = $false
        ErrorId = $_.FullyQualifiedErrorId
        Message = $_.Exception.Message
    }
}
```

`-ErrorAction Stop` 將這個命令的非終止錯誤升級為可捕捉的終止行為。catch 內的 `$_` 是 ErrorRecord（錯誤紀錄），與 Where-Object 中的目前資料物件不同。輸出是一筆描述失敗的資料，並非「取得檔案成功」。

## throw 與重拋

```powershell
function Get-LearningValidatedCount {
    param([int]$Count)
    if ($Count -lt 0) {
        throw 'Count 不可小於零'
    }
    $Count
}
Get-LearningValidatedCount -Count 2
```

正常輸出 2。負數會產生錯誤；catch 中單獨 `throw` 可重新拋出目前錯誤，保留失敗脈絡。不要為了「不看到錯誤」在所有地方使用 SilentlyContinue；偏好設定與進階函式 ErrorAction 會影響行為，應固定測試條件。

## finally 與清理

```powershell
$before = Get-Location
try {
    Set-Location -LiteralPath $HOME
    Get-Location
} finally {
    Set-Location -LiteralPath $before.Path
}
```

finally 適合回復位置或釋放本次取得的資源。在一般控制流程與可處理錯誤下會執行，但不能保證程序遭強制終止、機器斷電時仍可完成清理。它不是交易回復，檔案已寫入的內容不會因此自動復原。

## 原生程式與退出碼

外部程式的非零退出碼不一定自動變成你預期的 PowerShell 例外；要依版本與偏好設定檢查 `$LASTEXITCODE`，並保存原始失敗。不要在失敗命令後接一個成功命令，最後只回報最後一個狀態。命令列入口應讓測試系統取得非零退出碼。

## 常見錯誤、安全與最佳實踐

catch 空白會把失敗吞掉；catch 寫「完成」更危險。應記錄錯誤種類、目標與可重試性，敏感內容則先遮蔽。網路錯誤不全是認證問題，需分辨 DNS、TLS、代理、逾時、權限與 API 回應，不立即索取新密碼。

本章刻意查不存在路徑，不改系統；正式測試使用唯一暫存目錄，避免碰到同名真實檔案。

## 速查表

| 機制 | 用途 | 限制 |
|---|---|---|
| try/catch | 捕捉終止錯誤 | 不自動捕捉所有非終止錯誤 |
| ErrorAction Stop | 針對命令提高失敗嚴格度 | 不應任意套用外部程式假設 |
| `$_` in catch | 錯誤紀錄 | 可能含敏感內容 |
| finally | 一般流程清理 | 不保證強制終止時執行 |
| `$LASTEXITCODE` | 原生程式退出碼 | 需在被其他程式覆蓋前檢查 |

## 練習題

1. try/catch 主要捕捉哪一類錯誤？
2. 非終止錯誤後流程一定停止嗎？
3. 本章 Get-Item 為何加 ErrorAction Stop？
4. catch 中的 $_ 是什麼？
5. FullyQualifiedErrorId 的用途？
6. Exception.Message 可直接公開嗎？
7. catch 回傳 Success=false 代表操作成功嗎？
8. throw 通常用於什麼？
9. catch 中單獨 throw 有何用途？
10. Get-LearningValidatedCount 2 的結果？
11. 負數輸入應如何處理？
12. finally 適合做什麼？
13. finally 能保證斷電後執行嗎？
14. finally 等於檔案交易回復嗎？
15. 原生程式非零退出碼一定被 catch 捕捉嗎？
16. LASTEXITCODE 為何應及時保存？
17. 空白 catch 有何風險？
18. 對所有錯誤使用 SilentlyContinue 是否最佳實踐？
19. 網路失敗是否代表需要新憑證？
20. 測試失敗應如何回報給自動化系統？

## 參考答案與解題思路

1. 終止錯誤；非終止錯誤需依情境提高為 Stop。

2. 不一定，可能繼續下一項或下一命令。

3. 讓找不到檔案的非終止錯誤進入 catch。

4. ErrorRecord，描述這次捕捉到的錯誤。

5. 提供較可識別的錯誤身分，搭配訊息與脈絡診斷。

6. 不一定，可能含路徑或敏感資訊，需先檢查。

7. 不代表，它是失敗描述物件。

8. 宣告無法繼續的錯誤，讓上層處理。

9. 重新拋出目前錯誤，保留失敗脈絡。

10. 2，屬正常路徑。

11. 依本函式契約拋出錯誤，不能悄悄當成合法值。

12. 回復位置、釋放本次取得的資源等清理。

13. 不能，強制終止與斷電超出一般流程保證。

14. 不是，已完成的外部變更需另外設計回復機制。

15. 不能假設，依版本與設定判讀並檢查 LASTEXITCODE。

16. 後續原生程式可能覆蓋它。

17. 吞掉失敗，後續流程可能誤判成功。

18. 不是，會掩蓋問題並影響傳播行為。

19. 不一定，需先分辨 DNS、TLS、代理、逾時與授權等原因。

20. 保留錯誤證據並讓命令列入口回傳非零退出碼，不用最後一個成功步驟掩蓋。

## 參考資料與延伸閱讀

- [about_Try_Catch_Finally](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Try_Catch_Finally.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Throw](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Throw.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
