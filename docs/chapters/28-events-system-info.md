<a id="chapter-28"></a>

# 第 28 章：事件記錄與系統資訊

[返回目錄](../README.md)

## 學習目標

選擇事件來源、時間與層級，以伺服器端篩選減少讀取量；分辨事件識別碼與提供者，整理可比較的欄位，同時保留查詢失敗與無符合事件的差異。

## Event Log（事件記錄）是一組有來源的證據

Windows事件有LogName、ProviderName、Id、Level、TimeCreated、RecordId與Message等欄位。Id通常要配合ProviderName才有完整意義，不能把全系統的相同Id當同一類事件。Message會受語系、事件資源與格式化條件影響；跨語系規則優先使用結構欄位，必要時查看事件XML。

Get-WinEvent與Get-ComputerInfo是Windows專用。Get-WinEvent預設由新到舊回傳事件；它不等於Linux journal，也不保證目前帳戶能讀所有記錄。Windows PowerShell舊Get-EventLog範例不能直接當成PowerShell7通用做法。

## 先看記錄是否存在與啟用

```powershell
if ($env:OS -ne 'Windows_NT') { throw '此範例需要 Windows' }
Get-WinEvent -ListLog 'Application' -ErrorAction Stop |
    Select-Object LogName, IsEnabled, RecordCount, LogMode
Get-ComputerInfo -Property OsName, OsVersion, OsBuildNumber, OsArchitecture
```

這些是唯讀查詢。RecordCount與版本依實機而異，沒有固定答案。Application記錄為空不等於所有系統都沒有錯誤；未啟用、無權限或查錯記錄也可能讓你看不到資料。Get-ComputerInfo只選需要欄位，避免整份機器資料外流或不必要的收集時間。

## 用FilterHashtable把範圍交給事件查詢

```powershell
if ($env:OS -ne 'Windows_NT') { throw '此範例需要 Windows' }
$filter = @{
    LogName = 'Application'
    StartTime = (Get-Date).AddHours(-24)
    Level = 2, 3
}
$events = @(Get-WinEvent -FilterHashtable $filter -MaxEvents 100 -ErrorAction Stop)
$events | Select-Object TimeCreated, ProviderName, Id, LevelDisplayName, RecordId
```

Level 2是Error（錯誤），3是Warning（警告）；查詢最多100筆，不是一天的完整統計。先從記錄全部讀出，再Where-Object過濾，可能浪費時間與記憶體。FilterHashtable有自己支援的鍵、型別與萬用字元規則，不能把一般雜湊表中的任意欄位都當查詢語法。

查無符合事件時Get-WinEvent可能回報NoMatchingEventsFound；使用ErrorAction Stop後會進入catch。正式報表應辨識該錯誤與Access denied、記錄不存在等失敗，保留查詢條件，不應所有錯誤都轉成空陣列後寫「零錯誤」。

## 用合成事件學習彙總

以下可跨平台執行，完全不讀取真實事件；它只驗證資料整理，不驗證Windows事件服務。

```powershell
$sample = @(
    [pscustomobject]@{ProviderName='Learning.App';Id=100;Level=2}
    [pscustomobject]@{ProviderName='Learning.App';Id=100;Level=2}
    [pscustomobject]@{ProviderName='Learning.Backup';Id=100;Level=3}
)
$sample | Group-Object ProviderName, Id | Sort-Object Count -Descending |
    Select-Object Count, Name
```

結果兩組，數量分別2與1。若只按Id分組會得到3，失去來源差異。真正事件的RecordId需連同記錄來源理解；不能把兩個不同記錄的RecordId相同當成同一事件。

## 時間、訊息與匯出

時間範圍應記錄時區；查詢24小時是往回24小時，不一定等於當地曆日。跨機器關聯可轉為UTC顯示，但不要捨棄原時區資訊與查詢起迄。系統時間錯誤、記錄輪替與保留限制都可能造成缺口。

```powershell
# events由成功的Windows查詢提供；僅整理記憶體資料
$report = $events | Select-Object @{Name='TimeUtc';Expression={
    if ($null -ne $_.TimeCreated) { $_.TimeCreated.ToUniversalTime().ToString('o') }
}}, ProviderName, Id, Level, RecordId
$report | ConvertTo-Json -Depth 3
```

