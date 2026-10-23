<a id="chapter-24"></a>

# 第 24 章：CSV、JSON、XML 與資料交換

[返回目錄](../README.md)

## 學習目標

依資料形狀選擇交換格式，保留繁體中文與特殊字元；驗證匯入後的欄位及型別；處理 JSON 深度、單元素陣列與 XML 命名空間，不把轉換成功誤當成資料完全正確。

## 格式選擇取決於資料形狀

CSV（逗號分隔值）適合固定欄位的平面表格；JSON（JavaScript 物件表示法）適合巢狀物件與陣列；XML（可延伸標記語言）適合具有元素、屬性與命名空間的文件。這些格式都不是 PowerShell 活物件的完整備份，方法及原始 .NET 型別不會原封不動保留。

欄位名稱、必填值、允許的範圍、編碼與時間格式構成 Schema（結構規格）。即使剖析器接受檔案，缺欄位、重複識別碼或負數數量仍可能違反業務規則。

## CSV：用物件匯出，避免手工組逗號

以下範例只建立並清理自己的暫存資料夾。欄位包含逗號、引號與換行，交給 CSV 命令正確引用；不要使用 `-join ','` 自製序列化。

```powershell
$lab = Join-Path ([IO.Path]::GetTempPath()) ('ps-data-' + [guid]::NewGuid())
try {
    New-Item -ItemType Directory -Path $lab -ErrorAction Stop | Out-Null
    $file = Join-Path $lab 'inventory.csv'
    $rows = @(
        [pscustomobject]@{
            Name = '臺北,一組'
            Note = ('引號"測試' + "`n" + '換行')
            Count = 12
        }
    )
    $rows | Select-Object Name, Note, Count |
        Export-Csv -LiteralPath $file -NoTypeInformation -Encoding utf8BOM
    $read = @(Import-Csv -LiteralPath $file -Encoding utf8)
    $read[0].Name
    $read[0].Count.GetType().Name
    [int]$read[0].Count + 1
} finally {
    if (Test-Path -LiteralPath $lab) {
        Remove-Item -LiteralPath $lab -Recurse -Force
    }
}
```

輸出依序為 `臺北,一組`、String、13。CSV 讀回的 Count 是字串；直接加另一個字串可能變成串接，必須驗證後轉型。此處用 UTF-8 BOM 協助某些試算表工具識別中文，但仍需確認接收端版本；不能保證所有軟體都自動辨識。

`-Delimiter ';'` 明確指定分隔符號；匯出與匯入需一致。`-UseCulture` 使用目前文化設定的清單分隔符號，跨機器交換時可能不同。`-NoTypeInformation` 在 PowerShell 6 以後通常是預設行為，保留寫法可表達意圖並照顧舊版閱讀者。

切勿先 `Format-Table` 再 `Export-Csv`，格式化物件的欄位不是原資料。CSV 附加也要確認欄位相容，不能用 Force 掩蓋結構錯誤。匯出供試算表開啟的不受信任文字時，還要處理公式注入風險；CSV 正確引用不等於試算表一定把 `=...` 視為純文字，本章只使用自製資料。

## JSON：深度與陣列形狀都要驗收

```powershell
$source = [pscustomobject]@{
    Name = '臺灣'
    Config = @{ Labels = @{ Primary = '學習' } }
}
$json = $source | ConvertTo-Json -Depth 5 -WarningAction Stop
$restored = $json | ConvertFrom-Json -ErrorAction Stop
$restored.Config.Labels.Primary
'[1]' | ConvertFrom-Json -NoEnumerate | ConvertTo-Json -Compress
```

輸出是「學習」與 `[1]`。`ConvertTo-Json` 預設深度是 2，巢狀資料應依結構設定足夠深度並驗證葉節點；7.1 起超過深度會發出警告。本章使用 WarningAction Stop，讓警告成為不可忽略的失敗。不要把深度固定設成最大值就當作資料設計已完成。

`-Compress` 只縮減空白，不增加深度，也不是 ZIP 壓縮。`-NoEnumerate` 保持從 JSON 讀回的陣列作為單一輸出物件，對只有一個元素的陣列尤其重要。空陣列 `[]`、空物件 `{}`、null 和空字串不是同一種值。

```powershell
$map = '{"key":1,"Key":2}' | ConvertFrom-Json -AsHashtable
$map['key']
$map['Key']
$event = '{"time":"2026-01-01T00:00:00Z"}' |
    ConvertFrom-Json -DateKind String
