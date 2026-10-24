<a id="chapter-33"></a>

# 第 33 章：REST API 與網路服務

[返回目錄](../README.md)

## 學習目標

使用REST（表述性狀態轉移）服務的資料契約；辨認URL、HTTP方法、標頭、本文、狀態碼與分頁。將認證、傳輸、資料解析與業務驗收分開，設計有限逾時與重試，而不是遇到失敗就降低TLS驗證。

## 一次請求的六個部分

URI（統一資源識別碼）指出目標；Method（方法）表示操作意圖；Headers（標頭）攜帶內容型別與認證資訊；Body（本文）承載資料；Status Code（狀態碼）描述HTTP結果；回應本文則可能是JSON、文字或空內容。REST不是「把任意網址丟給JSON解析器」。

GET通常讀取、POST通常建立或觸發處理、PUT通常替換、PATCH通常部分更新、DELETE通常刪除；實際副作用、冪等性與授權以服務契約為準。不要只因GET唯讀就認為輸出不含個資。HTTP200也不保證本文符合期待的欄位與業務狀態。

<a id="invoke-restmethod"></a>

## 主要指令教學

### 1. 名稱

Invoke-RestMethod（呼叫REST方法），Microsoft.PowerShell.Utility。

### 2. 重要程度

API自動化必學；與第24章JSON資料處理、第29章網路診斷交叉使用。

### 3. 功能

送出HTTP請求並處理回應；JSON／XML回應可轉成PowerShell可處理的資料。不要假設所有API都回傳同一種物件或固定有value屬性。

### 4. 使用情境

從核准的API取得盤點資料、轉成報表；變更型API需另有操作授權與回滾／補償計畫。本章不呼叫任何正式服務變更介面。

### 5. 英文拆解

Invoke是呼叫，RestMethod指REST操作方法；記成「送請求，再驗回應」。

### 6. 語法

本章形式為Invoke-RestMethod -Uri 網址 -Method Get。PowerShell7.6的連線與操作逾時分別可用ConnectionTimeoutSeconds及OperationTimeoutSeconds；舊版本的參數名稱與行為需查本機語法，不直接套用全部範例。

### 7. 主要參數

| 參數 | 意義 | 注意 |
|---|---|---|
| -Uri／-Method | 目標與方法 | 先驗核准主機與副作用 |
| -Headers | HTTP標頭 | 不記錄認證標頭 |
| -Body／-ContentType | 本文與型別 | 雜湊表不一定自動變JSON |
| -StatusCodeVariable | 保存狀態碼 | 不能取代本文驗收 |
| -MaximumRetryCount | 內建重試次數 | 需評估服務與重複操作風險 |

### 8. 五類範例

**基本：唯讀GET範本。** 下列example.test是保留示意網域，尚未執行；必須換成核准API，不提供帳號或虛構成功輸出。

```powershell
$uri = 'https://api.example.test/v1/items'
$data = Invoke-RestMethod -Uri $uri -Method Get `
    -ConnectionTimeoutSeconds 10 -OperationTimeoutSeconds 20 -ErrorAction Stop
$data
```

**參數化：組合查詢值。** 此區塊只產生字串，不發出請求。

```powershell
$query = [uri]::EscapeDataString('台北 & 報表')
$uri = 'https://api.example.test/v1/items?search={0}' -f $query
$uri
```

預期&被編碼成%26，不會意外變成下一個參數。只編碼查詢值，不把整條URL全部Escape後當請求。

**實務：驗收合成回應後產生報表。** 這是本機資料處理，不代表遠端API可用。

```powershell
$response = '{"value":[{"id":"A1","count":2},{"id":"A2","count":0}]}' | ConvertFrom-Json
if ($null -eq $response.value) { throw '缺少value欄位' }
$rows = @($response.value)
foreach ($row in $rows) {
    if ([string]::IsNullOrWhiteSpace($row.id)) { throw '缺少id' }
    if ($null -eq $row.count -or $row.count -isnot [long] -or $row.count -lt 0) {
        throw 'count必須為非負整數'
    }
    [pscustomobject]@{ Id=$row.id; Count=$row.count }
}
```

預期A1=2、A2=0，零是合法資料，不應用if(-not $row.count)把它誤當缺值。本例以PowerShell7.6 JSON整數型別驗證，其他解析器需依契約調整。

**錯誤示範與修正：本文不是JSON字串。** 下列只做序列化，不送出POST。

```powershell
$bodyObject = @{ name='繁體中文'; enabled=$true }
# 錯誤假設：雜湊表的ToString就會產生JSON
$wrong = $bodyObject.ToString()
# 修正：明確序列化並指定足夠深度
$json = $bodyObject | ConvertTo-Json -Depth 4 -Compress
$roundtrip = $json | ConvertFrom-Json
[pscustomobject]@{ Wrong=$wrong; Name=$roundtrip.name; Enabled=$roundtrip.enabled }
```

預期Wrong是型別描述，Name保留繁中，Enabled仍為布林。真正提交時應依API契約使用application/json，必要時以UTF-8位元組提供本文；不要只改ContentType卻仍傳不符格式的資料。

**進階：明確取得HTTP狀態。** 未執行的GET範本：

```powershell
$payload = Invoke-RestMethod -Uri 'https://api.example.test/v1/items/A1' `
    -Method Get -StatusCodeVariable status -ConnectionTimeoutSeconds 10 `
    -OperationTimeoutSeconds 20 -ErrorAction Stop
