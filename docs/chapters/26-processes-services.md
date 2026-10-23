<a id="chapter-26"></a>

# 第 26 章：處理程序與 Windows 服務

[返回目錄](../README.md)

## 學習目標

以 PID（處理程序識別碼）觀察自己啟動的程序，區分累計 CPU 時間與即時使用率；理解 Windows 服務狀態及相依性，先查詢再評估變更，不把名稱相似的程序全部終止。

## Process（處理程序）與 Service（服務）不同

程式檔是磁碟上的檔案，程序是正在執行的實例；同一程式可以有多個程序。Windows 服務由服務控制管理員管理，可設定啟動方式、相依性與復原行為。一個服務不一定對應一個獨立程序，也不能把「某個程序存在」當作「服務正常」的證明。

`Get-Process` 在本章的 PowerShell 7 跨平台可用，`Get-Service`、`Restart-Service` 是 Windows 專用。Linux 的 systemd 等服務管理工具有自己的介面，不能把 Windows 服務命令的結果或參數直接套過去。

## 先查目前 PowerShell 程序

```powershell
Get-Process -Id $PID | Select-Object Id, ProcessName,
    @{Name='WorkingSetMB';Expression={[math]::Round($_.WorkingSet64 / 1MB, 2)}},
    CPU
```

Id 應等於目前 `$PID`，名稱通常是 pwsh；記憶體與 CPU 數值會隨時間變動，不填入固定假數字。WorkingSet64 是目前工作集位元組數，不是程式可用記憶體上限。CPU 是累計處理器時間（秒），不是工作管理員的即時百分比。

若要估算一段時間的 CPU 使用率，需取兩次累計值差、除以測量時間，再明確說明是否除以邏輯處理器數。本章不做跨機器效能排名。程序可能在查詢與讀取屬性間退出，權限也會限制 Module、Path 或使用者資訊，欄位為空不等於故意隱藏。

## 唯一子程序的生命週期練習

下面只啟動自己的一個 PowerShell 子程序，再以保存的程序物件預覽及終止它。不要改成 `Stop-Process -Name pwsh`，那會波及其他工作階段。

```powershell
$executable = (Get-Process -Id $PID).Path
$child = $null
try {
    $child = Start-Process -FilePath $executable -ArgumentList @(
        '-NoProfile', '-NonInteractive', '-Command', 'Start-Sleep -Seconds 30'
    ) -PassThru -ErrorAction Stop
    Get-Process -Id $child.Id | Select-Object Id, ProcessName
    Stop-Process -InputObject $child -WhatIf
    $child.Refresh()
    $child.HasExited
    Stop-Process -InputObject $child -ErrorAction Stop
    $child.WaitForExit()
    $child.HasExited
} finally {
    if ($null -ne $child) {
        $child.Refresh()
        if (-not $child.HasExited) { Stop-Process -InputObject $child -ErrorAction Stop }
        $child.Dispose()
    }
}
```

一般情況下，WhatIf 後 HasExited=False，真正終止後為 True；若系統負載或環境使子程序提前結束，需依實際狀態處理，不能假設程序永遠還在。這個停止動作不是儲存文件後的正常關閉；正式應用程式應優先使用其支援的關閉機制。

本例使用程序物件的WaitForExit方法；Wait-Process命令的官方文件明示不適用Linux與macOS，即使Get-Command能找到也不能推定支援。

`Start-Process -PassThru` 才回傳程序物件，`-Wait` 則等待程序結束。引數中若有空白、引號或外部輸入，應另查原生命令引數規則，不把本例的固定參數當任意字串的安全組合器。遠端工作階段中的子程序存活期也不是本機桌面的保證。

## Windows：先查服務再談重新啟動

下列區塊僅在隔離 Windows 執行，Linux 本輪未執行。服務名稱與顯示名稱可能不同，顯示名稱也受語系影響。

```powershell
if ($env:OS -ne 'Windows_NT') { throw '此範例需要 Windows' }
$service = Get-Service -Name 'Spooler' -ErrorAction Stop
$service | Select-Object Name, DisplayName, Status, CanStop
$service.ServicesDependedOn | Select-Object Name, Status
$service.DependentServices | Select-Object Name, Status
Restart-Service -InputObject $service -WhatIf
```

