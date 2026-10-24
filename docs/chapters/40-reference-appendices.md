<a id="chapter-40"></a>

# 第 40 章：術語、參數、版本與附錄參考

[返回目錄](../README.md)

## 學習目標

將動詞、別名、提供者、變數、字元、資料格式、版本與錯誤處理組成可查閱的參考；辨認固定語意與環境相依資料。本章是附錄核心初稿，不能代替每個產品版本的完整官方手冊。

## 如何使用本章

先查具體需求，再回到相關章節的完整教學。[中英文術語](../appendices/glossary.md)、[參數索引](../appendices/parameter-reference.md)、[總索引](../appendices/master-index.md)保留獨立搜尋入口；本章補上相互關係與常見誤解，避免只背縮寫。

## 1. PowerShell Verb（動詞）

官方建議使用核准Verb-Noun形式命名。Get是取得、Set是設定、New是建立、Remove是移除、Add是加入既有集合、Clear是清除內容；Copy保留原始項目並複製，Move則搬移。Start／Stop控制執行，Restart重新啟動；Import／Export跨格式或儲存邊界，ConvertTo／ConvertFrom著重轉換方向。

「Get＝問現在、Set＝改設定、New＝做新的、Remove＝拿掉」有助記憶，但不能由動詞推定所有副作用。Search、Read等名稱用字是否屬核准動詞應查實際清單；不要因教材舉例就認定每個英文詞都核准。

```powershell
Get-Verb | Where-Object Verb -in 'Get','Set','New','Remove','Clear' |
    Select-Object Verb, Group
```

本例只查清單，不執行變更。自訂函式使用核准動詞可提高可讀性，仍需清楚的名詞與契約。

## 2. Alias（別名）

gci常指Get-ChildItem、?指Where-Object、%指ForEach-Object；實際工作階段可被設定或覆寫。腳本優先寫完整命令與參數名稱，不把互動縮寫當跨平台契約。Linux的ls、rm等可能是原生程式，不能假設與Windows PowerShell別名相同。

```powershell
Get-Alias -Name gci,'?','%' -ErrorAction Stop | Select-Object Name, Definition
Get-Command -Name Get-ChildItem -All | Select-Object Name, CommandType, ModuleName
```

## 3. Provider（提供者）

提供者讓檔案、環境變數、別名等資料看起來像可巡覽的位置。PSDrive不一定是實體磁碟；Registry提供者是Windows特有能力，不能以Linux的FileSystem結果代替。操作前查Capabilities與具體命令支援的參數。

```powershell
Get-PSProvider | Select-Object Name, Capabilities
Get-PSDrive -PSProvider FileSystem | Select-Object Name, Root
```

## 4. Automatic Variables（自動變數）

$_／$PSItem代表目前管線項目，$PSVersionTable提供版本資訊，$PID是目前PowerShell程序Id，$PSScriptRoot是腳本所在目錄。$null表示沒有值，但與空字串、零、空集合不同。$Matches由適用的比對操作更新，失敗後可能保留舊值，不能未檢查比對結果就使用。

$LASTEXITCODE保存相關原生程式或腳本退出碼，應在目標命令後立即處理；$?表示上一個命令的成功狀態，不能當跨整個流程永久累積的驗收。版本差異與子運算式行為見官方文件。

## 5. Preference Variables（偏好設定變數）

$ErrorActionPreference、$WarningPreference、$VerbosePreference等影響各串流處理；命令層的通用參數可在適用範圍調整行為。不為了讓畫面乾淨就把所有錯誤隱藏；try/catch需要適當終止錯誤策略，詳見第19章。

偏好設定是工作階段行為，不是業務資料。函式或測試若修改偏好，應明確限制範圍；不要以改全域設定讓某一個測試通過。

## 6. 特殊值與作用範圍

