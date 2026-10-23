<a id="chapter-23"></a>

# 第 23 章：文字處理與正規表示式

[返回目錄](../README.md)

## 學習目標

選擇字面搜尋或 Regular Expression（正規表示式，Regex），從日誌擷取欄位，理解集合比對與 `$Matches` 的生命週期，避免替換字串與跳脫字元造成資料誤改。

## 先選對搜尋工具

找固定字串可用 `Select-String -SimpleMatch`；需要模式才使用 Regex。PowerShell 的 `-like` 使用萬用字元，`-match` 使用 .NET 正規表示式，兩者的 `*` 意義不同。`-like 'warn*'` 代表 warn 開頭的文字，Regex 的 `warn*` 則讓最後的 n 重複零次以上，並不代表「warn 後面任何內容」。

```powershell
'a.b','axb' | Select-String -Pattern 'a.b' -SimpleMatch
'a.b','axb' | Select-String -Pattern 'a.b'
'WARN' -match '^warn$'
'WARN' -cmatch '^warn$'
```

第一個搜尋只找到 `a.b`；第二個的點號能匹配任意單一字元（預設不含換行），因此兩筆都符合。後兩個結果依序是 True、False：PowerShell 比對運算子預設不分大小寫，帶 `c` 的版本區分大小寫。直接使用 .NET Regex API 時，不應假定它與 PowerShell 運算子的預設大小寫設定相同。

## 一小組符號就能處理日誌

| 模式 | 中文意義 | 範例用途 |
|---|---|---|
| `^`、`$` | 開頭、結尾位置 | 限制整筆格式；換行邊界需留意 |
| `[0-9]+` | 一個以上 ASCII 數字 | 數量欄位 |
| `\d`、`\s` | 數字類別、空白類別 | .NET 的數字類別不限 ASCII |
| `.`、`.*` | 單一字元、零個以上 | 避免無限制跨內容擷取 |
| `(...)` | 擷取群組 | 擷取指定欄位 |
| `(?<Name>...)` | 具名擷取群組 | 以名稱讀取欄位 |

`$` 在 .NET 有結尾換行等邊界行為；嚴格要求絕對字串結尾時可研究 `\z`。本章輸入是單行合成日誌，不把簡單範例當成完整協定解析器。

```powershell
$line = 'level=WARN count=12'
$pattern = '^level=(?<Level>[A-Z]+) count=(?<Count>[0-9]+)$'
if ($line -cmatch $pattern) {
    [pscustomobject]@{
        Level = $Matches['Level']
        Count = [int]$Matches['Count']
    }
} else {
    throw '日誌格式不符，不能繼續產生報表'
}
```

輸出包含 Level=WARN、Count=12。擷取結果本來是字串，明確轉型後才能做數值加總。正式輸入還要檢查整數範圍，不能認為「符合數字模式」就不會溢位。`-cmatch` 讓 `[A-Z]` 在此遵守大小寫要求。

## Matches 只在成功分支內使用

```powershell
'count=12' -match '^count=(?<Value>[0-9]+)$'
'invalid' -match '^count=(?<Value>[0-9]+)$'
$Matches['Value']
```

前兩行是 True、False，第三行仍可能是舊的 12。失敗比對不會自動清掉上一筆成功擷取，因此應如上一節在 `if` 成功分支內立即取值，而非比對後無條件讀 `$Matches`。

左側若是集合，`-match` 回傳符合的元素，不是單一布林值，也不替每個元素建立可依賴的 `$Matches`。需要逐行擷取時用 `foreach`，對每一個純量字串執行比對。

```powershell
$matched = @('info','WARN','warning' -match '^warn$')
$matched.Count
$matched[0]
```

輸出 1 與 WARN。用 `@(...)` 固定結果為陣列，有助處理零筆、一筆與多筆。

## Select-String 回傳的是命中資訊

```powershell
$hits = 'id=12 id=34' | Select-String -Pattern '[0-9]+' -AllMatches
$hits | Select-Object LineNumber, Line
$hits.Matches | Select-Object Value, Index
```

`-AllMatches` 把同一行所有命中放進 `MatchInfo.Matches`，不是每個數字各產生一個 MatchInfo。這裡有一筆行結果、兩筆擷取。檔案搜尋可用 `-LiteralPath`、`-Encoding utf8`；`-Quiet` 適合只需要是否命中的情況。傳入物件時先選真正的文字屬性，避免搜尋物件格式化表示而誤判。

## 替換與切割前，先把結果留在記憶體

```powershell
$before = 'Chen,Lin'
$after = $before -replace '^([^,]+),([^,]+)$', '$2 $1'
$before
$after
'A.B' -split '\.'
[regex]::Escape('report[1].txt')
```

依序得到原文、Lin Chen、A 與 B，以及可作字面匹配的跳脫模式。`-replace` 的替換字串使用單引號，避免 PowerShell 先把 `$2`、`$1` 當變數展開。`-split` 的分隔符號也是 Regex，點號需跳脫。

