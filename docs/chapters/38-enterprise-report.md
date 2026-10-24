<a id="chapter-38"></a>

# 第 38 章：企業自動化案例——可驗收的 CSV 報表

[返回目錄](../README.md)

## 學習目標

將需求、資料契約、驗證、轉換、輸出與失敗處理串成完整案例。使用自建暫存資料驗證正常、零值、錯誤資料與重跑結果；不發信、不部署、不連線企業系統，也不宣稱測試資料就是正式企業盤點。

## 案例與驗收條件

情境：維運人員收到一份UTF-8 CSV，含Id、Quantity、UnitPrice，要產生數量門檻以上的金額報表。Id不得空白或重複，Quantity是非負整數，UnitPrice使用小數點的非負十進位金額；不接受任意文化格式、千位分隔、負數或公式字串。

這是本章刻意選定的資料契約，不是所有公司CSV的通用規格。輸出保留Id、Quantity、UnitPrice與Total，計算使用decimal，避免以二進位浮點處理本例金額。沒有自動稅率、折扣、幣別轉換與四捨五入政策；需要時另定契約，不在背景隱含加入。

文字流程：讀CSV → 驗欄位 → 驗全部資料列 → 計算 → 篩選門檻 → 排序 → 呼叫端決定輸出。先驗全部列才輸出，避免處理到一半才遇壞資料，卻已產生部分成功報表。

## 主要函式教學

<a id="get-learningcsvreport"></a>

### 1. 名稱

Get-LearningCsvReport（取得教材CSV報表）；教材自訂函式，**不是Microsoft Cmdlet**，不計入官方命令索引。

### 2. 重要程度

★★★★☆ 常用設計練習；串接第16、19、21、24章觀念。

### 3. 功能

從單一精確路徑讀CSV，先驗證所有資料，再回傳結構化物件；不自行覆寫輸出、不吞掉例外，也不把日誌混入成功資料。

### 4. 使用情境

受控來源的小型報表。適合驗證流程設計，不代表已處理任意外部CSV或大資料壓力。

### 5. 英文拆解

Learning是教材範例，Csv是逗號分隔資料，Report是報表；名稱明確區分自訂函式與官方命令。

### 6. 語法

先點來源載入儲存庫examples/38-enterprise-report/Get-LearningCsvReport.ps1，再以Get-LearningCsvReport -LiteralPath 檔案 -MinimumQuantity 門檻呼叫。點來源會在目前範圍定義函式，應先審閱腳本。

### 7. 參數

| 參數 | 功能 | 驗證 |
|---|---|---|
| -LiteralPath | 單一CSV精確路徑 | 必填、非空；Import-Csv錯誤向外傳播 |
| -MinimumQuantity | 最低數量，預設0 | 非負long；不依此略過其他列的驗證 |

### 8. 五類範例

以下從儲存庫根目錄執行，只建立自己的暫存目錄。輸入包含中文與中括號檔名，來源檔不被報表函式修改；finally只清理本例資料。

```powershell
. ./examples/38-enterprise-report/Get-LearningCsvReport.ps1
$root = Join-Path ([IO.Path]::GetTempPath()) ('ps-report-' + [guid]::NewGuid())
try {
    $null = New-Item -ItemType Directory -Path $root
    $inputPath = Join-Path $root '訂單[1].csv'
    @(
        [pscustomobject]@{Id='A1';Quantity=3;UnitPrice='19.95'}
        [pscustomobject]@{Id='A2';Quantity=0;UnitPrice='5.00'}
    ) | Export-Csv -LiteralPath $inputPath -NoTypeInformation -Encoding utf8
    # 基本：回傳物件而非格式化畫面
    $all = @(Get-LearningCsvReport -LiteralPath $inputPath)
    # 參數化：門檻1，只保留A1
    $filtered = @(Get-LearningCsvReport -LiteralPath $inputPath -MinimumQuantity 1)
    # 實務：由呼叫端決定輸出位置，避免默默覆寫既有檔案
    $outputPath = Join-Path $root 'report.csv'
    if (Test-Path -LiteralPath $outputPath) { throw '輸出已存在，拒絕覆寫' }
    $filtered | Export-Csv -LiteralPath $outputPath -NoTypeInformation -Encoding utf8
    $readback = @(Import-Csv -LiteralPath $outputPath -Encoding utf8)
    # 錯誤假設與修正：CSV讀回的Total是文字，需要明確解析
    $total = [decimal]::Parse($readback[0].Total, [Globalization.CultureInfo]::InvariantCulture)
    # 進階：只重跑純讀取轉換，不重送外部變更
    $again = @(Get-LearningCsvReport -LiteralPath $inputPath -MinimumQuantity 1)
    [pscustomobject]@{ AllCount=$all.Count; FilteredCount=$filtered.Count; Total=$total; SameId=($again[0].Id -eq $filtered[0].Id) }
} finally {
    if (Test-Path -LiteralPath $root) { Remove-Item -LiteralPath $root -Recurse -Force }
}
```

預期AllCount=2、FilteredCount=1、Total=59.85、SameId=True。文字顯示可能依文化不同，但本例數值契約以不變文化的小數點為準；正式輸出跨文化需求需另外決定序列化格式。

### 9. 輸出判讀

函式回傳資料列物件；Import-Csv讀回則是文字欄位，型別不會自動恢復。合法篩選結果可以零筆，但本章要求輸入至少有一筆資料。空輸入、缺欄位與合法零筆結果是不同狀態。

### 10. 常見錯誤

把負數、空值或含貨幣符號的文字直接轉型會造成不一致；函式明確拒絕。Id以Ordinal比較，大小寫不同視為不同Id；若業務要求忽略大小寫，需修改契約與測試，不偷偷改判斷方式。