$true、$false與$null是語言特殊值；布林false與字串'false'不相同，後者是非空文字，不能當成假值使用。local、script、global與using等作用範圍語意不同；跨程序或執行空間傳遞資料需查第31章，不把同名變數當共享狀態保證。

## 7. Escape Characters（逸出字元）

PowerShell使用反引號作逸出，雙引號字串中的反引號n與反引號t分別可代表換行與定位字元；單引號字串一般不展開變數與這些逸出。反斜線不是PowerShell通用逸出字元，它在Regex與路徑等情境有自己的語意。

行尾反引號接續容易被尾端空白破壞；優先使用括號、管線與Splatting（參數展開）讓結構清楚。不要拿一套逸出方式同時處理PowerShell、JSON、SQL與URL。

## 8. Regex（正規表示式）速查

^與$表示位置、點號通常表示任意字元、方括號表示字元集合、加號表示一次以上。字面文字搜尋可使用Select-String -SimpleMatch；需要組合字面文字到Regex時用Regex.Escape，不直接把不可信文字當規則。

PowerShell的-match通常忽略大小寫，-cmatch區分大小寫；Regex中的群組、替換語法與PowerShell變數展開是不同層次。大量或不可信模式需額外時間上限與壓力驗證，本書未宣稱這些測試通過。

## 9. 常見縮寫

CLI＝命令列介面，SDK＝軟體開發套件，API＝應用程式介面，URI＝統一資源識別碼，TLS＝傳輸層安全性，CSV＝逗號分隔值，JSON＝JavaScript物件表示法，XML＝可延伸標記語言。縮寫只能幫助查詢，不能替代版本、模組與權限條件。

## 10. HTTP狀態碼

| 狀態 | 常見意義 | 下一步 |
|---|---|---|
| 200 | 成功回應 | 另驗本文結構與業務狀態 |
| 204 | 成功但無本文 | 不強迫解析不存在JSON |
| 400 | 請求不符 | 查參數、型別與服務契約 |
| 401／403 | 認證／授權相關 | 依服務文件區分權杖與角色 |
| 404 | 未找到或不揭露 | 查目標、範圍與權限 |
| 429 | 限流 | 依服務與Retry-After處理 |
| 5xx | 伺服器端問題 | 有限重試並考慮冪等性 |

此表是診斷起點，不是所有服務完全相同的規則。正式TLS與OAuth仍需在目標服務驗證。

## 11. JSON格式

JSON區分字串、數字、布林、null、陣列與物件；物件鍵使用雙引號，不能使用PowerShell的@{}語法直接當JSON。ConvertTo-Json的Depth不足可能遺失巢狀結構，轉換後需重讀驗收；重複鍵、日期與大小寫鍵行為依解析器與版本確認。

## 12. XML格式

XML的元素、屬性與命名空間是不同概念；XPath查詢需明確處理命名空間。處理外來資料時不要啟用不必要的DTD與外部實體解析；本書第24章的限制範例不代表所有XML壓力或攻擊情境已驗證。

## 13. CSV格式

CSV是文字交換格式，不會保留原始數值與日期型別。分隔符、雙引號、換行、標頭、編碼與欄位契約都需明確。Export-Csv處理CSV引用，不自動保護試算表公式注入；消費端安全仍要另設計。

## 14. 日期與時間格式

保存事件時間時優先包含UTC或明確偏移；顯示給人看與機器交換是不同需求。固定格式與InvariantCulture能減少文化差異，但不能替你決定時區或夏令時間的業務規則。

```powershell
$time = [datetime]::new(2026,1,1,0,0,0,[DateTimeKind]::Utc)
$text = $time.ToString('o', [Globalization.CultureInfo]::InvariantCulture)
[pscustomobject]@{ Text=$text; Kind=$time.Kind }
```

預期Text以Z標示UTC。不要把Unspecified時間直接加上Z就宣稱已轉換時區。

## 15. .NET常用型別

