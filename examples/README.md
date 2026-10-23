# 安全範例

- `10/Get-LearningReport.ps1`：合成檔案清單，篩選與排序，不讀真實檔案。
- `15/Get-LearningTotal.ps1`：帶參數與範圍驗證的整數總額範例。
- `17/LearningFunctions.psm1`：管線接收、記憶體 ShouldProcess、詳細訊息分流。
- `25/Invoke-LearningBackup.ps1`：兩個合成小檔案的 ZIP／還原／雜湊核對，結束清理自己的唯一暫存目錄，不接受正式資料路徑。

章節中的其餘程式碼仍保留於 Markdown。全部程式碼區塊執行語法解析；代表性功能另由 tests/Test-Examples.ps1 與 Pester 實測，兩種驗證不混同。

範例以 7.6.8 為實測基準；前幾章範例使用 ASCII；第 25 章含繁中資料並採 UTF-8 BOM，以符合靜態分析的跨版本編碼提醒，但不因此宣稱 Windows 5.1 已實測。主稿中的中文程式碼若另存給 5.1，需注意 UTF-8 BOM。
