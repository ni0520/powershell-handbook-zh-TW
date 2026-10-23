# 工具使用

工作目錄：`/workspace/powershell-handbook-zh-TW`。

1. `bash scripts/setup.sh`：驗證快照工具依賴與 PowerShell 固定雜湊，必要時從官方 Releases 下載。
2. `bash scripts/pwsh.sh -NoProfile ...`：使用固定 7.6.8 並將 XDG 狀態放在可寫目錄；保留代理與 CA 信任。
3. `python3 scripts/validate.py`：檢查章節、題解數、JSON 識別碼、內部檔案連結，以及教材程式碼與腳本的 Parser 語法。
4. `bash scripts/pwsh.sh -NoProfile -File tests/Test-Examples.ps1`：實際執行代表性測試，失敗保留非零退出碼。
5. `python3 scripts/build.py --sample`：產生代表性排版樣本。
6. `python3 scripts/build.py`：從共同 Markdown 合併與產生 HTML、Word、PDF、手機 PDF、速查與來源清單。
7. `python3 scripts/verify_artifacts.py`：以瀏覽器與文件解析器驗證產出，結果保存在 progress。

建置不啟動常駐服務，也不部署網站。Chromium 直接接收已讀取的內嵌 HTML，避免依賴本機檔案網址或外部資源；不提供雲端不支援的 localhost 預覽連結。

目前作者內容已到第 25 章；版本與章數存於 data/book.json，建置與文件檢查共用 scripts/book_config.py。新增章節仍須同步原稿、目錄、資料與進度。完整參數組中繼資料是 7.6.8 的觀察，不是所有版本相容保證。

## 測試工具與新增流程

- `python3 scripts/setup_test_tools.py`：驗證固定 SHA-512 的 .NET SDK 8.0.426；驗證 PSScriptAnalyzer 1.25.0 NuGet 作者簽章與時間戳；從固定 GitHub commit 原始碼建置 Pester 5.7.1，以 LockedRestore 核對依賴。設定可寫 XDG_RUNTIME_DIR 等工具目錄，不修改 HOME、代理或 CA 信任。
- PSScriptAnalyzer 驗證回傳成功，但撤銷伺服器無法連線，保留 NU3018／NU3028 警告；沒有關閉撤銷、簽章或 TLS 檢查。Pester 是原始碼建置，不宣稱已簽章的發行模組。證據在 progress/tooling。
- `bash scripts/pwsh.sh -NoProfile -File scripts/Invoke-Checks.ps1`：37 項 Pester 測試與 examples 的靜態分析，任一失敗或零測試均回傳非零退出碼。可用 PesterManifest、AnalyzerManifest 指定其他已核准安裝位置。
- `python3 tests/verify_runner.py`：對真實執行器測正常、故意失敗、空集合及 Discovery/Run 階段差異；故意失敗不混入正式測試結果。
- `python3 tests/verify_document_examples.py`：執行已明確檢視的第 22–24 章獨立區塊及新增五項命令詳解，限制為唯讀或自建暫存資料；不自動執行全書內容。
- `bash scripts/pwsh.sh -NoProfile -File scripts/Export-CommandMetadata.ps1`：更新索引命令的本機參數組觀察。
- `python3 scripts/render_reference_data.py`：由已審讀 JSON 產生術語、參數、來源附錄。
- 文件驗證完成後執行 `python3 scripts/package_delivery.py`：核對實際文件雜湊並建立本機 ZIP，不發布 GitHub Release。
