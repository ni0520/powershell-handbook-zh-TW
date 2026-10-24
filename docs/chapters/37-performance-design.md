<a id="chapter-37"></a>

# 第 37 章：效能量測與程式碼設計

[返回目錄](../README.md)

## 學習目標

先驗證結果再比較速度；區分啟動、計算、I/O、序列化與顯示成本；以重複量測、明確資料量與環境紀錄支持結論。改善可維護性時，保留輸入、輸出及失敗契約，不為追求單一數字改變功能。

## 快之前先定義正確

效能問題應從具體目標開始，例如「核准目錄中的十萬筆記錄，在限制記憶體下產生相同報表」。沒有資料量、正確結果、環境與測試方式的「快十倍」無法重現。互動畫面的顯示、第一次模組載入、檔案快取與網路等待都可能主導量測。

Wall-clock time（實際經過時間）不同於CPU time（處理器時間），工作集也不是累計分配量。Get-Process的CPU是累計秒數，不直接等於某段腳本的CPU百分比；本章不宣稱完成記憶體、CPU或跨版本基準測試。

## 主要指令教學

<a id="measure-command"></a>

### 1. 名稱

Measure-Command（量測命令），Microsoft.PowerShell.Utility。

### 2. 重要程度

★★★★☆ 常用；是初步量測工具，不是完整效能剖析器。

### 3. 功能

執行區塊並回傳TimeSpan（時間間隔）。被量測的工作真的會執行，不能用於未核准的變更命令來「只看時間」。

### 4. 使用情境

在固定小型資料上比較等價計算，或確認耗時位於哪個階段。正式優化需有多次量測與結果一致性檢查。

### 5. 英文拆解

Measure是量測；先問「量到哪一段」，再看數字。

### 6. 語法

本章使用Measure-Command -Expression { 區塊 }；量測回傳TimeSpan，可取TotalMilliseconds。不要把Milliseconds分量當總毫秒。

### 7. 主要參數

| 參數／屬性 | 意義 | 注意 |
|---|---|---|
| -Expression | 被執行的區塊 | 包含真實副作用 |
| -InputObject | 傳入資料 | 需理解管線與區塊的處理方式 |
| TotalMilliseconds | 總毫秒 | 可含小數，與Milliseconds分量不同 |

### 8. 五類範例

**基本：量測固定計算。**

```powershell
$elapsed = Measure-Command { $sum = 0; foreach ($n in 1..1000) { $sum += $n } }
[pscustomobject]@{ Total=$sum; Milliseconds=$elapsed.TotalMilliseconds }
```

Total應為500500，毫秒值依環境不同；不把教材填入的固定時間當驗收標準。Measure-Command在目前範圍執行區塊，本例可在外部讀取sum；正式量測仍應避免對共用狀態造成混淆。

**參數化：固定輸入量。**

```powershell
$count = 1000
$data = 1..$count
$elapsed = Measure-Command { $result = @($data | Where-Object { $_ % 2 -eq 0 }) }
[pscustomobject]@{ InputCount=$count; ResultCount=$result.Count; Milliseconds=$elapsed.TotalMilliseconds }
```

預期ResultCount=500。是否把輸入建立也放進區塊，取決於想量哪個階段；比較不同方案時必須一致。

**實務：重複量測並列出摘要。**

```powershell
$data = 1..1000
$null = $data | Where-Object { $_ % 2 -eq 0 } # 相同工作先暖機
$times = @(foreach ($run in 1..5) {
    (Measure-Command { $result = @($data | Where-Object { $_ % 2 -eq 0 }) }).TotalMilliseconds
    if ($result.Count -ne 500) { throw '結果不符，拒絕當成效能成功' }
})
$ordered = @($times | Sort-Object)
[pscustomobject]@{ Runs=$times.Count; MinMs=$ordered[0]; MedianMs=$ordered[2]; MaxMs=$ordered[-1] }
```

本例只有五次樣本，摘要只是學習方法；不宣稱達到嚴格統計顯著或正式服務SLA（服務水準協議）。正式報告應保留原始樣本與系統背景負載。

**錯誤示範與修正：分量不是總量。**

```powershell
$duration = [timespan]::FromMilliseconds(1500)
[pscustomobject]@{ Component=$duration.Milliseconds; Total=$duration.TotalMilliseconds }
```

預期Component=500、Total=1500；用分量比較會把超過一秒的時間看錯。

**進階：先比較等價結果。**

```powershell
$data = 1..1000
$pipeline = @($data | Where-Object { $_ % 2 -eq 0 })
$loop = @(foreach ($n in $data) { if ($n % 2 -eq 0) { $n } })
if (@(Compare-Object $pipeline $loop).Count -ne 0) { throw '兩方案不等價' }
[pscustomobject]@{ PipelineCount=$pipeline.Count; LoopCount=$loop.Count; Equivalent=$true }
```

本例檢查值的差異，未檢查所有可能的型別、順序與重複契約；若它們有業務意義，需額外斷言。沒有在這裡宣稱哪個方案較快。

### 9. 輸出判讀

TimeSpan回答區塊經過多久，不提供每個函式的詳細呼叫成本。Measure-Command一般抑制被測區塊的成功輸出；為了看畫面把顯示重新導出時，也會改變量測邊界與成本。

### 10. 常見錯誤

