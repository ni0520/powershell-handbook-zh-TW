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

目前作者內容已到第 20 章；建置封面、範圍說明與統計需隨後續章節一併更新。完整參數組中繼資料是 7.6.8 的觀察，不是所有版本相容保證。
