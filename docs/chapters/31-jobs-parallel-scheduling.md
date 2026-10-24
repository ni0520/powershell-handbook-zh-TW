<a id="chapter-31"></a>

# 第 31 章：背景工作、平行處理與排程

[返回目錄](../README.md)

## 學習目標

分清 Background Job（背景工作）、Parallel（平行處理）與 Scheduler（排程器）；傳遞資料到另一個工作階段、等待並接收結果、限制同時執行數量，最後清理自己建立的工作。本章不註冊排程、不連線企業服務，範例只計算小型合成資料。

## 三種需求，三種生命週期

「不要卡住提示字元」可以使用 Start-Job；「同時處理多筆獨立資料」可以考慮 ForEach-Object -Parallel；「明天凌晨執行，即使目前終端機已關閉」需要作業系統排程或其他持久執行服務。Start-Job 並不替代排程器，父工作階段結束會連帶終止其執行中的子工作。

Start-Job 的本機背景工作在另一個程序執行；Thread Job（執行緒工作）與 ForEach-Object -Parallel 則在同程序的不同 Runspace（執行空間）工作。程序隔離有啟動與序列化成本；執行緒共享程序風險，也需要注意可變物件的競爭。不要把三種方式視為同一個效能選項。

<a id="start-job"></a>

## 主要指令教學

### 1. 名稱

Start-Job（啟動背景工作）；模組 Microsoft.PowerShell.Core。

### 2. 重要程度

進階必學：長時間本機計算與理解非同步生命週期的基礎。

### 3. 功能

啟動本機背景工作並回傳 Job 物件。這個物件是工作控制代碼，不是運算結果；結果透過 Receive-Job 接收。

### 4. 使用情境

在提示字元仍可使用的情況下產生小型報表。需要跨登出存活的任務，應改用正式排程方案並保存輸出。

### 5. 英文拆解

Start 是「開始」，Job 是「工作」。記成「先拿號碼牌，再領結果」。

### 6. 語法

本章使用的參數形式為 Start-Job -ScriptBlock 區塊 -ArgumentList 引數；完整參數組以本機 Get-Command Start-Job -Syntax 與官方文件為準。不同主機環境可能不支援建立外部 pwsh 程序，例如部分內嵌 PowerShell 主機。

### 7. 主要參數

| 參數 | 中文與用途 | 注意事項 |
|---|---|---|
| -ScriptBlock | 要在工作中執行的區塊 | 父工作階段函式不會自動全部出現 |
| -ArgumentList | 傳給區塊 param 的引數 | 陣列形狀與位置需明確設計 |
| -Name | 便於辨識的名稱 | 不應假設名稱唯一 |
| -WorkingDirectory | 初始工作目錄 | 本章不依賴預設位置；必要時傳絕對路徑 |

### 8. 五類範例

**基本：接收一筆結果並清理。** 只建立自己的子工作。finally 中先停止仍在執行的工作，再移除紀錄；不使用 Get-Job 全選刪除。

```powershell
$job = $null
try {
    $job = Start-Job -ScriptBlock { 6 * 7 }
    $finished = Wait-Job -Job $job -Timeout 20
    if ($null -eq $finished) { throw '背景工作逾時' }
    Receive-Job -Job $job -ErrorAction Stop
} finally {
    if ($null -ne $job) {
        Stop-Job -Job $job -ErrorAction Stop
        Remove-Job -Job $job -ErrorAction Stop
    }
}
```

預期成功輸出為 42。Wait-Job 回傳工作物件；Receive-Job 才回傳 42。Timeout 是限制等待時間，逾時不會自動取消工作。

**參數化：明確傳值，不依賴父工作階段變數。**

```powershell
$job = $null
try {
    $job = Start-Job -ArgumentList 8, 5 -ScriptBlock {
        param([int]$Quantity, [int]$UnitPrice)
        [pscustomobject]@{ Quantity=$Quantity; Total=$Quantity*$UnitPrice }
    }
    if ($null -eq (Wait-Job -Job $job -Timeout 20)) { throw '背景工作逾時' }
    Receive-Job -Job $job -ErrorAction Stop | Select-Object Quantity, Total
} finally {
    if ($null -ne $job) { Stop-Job $job; Remove-Job $job }
}
```

