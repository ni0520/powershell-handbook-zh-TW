# 測試範圍

`Test-Examples.ps1` 使用內建斷言收集器，是真實功能測試，不假稱 Pester。42 項涵蓋檔案字面路徑、管線型別、排序邊界、資料型別、參數拒絕、WhatIf 無變更、正常記憶體變更、錯誤捕捉與串流分離。

僅建立一個唯一暫存目錄，結束時清除該目錄並還原位置；不修改真實使用者檔案、服務或雲端帳戶。刻意錯誤被預期捕捉的案例，通過代表「正確拒絕或傳播」，不代表該錯誤操作成功。

`validate.py` 對教材與腳本執行 Parser 語法檢查，不執行未知 Markdown 內容。`verify_artifacts.py` 檢查文件與瀏覽器行為。JSON 證據保存於 progress，重新執行會更新執行時間與結果。


新增 Pester 5.7.1：LearningTotal.Tests.ps1 與 DataFiles.Tests.ps1 共 37 項，使用 TestDrive 或自行建立的唯一暫存目錄。涵蓋型別、邊界、CSV 特殊字元、JSON 深度與形狀、XML 命名空間／DTD 拒絕、ZIP 還原與錯誤雜湊。

Invoke-Checks.ps1 另用 PSScriptAnalyzer 1.25.0 對 examples 套用預設 Warning／Error 規則。工具來源、簽章警告與重建方法見 scripts/README.md；不把靜態分析範圍擴稱為全書。

verify_runner.py 實際啟動子程序檢查正常／故意失敗／零測試的退出碼，並比較僅探索與真正執行的 BeforeAll 副作用。verify_document_examples.py 執行 28 個已檢視、可獨立運行的教材區塊；這是執行檢查，預期值斷言另在 Pester 記錄。

全部證據保存於 progress/*.json。Windows 5.1、Windows／macOS、企業模組及壓力測試未執行。

SystemManagement.Tests.ps1新增10個本機／合成資料通過案例，4個Windows唯讀查詢與1個ICMP案例因能力缺少跳過。整體Pester為47通過、0失敗、5跳過，跳過不當通過。第27章Registry變更與第30章遠端連線沒有執行。test_build.py另防止匯出時把程式碼註解轉成章節錨點。

第31章新增 Jobs.Tests.ps1：引數、Keep、等待逾時與清理、非終止錯誤及平行排序。完整Pester目前57案例（52通過、5平台能力跳過）；verify_document_examples.py新增第31章六個已審閱區塊，現共34個。第31章個別輸出另見progress/chapter31-execution-results.json。

v0.4：SecurityCloud.Tests.ps1新增6項本機契約測試；整套Pester63案例（58通過／5跳過），教材允許清單44區塊。python3 tests/verify_rest_http.py啟動暫時回送HTTP測試並關閉，驗證5項契約，不含正式TLS／OAuth／企業整合。

v0.5：新增EnterpriseReport.Tests.ps1共13項契約／量測測試；整套Pester76案例（71通過／5跳過），教材允許清單59區塊。test_build.py另驗證第40章後不產生反向剩餘章數範圍。產品服務範本未列入執行清單。