只跑一次、冷啟動與暖機混比、把格式化排除在一個方案卻包含在另一方案，都是不公平比較。微小差異可能來自排程與背景負載，不直接用比例當產品結論。

### 11. 安全提醒

被測程式會實際執行。不要量測正式刪除、部署或大量API變更來「看看快不快」。只對自己建立的測試資料做必要操作。

### 12. 相關指令

Measure-Object可做數量與數值摘要；Compare-Object可協助比較；更細的CPU／配置分析需要適當剖析工具與獨立方法，不由Measure-Command單獨證明。

### 13. 記憶技巧

「同資料、同結果、同邊界、多次量」，先讓比較公平。

### 14. 官方來源

Measure-Command與PowerShell效能注意事項的固定Microsoft文件見章末；本章數字均由實際環境產生，未捏造基準時間。

## 資料結構、串流與查詢位置

大量逐次陣列串接可能產生不必要的資料搬移；可使用合適集合或直接讓foreach產生輸出後一次收集。不要把任何方法一概叫最快，實際成本依版本、資料形狀與流程而變。

能在來源端安全篩選時，先減少傳輸與記憶體負擔；但來源端Filter與Where-Object的語言和支援欄位可能不同，必須保持結果等價。串流能減少同時保留資料，但排序與分組等操作通常仍需要聚合，不能只因使用管線就宣稱固定記憶體。

平行化會增加執行空間、序列化、同步與服務限流成本。第31章的有限平行範例是正確性示範，不代表把ThrottleLimit加大就能加速；測試必須包括服務配額與失敗率。

## 程式設計與最佳實踐

將「讀取來源、驗證、轉換、寫入」分開；函式輸出資料，外層決定顯示或匯出。每層有明確的成功／失敗契約，避免錯誤處理、日誌與畫面字串混入成功輸出。為正常資料、空資料、無效型別與部分失敗建立有意義的測試，優先測契約而不是逐行模仿實作。

優化前保存基準與驗收測試，修改後先驗結果、再量效能；若只是改善命名或格式，不需建立機械式測試。沒有量測的「最佳化」只能叫設計選擇，不能宣稱已改善效能。

## 速查表

| 問題 | 方法 | 限制 |
|---|---|---|
| 區塊耗時 | Measure-Command | 真正執行區塊 |
| 總毫秒 | TotalMilliseconds | 不是Milliseconds分量 |
| 公平比較 | 同輸入／結果／邊界 | 保留原始樣本 |
| 記憶體壓力 | 評估聚合與資料量 | 管線不保證固定記憶體 |
| 平行 | 先驗契約再調同時數 | 不忽略限流與失敗 |

## 練習題

1. 速度比較前應先驗證什麼？
2. Measure-Command會真的執行區塊嗎？
3. 回傳型別是什麼？
4. Milliseconds與TotalMilliseconds差異？
5. 1500毫秒的Milliseconds分量是多少？
6. 基本範例的總和應是多少？
7. 1至1000的偶數有幾個？
8. 第一次模組載入可能影響量測嗎？
9. 為何保留原始樣本？
10. 五次樣本足以宣稱嚴格統計顯著嗎？
11. 不同資料量可以直接比較速度比例嗎？
12. 格式化成本可在一邊包含另一邊排除嗎？
13. Get-Process的CPU是否直接是CPU百分比？
14. 使用管線就保證固定記憶體嗎？
15. 來源Filter與Where-Object語法必然一樣嗎？
16. ThrottleLimit越高一定越快嗎？
17. Compare-Object是否自動驗證所有順序契約？
18. 正式部署可以拿來微基準測試嗎？
19. 為何分離資料輸出與畫面顯示？
20. 修改後應先量速度還是先驗正確結果？

## 參考答案與解題思路

1. 等價結果與完整的輸入／輸出／失敗契約。
2. 會；有真實副作用，需限制測試範圍。
3. TimeSpan時間間隔，不是詳細效能剖析報告。
4. 前者是毫秒分量，後者是整段時間的總毫秒。
5. 500；總毫秒仍是1500。
6. 500500；錯誤結果再快都不能算通過。
7. 500個；本例以此作結果驗收。
8. 會；冷啟動與暖機條件應一致。
9. 讓異常、變異與環境影響可追查，不只留下平均值。
10. 不足；本例只是方法示範，需適當統計設計。
11. 不適合；先固定資料量與工作內容。
12. 不公平；需定義一致量測邊界。
13. 不是；它是程序累計CPU秒數。
14. 不保證；排序／分組等仍可能聚合資料。
15. 不一樣；需查來源語言與支援欄位並驗等價結果。
16. 不一定；可能增加同步、限流與資源競爭。
17. 不會；若順序、型別或重複有意義需另測。
18. 不可隨意；改用核准隔離資料與無副作用案例。
19. 保持可測與可匯出的資料契約，避免格式物件或日誌污染結果。
20. 先驗正確結果，再以同方法量測效能。

## 參考資料與延伸閱讀

- [Measure-Command](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Measure-Command.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [script-authoring-considerations](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/dev-cross-plat/performance/script-authoring-considerations.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。

## 驗證狀態

來源使用段落已查證；語法、功能與格式分層結果見[驗證紀錄](../../progress/VALIDATION.md)。企業服務、Windows與跨平台結果不得由本機合成資料替代；500+索引與附錄深度仍未完成。
