<a id="chapter-25"></a>

# 第 25 章：壓縮、備份與批次處理

[返回目錄](../README.md)

## 學習目標

使用 ZIP 整理一組合成資料，分辨壓縮成功與可還原備份，建立 SHA-256 清單並核對還原內容；理解隱藏檔、覆寫、路徑結構與批次錯誤的限制。

## 壓縮檔不等於完整備份

Archive（封存檔）把多個檔案放進同一容器，可選擇壓縮。Backup（備份）還需要可還原性、保存位置、版本、保留期限與權限等設計。ZIP 能打開，不代表所需檔案都在，也不代表 Windows ACL、替代資料串流、應用程式一致性或服務設定被完整保存。

本章只處理自製的一般小型文字檔。正式資料庫或正在寫入的資料需要應用程式支援的備份方法，不能一邊寫入一邊壓縮就宣稱一致性。此處也未驗證災難復原時間。

## Compress-Archive 與目錄結構

`-LiteralPath` 指定字面來源，`-DestinationPath` 指定 ZIP 檔。來源是整個目錄時，封存檔會包含該根目錄；來源使用 `目錄/*` 時通常只包含其內容。選擇會影響還原後的路徑，不能只看 ZIP 檔名判斷。

`-CompressionLevel` 可選 Optimal、Fastest、NoCompression。Fastest 著重壓縮耗時，不保證所有資料都更小；圖片或已壓縮格式往往沒有明顯收益。`-Update` 更新既有封存項目，不是與來源做完整鏡像同步，不能假設來源刪除的檔案會自動從 ZIP 消失。

官方文件提醒單一檔案的 2 GB 限制及隱藏項目略過行為；Linux/macOS 的點號開頭名稱也屬於受影響情況。不要把 Compress-Archive 視為完整家目錄備份工具。需要隱藏檔或其他備份屬性時，應選擇並驗證合適工具，而非只加 Force。

## 完整練習：建立、還原、核對、清理

可執行版本保存在 `examples/25/Invoke-LearningBackup.ps1`。它不接受正式路徑，所有寫入限於新建立的唯一暫存目錄。執行後回傳核對結果，再清理暫存資料；它是一個練習，不會留下可供長期保存的備份。

```powershell
$result = & './examples/25/Invoke-LearningBackup.ps1'
$result | Select-Object Success, FileCount, Algorithm
$result.Manifest | Format-Table Name, Hash
Test-Path -LiteralPath $result.LabPath
```

從儲存庫根目錄執行，預期 Success=True、FileCount=2、Algorithm=SHA256；最後是 False，表示本次練習目錄已清除。雜湊值依實際位元組計算，換行可能因平台而不同，不應照抄某一台機器的值當成全部平台的標準。

核心流程如下；這段是上面完整腳本內的片段，`$source`、`$zip`、`$restore` 均由完整腳本先建立在暫存範圍。

```powershell
$files = @(Get-ChildItem -LiteralPath $source -File)
$manifest = @($files | ForEach-Object {
    [pscustomobject]@{
        Name = $_.Name
        Hash = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
    }
})
Compress-Archive -LiteralPath $source -DestinationPath $zip -ErrorAction Stop
Expand-Archive -LiteralPath $zip -DestinationPath $restore -ErrorAction Stop
$restoredRoot = Join-Path $restore 'input'
foreach ($entry in $manifest) {
    $path = Join-Path $restoredRoot $entry.Name
    $actual = (Get-FileHash -LiteralPath $path -Algorithm SHA256 -ErrorAction Stop).Hash
    if ($actual -ne $entry.Hash) {
        throw "還原內容不符：$($entry.Name)"
    }
}
```

完整腳本另核對還原筆數。檔案缺少、雜湊不符或解壓失敗都會拋錯，不能繼續回報成功。本例只有一層兩個檔案；若擴充到子目錄，清單要保存相對路徑，不能只用 Name，否則不同目錄的同名檔會衝突。

## 雜湊證明的範圍

SHA-256（安全雜湊演算法 256 位元）可用來偵測內容變動。檔案重新命名不改變內容雜湊；附加一個字元通常就會改變雜湊。相同雜湊可作實務上的完整性核對，但雜湊不是加密，也不能單獨證明發布者身分。

如果攻擊者能同時替換檔案與雜湊清單，單純互相比對無法建立來源信任。正式交付還需可信來源、簽章或受保護清單。本章的清單在記憶體內保存，只驗證自製資料的往返。

## 批次處理：一筆結果對應一個目標

批次操作常有兩種政策：第一筆失敗就停止，或逐筆記錄結果後讓整體回報失敗。重要的是不能吞掉錯誤，並保留檔名、狀態與原因。下例只讀取固定清單中的合成路徑，不掃描整個磁碟。

```powershell
# $paths 應由呼叫端提供已核准的精確檔案清單
$results = foreach ($path in $paths) {
    try {
        $hash = Get-FileHash -LiteralPath $path -Algorithm SHA256 -ErrorAction Stop
        [pscustomobject]@{ Path=$path; Success=$true; Hash=$hash.Hash; Error=$null }
    } catch {
        [pscustomobject]@{ Path=$path; Success=$false; Hash=$null; Error=$_.Exception.Message }
    }
}
$failed = @($results | Where-Object { -not $_.Success })
if ($failed.Count -gt 0) {
    throw "有 $($failed.Count) 個檔案未完成核對"
}
```