if ($status -ne 200) { throw ('非預期狀態：{0}' -f $status) }
if ($null -eq $payload.id) { throw '回應缺少id' }
```

本章沒有使用SkipHttpErrorCheck來掩蓋錯誤。若服務契約需要處理非2xx本文，應明確分支處理狀態，不把錯誤頁當正常報表。

### 9. 輸出判讀

物件形狀來自API契約。清單可能包在value、items或直接是陣列；204可能沒有本文。記錄狀態碼與必要的請求識別碼，另驗證結構、型別、必填欄位與筆數。

### 10. 常見錯誤

401通常先查認證與權杖，403先查授權，404查路徑與資源可見性，429依服務規則與Retry-After處理，5xx評估暫時故障。這些是診斷起點，不是跨所有服務必然相同的原因。TLS錯誤要查憑證、主機與時間，不能關閉驗證。

### 11. 安全提醒

不把Bearer權杖貼到教材、日誌、命令歷史或Git。只對核准HTTPS主機傳認證，不把伺服器回傳的任意下一頁網址視為可攜帶認證的可信目標。重導向與分頁也需驗證目的地。

### 12. 相關指令

Invoke-WebRequest適合需更直接檢查網頁／HTTP回應的情境；ConvertTo-Json與ConvertFrom-Json處理資料契約。功能不同，不只以命令長短選擇。

### 13. 記憶技巧

「網址、方法、標頭、本文；狀態、結構、業務」逐層驗收。

### 14. 官方來源

Invoke-RestMethod的PowerShell7.6官方文件記錄參數組、回應處理與重試行為；JSON命令來源見本章末。

## 分頁、重試與最佳實踐

清單第一頁不代表全部資料。API可能用nextLink、游標或Link標頭；FollowRelLink處理的是適當的Link關聯，不會自動理解所有JSON內的分頁欄位。設計最大頁數、最大筆數、重複游標檢查與目的主機驗證；分頁失敗時不要把部分清單標成完整盤點。

重試前先判斷請求是否已在伺服器完成。POST逾時不代表沒有建立資料；盲目重送可能產生重複。使用服務支援的冪等鍵、查詢確認或補償流程，並限制重試次數與總時間。平行呼叫的ThrottleLimit不等於API配額控制，限流需另有速率與退避設計。

本機HTTP測試只能證明用戶端對控制回應的處理；不證明正式TLS、OAuth（開放授權）、租戶或權限可用。本章不提供停用TLS或未加密傳送認證的修正方案。

## 速查表

| 目的 | 方法 | 驗收 |
|---|---|---|
| 唯讀 | GET | 狀態與本文 |
| JSON本文 | ConvertTo-Json | 型別／編碼／深度 |
| 查詢值 | EscapeDataString | 不編碼整條URL |
| 分頁 | 依服務契約 | 限頁數與目的主機 |
| 重試 | 有限次數與冪等性 | 不盲目重送變更 |

## 練習題

1. URI與HTTP方法分別回答什麼？
2. HTTP200保證業務成功嗎？
3. GET是否保證輸出不含個資？
4. 雜湊表ToString能產生JSON嗎？
5. 如何明確建立JSON本文？
6. ContentType設成JSON會自動修正任何本文嗎？
7. 如何編碼查詢值中的&？
8. 應把整條URL都Escape嗎？
9. 合成資料count=0是缺值嗎？
10. 為何另外驗證必填欄位？
11. 204回應可以沒有本文嗎？
12. 401與403的診斷起點有何不同？
13. TLS失敗能用停用驗證通用修正嗎？
14. 第一頁清單等於完整盤點嗎？
15. FollowRelLink自動處理每種nextLink欄位嗎？
16. 為何限制最大頁數？
17. POST逾時後直接重送有何風險？
18. ThrottleLimit等於每秒API配額嗎？
19. 分頁網址換了主機時應怎麼做？
20. 本機HTTP測試能證明正式OAuth授權成功嗎？

## 參考答案與解題思路

1. URI指出目標；方法表示操作意圖，仍須查服務契約。
2. 不保證；本文與業務狀態需額外驗收。
3. 不保證；唯讀與資料機密性是不同問題。
4. 不能，通常只是型別描述。
5. 使用ConvertTo-Json並設定足夠Depth，再依契約提供內容型別與編碼。
6. 不會；標頭宣告與實際位元組都必須正確。
7. 對該查詢值使用Uri.EscapeDataString，&變成%26。
8. 不應；那會破壞URL結構，應只處理值。
9. 不是；零是合法非負整數，需區分null。
10. HTTP成功只回答傳輸層，可能仍缺少契約所需資料。
11. 可以；不能強迫每個成功回應都有JSON。
12. 401先查認證，403先查授權，但仍依服務文件診斷。
13. 不可；應查憑證、主機名稱、信任鏈與時間。
14. 不等於；需依分頁契約取完並記錄是否完整。
15. 不會；Link標頭與JSON欄位是不同機制。
16. 避免錯誤游標、循環或無上限資源使用；達上限需標明不完整。
17. 伺服器可能已完成，重送會重複建立；需查詢或冪等策略。
18. 不等於；同時數與時間內請求量不同。
19. 驗證核准目的主機與認證規則，不直接攜帶權杖。
20. 不能；只驗證受控回應與用戶端邏輯。

## 參考資料與延伸閱讀

- [Invoke-RestMethod](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Invoke-RestMethod.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [ConvertTo-Json](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertTo-Json.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [ConvertFrom-Json](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-Json.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。

## 驗證狀態

已完成教材使用段落的官方來源查讀；語法、實際測試、文件產出分層紀錄見[驗證紀錄](../../progress/VALIDATION.md)。企業登入、帳戶／權限與Windows管理未執行；合成資料不代表遠端整合成功。
