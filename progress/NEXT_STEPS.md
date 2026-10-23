# 接續工作

## v0.2 收尾（2026-10-24，臺灣）

使用者已要求恢復工作。前25章交付ZIP已建立，13個檔案的ZIP完整性及SHA-256核對通過；本輪提交與遠端保存以Git歷史及推送後核對為準。接續第26–30章。

1. 先讀 PROJECT_SPEC.md、AGENTS.md、STATUS.md、VALIDATION.md 與現有原稿；目前 v0.2 已到第 25 章，保留已保存內容與使用者變更。
2. 下一個具體工作：研究並編寫第 26–30 章（處理程序／服務、Registry、事件記錄、網路診斷、WMI／CIM）。逐章保存來源與實測範圍，每批整合。Linux 可先做本程序唯讀查詢；Windows 專用命令必須標示平台，不可用 Linux 結果替代。
3. 優先準備 Windows 5.1 與 Windows PowerShell 7 的隔離驗證環境，再測服務、Registry、事件記錄與 CIM。若未取得環境，只能記錄文件查證／語法，不宣稱功能通過。不要修改真實服務或企業系統。
4. Pester 5.7.1 已從固定官方原始碼建置；PSScriptAnalyzer 1.25.0 已載入並分析 examples。來源與雜湊見 data/test-tool-sources.json，重建用 scripts/setup_test_tools.py。NuGet 作者簽章及時間戳驗證成功，但撤銷伺服器無法連線；完整線上撤銷驗證仍待可用環境補做，不能稱此限制已解除。
5. 第 21–25 章代表性功能已測，仍需深度審閱與其他平台驗證。尚未測 Pester 覆蓋率／Mock整合、Regex壓力、外來XML／ZIP、大檔案、Windows ACL／ADS、網路磁碟與生產備份。
6. 持續擴充 cmdlet-index：目前 30 筆（15 個十四項詳解、15 個速查），目標 500+。不得把官方文件檔名數量當作已翻譯查證的索引。
7. 新增章節時更新 data/book.json、目錄、索引、README、STATUS 與報告。scripts/book_config.py 共用封面與檔名；validate.py 會比對實際章數。附錄 JSON 變更後執行 render_reference_data.py，再驗證與重建文件。
8. 維持分層測試：語法、42 項原有斷言、37 項 Pester、19 個教材區塊執行、執行器退出碼／探索階段、靜態分析、文件產出各自記錄。不要把重疊案例加總稱為獨立功能覆蓋。
9. 使用者已授權完成後提交合併 GitHub；授權在對話中持續有效。不強推、不刪分支或歷史，不自行建立 Release 或公開部署。遠端結果必須在推送後核對。

版本基準：PowerShell 7.6.8 / Debian 13 x64。Microsoft PowerShell 文件快照 a3de8f22552170e70852470d46cd52cd9ca471ec；新增 Pester／.NET 文件固定 commit 詳見 data/sources.json。

術語：Cmdlet＝PowerShell 命令、Pipeline＝管線、Object＝物件、Parameter＝參數、Argument＝引數、Hashtable＝雜湊表、Regex＝正規表示式。Pester 探索與執行、CSV 字串與數字、雜湊與來源簽章須清楚區分。

工具快取位於 /workspace/handbook-tools，快取不是 GitHub 原稿保存的替代。使用現有 checkout，不建立工作樹。保留代理、CA 信任與憑證設定，不修改 HOME。

任務停止後不會自動在背景繼續；下次依此紀錄與實際 Git 狀態接續。
