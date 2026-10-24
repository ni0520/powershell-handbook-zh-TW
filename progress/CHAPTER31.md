# 第31章接續驗證

日期：2026-10-24（Asia/Taipei）。本輪為第31–35章批次的部分進度，尚未完成整批，不宣稱五章交付。第32–35章須接續製作。

## 完成範圍

新增 docs/chapters/31-jobs-parallel-scheduling.md：Start-Job十四項教學、五類範例、ForEach-Object平行範例、排程設計檢查、20題練習及解答。章內詳解尚未另加入命令索引，因此索引維持50筆（20詳解／30速查），不重複計數。

查讀Microsoft固定快照的about_Jobs、Start-Job、Receive-Job、Wait-Job與ForEach-Object，來源雜湊保存於data/sources.json。技術來源113筆，另有字型來源1筆。

## 分層結果

- 語法與結構：217案例通過，31章／620題解、來源ID、既有命令索引與內部連結通過。syntax-results.json。
- Pester：57案例中52通過、0失敗、5跳過；新增5項涵蓋引數、Keep接收、逾時不停止與清理、非終止錯誤、平行排序驗收。pester-results.json。
- 新教材實際執行：6個原稿區塊全部退出0，保存實際輸出；這是區塊執行證據，值與狀態斷言由Pester另行驗證。chapter31-execution-results.json。
- 靜態分析：沿用examples範圍預設Warning／Error規則，本輪執行通過；未宣稱新章所有片段通過靜態分析。static-analysis-results.json。
- Windows／macOS、ThreadJob整合、正式排程註冊、跨登出執行與大資料效能：未執行。

本輪另將第31章加入明確允許清單，重新執行共34個教材區塊，全數通過，document-execution-results.json為最新證據；新6個個別輸出也分檔保存。原有42斷言、執行器退出碼與建置回歸實作未改，沿用既有證據。不同層案例重疊，不加總宣稱獨立功能覆蓋。

## 工具信任限制

PowerShell7.6.8／Debian13；Pester5.7.1固定來源建置。PSScriptAnalyzer1.25.0作者簽章與時間戳曾驗證成功，線上撤銷查詢NU3018／NU3028限制仍保留，未停用TLS或簽章檢查。詳見VALIDATION.md與tooling。

本輪文件產出檢查另保存artifact-results.json；舊v0.3 ZIP保留為前30章歷史交付，不替代本輪原稿。

文件檢查通過：31章DOCX（41表格、4775段落）、282頁A4、521頁手機、6頁速查PDF；HTML錨點／搜尋與390px、1280px寬度通過。已視覺檢查第31章代表性A4與手機頁，未逐頁人工驗收或使用桌面Word檢查。