Spooler 是常見教學名稱，某些映像可能沒有此服務；不存在就是環境差異，不能把服務缺少改成「已停止」。ServicesDependedOn 是它依賴的服務，DependentServices 是依賴它的服務。CanStop 也不是目前帳戶一定有停止權限的證明。

Restart-Service 對已停止的服務會啟動它，因此不是只重啟「目前正在執行」的服務。WhatIf 不會驗證重新啟動後應用程式可用性。真實變更前要確認影響、維護時間與核准範圍；本章沒有要求實際重啟印表服務。

## 常見錯誤、安全與版本

名稱查詢可能對應多個程序；PID 也會被系統重複使用，正式長流程需重新核對身分與啟動時間。Force 不會提升帳戶權限，也不是不遺失資料的保證。Windows PowerShell 5.1 某些命令曾有遠端參數，不能假設 PowerShell 7 仍有相同參數；用 Get-Command 查目前語法。

不要把程式命令列、完整路徑與帳戶資訊無條件上傳。盤點先選必要欄位；操作腳本遇錯誤應回報目標與類別，避免用大範圍萬用字元「重試」。

## 速查表

| 需求 | 工具 | 注意 |
|---|---|---|
| 查目前程序 | Get-Process -Id $PID | CPU 是累計秒數 |
| 啟動並保留身分 | Start-Process -PassThru | 保存物件，避免以名稱廣泛停止 |
| 預覽終止 | Stop-Process -InputObject … -WhatIf | 預覽不是正常關閉 |
| 查服務 | Get-Service | Windows 專用 |
| 查相依性 | ServicesDependedOn／DependentServices | 方向相反 |

## 練習題

1. 程式檔與程序有何不同？
2. 服務一定一對一對應程序嗎？
3. 如何查目前PowerShell程序？
4. WorkingSet64 的單位？
5. CPU 欄位是即時百分比嗎？
6. 估算區間CPU需要哪些量？
7. 為何不保證每個程序都有Path？
8. Start-Process 如何取得程序物件？
9. PassThru與Wait相同嗎？
10. 為何練習保存child而不停止所有pwsh？
11. WhatIf後子程序通常仍在嗎？
12. Stop-Process代表應用程式已儲存資料嗎？
13. finally的用途？
14. Get-Service在本Linux可用嗎？
15. Name和DisplayName為何要分開？
16. ServicesDependedOn表示哪個方向？
17. DependentServices表示哪個方向？
18. Restart-Service對停止狀態會怎樣？
19. Force會提升權限嗎？
20. 長時間保存PID有何風險？

## 參考答案與解題思路

1. 前者是檔案，後者是執行實例；同一檔案可有多個程序。

2. 不一定，不能只靠程序存在判斷服務健康。

3. 使用 Get-Process -Id $PID。

4. 位元組，範例除以1MB轉換顯示。

5. 不是，是累計處理器時間秒數。

6. 兩次CPU累計值差、經過時間，並說明是否按邏輯處理器數正規化。

7. 平台、權限與程序退出都可能限制屬性讀取。

8. 使用PassThru。

9. 不同，前者回傳程序物件，後者等待結束。

10. 避免終止不屬於本次練習的工作階段。

11. 是，但仍需檢查是否自行退出。

12. 不是，應優先使用應用程式正常關閉方法。

13. 清理本次建立的子程序與程序物件資源。

14. 不可用，本版文件標示Windows專用。

15. 服務內部名稱與顯示名稱不同，後者可能隨語系改變。

16. 目前服務所依賴的服務。

17. 依賴目前服務的其他服務。

18. 可能啟動它，不只處理已運行服務。

19. 不會，也不能保證不遺失資料。

20. PID可能被重複使用，需重新核對程序身分與啟動時間。

## 參考資料與延伸閱讀

- [Get-Process](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Process.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Start-Process](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Start-Process.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Stop-Process](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Stop-Process.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Get-Service](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Service.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Restart-Service](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Restart-Service.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。

## 驗證狀態

程序觀察與本次建立的子程序生命週期在 Linux 做代表性實測；Windows 服務查詢與重啟預覽未執行。 詳見[驗證紀錄](../../progress/VALIDATION.md)。
