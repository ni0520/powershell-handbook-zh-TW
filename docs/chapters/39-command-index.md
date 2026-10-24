<a id="chapter-39"></a>

# 第 39 章：命令索引的查詢、驗證與 500+ 擴充進度

[返回目錄](../README.md)

## 學習目標

依任務、模組、平台與版本找到命令；區分完整教學、速查與未驗證條目；用本機中繼資料核對官方語法，而不是把命令名稱數量當成已完成的教學或功能測試。

## 實際範圍與尚未達標的部分

本版命令索引擴充至250個唯一命令：27個十四項教學、223個僅速查。500+仍未完成，至少還差250個唯一條目；本章提供可用的查詢方法與本批索引，不把章節編號齊全說成索引目標已達成。完整教學與速查依data/cmdlet-index.json的entry_type分開計數。

本版另新增150筆工作階段、模組、安全、事件、系統與遠端命令，來源查讀與本機中繼資料分開記錄。

新增條目涵蓋格式化、串流、CSV／XML、文化設定、提供者、位置堆疊、模組及背景工作。每筆有繁中用途、模組、章節、平台、版本、官方來源與查證日期；各筆限制見[命令速查索引](../appendices/cmdlet-quick-index.md)。新增速查不是十四項完整教學，不能合計宣稱250份詳解。

## 從需求找到命令

先問要讀取、計算、轉換、顯示或變更什麼。查檔案內容可找Get-Content；查檔案項目用Get-Item；算內容摘要用Get-FileHash。名稱相似不等於輸出相同，不能只依英文直覺替換。

| 任務 | 候選 | 第一個驗證問題 |
|---|---|---|
| 顯示清單 | Format-Table／Format-List | 是畫面，還是後續要匯出資料？ |
| 資料轉換 | ConvertTo-Csv／ConvertTo-Json | 只是文字，還是要直接寫檔？ |
| 集合分析 | Group-Object／Measure-Object | 要原始列、分組，還是統計值？ |
| 執行狀態 | Get-Job／Receive-Job | 要控制物件，還是真正結果？ |
| 模組 | Get-Module／Import-Module | 可用、已載入，還是已驗證？ |

## 正式使用前的四層檢查

第一層看官方文件版本與平台；第二層看目標環境Get-Command的ModuleName、CommandType與參數；第三層用Get-Help理解輸入輸出；第四層才在核准測試資料執行，記錄功能結果。某命令能被找到，只證明目前可解析它，不證明所需服務、提供者或帳戶可用。

```powershell
Get-Command -Name Get-FileHash -All |
    Select-Object Name, CommandType, ModuleName
Get-Command -Name Get-FileHash -Syntax
```

Get-Verb本身可能是函式；docker是原生程式，Get-LearningCsvReport是教材自訂函式。索引中的命令要明確分類，不把別名、函式、外部程式與Cmdlet全部宣稱為相同技術實體。本版官方索引含官方提供的命令，不收教材函式或docker當成補足500+的數量。

若命令存在多個來源，先查-All與模組來源，再視情況使用ModuleName\\CommandName限定。不要因為同名就套用另一產品的語法；第36章Get-VM便是需要確認模組的例子。

## 讀取本版索引

下列從儲存庫根目錄執行，唯讀載入資料檔，不自動安裝模組或執行索引中的命令。

```powershell
$index = @(Get-Content -LiteralPath './data/cmdlet-index.json' -Raw -Encoding utf8 | ConvertFrom-Json)
$index | Group-Object entry_type | Sort-Object Name | Select-Object Name, Count
$index | Where-Object module -eq 'Microsoft.PowerShell.Utility' |
    Select-Object name, zh_name, entry_type
```

預期兩類為tutorial=27、quick-reference=223；數量代表本版資料，不是本機安裝命令總數。HTML可以搜尋中文或英文，GitHub原稿可由總索引點入對應章節。詳解連結可能在章內或附錄，不只看檔案位置判斷是否完整。

## 唯一性與最低資料品質

索引名稱相同的命令需要先決定是否按產品分開建模。本專案目前要求name唯一，且保留模組欄位；若未來需要同名不同模組，必須一起更新穩定Id、驗證與連結策略，不能偷加重複資料來增加數量。

```powershell
$index = @(Get-Content -LiteralPath './data/cmdlet-index.json' -Raw -Encoding utf8 | ConvertFrom-Json)
$duplicates = @($index | Group-Object name | Where-Object Count -gt 1)
if ($duplicates.Count -gt 0) { throw '命令名稱重複' }
foreach ($entry in $index) {
    if ([string]::IsNullOrWhiteSpace($entry.official_source) -or
        [string]::IsNullOrWhiteSpace($entry.zh_name)) { throw '索引缺少來源或中文名稱' }
}
[pscustomobject]@{ UniqueNames=$index.Count; MinimumFieldsPresent=$true }
```