string是文字、bool是布林、long是64位元整數、decimal適合本章金額契約、double是二進位浮點、datetime表示日期時間、timespan表示間隔。PSCustomObject便於建立報表列，Hashtable便於鍵值對；它們與從遠端取得的產品物件不是同一種實體。

## 16. .NET常用類別

IO.Path協助組合或取得路徑部分，Text.Encoding處理文字位元組，Globalization.CultureInfo提供文化規則，Net.IPAddress可解析與辨識IP。這些方法成功不代表檔案可讀、網路可達或服務已授權；仍需實際能力驗證。

## 17. PowerShell常用模組

Core、Utility、Management、Security等提供不同核心能力；Archive處理ZIP，CimCmdlets依本版文件為Windows用途。ActiveDirectory、Az、Microsoft.Graph與ExchangeOnlineManagement有額外平台、模組、帳戶與角色條件，不能以PowerShell版本號代表全部相容性。

## 18. PowerShell Gallery模組

Gallery是套件來源，不是對每個作者與模組安全性的背書。正式流程應固定版本、查發布者與依賴、驗證來源／雜湊／適當簽章並審閱行為。Import-Module會載入程式，不應把未審閱模組視為純文字資料。本章不自動安裝任何新套件。

## 19. 官方文件索引

[來源清單](../appendices/sources.md)保存文件網址、版本、查閱日期與使用章節，data/sources.json另保留快照與雜湊。連結存在不代表已查讀全文；本書只宣稱使用段落已查證，不把官方原文大量複製成教材。

## 20. 版本演進與相容性

Windows PowerShell5.1使用不同的執行階段與內建模組組合；PowerShell7跨平台不代表每個Windows管理模組也跨平台。ForEach-Object -Parallel從7.0加入，7.1起預設重用執行空間池；JSON與Web命令參數也有版本演進，應對照本機Syntax與同版本文件。

本書實測基準為PowerShell7.6.8／Debian13，不宣稱為所有平台的最新版本或完整支援矩陣。版本相容性需檢查語法、型別、編碼、原生引數、模組、提供者與服務，不只比較版本字串。

## 21. 常見錯誤訊息

| 現象 | 檢查 | 預防 |
|---|---|---|
| 找不到命令 | 名稱、模組、平台、來源 | 固定依賴並記錄版本 |
| 參數集無法解析 | 必填／互斥參數與管線 | 先讀Syntax與範例 |
| 存取被拒 | 身分、資源範圍、權限 | 最小權限與核准目標 |
| Null方法失敗 | 合法缺值或前一步失敗 | 明確驗收輸入與狀態 |
| JSON解析失敗 | 狀態碼、本文、編碼 | 不把錯誤頁當JSON |
| 遠端失敗 | 名稱、連線、TLS、認證、授權 | 分層診斷，不降低驗證 |

遇到例外不應一律變成空資料；保留適當錯誤類型與識別碼，避免輸出秘密。每個產品的詳細修正仍要查對應版本文件。

## 22. 常用指令組合

Get-ChildItem配Where-Object篩選、Select-Object投影再Export-Csv；Get-Content -Raw配ConvertFrom-Json讀結構資料；Start-Job配Wait-Job、Receive-Job與finally清理。Format-Table放在顯示末端，避免把格式指令當資料匯出。

## 23. 安全操作檢查

先確認目標、身分、權限、輸入、輸出、影響範圍與還原策略。支援ShouldProcess的命令可用WhatIf作模擬，但不代表已驗證外部服務授權、成本或交易回滾。簽章、雜湊、TLS與執行原則各有用途，不停用某一層來掩蓋另一層的失敗。

## 24. 系統管理範例入口

檔案與備份見第22–25章，程序／服務與事件見第26–28章，網路／CIM見第29–30章，排程／安全見第31–32章，API與雲端見第33–35章，基礎設施與完整報表案例見第36–38章。這些章節的Windows、服務與帳戶限制仍有效；交叉參照不會把未執行變成已通過。

