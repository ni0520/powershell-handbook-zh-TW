# 分層驗證紀錄

日期：2026-10-24（Asia/Taipei）。環境：Debian 13 x64、PowerShell 7.6.8 Core、Python 3.12.14、Pandoc 3.1.11.1、Chromium 154.0.8037.57。

| 檢查 | 結果 | 方法與證據 |
|---|---|---|
| 完整需求保存 | 通過 | PROJECT_SPEC.md 與附件逐位元組一致；SHA-256 2021d1ea8fbe2bcc2180db2a6e34c15a950b412ab306680289c040b58387357c |
| PowerShell 安裝完整性 | 通過 | 官方 hashes.sha256 比對；tar.gz：59112e38ad83350e4f6dc0195953c66b5926792f300ca2e7691b8242e7a16e7f |
| 安裝重複執行 | 通過 | bash scripts/setup.sh，多次核對同版工具與固定雜湊，保留既有原稿 |
| 官方文件研究 | 通過（本版使用範圍） | data/sources.json，55 筆來源、固定 Git commit、日期與用途；非全部文件逐行審查 |
| PowerShell 語法 | 通過 | python3 scripts/validate.py；130 個教材區塊／腳本，0 失敗；syntax-results.json |
| 靜態分析 | 未執行 | PSScriptAnalyzer 官方 nupkg 已下載，但 NuGet 簽章驗證流程尚未準備，不載入未完成驗證的模組 |
| 代表性功能 | 通過 | tests/Test-Examples.ps1；42 通過、0 失敗、0 跳過；test-results.json |
| 預期錯誤路徑 | 通過 | 負數參數拒絕、PathNotFound 捕捉等斷言包含於上述 42 項；不是錯誤操作成功 |
| Pester | 未執行 | 現有測試是自製斷言收集器，沒有冒稱 Pester |
| 20 章／400 題解／JSON／內部檔案連結 | 通過 | validate.py；題目與答案數一致，穩定識別碼不重複 |
| HTML 功能 | 通過 | 390px 與 1280px，無水平溢出、無重複 ID、無失效錨點、搜尋命令／中文術語成功、零 JavaScript 錯誤 |
| Word | 通過（結構） | python-docx 重新開啟、ZIP/XML 完整、20 章、23 表格、字型樣式與超連結存在；桌面 Microsoft Word 視覺檢查未執行 |
| A4 PDF | 通過 | 156 頁，A4 尺寸、中文擷取、無空白頁、書籤、字型嵌入與 Unicode 對應；代表性頁面視覺檢查 |
| 手機 PDF | 通過 | 278 頁，105×185 mm 獨立尺寸、較大相對字級、單欄、同樣文件檢查 |
| 速查 PDF | 通過 | 5 頁，文字、書籤、字型與內容檢查 |
| Windows 5.1／macOS／桌面操作 | 未執行 | 沒有以 Linux 結果替代 |
| 企業與雲端模組、跨版本效能 | 未執行 | 尚未進入對應章節與測試環境 |
| 正式網站部署／GitHub Release | 不適用 | 本輪交付原稿與離線文件，未發布網站或 Release |

功能結果不是全章每個範例的實測保證。教材中的故意錯誤區塊只做語法檢查，代表性錯誤另以安全斷言驗證。來源查證、語法、靜態分析、功能與排版分開記錄。

## 已診斷並修正的問題

- 官方雜湊清單是 UTF-16，改用正確編碼讀取後比對，未跳過校驗。
- 家目錄唯讀，使用工具支援的 XDG 快取／設定／資料路徑。
- Chromium 禁止 file URL，改為直接排版已讀取的內嵌 HTML；不更改管理政策。
- 中文標題產生過長 PDF 目的地名稱，改用短 ASCII 錨點；原稿使用 GitHub 可讀的 HTML 錨點。
- 舊 CFF 字型的 ToUnicode 將部分字元映射為康熙部首，改用有授權且固定雜湊的 TrueType 子集；沒有靠正規化掩蓋錯字。
- 速查 PDF 的測試曾錯用原文不存在的「管線」作驗收詞，改為檢查真實內容「速查」。
- 速查 PDF 初次缺少書籤，啟用 tagged PDF 後重新產生並驗證。
- 提交前發現兩題管線符號造成題解分隔錯誤，修正後新增行內程式碼成對檢查，重建所有交付格式並通過驗證。

詳細證據：[功能](test-results.json)、[語法](syntax-results.json)、[文件與 SHA-256](artifact-results.json)。檔案產生時的工作區保存、GitHub 提交／合併、環境發布及新任務還原是不同狀態；沒有把草稿設定保存視為已發布環境。