`[regex]::Escape()` 用於「模式中的字面內容」，不能直接當成替換字串的通用跳脫方式。正式改檔前保存原文與差異，確認命中筆數，才在核准範圍寫回；`-replace` 本身沒有 `-WhatIf`，因為它只是產生新字串。

## 效能、安全、版本與常見錯誤

不要把使用者輸入無條件當成 Regex。複雜的巢狀量詞可能造成大量回溯與長時間運算；固定字串優先 SimpleMatch，需要接受模式時限制長度並使用 .NET Regex 的逾時設定。

```powershell
$regex = [regex]::new(
    '^[A-Z]{2}[0-9]{4}$',
    [Text.RegularExpressions.RegexOptions]::None,
    [timespan]::FromMilliseconds(200)
)
$regex.IsMatch('TW2026')
```

結果 True。逾時值是政策選擇，並不是所有資料都應設定 200 毫秒。逾時錯誤需由呼叫端處理。本輪只驗證正常比對，未做惡意模式壓力測試。

常見錯誤是混用 like 與 match、讀取舊 Matches、把兩次擷取誤算成兩行、以及用雙引號讓替換群組提前展開。範例以 7.6.8/.NET 執行；5.1 使用不同 .NET 版本，進階 Regex 特性須另查支援。

## 速查表

| 需求 | 方法 | 結果形狀 |
|---|---|---|
| 固定文字搜尋 | Select-String -SimpleMatch | 命中行資訊 |
| 純量格式檢查 | -match／-cmatch | 布林值；成功時更新 Matches |
| 集合過濾 | 集合 -match 模式 | 符合元素 |
| 一行多次擷取 | -AllMatches 後讀 Matches | 一行可有多個 Match |
| 改文字／切欄位 | -replace／-split | 新字串／切割結果 |

## 練習題

1. 找固定字串時如何避免 Regex 解讀？
2. like 的星號與 Regex 星號相同嗎？
3. 為何 a.b 的 Regex 可以命中 axb？
4. match 與 cmatch 的差異？
5. `[0-9]+` 代表什麼？
6. `\d` 一定只有 ASCII 數字嗎？
7. 具名群組的寫法？
8. 為何 Count 擷取後仍要轉型？
9. 符合數字模式就一定不會整數溢位嗎？
10. 比對失敗會自動清空 Matches 嗎？
11. 在哪個分支使用 Matches 較安全？
12. 左側是集合時 match 回傳什麼？
13. 為何使用 `@(...)` 包住結果？
14. AllMatches 讓本章範例有幾行結果、幾個擷取？
15. 為何不要直接對任意物件做文字搜尋？
16. 替換字串 `$2 $1` 為何使用單引號？
17. 用點號切割文字的 Regex 應怎麼寫？
18. Regex Escape 是替換字串的萬用跳脫器嗎？
19. replace 有 WhatIf 嗎？
20. 如何降低不受信任 Regex 的效能風險？

## 參考答案與解題思路

1. 使用 Select-String 的 SimpleMatch。
2. 不同；萬用字元星號可代表任意字串，Regex 星號重複前一項。
3. 點號代表單一字元；字面點號要跳脫或用 SimpleMatch。
4. 前者預設不分大小寫，後者區分。
5. 一個以上 ASCII 數字。
6. 不是，.NET 的數字類別包含其他 Unicode 數字。
7. `(?<Name>模式)`，成功後從 Matches 的 Name 鍵取值。
8. 擷取結果是字串，數值運算需要明確轉型。
9. 不一定，還需驗證數值範圍。
10. 不會，可能留下上一筆成功結果。
11. 純量比對成功的 if 分支內。
12. 符合模式的元素，不是單一 True/False。
13. 固定集合形狀，便於統一處理零筆與一筆。
14. 一行結果、兩個 Match，值為 12 與 34。
15. 應選真正的文字欄位，避免格式化表示造成誤判。
16. 防止 PowerShell 先展開變數，保留給 Regex 替換引擎處理。
17. `\.`，因為 split 的分隔符號是 Regex。
18. 不是，它用於匹配模式中的字面內容。
19. 沒有；先在記憶體核對新舊結果，再決定寫回。
20. 固定文字優先 SimpleMatch，限制輸入與模式，設定逾時並處理逾時錯誤。

## 參考資料與延伸閱讀

- [about_Regular_Expressions](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Regular_Expressions.md) — Microsoft；7.6；查閱 2026-10-24；語法與擷取。
- [Select-String](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-String.md) — SimpleMatch、AllMatches 與輸出。

- [.NET Regex 最佳實踐與逾時](https://github.com/dotnet/docs/blob/22dffe78e3542278c89cf2c2724be8f8272001dd/docs/standard/base-types/best-practices-regex.md) — Microsoft / .NET；查閱 2026-10-24。

## 驗證狀態

正常／錯誤格式、大小寫、集合、舊 Matches、AllMatches、替換與切割的代表性案例記於 [驗證紀錄](../../progress/VALIDATION.md)。未做正規表示式效能比較或不受信任輸入壓力測試。
