# PowerShell 完整繁體中文版學習手冊（2026 版）

PowerShell 完整繁體中文版學習手冊：涵蓋入門教學、指令索引、實作範例、練習題、版本相容性與官方參考來源，以 Markdown 原稿產生手機友善 HTML、Word 與 PDF。

**目前版本：v0.5，40 章初稿。500+ 索引、附錄深度與企業驗證尚未完成。**

[開始閱讀](docs/README.md) · [命令詳解](docs/appendices/cmdlet-tutorials.md) · [速查表](docs/cheatsheets/quick-reference.md) · [驗證紀錄](progress/VALIDATION.md) · [接續工作](progress/NEXT_STEPS.md)

建立／更新：2026-10-24（Asia/Taipei）。實測：PowerShell 7.6.8、Debian 13 x64。

## 實際範圍

- 40 章原稿：基礎操作、版本、說明系統、物件與管線、資料型別、控制流程、函式、模組、錯誤處理、偵錯與日誌、Pester、檔案、文字、CSV／JSON／XML、ZIP 還原驗收、程序與Windows系統管理、網路診斷及CIM。
- 800 題練習與解答；100 個命令索引，其中 27 個採十四項教學結構、73 個為速查摘要。
- 74 個中英文術語、48 個參數、178 筆技術來源紀錄。
- 共用 Markdown 產生 HTML、DOCX、A4 PDF、獨立手機尺寸 PDF 與速查 PDF。
- HTML 可離線閱讀，提供章節、指令、中英文術語搜尋；全文搜尋可用瀏覽器功能。

40 章均已建立初稿；500+ 指令索引至少還差 400 筆，完整企業案例與附錄深度仍待擴充。所有章節仍屬初稿，後續仍需技術審閱及擴充。Windows PowerShell 5.1、Windows／macOS 桌面及企業模組未實測；語法檢查不等於每個範例已執行。

## 雲端環境中的重現方式

在 `/workspace/powershell-handbook-zh-TW` 執行：

```bash
bash scripts/setup.sh
python3 scripts/setup_test_tools.py
python3 scripts/validate.py
bash scripts/pwsh.sh -NoProfile -File tests/Test-Examples.ps1
bash scripts/pwsh.sh -NoProfile -File scripts/Invoke-Checks.ps1
python3 tests/verify_runner.py
python3 scripts/build.py --sample
python3 scripts/build.py
python3 scripts/verify_artifacts.py
```

這套設定使用雲端快照已有的 Python 3.12、Pandoc 3.1.11.1、Chromium 154、Noto CJK 字型，及 python-docx 1.2.0、pypdf 6.10.0、playwright 1.62.0、fontTools 4.61.1。`setup.sh` 核對文件工具依賴，安裝／核對固定 SHA-256 的 PowerShell 7.6.8，並準備有授權且固定雜湊的繁中字型子集。另以 `setup_test_tools.py` 重建固定 Pester 5.7.1 原始碼並驗證 PSScriptAnalyzer 1.25.0 套件；保留憑證撤銷查詢無法連線的限制。這不是任意作業系統的一鍵安裝器。

其他機器需先安裝相同或經驗證的工具，調整腳本中的雲端路徑；不得把本環境測試當成其他平台的安裝證明。詳細說明見 [scripts/README.md](scripts/README.md)。

輸出在 `dist/`；這些是可重建成果，不提交大型 PDF/DOCX。主稿、資料與測試證據保存在 Git。工作區保存、GitHub 合併與雲端環境發布是不同狀態，以實際操作回報為準。

## 結構與維護

- `PROJECT_SPEC.md`：使用者提供的完整需求原文。
- `AGENTS.md`：專案規則與中斷接續方式。
- `docs/`：章節、命令附錄、來源與速查表。
- `data/`：穩定識別碼的索引、來源與本機命令中繼資料。
- `examples/`、`tests/`：安全範例與可失敗的功能驗證。
- `scripts/`、`assets/`：建置工具與原創排版樣式。
- `progress/`：實際進度、分層驗證與下一步。

編輯前先讀進度，逐章保存、每批至少五章整合。保留使用者變更；來源必須可追溯，輸出與測試結果不得捏造。所有變更操作都需考慮權限、目標與回復方式。

第31–35章已整合：背景工作、安全性、REST API、AD／Microsoft 365、Azure／Exchange。企業連線均未實測，本機測試與服務授權分開記錄。

v0.5新增基礎設施、效能、可實測CSV報表、索引與附錄核心。第39章與第40章明確保留未達標項目；章節數不代表專案定稿。