這段呈現逐筆收集政策；正式程式還要拒絕未預期的空清單，避免什麼都沒做卻宣稱完成。若要保留報告，先寫入核准位置再回傳非零退出碼。錯誤訊息可能含路徑，分享前須檢查敏感資訊。

## 安全、常見錯誤與最佳實踐

Compress-Archive 與 Expand-Archive 支援 WhatIf；預覽不驗證磁碟空間、來源一致性或還原結果。正式還原先選新的空目錄，避免 `-Force` 覆蓋既有檔案。對不受信任 ZIP，要檢查來源、大小、項目數與解壓後容量；本章沒有執行外來壓縮檔，也不宣稱能處理所有路徑穿越或解壓炸彈。

常見錯誤包括把目的 ZIP 放入將被遞迴壓縮的來源目錄、把略過隱藏檔當成完整備份、還原後多一層根目錄卻找錯檔，以及只檢查程序沒報錯。最佳實踐是先界定資料範圍，保存可比對清單，在新位置還原，再核對內容與需要的中繼資料。

## 版本與平台限制

本章使用 PowerShell 7.6.8 隨附的 Microsoft.PowerShell.Archive。Linux 點號檔案略過行為有實測；Windows ACL、ADS、長路徑、符號連結、超過 2 GB 檔案與遠端儲存未實測。文件的限制與本輪觀察需分開理解。

## 速查表

| 需求 | 方法 | 限制 |
|---|---|---|
| 建立 ZIP | Compress-Archive -LiteralPath | 隱藏檔與大小限制 |
| 還原 ZIP | Expand-Archive -LiteralPath | 先用新的目的目錄 |
| 核對內容 | Get-FileHash -Algorithm SHA256 | 不證明身分或權限一致 |
| 保留路徑 | 相對路徑清單 | 子目錄不可只用 Name |
| 批次失敗 | 逐筆結果＋整體失敗 | 不使用空 catch 吞錯 |

## 練習題

1. ZIP 可打開就代表備份完整嗎？
2. 壓縮整個目錄與目錄下星號來源有何差異？
3. DestinationPath 是來源還是 ZIP 目的地？
4. Fastest 保證檔案最小嗎？
5. Update 是完整鏡像同步嗎？
6. Linux 點號檔案一定被 Compress-Archive 收錄嗎？
7. 官方文件提醒的單檔大小限制？
8. 完整練習會保存永久備份嗎？
9. 範例預期有幾個檔案？
10. 執行後 LabPath 應該存在嗎？
11. 為何核對還原檔數量？
12. 子目錄清單只保存 Name 會有何問題？
13. 檔案重新命名是否改變內容雜湊？
14. 雜湊是否等同加密？
15. 檔案與雜湊清單都被替換時能證明可信嗎？
16. 批次逐筆捕捉錯誤後還要做什麼？
17. 空清單為何需要明確處理？
18. WhatIf 能驗證還原內容嗎？
19. 為何目的 ZIP 不應放在遞迴來源內？
20. 提出一個能證明驗收會拒絕損壞資料的測試。

## 參考答案與解題思路

1. 不能，還需檔案完整性、可還原性及需要的權限等屬性。
2. 整個目錄通常保留根目錄；星號來源通常只包含其內容，需核對還原路徑。
3. ZIP 輸出目的地。
4. 不保證，Fastest 著重速度。
5. 不是，不能假設來源刪除的項目會從 ZIP 移除。
6. 不一定，一般目錄壓縮會略過隱藏項目，包含點號名稱。
7. 單一檔案 2 GB；本輪未以大型檔案壓力驗證。
8. 不會，所有合成資料在 finally 清理。
9. 兩個：臺灣.txt 與 counts.csv。
10. 不應存在；正常結束後本次唯一暫存目錄已刪除。
11. 避免漏檔或多出未預期檔案，不能只檢查 ZIP 存在。
12. 不同子目錄的同名檔會衝突，需相對路徑。
13. 不會，只要內容位元組相同。
14. 不是，雜湊是完整性比對用途，不是可解密的密文。
15. 不能，需要另外的可信來源或簽章。
16. 彙整失敗並讓整體流程回報失敗，保留可診斷原因。
17. 避免沒有處理任何檔案卻宣稱備份成功。
18. 不能，必須實際還原並比對。
19. 可能把輸出納入輸入或造成自我包含等錯誤，應分離來源與目的地。
20. 還原後修改一個檔案，再核對 SHA-256，預期不相等並阻止成功回報。

## 參考資料與延伸閱讀

- [Compress-Archive](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Archive/Compress-Archive.md) — Microsoft；7.6；查閱 2026-10-24；路徑結構、隱藏檔與大小限制。
- [Expand-Archive](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Archive/Expand-Archive.md) — 還原與覆寫。
- [Get-FileHash](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Utility/Get-FileHash.md) — SHA-256 完整性核對。

## 驗證狀態

ZIP 往返、來源／還原雜湊、故意修改、WhatIf、點號檔案略過與完整練習清理記於 [驗證紀錄](../../progress/VALIDATION.md)。未驗證生產備份、權限還原、外來 ZIP、大型資料或災難復原。