預期 Quantity=8、Total=40。跨程序回傳的複雜物件通常是反序列化的資料快照，不能假定原物件的方法仍可呼叫。若需要方法，應在工作內呼叫，回傳簡單結果。

**實務：先取得結構化報表，再決定如何輸出。**

```powershell
$job = $null
try {
    $job = Start-Job -ScriptBlock {
        foreach ($item in 1..3) {
            [pscustomobject]@{ Item=$item; Square=$item*$item; Status='OK' }
        }
    }
    if ($null -eq (Wait-Job $job -Timeout 20)) { throw '報表逾時' }
    $report = @(Receive-Job $job -ErrorAction Stop)
    $report | Sort-Object Item | Select-Object Item, Square, Status
} finally {
    if ($null -ne $job) { Stop-Job $job; Remove-Job $job }
}
```

預期三列 Square 為 1、4、9。正式流程需定義每筆成功條件，不能只看 State=Completed；非終止錯誤可能已寫到錯誤串流，卻沒有使工作變成 Failed。

**錯誤示範與修正：只等待就以為拿到答案。** 下列區塊刻意顯示錯誤假設，但有完整清理。

```powershell
$job = $null
try {
    $job = Start-Job { 42 }
    $control = Wait-Job $job -Timeout 20
    if ($null -eq $control) { throw '背景工作逾時' }
    $control.GetType().Name    # 工作控制物件，不是42
    Receive-Job $job -ErrorAction Stop  # 修正：接收結果
} finally {
    if ($null -ne $job) { Stop-Job $job; Remove-Job $job }
}
```

另一種錯誤是忽略接收動作的消耗行為：一般 Receive-Job 會取走彙總串流中的資料；想重複查看要使用 -Keep。不要先為了顯示取走，再期待匯出時還有相同資料。可先存入變數，後續顯示與匯出都使用變數。

**進階：保留接收資料直到正式領取。**

```powershell
$job = $null
try {
    $job = Start-Job { '繁中報表' }
    if ($null -eq (Wait-Job $job -Timeout 20)) { throw '背景工作逾時' }
    $first = @(Receive-Job $job -Keep -ErrorAction Stop)
    $second = @(Receive-Job $job -ErrorAction Stop)
    $remaining = @(Receive-Job $job -ErrorAction Stop)
    [pscustomobject]@{ First=$first[0]; Second=$second[0]; Remaining=$remaining.Count }
} finally {
    if ($null -ne $job) { Stop-Job $job; Remove-Job $job }
}
```

預期 First 與 Second 都是「繁中報表」，Remaining=0。這是彙總串流接收行為；不表示物件模型中的所有子工作資料都被安全抹除。

### 9. 輸出判讀

Get-Job 可查看目前工作階段的工作，State 顯示狀態，HasMoreData 表示是否仍有可接收資料。Completed 不代表你已接收資料，也不是業務驗收標記。正式報表可加入輸入識別碼、狀態、錯誤摘要與時間；敏感錯誤內容不宜直接公開。

### 10. 常見錯誤

工作內找不到父工作階段的函式時，檢查依賴並在工作內匯入必要模組；不要用 Invoke-Expression 拼接任意輸入。逾時後應保留診斷、停止自己的工作並清理，不要立即無限重試。收到 Deserialized 型別時先檢查屬性，不直接當原始即時物件使用。

### 11. 安全提醒

工作以目前執行身分運作，不因在背景執行就取得隔離沙箱或額外權限。不要傳遞明文密碼或建立沒有上限的工作。Stop-Job 只能停止執行，無法還原已寫出的檔案或遠端變更。finally 是清理資源，不是交易回滾。

### 12. 相關指令

Get-Job 查狀態、Wait-Job 等待、Receive-Job 收結果、Stop-Job 停止、Remove-Job 刪除工作紀錄。Remove-Job 不等於刪除工作產生的實體檔案。相關錯誤處理見[第 19 章](19-error-handling.md)。

