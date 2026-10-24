<a id="chapter-32"></a>

# 第 32 章：PowerShell 安全性

[返回目錄](../README.md)

## 學習目標

辨認執行原則、來源簽章、雜湊、身分與授權各自能證明什麼；把不可信輸入當資料處理，限制權限與輸出，避免把密碼寫進腳本或Git。本章不變更執行原則、不建立帳戶、不解除組織限制。

## 安全從信任鏈開始

安全問題先拆成四個問題：誰提供程式？檔案是否改過？誰執行？該身分能做什麼？SHA-256能核對位元組是否符合預期；如果檔案和雜湊都由同一個不可信來源提供，攻擊者可同時替換兩者。簽章則讓你檢查發布者與簽署後完整性，但有效簽章不等於程式沒有漏洞，也不代表組織已核准執行。

下載腳本後應先查來源、版本與簽章政策，再閱讀影響範圍，在隔離測試資料驗證。不要把下載內容直接接到 Invoke-Expression。輸入中的PowerShell語法不應被當程式執行；優先使用具型別的參數、白名單與命令的正式參數繫結。

## 執行原則與平台

Execution Policy（執行原則）是減少誤執行的防護措施，不是完整安全邊界。Windows可有MachinePolicy、UserPolicy、Process、CurrentUser、LocalMachine等範圍，群組原則優先；查詢結果要包含有效值與各範圍，不直接修改最寬的範圍。

```powershell
Get-ExecutionPolicy
Get-ExecutionPolicy -List
$ExecutionContext.SessionState.LanguageMode
```

Linux／macOS的Get-ExecutionPolicy通常回傳Unrestricted，官方說明其實際行為因沒有Windows安全區域而接近Bypass；Set-ExecutionPolicy在非Windows不受支援。不能以此推論Windows上的原則不起作用。本章只查詢，不示範降低原則或解除封鎖。

Language Mode（語言模式）控制可使用的語言功能；ConstrainedLanguage（受限語言）常與應用程式控制政策一起使用。自行在互動工作階段設定某個模式，不等於建立不可逃離的組織安全邊界。需要受限管理端點時應由管理者設計JEA等架構，並依角色與命令清單驗證。

<a id="get-filehash"></a>

## 主要指令教學

### 1. 名稱

Get-FileHash（取得檔案雜湊），Microsoft.PowerShell.Utility。

### 2. 重要程度

必學；下載工具與交付成果的完整性驗收基礎。

### 3. 功能

依指定演算法計算檔案或串流的雜湊。本章固定SHA256，不使用已不適合抵抗攻擊的MD5／SHA1作信任驗證。

### 4. 使用情境

核對官方提供的預期雜湊，或比較備份還原前後內容。雜湊相同不是來源身分證明。

### 5. 英文拆解

File是檔案，Hash是將內容映成固定長度摘要；記成「比內容，不比檔名」。

### 6. 語法

本章形式為Get-FileHash -LiteralPath 檔案 -Algorithm SHA256；另有Path與InputStream參數組，完整語法以官方文件及Get-Command為準。

### 7. 主要參數

| 參數 | 意義 | 注意 |
|---|---|---|
| -LiteralPath | 精確檔案路徑 | 中括號不當萬用字元 |
| -Algorithm | 雜湊演算法 | 比對雙方必須相同 |
| -InputStream | 已開啟的串流 | 呼叫者負責正確位置與釋放 |

### 8. 五類範例

以下五步在同一區塊中使用自建暫存目錄，最後只刪除此目錄；不讀取使用者秘密。示範的預期值由本機原始檔產生，**只證明複製一致性**，不是官方發布者驗證。

```powershell
$root = Join-Path ([IO.Path]::GetTempPath()) ('ps-security-' + [guid]::NewGuid())
try {
    $null = New-Item -ItemType Directory -Path $root
    $source = Join-Path $root '原稿[1].txt'
    $copy = Join-Path $root 'copy.txt'
    Set-Content -LiteralPath $source -Value '教材驗收' -Encoding utf8 -NoNewline
    # 基本：計算單一檔案
    $expected = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash
    # 參數化：使用精確路徑；不讓中括號變成萬用字元
    $observed = Get-FileHash -LiteralPath $source -Algorithm SHA256
    # 實務：驗收複本
    Copy-Item -LiteralPath $source -Destination $copy
    $copyMatches = (Get-FileHash -LiteralPath $copy -Algorithm SHA256).Hash -eq $expected
    # 錯誤假設與修正：同檔名不代表內容未變，修改後必須重新核對
    Add-Content -LiteralPath $copy -Value '已修改' -Encoding utf8
    $changedMatches = (Get-FileHash -LiteralPath $copy -Algorithm SHA256).Hash -eq $expected
    # 進階：先驗證預期摘要格式，再比對內容
    if ($expected -notmatch '^[0-9A-Fa-f]{64}$') { throw '預期SHA256格式不符' }
    [pscustomobject]@{ Algorithm=$observed.Algorithm; CopyMatches=$copyMatches; ChangedMatches=$changedMatches }
} finally {
    if (Test-Path -LiteralPath $root) { Remove-Item -LiteralPath $root -Recurse -Force }
}
```

### 9. 輸出判讀

預期Algorithm=SHA256、CopyMatches=True、ChangedMatches=False。文字編碼、換行與BOM都會改變位元組；不能只看畫面文字相同就預期雜湊一致。

### 10. 常見錯誤

檔案不存在或權限不足應回報失敗，不將空Hash當成功。預期雜湊必須來自適當的獨立可信管道；不要只在不一致時重新產生預期值來「修正」錯誤。

