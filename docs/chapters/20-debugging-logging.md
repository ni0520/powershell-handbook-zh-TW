<a id="chapter-20"></a>

# 第 20 章：偵錯、輸出串流與日誌

[返回目錄](../README.md)

## 學習目標

分開資料與診斷訊息，使用可查詢的日誌欄位，理解中斷點與執行步進的真實效果。

## Debugging（偵錯）是在執行時觀察

錯誤可能是語法、型別、邏輯、外部服務或環境問題。先縮小成最小可重現案例，記錄版本、輸入、預期與實際結果，再設中斷點。Set-PSBreakpoint 可針對行、變數或命令設定；Get-PSBreakpoint 查看；Remove-PSBreakpoint 移除本次設定。

桌面可用 VS Code 的中斷點與變數面板；本雲端沒有實測桌面互動。Step Into（逐步執行）進入函式，Step Over（不進入函式的逐步執行）仍會執行函式內容，不能把「略過檢視」當成「不執行」。

## 六種可重新導向的輸出串流

| 編號 | 名稱 | 中文用途 |
|---|---|---|
| 1 | Success | 成功資料，Write-Output |
| 2 | Error | 錯誤，Write-Error |
| 3 | Warning | 警告，Write-Warning |
| 4 | Verbose | 詳細診斷，Write-Verbose |
| 5 | Debug | 偵錯訊息，Write-Debug |
| 6 | Information | 資訊，Write-Information／Write-Host |

Progress（進度）不是第七個可照樣重新導向的串流。Write-Host 在現代 PowerShell 會使用資訊串流並顯示在主控台，不宜簡化成「永遠無法擷取」。

```powershell
function Get-LearningStatus {
    [CmdletBinding()]
    param([int]$Count = 2)
    Write-Verbose "讀取 $Count 筆合成資料"
    [pscustomobject]@{ Success = $true; Count = $Count }
}
$result = Get-LearningStatus -Count 2 -Verbose
$result.Count
```

最後是 2；Verbose 訊息不應混入 `$result` 的成功資料。若刻意合併串流，物件種類也可能混在一起，匯出前需明確處理。

## Logging（記錄日誌）應可追蹤與去敏感化

```powershell
$event = [pscustomobject]@{
    TimestampUtc = [datetime]::UtcNow.ToString('o')
    Operation = 'LearningCheck'
    Success = $true
    ItemCount = 2
}
$event | ConvertTo-Json -Compress
```

這只在記憶體建立一行 JSON（JavaScript 物件表示法），沒有寫入檔案。UTC 時間利於跨機器關聯，使用者閱讀時再換時區。真實日誌可加入關聯識別碼、耗時、錯誤分類，但不記錄密碼、權杖或整份環境變數。

Transcript（工作階段逐字紀錄）可保存互動內容，但可能包含敏感輸入輸出，不能把它當成可無條件上傳的偵錯包。檔案保存位置、存取權限、輪替與保留期限都要依工作需求設計。

## 錯誤、安全、版本與最佳實踐

沒有錯誤輸出不等於邏輯正確；必須用斷言核對值。不要讓日誌寫入失敗被當成業務成功，也不要為寫日誌改掉原始錯誤。記錄功能本身要測：正常、無權限、磁碟滿、敏感值遮蔽。

本章資料／詳細串流在 7.6.8 執行驗證；互動中斷點與桌面操作未實測。資訊串流在 5.0 起出現，引用舊版文章時要注意版本。

## 速查表

| 需求 | 工具 | 注意 |
|---|---|---|
| 查看呼叫堆疊 | Get-PSCallStack | 脈絡可能含敏感參數 |
| 按需診斷 | Write-Verbose | 不混入成功資料 |
| 結構化記錄 | 物件 → ConvertTo-Json | 控制欄位與深度 |
| 互動記錄 | Start-Transcript | 先評估敏感內容 |
| 成果驗證 | 斷言預期值 | 日誌不是測試通過證明 |

## 練習題

1. Debugging 的中文與目的？
2. 開始設中斷點前應先準備什麼？
3. Set-PSBreakpoint 用途？
4. Get-PSBreakpoint 與 Remove-PSBreakpoint 差異？
5. Step Over 會完全不執行函式嗎？
6. 成功資料是哪個串流編號？
7. 錯誤與警告編號？
8. Verbose 與 Debug 編號？
9. Information 編號與加入版本？
10. Progress 能當第七串流相同方式重新導向嗎？
11. Write-Host 在現代版本完全不能擷取嗎？
12. 本章 result.Count 是多少？
13. 為何不把詳細訊息與資料一律合併？
14. TimestampUtc 採 UTC 有何好處？
15. JSON 日誌範例會寫入磁碟嗎？
16. 日誌不應包含哪類資料？
17. Transcript 可不經檢查直接分享嗎？
18. 有完整日誌是否等於測試通過？
19. 日誌功能本身至少要測哪種失敗？
20. 本章哪些驗證未執行？

## 參考答案與解題思路

1. 偵錯，在執行脈絡中找出與修正問題。

2. 最小重現案例、版本、輸入、預期與實際結果。

3. 設定行、變數或命令中斷點。

4. 前者查詢，後者移除工作階段中斷點。

5. 不會，只是不進入內部逐步檢視，函式仍執行。

6. 1。

7. 2 與 3。

8. 4 與 5。

9. 6，PowerShell 5.0 起。

10. 不能，進度串流不支援同樣重新導向。

11. 不是，它使用資訊串流，仍有特定重新導向行為。

12. 2，詳細訊息不應混入成功結果。

13. 輸出型別會混雜，破壞後續報表與測試。

14. 跨機器與時區關聯較一致，顯示時再轉當地時區。

15. 不會，只在記憶體建立並輸出字串。

16. 密碼、權杖、完整環境變數或未遮蔽的敏感參數。

17. 不應，可能包含互動中的敏感資訊。

18. 不是，仍要用斷言比較預期與實際結果。

19. 無寫入權限、空間不足與敏感值遮蔽，且不能掩蓋原始錯誤。

20. Windows/macOS 桌面偵錯與互動中斷點操作；不可用 Linux 串流測試替代。

## 參考資料與延伸閱讀

- [about_Debuggers](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Debuggers.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。
- [about_Output_Streams](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Output_Streams.md) — Microsoft；PowerShell 7.6；查閱：2026-10-24。用途：語言規則與原創範例設計。

## 驗證狀態

官方來源已查閱；本章程式碼的語法、代表性實測與平台限制分別記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows、macOS 圖形介面與 5.1 實測未執行。教材輸出是說明性示意，逐項斷言結果以測試紀錄為準。