### 13. 記憶技巧

「開始、等待、接收、停止、清理」；每步都問：我操作的是工作，還是工作傳回的資料？

### 14. 官方來源

本章末列出固定版本的 Microsoft 原始文件；範例為教材原創，不複製官方完整案例。

## 平行處理：先分離資料，再合併結果

PowerShell 7.0 新增 ForEach-Object -Parallel；Windows PowerShell 5.1 沒有此參數組。7.1 起預設重用執行空間池，ThrottleLimit 控制同時執行數量，預設為 5。它不是每秒請求限制，也不是所有巢狀／多個呼叫共用的全域上限。

```powershell
$factor = 3
$result = @(1..4 | ForEach-Object -Parallel {
    [pscustomobject]@{ Item=$_; Product=$_ * $using:factor }
} -ThrottleLimit 2)
$result | Sort-Object Item
```

預期排序後 Product 為 3、6、9、12；平行完成順序不保證與輸入一致。$using: 傳入外部變數，此處只讀純量。不讓多個執行空間同時寫一般 List 或同一 CSV 檔；先各自輸出，再由父工作階段彙整。函式與模組依賴需明確準備；不要以為父工作階段所有狀態都自動可見。

本例運算很小，啟動執行空間的成本可能高於工作本身；它用來學習正確結果，沒有宣稱平行一定較快。正式效能評估應用相同資料量、正確結果、暖機條件與重複量測比較。

## 排程：持久執行需要可觀測的契約

Windows 可由 Task Scheduler（工作排程器）啟動 pwsh；Linux 可由 cron 或 systemd timer 等系統服務啟動。PowerShell 的 PSScheduledJob 是另一套 Windows PowerShell 技術，不能假設 PowerShell 7 跨平台都有它。下列為設計檢查項，不是已註冊的排程。

| 設計項 | 應明確設定 | 常見失敗 |
|---|---|---|
| 執行檔 | 核准的 pwsh 絕對路徑與版本 | 互動終端機PATH與排程不同 |
| 腳本 | 絕對路徑、-NoProfile、-NonInteractive | 依賴個人設定檔或跳出登入視窗 |
| 身分 | 最小必要權限與核准認證方式 | 管理者手動可用，排程帳戶卻無權限 |
| 時間 | 時區、夏令時間、漏跑補償 | 以為每個平台時間解讀相同 |
| 重疊 | 禁止重入或適當鎖定 | 上一輪未完又寫同一份輸出 |
| 結果 | 結構化日誌、退出碼、告警責任 | 程序啟動就被當任務成功 |

排程腳本遇不可恢復錯誤時應回傳非零退出碼；原生程式的退出碼需另行檢查，不能假定每個非零碼都自動觸發 catch。重試應有次數／延遲上限並考慮冪等性：同一批輸入再次執行，不應重複扣款、寄信或追加相同紀錄。腳本檔案能在互動環境通過，只是排程上線前的其中一項驗證。

## 最佳實踐與版本限制

先以序列方式取得可驗收結果，再引入有限平行。輸入、輸出與錯誤契約保持一致，先測空輸入、單筆、部分失敗與取消。只保留自己建立的 Job 參照，避免誤清理其他工作。匯出大量資料前評估記憶體與接收緩衝；本章小型案例不代表大資料壓力通過。

本章實測目標為 PowerShell 7.6.8／Debian 13；未測 Windows PowerShell 5.1、ThreadJob 整合、正式排程服務及跨登出執行。排程註冊的帳戶與機器政策需由實際環境另行核准。

## 速查表

| 目的 | 方法 | 注意 |
|---|---|---|
| 啟動 | Start-Job | 回傳Job而非結果 |
| 等待 | Wait-Job -Timeout | 逾時不會自動停止工作 |
| 接收 | Receive-Job | -Keep保留彙總串流 |
| 清理 | Stop-Job後Remove-Job | 只操作自己的工作 |
| 平行 | ForEach-Object -Parallel | PowerShell7；排序後驗收 |
| 明天執行 | 系統排程器 | 身分、退出碼、日誌與重疊策略 |