### 11. 安全提醒

雜湊不加密資料，不能拿來隱藏密碼。一般SHA256檔案摘要也不是適當的密碼儲存方案；密碼儲存需要專門的加鹽、成本可調演算法與身分系統。

### 12. 相關指令

Get-AuthenticodeSignature用於支援平台的簽章檢查；Get-Content與Get-Item提供不同層次資訊。本章沒有在Linux冒稱已完成Windows Authenticode驗證。

### 13. 記憶技巧

「摘要看內容，簽章查來源，授權管行為。」三者不能互相替代。

### 14. 官方來源

Get-FileHash與執行原則、語言模式、SecureString的Microsoft文件見本章末來源。

## 秘密與記錄

SecureString（安全字串）不是把硬編碼密碼變安全的魔法。明文出現在原稿、歷史或命令列後再轉型，原始暴露已發生；官方文件也指出非Windows的SecureString內容沒有同樣的記憶體加密保障。正式秘密應由組織核准的保管庫或執行身分取得，輸出、錯誤及HTTP標頭都要避免洩漏Token（權杖）。

Transcript（轉錄）與詳細日誌可能包含個資、路徑、引數及服務回應。記錄必要的識別碼、時間、狀態與錯誤類型，設定存取權、保留期限與刪除流程；不把「多記錄」視為永遠較安全。若秘密誤入Git，先撤銷或輪替，單純刪除最新檔案不會移除歷史暴露。

## 輸入驗證、最小權限與最佳實踐

以下只接受固定報表名稱，不對文字求值，也不依輸入自由組合路徑。這是業務白名單，不是任意檔案路徑的完整防護方案。

```powershell
function Get-LearningReportName {
    param([ValidateSet('Daily','Weekly')][string]$Period)
    'report-{0}.csv' -f $Period.ToLowerInvariant()
}
Get-LearningReportName -Period Daily
```

預期report-daily.csv。正式流程再以固定輸出根目錄組合路徑、檢查實際目的地與存取權；處理符號連結等情況需要額外設計。最小權限指執行身分只擁有所需權限；WhatIf只是命令支援的模擬機制，不是帳戶權限隔離或惡意腳本分析器。

## 速查表

| 問題 | 方法 | 限制 |
|---|---|---|
| 內容是否相同 | SHA256與可信預期值 | 不直接證明發布者 |
| 執行原則 | Get-ExecutionPolicy -List | Windows行為不可套用到Linux |
| 語言模式 | SessionState.LanguageMode | 模式值不等於完整隔離 |
| 不可信輸入 | 正式參數、白名單 | 避免文字求值 |
| 秘密暴露 | 撤銷／輪替並檢查影響 | 刪檔不清除歷史 |

## 練習題

1. 雜湊相同能證明發布者身分嗎？
2. 簽章有效就代表無漏洞嗎？
3. Execution Policy是完整安全邊界嗎？
4. 本章有修改執行原則嗎？
5. Linux的Unrestricted能直接代表Windows狀態嗎？
6. 如何查所有執行原則範圍？
7. 什麼是Language Mode？
8. SHA256是否加密原檔？
9. 為何使用LiteralPath？
10. 編碼與BOM是否影響雜湊？
11. 基本範例的CopyMatches預期值？
12. 修改複本後ChangedMatches預期值？
13. 預期SHA256的十六進位長度？
14. 檔案和摘要都來自陌生網站有何限制？
15. SecureString能移除已提交的明文密碼嗎？
16. 日誌可能有哪些敏感資料？
17. ValidateSet的用途？
18. 為何不把輸入接到Invoke-Expression？
19. WhatIf等於最小權限嗎？
20. Token誤入Git時第一步是什麼？

## 參考答案與解題思路

1. 不能；它核對內容，發布者需另驗來源或簽章。
2. 不代表；仍需審查、核准與修補管理。
3. 不是；它主要減少誤執行，不能取代權限與應用程式控制。
4. 沒有，只做唯讀查詢，保留目前政策。
5. 不能；非Windows缺Windows安全區域機制。
6. Get-ExecutionPolicy -List，並檢查有效值與群組原則。
7. 可使用語言功能的模式；需要結合實際安全政策理解。
8. 否；摘要無法保護原始資料的機密性。
9. 精確處理中括號等字元，避免誤當萬用字元。
10. 會；雜湊針對位元組，不只畫面文字。
11. True；本例複製後位元組一致。
12. False；變更後內容與原始預期值不同。
13. 64字元；格式正確仍不代表來源可信。
14. 攻擊者可能同時替換兩者，沒有獨立可信基準。
15. 不能；應撤銷或輪替，並處理歷史暴露。
16. 引數、路徑、個資、權杖與服務回應；只記必要資料並管控存取。
17. 限制可接受值；本例只接受Daily或Weekly。
18. 會把資料當程式執行；應以正式參數繫結處理。
19. 不等於；模擬與身分授權是不同機制。
20. 先撤銷或輪替，再調查使用與暴露範圍；只刪檔不足。

## 參考資料與延伸閱讀

- [about_Execution_Policies](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Execution_Policies.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [about_Language_Modes](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Language_Modes.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [ConvertTo-SecureString](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Security/ConvertTo-SecureString.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。
- [Get-FileHash](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-FileHash.md) — Microsoft；固定快照；查閱2026-10-24；適用與限制見本章。

## 驗證狀態

已完成教材使用段落的官方來源查讀；語法、實際測試、文件產出分層紀錄見[驗證紀錄](../../progress/VALIDATION.md)。企業登入、帳戶／權限與Windows管理未執行；合成資料不代表遠端整合成功。