### 11. 安全提醒

輸出可能包含商業資料；只放核准位置。本例限制數值欄位，但Id仍是不可信文字，若由試算表開啟，可能涉及公式注入風險；必須依消費端另訂防護，不宣稱Export-Csv會自動消毒。檔案存取權、原子提交與失敗後殘留處理也需在正式流程補齊。

### 12. 相關指令

Import-Csv／Export-Csv處理交換格式；TryParse用於不把無效輸入誤當有效數值；Pester驗證正常與失敗契約。

### 13. 記憶技巧

「先驗全批，再出結果；資料與顯示分開。」

### 14. 官方來源

Import-Csv、Export-Csv與錯誤處理文件支持本例的語意；函式與測試為教材原創，沒有宣稱是官方產品範例。

## 失敗分類與操作紀錄

| 現象 | 可能原因 | 檢查／處理 | 預防 |
|---|---|---|---|
| 讀檔失敗 | 不存在、無權限、路徑不符 | 保留錯誤類型，停止本批 | 明確精確路徑與來源契約 |
| 缺欄位 | 格式或版本不符 | 回報欄位名稱，不匯出 | 固定結構版本與測試 |
| 數字不合法 | 空值、負數、文化格式 | 拒絕，不自動改0 | 不變文化與資料驗證 |
| 重複Id | 上游重送或識別錯誤 | 停止，交由資料責任人處理 | 唯一鍵與重跑策略 |
| 篩選後零筆 | 合法資料都低於門檻 | 記錄成功零筆 | 不與讀檔失敗混淆 |

正式操作日誌應保存執行識別碼、輸入摘要、版本、門檻、成功／失敗與筆數，不直接記完整訂單。報表函式不處理登入、通知或重試；這些責任由外層協調，並防止失敗後寄出「成功」通知。

## 擴充與最佳實踐

本例收集所有資料後才輸出，記憶體用量隨資料增加；大檔需設計上限或暫存驗證流程，不能宣稱固定記憶體。輸入檔若在讀取期間被其他程序修改，也需要來源快照或交付協議。正式發布可先寫新暫存檔、驗收、再依檔案系統能力提交到目的地，不能把任意檔案移動都叫跨平台原子交易。

要加入寄信、API上傳或資料庫寫入時，先新增唯一執行Id、去重、授權、重試上限與補償流程；本章只完成本機資料轉換，不把同一檔案重讀當成外部變更冪等性的證明。

## 速查表

| 階段 | 原則 | 驗收 |
|---|---|---|
| 輸入 | UTF-8、明確欄位 | 至少一筆 |
| 數字 | long／decimal、不變文化 | 非負、拒絕無效 |
| 身分 | Ordinal唯一Id | 不自動去重 |
| 轉換 | 先驗全批再輸出 | 不產生部分成功 |
| 輸出 | 呼叫端決定位置 | 重讀型別與筆數 |

## 練習題

1. 本章函式是Microsoft Cmdlet嗎？
2. 三個必需欄位是什麼？
3. Quantity可接受負數嗎？
4. UnitPrice使用什麼數值型別？
5. 為何不依目前文化解析金額？
6. 基本範例A1總額是多少？
7. 門檻1後有幾筆？
8. 門檻0是否保留零數量？
9. 篩選掉的資料還要驗證嗎？
10. 輸入至少要幾筆？
11. 篩選後零筆一定失敗嗎？
12. Import-Csv會恢復decimal型別嗎？
13. Id的大小寫比較策略是什麼？
14. 重複Id會自動保留最後一筆嗎？
15. 為何先驗全部再輸出？
16. 本函式會改寫來源嗎？
17. Export-Csv自動防止公式注入嗎？
18. 本例能證明外部上傳具冪等性嗎？
19. 本例記憶體固定不變嗎？
20. 加入通知前應先補什麼？

## 參考答案與解題思路

1. 不是；它是教材自訂函式，不計入官方命令索引。
2. Id、Quantity、UnitPrice，名稱大小寫依本章契約。
3. 不接受，需非負long整數。
4. decimal；本例避免二進位浮點金額誤差。
5. 契約固定小數點格式，避免不同機器解讀不同。
6. 59.85；3乘19.95。
7. 一筆A1；A2數量為0。
8. 保留；門檻是大於等於，不把零當缺值。
9. 要；全批資料都先驗證，避免以篩選隱藏壞資料。
10. 一筆資料列；只有標頭或空檔會拒絕。
11. 不一定；合法輸入經門檻後可以成功零筆。
12. 不會；讀回仍是文字，需按契約解析。
13. Ordinal且區分大小寫；更改需同步契約與測試。
14. 不會；直接拒絕，避免默默遺失資料。
15. 避免後段錯誤時前段已輸出部分成功報表。
16. 不會；它只讀取並回傳物件，輸出由呼叫端決定。
17. 不會；Id等文字欄位仍需依試算表消費端處理。
18. 不能；只測本機純讀取轉換，外部變更需另有去重。
19. 不是；全批驗證需收集資料，記憶體隨筆數增加。
20. 執行識別、成功／失敗契約、授權、去重與告警責任，避免錯寄成功訊息。

## 參考資料與延伸閱讀

- [Import-Csv](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Import-Csv.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [Export-Csv](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-Csv.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Try_Catch_Finally](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Try_Catch_Finally.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。

## 驗證狀態

來源使用段落已查證；語法、功能與格式分層結果見[驗證紀錄](../../progress/VALIDATION.md)。企業服務、Windows與跨平台結果不得由本機合成資料替代；500+索引與附錄深度仍未完成。
