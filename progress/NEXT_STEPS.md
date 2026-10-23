# 接續工作

## v0.3 交付紀錄（2026-10-24，臺灣）

v0.2 已提交合併至 GitHub main，核對提交為 1d07caeac21c6a5a857ffde5b7d3975debc5cbc6。本輪接續完成第 26–30 章初稿與整合檢查；v0.3 遠端提交結果以 Git 歷史與推送後核對為準。

1. 先讀 PROJECT_SPEC.md、AGENTS.md、STATUS.md、VALIDATION.md 與現有原稿；目前 v0.3 到第 30 章，保留已保存內容與使用者變更。
2. 下一批研究並編寫第 31–35 章：背景工作／平行／排程、安全性、REST API、Active Directory／Microsoft 365、Azure／Exchange。每章保存官方來源與實測範圍，每批至少五章整合；企業帳戶與服務未提供時，明確記錄未執行，不杜撰連線結果。
3. 第 26–30 章缺 Windows 5.1／Windows PowerShell 7 隔離驗證環境。服務、Registry、事件與 CIM 的 4 項唯讀測試跳過；Registry 自建實驗機碼範例及遠端工作階段也未執行。不要修改真實服務或企業系統。
4. Linux 缺系統 ping，實際回送 Test-Connection 回報缺少工具；ICMP 測試跳過。補齊能力後再測，不能把 IP 格式解析當成連線成功。命令存在也不代表平台支援，例如 Wait-Process 不支援 Linux／macOS。
5. Pester 5.7.1 固定官方原始碼建置；PSScriptAnalyzer 1.25.0 作者簽章與時間戳驗證成功，但線上撤銷查詢仍受限。來源見 data/test-tool-sources.json，重建用 scripts/setup_test_tools.py，保留完整信任限制。
6. 擴充命令索引：目前 50 筆（20 個十四項詳解、30 個速查），目標 500+；術語 62、參數 40、技術來源 109。不得把文件檔名數量當作已翻譯查證的索引。
7. 新章節同步更新 data/book.json、目錄、索引、README、STATUS 與報告；附錄 JSON 變更後執行 render_reference_data.py。建置共用 book_config.py 的版本／章數，validate.py 比對實際章數。
8. 分層驗證紀錄：本輪語法 210 通過、Pester 47 通過／5 跳過、教材區塊 28 通過、examples 靜態分析及建置程式碼保留回歸通過。原有 42 項斷言與執行器驗證沿用 v0.2 證據；不把重疊案例加總為獨立功能覆蓋。
9. 文件檢查已通過：30 章 DOCX、273 頁 A4／502 頁手機／6 頁速查 PDF、HTML 搜尋與錨點。重新產生輸出後先跑 verify_artifacts.py，再以 package_delivery.py 打包並驗證 ZIP／SHA-256。
10. 使用者已授權完成後提交合併 GitHub，授權持續有效。不強推、不刪分支或歷史，不自行建立 Release 或公開部署；推送後核對遠端 SHA。

尚需深度審閱、Pester 覆蓋率／Mock 整合、Regex 壓力、外來 XML／ZIP、大檔案、Windows ACL／ADS、網路磁碟與生產備份驗證。Word 桌面逐頁視覺驗收尚未執行。

版本基準：PowerShell 7.6.8 / Debian 13 x64。PowerShell 文件快照 a3de8f22552170e70852470d46cd52cd9ca471ec；Windows PowerShell 文件快照 b7645dd8c687139b28e845119da30ec670526507；其他固定來源見 data/sources.json。

工具快取位於 /workspace/handbook-tools，快取不能替代 GitHub 原稿保存。使用現有 checkout，不建立工作樹；保留代理、CA 信任與憑證設定，不修改 HOME。

任務停止後不會自動在背景繼續；下次依此紀錄與實際 Git 狀態接續。
