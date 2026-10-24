# 第31–35章整合驗證 — v0.4

日期：2026-10-24（Asia/Taipei）。本輪接續新增第32–35章，與既有第31章完成五章整合；全書前35章仍為初稿。

## 實際完成

新增安全性、REST API、AD／Microsoft 365、Azure／Exchange四章及80題練習與80題解答。累計35章、700題解、54個命令索引（25個十四項教學、29個僅速查）、62術語、40參數、123筆技術來源，另有字型來源1筆。

Start-Job章內教學納入正式索引；Get-FileHash由速查升級詳解，未重複計數。其餘新增Invoke-RestMethod、Get-ADUser、Get-AzResource詳解。企業模組未安裝，命令中繼資料保留Available=false；文件快照不代表已安裝或測過該版本。

## 分層證據

| 檢查 | 結果 | 證據與限制 |
|---|---|---|
| 文件查證 | 通過使用範圍 | data/sources.json固定commit與SHA256；只查讀教材使用段落 |
| 語法／結構／連結 | 通過 | 239案例、35章／700題解、JSON唯一ID及教學14節；syntax-results.json |
| Pester | 通過並保留跳過 | 63案例中58通過、0失敗、5平台能力跳過；pester-results.json |
| 教材區塊實際執行 | 通過 | 44個明確允許區塊；document-execution-results.json；不自動執行企業範本 |
| HTTP回應契約 | 通過 | verify_rest_http.py，5項檢查；rest-http-results.json；暫時回送HTTP服務、無憑證、無外部目的地，完成後關閉 |
| 靜態分析 | 通過限定範圍 | PSScriptAnalyzer對examples預設Warning／Error規則；非全書片段，static-analysis-results.json |
| 排版樣本 | 通過代表頁 | 新章代表性A4與手機樣本已視覺檢查；未逐頁人工驗收 |
| HTML／Word／PDF | 通過 | artifact-results.json；Word只做結構與重新開啟，未用桌面Word逐頁驗收 |
| 企業／跨平台整合 | 未執行 | 無Windows、AD、Graph、Azure、Exchange環境與帳戶；不發起登入／同意／權限指派 |

HTTP測試涵蓋200狀態、必要欄位與零值、UTF-8、404拒絕、POST JSON與布林往返。回送HTTP不是正式TLS、OAuth或企業授權的替代證據。新增6項Pester測試涵蓋雜湊變更、查詢值編碼、JSON型別、合成AD資料及同名資源識別；合成資料不代表服務查詢成功。

## 發現與修正

- Get-FileHash原已存在速查索引；整合時改為升級，移除重複資料ID後重驗，不把同命令重複計數。
- 官方Get-EXOMailbox文件警告null或不存在Identity可能擴大查詢，已在章節說明非空檢查仍不足；正式流程需精確查詢與結果身分／筆數驗收。
- 雲端認證、目前目標情境與服務授權分開；所有示意租戶／訂用帳戶／信箱均未連線。

工具信任限制沿用：Pester5.7.1固定官方原始碼建置；PSScriptAnalyzer1.25.0作者與時間戳驗證成功，但NU3018／NU3028線上撤銷查詢限制未解除，未停用TLS／簽章驗證。原有42斷言及執行器實作未改，沿用既有證據。不同測試層重疊，不相加宣稱獨立覆蓋；PesterCoverage未量測。

下一批第36–40章及500+索引、附錄、企業案例擴充尚未完成。大型交付文件在dist且可重建；GitHub遠端結果需推送後核對。

本輪文件實際結果：A4 PDF313頁、手機PDF582頁、速查PDF6頁，Word35章／50表格／5295段落。HTML390px與1280px無橫向溢出、重複ID、壞錨點或JS錯誤。