## 練習題

1. 單選：Start-Job 先回傳結果還是工作物件？
2. 是非：Start-Job 可以保證登出後繼續執行。
3. 填空：取得結果應使用哪個命令？
4. Wait-Job 逾時後，工作會自動停止嗎？
5. 如何避免重複接收時資料已被取走？
6. 程式碼閱讀：參數範例的 Total 是多少？
7. 複選：程序隔離增加哪些成本：啟動、序列化、永遠零記憶體？
8. 反序列化物件能保證保留原始方法嗎？
9. 除錯：工作內找不到父工作階段函式時，應檢查什麼？
10. 為何不對 Get-Job 的所有結果直接 Remove-Job？
11. Completed 可以當每筆業務處理成功的證明嗎？
12. Stop-Job 會回滾已寫入的資料嗎？
13. Windows PowerShell 5.1 可直接使用 -Parallel 嗎？
14. 平行輸出為何要依 Item 排序驗收？
15. ThrottleLimit=2 代表每秒最多兩個HTTP請求嗎？
16. 為何不讓兩個執行空間同時追加同一CSV？
17. 實作：把平行範例的倍數改成5，列出預期結果。
18. 情境：凌晨任務重疊執行，應補哪項設計？
19. 情境：互動環境成功但排程失敗，先檢查哪些差異？
20. 設計：遠端匯入失敗後重試，如何避免重複寫入？

## 參考答案與解題思路

1. 工作物件；真正的結果由 Receive-Job 取得。
2. 錯；父工作階段終止會影響子工作，應選持久排程方案。
3. Receive-Job；Wait-Job負責等待，兩者責任不同。
4. 不會；需檢查回傳結果並停止、清理自己的工作。
5. Receive-Job -Keep，或首次接收後存變數；後者更方便分開顯示與匯出。
6. 40，因8乘5；這是傳值計算，不依賴外部同名變數。
7. 啟動與序列化；沒有永遠零記憶體成本的工作。
8. 不能；需用屬性傳資料，必要的方法在原工作內先執行。
9. 模組與函式依賴；在工作內明確匯入，不用文字拼接執行任意輸入。
10. 可能包含不屬於本次流程的工作；保存自己的參照即可。
11. 不行；非終止錯誤與業務失敗需獨立記錄、接收與驗收。
12. 不會；停止與回滾是不同設計，應有適當補償或交易機制。
13. 不可；這是PowerShell7新增的參數組，需先檢查版本。
14. 完成順序不固定；保留識別碼後排序，避免把順序不同當錯算。
15. 不是；它限制同時執行數量，速率限制需要另外設計。
16. 寫入可能競爭、交錯或失敗；由父工作階段彙整後單一寫入。
17. 將 $factor 設為5；Item=1至4時Product應為5、10、15、20；需在PowerShell7執行。
18. 禁止重入或鎖定；同時定義逾時、失敗告警與未完成輸出的處置。
19. 執行檔版本、身分、絕對路徑、工作目錄、設定檔、環境變數及非互動認證。
20. 使用穩定的輸入識別碼與冪等寫入／去重策略，限定重試並驗收每筆狀態，不只重跑整批。

## 參考資料與延伸閱讀

來源為 Microsoft PowerShell 7.6 文件固定快照，查閱日期2026-10-24；Start-Job／Receive-Job／Wait-Job／about_Jobs用於生命週期與資料語意，ForEach-Object用於平行版本與參數查證。排程表為設計檢查，並非特定排程服務操作手冊。

- [Start-Job](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Start-Job.md)
- [Receive-Job](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Receive-Job.md)
- [Wait-Job](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Wait-Job.md)
- [ForEach-Object](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/ForEach-Object.md)
- [about_Jobs](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Jobs.md)

## 驗證狀態

文件查證完成；實際語法、Pester與教材區塊結果見[驗證紀錄](../../progress/VALIDATION.md)。未執行Windows、排程註冊、ThreadJob或企業連線；文件格式檢查以實際產出的artifact-results.json為準。
