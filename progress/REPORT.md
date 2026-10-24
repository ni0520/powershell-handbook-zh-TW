# PowerShell 教材製作報告 — v0.4

日期：2026-10-24（Asia/Taipei）。本輪接續新增第32–35章，與既有第31章完成五章整合；前35章均為初稿，未完成40章全書。

## 實際成果

35章原稿、700題練習與700題解答、54命令索引（25項十四節詳解／29項僅速查）、123技術來源、62術語與40參數，另有字型來源1筆。Start-Job章內教學納入索引；Get-FileHash由速查升級詳解，沒有重複計數。新增安全性、REST API、AD／Microsoft365、Azure／Exchange與80題解。

原稿共用產生Markdown、離線搜尋HTML、DOCX、A4與獨立105×185mm手機PDF、速查與來源。A4 PDF313頁、手機PDF582頁、速查PDF6頁；Word35章、50表格、5295段落，已通過結構與重新開啟檢查；13項交付檔由package_delivery.py核對ZIP CRC與每檔SHA-256。雜湊用於完整性，不冒稱發布者簽章。

## 分層驗證

PowerShell7.6.8／Debian13：239語法案例與章節／題解／JSON／連結檢查通過；Pester63案例中58通過、0失敗、5因Windows／ping能力不足跳過。44個明確允許的教材區塊實際執行通過；回送HTTP另有5項契約檢查，測試後關閉服務。這些層次可能重疊，不相加宣稱獨立功能覆蓋。

HTTP檢查包含200、必要欄位及零值、繁中UTF-8、404失敗處理、POST JSON與布林往返；不包含正式TLS、OAuth、企業服務或租戶授權。PSScriptAnalyzer對examples使用預設Warning／Error規則通過，未對全書所有片段宣稱靜態分析成功。建置程式碼保留回歸檢查通過。

先產生新章代表性A4／手機排版樣本並視覺檢查，再建置整合文件；修正Get-FileHash升級造成的新舊錨點重複並重新建置。HTML搜尋／錨點、Word結構與重新開啟、PDF字型／Unicode／書籤／空白頁檢查另見artifact-results.json。沒有逐頁人工驗收或桌面Word視覺檢查。

## 限制與接續

本環境未安裝或登入AD／Graph／Az／Exchange企業模組，未執行認證、同意、權限指派、正式排程或企業查詢；合成資料只驗證本機轉換。Windows5.1、Windows／macOS、企業整合、大資料效能與PesterCoverage未測。Exchange Identity擴大查詢風險已依官方文件標示，非空值檢查不足以保證目標正確，正式流程需驗收精確結果。

Pester5.7.1使用固定官方原始碼建置；.NET SDK依官方SHA-512核對。PSScriptAnalyzer1.25.0作者與時間戳驗證成功，但NU3018／NU3028線上撤銷查詢限制仍保留，未停用TLS或簽章。原有42斷言與測試執行器實作未改，沿用既有證據。完整方法見progress/BATCH31_35.md與VALIDATION.md。

第36–40章、500+命令索引、完整附錄與企業案例尚未完成。原稿、資料、測試與證據納入Git，大型交付文件在dist可重建；依持續授權提交合併GitHub，遠端結果需推送後另行核對。本產出前報告不預先宣稱遠端成功；未建立Release或部署網站。