Message可能含路徑、使用者或應用程式資料，預設不整段附在報告。本章不清除事件記錄，也不為得到測試資料故意觸發系統故障。若需要原始EVTX證據，依組織保存規則與來源信任要求處理；CSV／JSON摘要不等於保留全部原始事件欄位。

## 常見錯誤、版本與最佳實踐

Id單獨不足以建立可靠告警；LevelDisplayName不適合當跨語系固定值；MaxEvents限制後不能冒稱完整數量。權限不足應調整合法讀取範圍或申請必要權限，不要直接改事件記錄ACL。

先確認版本、記錄來源與查詢是否成功，再討論「沒有事件」的業務意義。Windows事件格式、Provider與權限依版本及產品而異；本輪沒有Windows實機或遠端事件伺服器。

## 速查表

| 需求 | 方法 | 注意 |
|---|---|---|
| 記錄中繼資料 | Get-WinEvent -ListLog | 無權限不等於空記錄 |
| 時間與層級篩選 | -FilterHashtable | 優先縮小查詢範圍 |
| 限制輸出 | -MaxEvents | 不能當完整總數 |
| 分類事件 | ProviderName＋Id | 不只看Id |
| 系統版本 | Get-ComputerInfo -Property | Windows專用，選必要欄位 |

## 練習題

1. 事件Id為何要搭配ProviderName？
2. Message適合當跨語系唯一判斷嗎？
3. Get-WinEvent預設由新到舊還是由舊到新？
4. 本Linux能直接用Get-WinEvent嗎？
5. 如何查看Application記錄中繼資料？
6. RecordCount為零代表整台機器健康嗎？
7. 為何Get-ComputerInfo只選Property？
8. Level2與3分別是什麼？
9. FilterHashtable的好處？
10. 能使用任意FilterHashtable鍵嗎？
11. MaxEvents100代表24小時完整事件數嗎？
12. 沒有符合事件一定回傳空陣列嗎？
13. 為何不能所有catch都回傳空陣列？
14. 合成資料按ProviderName與Id分成幾組？
15. 只按Id分組會得到什麼？
16. RecordId跨記錄一定唯一嗎？
17. 最近24小時等於當地昨天嗎？
18. 為何報告預設不包含完整Message？
19. JSON摘要等於原始EVTX嗎？
20. 本章合成資料通過代表Windows事件服務通過嗎？

## 參考答案與解題思路

1. 不同提供者可使用相同Id，來源決定事件意義。

2. 不適合，訊息文字可能隨語系與資源改變。

3. 預設由新到舊，特定讀取需求需另查Oldest等參數。

4. 不能，這是Windows專用命令。

5. Get-WinEvent -ListLog Application。

6. 不代表，需確認來源、啟用、權限與保留範圍。

7. 減少不必要收集與敏感資訊暴露。

8. Error錯誤與Warning警告。

9. 由事件查詢先縮小資料範圍，減少不必要讀取。

10. 不能，需依官方支援鍵與型別。

11. 不是，只是最多取得100筆。

12. 不一定，可能回報NoMatchingEventsFound。

13. 會把無權限或查詢失敗偽裝成零事件。

14. 兩組，數量2與1。

15. 一組3筆，失去來源差異。

16. 不能如此假設，需連同來源記錄判斷。

17. 不一定，時間區間與曆日邊界不同。

18. 可能有帳戶、路徑與應用程式敏感資料。

19. 不等於，摘要只保存選取欄位。

20. 不代表；只驗證彙總邏輯，Windows查詢仍未執行。

## 參考資料與延伸閱讀

- [Get-WinEvent](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Diagnostics/Get-WinEvent.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Get-ComputerInfo](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-ComputerInfo.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。

## 驗證狀態

Windows事件與系統資訊查詢未執行；合成事件的分組與上限解讀可在Linux測試，不代替Windows功能驗證。 詳見[驗證紀錄](../../progress/VALIDATION.md)。
