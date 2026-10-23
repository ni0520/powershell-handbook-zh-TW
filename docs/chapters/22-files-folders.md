<a id="chapter-22"></a>

# 第 22 章：檔案、資料夾與文字編碼

[返回目錄](../README.md)

## 學習目標

在明確限定的資料夾建立、讀取、複製、重新命名與清理檔案；辨別路徑萬用字元與字面路徑；用明確編碼保存繁體中文，並驗證實際內容。

## 先建立自己的練習範圍

PowerShell 的 Provider（提供者）讓相似命令能操作檔案、變數或 Registry（登錄）。本章只操作 FileSystem（檔案系統），不能把檔案範例直接套在其他提供者。`Join-Path` 按提供者規則組合路徑，並不自動建立資料夾，也不保證使用者提供的子路徑安全。

以下整段可在 PowerShell 7 執行；唯一 GUID（全域唯一識別碼）資料夾避免覆寫既有檔案。`finally` 僅清理這次建立的目錄。請不要把 `$lab` 改成文件目錄、磁碟根目錄或正式備份路徑。

```powershell
$lab = Join-Path ([IO.Path]::GetTempPath()) ('ps-files-' + [guid]::NewGuid())
try {
    New-Item -ItemType Directory -Path $lab -ErrorAction Stop | Out-Null
    $source = Join-Path $lab '報表[1].txt'
    Set-Content -LiteralPath $source -Value '第一列','第二列' -Encoding utf8NoBOM
    Add-Content -LiteralPath $source -Value '第三列' -Encoding utf8NoBOM
    $lines = @(Get-Content -LiteralPath $source -Encoding utf8)
    $lines.Count
    Test-Path -LiteralPath $source -PathType Leaf
    Get-Item -LiteralPath $source | Select-Object Name, Length
    $copy = Join-Path $lab '複本.txt'
    Copy-Item -LiteralPath $source -Destination $copy -ErrorAction Stop
    Rename-Item -LiteralPath $copy -NewName '已核對.txt' -ErrorAction Stop
    $renamed = Join-Path $lab '已核對.txt'
    Remove-Item -LiteralPath $renamed -WhatIf
    Test-Path -LiteralPath $renamed
} finally {
    if (Test-Path -LiteralPath $lab) {
        Remove-Item -LiteralPath $lab -Recurse -Force -ErrorAction Stop
    }
}
```

行數應是 3，兩個存在性檢查都是 True；`-WhatIf` 不刪除複本，但 `finally` 結束時確實刪除整個練習目錄。`Length` 是位元組數，不是中文字數，還會受換行序列影響，不應把某個固定位元組數寫成跨平台答案。

## Path、LiteralPath 與存在性

檔名 `報表[1].txt` 中的中括號，在接受萬用字元的 `-Path` 參數可能被解讀為比對模式。`-LiteralPath` 按字面解讀，不把中括號當萬用字元。引號處理 PowerShell 字串，不會讓接受萬用字元的命令自動變成字面路徑。

`Test-Path -PathType Leaf` 用於檔案等終端項目，`Container` 用於資料夾等容器。存在性檢查只是當下觀察；檢查後檔案仍可能被刪除或鎖定，因此實際操作仍需 `-ErrorAction Stop` 與錯誤處理。`New-Item` 沒有可照抄的 `-LiteralPath`，先用 Get-Command 查支援參數。

## 讀取行、全文與二進位資料

```powershell
# 唯讀；請先指定自己可讀的文字檔案
$path = './README.md'
$lines = @(Get-Content -LiteralPath $path -Encoding utf8)
$text = Get-Content -LiteralPath $path -Raw -Encoding utf8
[pscustomobject]@{
    LineCount = $lines.Count
    TextType = $text.GetType().Name
    Characters = $text.Length
}
```

一般讀取逐行回傳字串；`-Raw` 回傳包含換行的單一字串，適合交給 JSON 解析器。大檔案不宜一律 `-Raw`，因為會一次載入全文。空檔案與單行檔案要另外測，不要假設每次都有多個輸出。二進位檔可用 PowerShell 7 的 `-AsByteStream`，不能以文字解碼再寫回來當成無損複製。

## Encoding（字元編碼）要在讀寫兩端一致

PowerShell 7 的一般文字輸出預設 UTF-8 無 BOM（位元組順序標記），本章仍明確使用 `utf8NoBOM`。Windows PowerShell 5.1 的 `Out-File` 預設 UTF-16LE，`Set-Content` 新檔預設依系統 ANSI 字碼頁，`Export-Csv` 預設 ASCII；不能只說「舊版全都是 UTF-16」。5.1 的 `-Encoding UTF8` 會寫入 BOM，且沒有 `utf8NoBOM` 這個值。

如果要讓 Windows 5.1 執行含繁體中文的 `.ps1`，需另外確認檔案編碼，通常使用 UTF-8 BOM。這和資料檔要交換的編碼需求是兩件事。`$OutputEncoding` 主要涉及與原生命令互通，不是改變所有讀寫命令編碼的總開關。