預期UniqueNames=250。這只是最低結構檢查，不驗證中文摘要的技術正確性，也不證明網頁仍可用或每個參數已實測。正式驗證還需來源查讀、錨點、版本與平台檢查，見scripts/validate.py及驗證紀錄。

## 速查條目如何擴充成詳解

先選擇有明確學習價值的命令，查官方版本與參數組，再撰寫十四項教學與五類範例。語法、靜態分析、代表性功能、輸出格式分開驗證；缺平台時保留未執行。原速查可保留供交叉參照，但data中同一命令只計一次並改entry_type。

Get-FileHash曾在第32章由速查升級詳解；若原錨點與新教學使用同名Id，整合文件會重複。需要更新錨點、索引與舊連結，再檢查HTML／PDF；不能只把資料欄位改成tutorial就宣稱完成。

## 安全、錯誤與最佳實踐

Get開頭不保證零成本或零副作用；提供者、類別與服務行為仍須查證。Clear-Content會清空內容，Import-Module可能執行初始化，Read-Host會等待互動，Out-File可能覆寫；速查應保留這些使用限制，不能只列一句直譯。

自動蒐集官方文件名稱可以作研究清單，但不能當已翻譯查證的正式索引。每個新增條目應有明確用途、來源與限制；不要批量產生同一段模板敘述來湊足數量。500+擴充下一步應優先涵蓋尚未收錄且有實用價值的模組，並逐筆審閱，不宣稱本輪已達標。

## 速查表

| 問題 | 去哪裡查 | 不代表 |
|---|---|---|
| 有何用途 | 中文索引與章節 | 已完整實測 |
| 哪個模組 | Get-Command -All | 服務已可用 |
| 哪些參數 | 本機Syntax＋官方同版本 | 跨版本皆相同 |
| 是否完整教學 | entry_type及十四項結構 | 只有名稱就算完成 |
| 500+進度 | 唯一條目與品質紀錄 | 文件檔名數量 |

## 練習題

1. 本版唯一命令有幾個？
2. 完整教學與僅速查各幾個？
3. 500+目標至少還差多少？
4. Get-Item與Get-Content輸出相同嗎？
5. 查命令來源可以使用哪個命令？
6. 為何加-All？
7. 命令存在就代表Registry提供者存在嗎？
8. Get-Verb一定是二進位Cmdlet嗎？
9. docker應當官方PowerShell Cmdlet計數嗎？
10. 教材自訂函式可拿來充500+官方命令嗎？
11. Format-Table適合直接接Export-Csv嗎？
12. 兩個同名不同模組可直接重複加入目前資料嗎？
13. 最低欄位檢查能驗證摘要正確嗎？
14. 官方文件檔名數能當已翻譯索引數嗎？
15. 速查升級詳解只改entry_type就完成嗎？
16. 舊新錨點重複有何影響？
17. Get開頭命令一定沒有副作用嗎？
18. Import-Module只讀取資料而不執行程式嗎？
19. 查本版索引會自動安裝企業模組嗎？
20. 本章編號齊全代表500+索引完成嗎？

## 參考答案與解題思路

1. 250個；依data/cmdlet-index.json的唯一命令計算。
2. 27個十四項教學、223個僅速查，不混成250份詳解。
3. 至少250個；500+仍需逐筆來源與內容審閱。
4. 不同；前者是項目，後者是內容。
5. Get-Command，並檢查ModuleName及CommandType。
6. 找到所有同名來源，避免別名或不同模組混淆。
7. 不代表；提供者與平台能力另行驗證。
8. 不一定；官方也可能以函式實作命令，應看CommandType。
9. 不應；它是另一工具的原生CLI。
10. 不可；本專案官方索引與教材函式分開。
11. 不適合；它輸出格式指令，應先以Select-Object整理資料。
12. 不可；目前驗證要求name唯一，需要先更新資料模型與連結策略。
13. 不能；結構與技術語意是不同檢查層。
14. 不能；候選清單不代表內容已查證。
15. 不夠；還需十四節、範例、來源、驗證與連結。
16. 可能造成錯誤跳轉與匯出警告，需更新並重驗。
17. 不保證；需查提供者、類別與服務成本／副作用。
18. 不是；載入模組可能執行初始化程式，來源要可信。
19. 不會；範例只讀JSON，不執行條目。
20. 不代表；本章明確保留未達標項目。

## 參考資料與延伸閱讀

- [Get-Command](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Command.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [Get-Help](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/Get-Help.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。

## 驗證狀態

來源使用段落已查證；語法、功能與格式分層結果見[驗證紀錄](../../progress/VALIDATION.md)。企業服務、Windows與跨平台結果不得由本機合成資料替代；500+索引與附錄深度仍未完成。