$event.time.GetType().Name
```

前兩個值為 1、2；最後是 String。AsHashtable 在 6.0 加入，7.3 起回傳保留順序的 OrderedHashtable，可處理只差大小寫的鍵。但完全重複的同名鍵仍只保留最後值，不能把轉換結果當作「沒有重複鍵」的證明。DateKind 在 7.5 加入，String 選項避免自動把時間欄位轉為日期物件；舊版不能直接使用。

讀 JSON 檔案時使用 `Get-Content -Raw -Encoding utf8` 再剖析，避免將每行當成獨立 JSON 文件。輸入來源不可信時，限制檔案大小與深度，再檢查欄位；不要把剖析後的字串交給 Invoke-Expression。

## XML：預設命名空間也需要查詢前綴

```powershell
[xml]$document = '<inventory xmlns="urn:learning"><item code="A">臺灣</item></inventory>'
$nodes = @(Select-Xml -Xml $document -XPath '//i:item' -Namespace @{i='urn:learning'})
$nodes.Count
$nodes[0].Node.InnerText
$nodes[0].Node.GetAttribute('code')
```

結果是 1、臺灣、A。文件中的預設 Namespace（命名空間）仍有 URI；XPath（XML 路徑語言）需要在查詢中配置前綴。`i` 是查詢自行選定的前綴，不必與來源的字面前綴相同，URI 必須一致。不帶前綴的 `//item` 在此找不到命名空間內的元素。

Select-Xml 回傳的是包含 Node 的結果物件。需要文字時讀 InnerText，InnerXml 則包含內部 XML 標記，不能互換使用。對大型 XML，整份載入記憶體可能不合適，應評估串流讀取。

## 明確禁止外部實體與 DTD

前例是固定可信字串；讀取外部 XML 時可明確配置 XmlReader，禁止 DTD（文件型別定義）並停用外部資源解析。

```powershell
$settings = [Xml.XmlReaderSettings]::new()
$settings.DtdProcessing = [Xml.DtdProcessing]::Prohibit
$settings.XmlResolver = $null
$settings.MaxCharactersInDocument = 1000000
$inputText = '<inventory><item>學習</item></inventory>'
$reader = [Xml.XmlReader]::Create([IO.StringReader]::new($inputText), $settings)
try {
    $document = [Xml.XmlDocument]::new()
    $document.XmlResolver = $null
    $document.Load($reader)
    $document.DocumentElement.Name
} finally {
    $reader.Dispose()
}
```

輸出 inventory。長度上限是此教學的示範政策，正式流程應依資料量決定，並限制接收檔案大小。禁止 DTD 的測試會拒絕帶有實體宣告的文件，沒有為了測試去存取遠端網址或讀取系統檔案。

## 常見錯誤、版本與最佳實踐

匯入成功後至少核對筆數、必要欄位、識別碼唯一性、數值範圍與繁中內容。輸出先寫到新檔，重新讀回驗收，再依需求決定替換正式檔案。不要對所有解析錯誤使用空 catch，否則失敗資料容易被誤當空集合。

範例以 7.6.8 為基準，Windows 5.1 的編碼、JSON 參數與底層 .NET 不同；本輪未測 Excel／Word 桌面或外部資料交換端。XML 安全設定範例是限制輸入功能，不是完整的 Schema 驗證器。

## 速查表