`Set-Content` 取代內容；`Add-Content` 附加內容。附加前應確認既有編碼，不能把 UTF-8 直接接到 UTF-16 檔案尾端。`-NoNewline` 控制是否附加換行，不是壓縮或清除所有既有換行。不要用 `Format-Table | Set-Content` 保存可再處理的原始物件。

## 移動、重新命名與刪除

`Copy-Item` 保留來源；`Move-Item` 成功後來源位置不再有原項目。`Rename-Item -NewName` 接受新名稱，不能用它跨目錄搬移。目的地若已存在，命令的行為可能不同，尤其「目的地是一個資料夾」和「目的地是一個檔案」必須分清楚。

`-Force` 不等於系統管理員權限，也不會使被鎖定或拒絕存取的檔案必然成功。`Remove-Item` 直接刪除，不應假設一定進資源回收筒。先列出精確目標、使用支援的 `-WhatIf`，核對後才在核准範圍執行。

本章使用自己建立的普通暫存資料夾，不處理不受信任的符號連結（Symbolic Link）、Junction 或任意上傳路徑。字串前綴比對不是可靠的路徑安全邊界；正式檔案服務需要另外處理正規化、連結與競態條件。

## 常見錯誤與最佳實踐

找不到有中括號的檔名時，先確認 LiteralPath；中文亂碼先查原始位元組與編碼，重存之前保留原檔；Access denied（拒絕存取）應查權限與鎖定，不要反覆加 Force。相對路徑取決於目前位置；腳本內建資源應以 `$PSScriptRoot` 定位。

## 速查表

| 需求 | 命令／參數 | 注意 |
|---|---|---|
| 組合路徑 | Join-Path | 不建立項目 |
| 確認檔案 | Test-Path -PathType Leaf | 不保證下一步成功 |
| 讀全文 | Get-Content -Raw | 評估記憶體 |
| 取代／附加 | Set-Content／Add-Content | 明確指定編碼 |
| 安全預覽 | Remove-Item -WhatIf | 預覽不等於備份 |

## 練習題

1. 為何使用 GUID 命名練習資料夾？
2. Join-Path 會建立資料夾嗎？
3. 本章限制在哪個提供者？
4. 為何引號不等於 LiteralPath？
5. PathType Leaf 與 Container 差異？
6. Test-Path 成功後為何仍需錯誤處理？
7. 主範例有幾行文字？
8. Length 是字元數嗎？
9. Remove-Item -WhatIf 後複本還存在嗎？
10. finally 執行後練習目錄還存在嗎？
11. Get-Content -Raw 回傳哪類資料？
12. 為何大檔案不宜一律 Raw？
13. 二進位檔應用文字編碼讀寫嗎？
14. 5.1 的 Set-Content 新檔預設一定是 UTF-16 嗎？
15. 5.1 的 UTF8 與 7 的 utf8NoBOM 差異？
16. Set-Content 與 Add-Content 差異？
17. Rename-Item 能跨資料夾搬檔嗎？
18. Force 會提升權限嗎？
19. Remove-Item 一定進資源回收筒嗎？
20. 寫出一個防止中文資料損壞的驗收條件。

## 參考答案與解題思路

1. 降低與既有資料衝突的機會，限定清理範圍。
2. 不會，只組合路徑字串。
3. FileSystem；其他提供者有自己的行為與風險。
4. 引號處理字串，LiteralPath 才指定不解析萬用字元。
5. Leaf 檢查終端項目，Container 檢查容器。
6. 檔案可能在兩步之間改變，權限與鎖定也可能造成操作失敗。
7. 三行；Set-Content 寫兩行，Add-Content 再加一行。
8. 不是，是位元組數；中文字與換行會影響大小。
9. 存在，WhatIf 沒有真正刪除。
10. 不存在，finally 實際清理本次建立的目錄。
11. 包含換行的單一字串；空檔等邊界需另測。
12. 會一次將全文載入記憶體。
13. 不應；用位元組 API 或直接複製，避免解碼造成改變。
14. 不是，新檔使用系統 ANSI 字碼頁；Out-File 預設才是 UTF-16LE。
15. 5.1 的 UTF8 寫 BOM；7 的 utf8NoBOM 不寫 BOM。
16. 前者取代，後者附加；兩者都要考慮編碼與換行。
17. 不能，使用 Move-Item 並核對目的地。
18. 不會，不是權限提升機制。
19. 不一定，不能依賴資源回收筒救回。
20. 用明確 UTF-8 寫入「臺灣」，再以 UTF-8 讀回，斷言字串完全一致；另檢查 BOM 是否符合交換規格。

## 參考資料與延伸閱讀

- [Get-Content](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Get-Content.md) — Microsoft；7.6；查閱 2026-10-24；行與全文讀取。
- [about_Character_Encoding](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Character_Encoding.md) — 版本預設值。
- [Remove-Item](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Remove-Item.md) — 刪除範圍與參數；其餘命令來源見總來源清單。

## 驗證狀態

本機 Linux 的中括號檔名、UTF-8、複製、重新命名、移動、WhatIf 與清理案例記於 [驗證紀錄](../../progress/VALIDATION.md)。Windows ACL、鎖定、網路磁碟、符號連結與 5.1 未實測。
