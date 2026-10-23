# PowerShell 教材製作報告 — v0.3

更新日期：2026-10-24（Asia/Taipei）。本版為前 30 章初稿，新增第 26–30 章；未完成全部 40 章。

## 實際成果

- 30 章，新增處理程序／服務、Windows Registry、事件記錄、網路診斷、WMI／CIM。
- 600 題練習與 600 題解答，本輪新增 100 題解。
- 命令索引 50 筆：20 筆有十四項教學結構，30 筆為速查摘要；完整參數組未全部實測。
- 62 個術語、40 個參數、109 筆技術來源，另有字型來源與 SIL OFL 1.1 授權。
- Markdown、離線搜尋 HTML、DOCX、273 頁 A4 PDF、502 頁手機 PDF、6 頁速查 PDF、來源與本報告。
- 修正輸出轉換將程式碼註解誤加標題錨點的問題，加入原樣保留程式碼的回歸檢查並重新產生文件。

## 實際驗證

PowerShell 7.6.8 / Debian 13 x64：210 個教材區塊／腳本語法案例通過；Pester 52 項案例中 47 通過、0 失敗、5 跳過。新增的 10 項通過案例涵蓋本機程序、自己建立之子程序的 WhatIf 與終止、事件及 CIM 形狀的合成資料、IP 格式解析。合成資料結果不代表 Windows 事件或 CIM 查詢成功。

28 個已檢視且可獨立執行的教材區塊通過執行檢查。PSScriptAnalyzer 1.25.0 對 examples 使用預設 Warning／Error 規則，無診斷；沒有對全書所有片段宣稱靜態分析通過。不同測試層有重疊，不相加宣稱獨立功能覆蓋。

v0.2 已通過的 42 項自製斷言、正常／故意失敗／零測試退出碼 0／1／1、Pester Discovery／Run 行為檢查沿用；對應實作未改，本輪未重複執行。正式 Pester 通過數不包含故意失敗控制案例。

HTML 搜尋／錨點／390px 與 1280px 寬度、DOCX 重新開啟與 30 章結構（38 表格、4627 段落）、PDF 中文字型／Unicode／書籤／無空白頁檢查通過。代表性 A4 與手機樣本經視覺檢查，未宣稱逐頁人工驗收；Word 未經桌面 Microsoft Word 逐頁視覺驗收。

## 平台與工具限制

4 項 Windows 唯讀測試因缺少 Windows 而跳過；1 項 ICMP 測試因缺少系統 ping 而跳過。實際嘗試回送 ICMP 所得錯誤已保存於 progress/platform-capabilities.json。Registry、服務、事件記錄、CIM 與遠端連線沒有在本 Linux 環境完成實測。Wait-Process 的 Linux／macOS 限制依官方文件標示，本機子程序範例使用 Process.WaitForExit。

.NET SDK 8.0.426 以官方 SHA-512 核對；Pester 5.7.1 從官方固定 commit 原始碼建置、鎖定依賴還原，不冒稱已簽章發行套件。PSScriptAnalyzer 1.25.0 以固定 SHA-256 與 NuGet 簽章工具驗證，Microsoft 作者與時間戳驗證成功；撤銷伺服器無法連線，保留 NU3018／NU3028 警告。未停用 TLS、簽章或撤銷檢查，紀錄見 progress/tooling。

## 尚未完成與保存

第 31–40 章、500+ Cmdlet 索引、完整企業案例、附錄擴充與深度審閱尚未完成。Windows 5.1、Windows／macOS、企業模組、跨版本效能、正式備份、大檔案及不受信任輸入壓力未實測；Pester 覆蓋率未量測。

v0.2 已合併並核對 GitHub main 提交 1d07caeac21c6a5a857ffde5b7d3975debc5cbc6。v0.3 原稿、資料、測試與證據納入 Git；大型交付文件留在 dist 並可重建。依使用者持續授權提交合併，本版遠端結果於推送後另行核對回報，這份產出前報告不預先宣稱推送成功。未發布 GitHub Release 或網站。

下一批為第 31–35 章；Windows 與企業環境的待驗證事項另行保留。詳細接續項目見 progress/NEXT_STEPS.md。