| 需求 | 方法 | 驗收重點 |
|---|---|---|
| 表格檔案 | Export-Csv／Import-Csv | 欄位、分隔符號、字串轉型 |
| 巢狀物件 | ConvertTo-Json -Depth | 葉節點不被截斷 |
| 單元素陣列 | ConvertFrom-Json -NoEnumerate | 保留陣列形狀 |
| 特殊 JSON 鍵 | -AsHashtable | 同名重複鍵仍會遺失 |
| XML 查詢 | Select-Xml -Namespace | 前綴對應 URI |

## 練習題

1. 平面表格與巢狀資料分別適合哪種格式？
2. 為何不使用 join 逗號自己產生 CSV？
3. CSV 範例讀回的 Count 是什麼型別？
4. 如何將 Count 加一得到數值 13？
5. 為何先 Select-Object 而不先 Format-Table？
6. 匯入與匯出的 Delimiter 不同會怎樣？
7. UseCulture 是否保證跨機器分隔符號一致？
8. CSV 引用正確是否消除公式注入風險？
9. ConvertTo-Json 預設 Depth 是多少？
10. 深度不足的警告如何讓流程停止？
11. Compress 會修正 JSON 深度不足嗎？
12. NoEnumerate 對單元素陣列有何作用？
13. 空陣列與空物件相同嗎？
14. AsHashtable 能保留完全重複的同名鍵嗎？
15. DateKind String 的用途與加入版本？
16. 讀 JSON 檔為何使用 Raw？
17. XML 預設命名空間可以省略 XPath 前綴嗎？
18. InnerText 與 InnerXml 的差異？
19. 禁止 DTD 與 XmlResolver=null 的目的？
20. 剖析成功後至少提出三項資料驗收。

## 參考答案與解題思路

1. 平面固定欄位常用 CSV，巢狀物件與陣列常用 JSON；已有 XML 規格時遵循該規格。
2. 欄位中的逗號、引號與換行需要正確引用及跳脫。
3. String；CSV 本身不保留原始數字型別。
4. 先驗證再轉為 int，接著做數值加法。
5. Select-Object 選原始欄位；Format-Table 產生顯示用物件。
6. 欄位可能被錯誤切分，需遵循一致交換規格。
7. 不保證，它取決於目前文化設定。
8. 沒有，接收端可能仍把特定文字解讀成公式。
9. 2；應依實際結構設定並驗證。
10. 使用 WarningAction Stop，並保留錯誤回報。
11. 不會，只移除多餘空白。
12. 保持陣列以單一物件回傳，往返可維持 `[1]`。
13. 不相同，分別是序列與鍵值物件。
14. 不能，完全同名鍵仍只保留最後值。
15. 保留時間欄位原字串，PowerShell 7.5 加入。
16. 將多行檔案當成一份完整 JSON 文件。
17. 不行，查詢仍需將前綴對應到該命名空間 URI。
18. 前者取文字，後者包含內部 XML 標記。
19. 拒絕 DTD 並阻止解析器存取外部資源；仍需限制輸入大小與檢查結構。
20. 例如筆數、必要欄位、識別碼唯一性、數值範圍及繁中往返一致。

## 參考資料與延伸閱讀

- [Export-Csv](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Export-Csv.md) — Microsoft；7.6；查閱 2026-10-24；物件與編碼。
- [ConvertTo-Json](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertTo-Json.md) — 深度與版本。
- [ConvertFrom-Json](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/ConvertFrom-Json.md) — 陣列、鍵與日期。
- [Select-Xml](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Select-Xml.md) — XPath 命名空間。

- [XmlReaderSettings 安全設定](https://github.com/dotnet/dotnet-api-docs/blob/4f16f542b89a2759c5fb8e569f91d010cc671a6f/xml/System.Xml/XmlReaderSettings.xml) — Microsoft / .NET；查閱 2026-10-24。

## 驗證狀態

CSV 特殊字元、JSON 深度／陣列／重複鍵／無效語法、XML 命名空間與 DTD 拒絕案例記於 [驗證紀錄](../../progress/VALIDATION.md)。大型文件、外部資料來源及桌面軟體相容性未實測。