## 尚需擴充的附錄深度

本章建立24類核心參考，但完整Verb字典、Alias與模組跨版本矩陣、更多企業錯誤案例、參數與術語深度仍需擴充。第39章500+索引未達標；章節達40不等於專案定稿。後續應以實際資料、來源與功能驗證逐項補齊。

## 速查表

| 查詢需求 | 入口 | 驗證原則 |
|---|---|---|
| 英文不懂 | 術語與本章縮寫 | 同詞依情境可能不同 |
| 參數不確定 | 參數索引＋Syntax | 同名不保證同義 |
| 平台差異 | 版本與章節限制 | Linux不替代Windows |
| 命令用途 | 總索引與第39章 | 詳解與速查分開計數 |
| 證據 | progress紀錄 | 語法與實測分層 |

## 練習題

1. Get、Set、New、Remove分別表示什麼？
2. Verb清單是否代表所有命令零副作用？
3. Alias可以被工作階段覆寫嗎？
4. Linux的ls一定是Get-ChildItem別名嗎？
5. PSDrive一定是實體磁碟嗎？
6. Registry提供者在本Linux可用嗎？
7. null、空字串與零相同嗎？
8. 字串'false'就是布林false嗎？
9. LASTEXITCODE應何時處理？
10. 偏好設定可取代業務驗收嗎？
11. 反斜線是PowerShell通用逸出嗎？
12. CSV會保留原始decimal型別嗎？
13. Export-Csv自動防公式注入嗎？
14. JSON Depth不足可能有何問題？
15. UTC時間的Z可任意加到未知時間嗎？
16. IPAddress解析成功等於網路可達嗎？
17. Gallery上的每個模組都已安全審閱嗎？
18. PowerShell7代表所有Windows模組跨平台嗎？
19. 24類參考初稿等於完整產品手冊嗎？
20. 全部40個章節檔案存在就代表全專案完成嗎？

## 參考答案與解題思路

1. 取得、設定、建立與移除；仍需查具體命令的行為。
2. 不是；動詞命名不等於副作用保證。
3. 可以；正式腳本優先用完整名稱並查來源。
4. 不一定；可能是原生工具，需看Get-Command結果。
5. 不是；提供者磁碟也可以映射其他資料來源。
6. 本環境沒有；Windows提供者需另驗證。
7. 不同；需依資料契約分開判斷。
8. 不是；非空字串不應當布林假值使用。
9. 在目標原生命令後立即保存，避免被後續呼叫覆寫。
10. 不能；它只影響處理行為，不證明輸出符合契約。
11. 不是；PowerShell通常以反引號逸出，其他格式另有規則。
12. 不會；讀回需要明確依契約轉型。
13. 不會；引用格式與消費端安全不同。
14. 巢狀資料可能遺失或被簡化，需重讀驗收。
15. 不可以；先確定時區與正確轉換，不能只改標記。
16. 不等於；它只驗格式與位址表示。
17. 不是；需查來源、版本、依賴與實際行為。
18. 不代表；模組、提供者與產品服務各有支援條件。
19. 不等於；本章只建立核心參考，深度仍需擴充。
20. 不代表；500+索引、附錄、企業驗證與深度審閱仍未完成。

## 參考資料與延伸閱讀

- [about_Aliases](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Aliases.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Providers](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Providers.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Automatic_Variables](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Automatic_Variables.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Preference_Variables](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Preference_Variables.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Quoting_Rules](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Quoting_Rules.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Special_Characters](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Special_Characters.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Comparison_Operators](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Comparison_Operators.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Scopes](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Scopes.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_Modules](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Modules.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [about_CommonParameters](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_CommonParameters.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。

## 驗證狀態

來源使用段落已查證；語法、功能與格式分層結果見[驗證紀錄](../../progress/VALIDATION.md)。企業服務、Windows與跨平台結果不得由本機合成資料替代；500+索引與附錄深度仍未完成。
