# 接續工作

1. 先讀 PROJECT_SPEC.md、AGENTS.md、STATUS.md、VALIDATION.md 與現有原稿，不重建或覆寫已保存內容。
2. 下一個具體工作：研究並編寫第 21–25 章，逐章保存、每批整合。先準備能驗證簽章／來源的 Pester 與 PSScriptAnalyzer 工具，再分開記錄測試、靜態分析與實際功能。
3. 第 21 章需補 Pester 的官方來源、版本、Discovery/Run 差異、失敗退出碼與實際測試，不得把現有自製斷言收集器叫做 Pester。
4. 第 22–25 章只用唯一暫存資料夾驗證檔案／編碼／CSV／JSON／XML／壓縮；危險操作需清楚範圍與模擬支援。
5. 逐批擴充 data/cmdlet-index.json，索引目標 500+，目前 10。來源候選可從官方 PowerShell-Docs 與 Windows 模組文件研究，但不得把檔名計數直接當成已翻譯查證索引。
6. 擴充至 21–40 章時同步更新建置封面、範圍說明、測試、索引、README 與統計。現有 build.py 的本版名稱及範圍明確固定前 20 章，不能只加檔案便稱新版本完成。
7. 增加 Windows 5.1、Windows PowerShell 7、macOS 與企業模組環境的分層實測；目前沒有這些平台／帳戶驗證。
8. 本輪使用者已授權完成後提交合併 GitHub。後續 Git 操作依對話中持續有效的授權及儲存庫規則執行；不強推，不擅自發行或公開部署。

版本：PowerShell 7.6.8 / Debian 13 x64，官方文件快照 a3de8f22552170e70852470d46cd52cd9ca471ec。

術語：Cmdlet＝PowerShell 命令、Pipeline＝管線、Object＝物件、Parameter＝參數、Argument＝引數、Hashtable＝雜湊表。

工具：固定雜湊的 PowerShell、fontTools 子集字型、Pandoc、Chromium、python-docx、pypdf、Playwright。字型原始檔與研究 checkout 在 /workspace/handbook-tools，重建需遵守簽章、TLS、雜湊與授權規則。套件快取與程序不是 GitHub 原稿保存的替代。

任務停止後不會自動在背景繼續；接續時依本紀錄與實際 Git 狀態前進。
