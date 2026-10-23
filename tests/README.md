# 測試範圍

`Test-Examples.ps1` 使用內建斷言收集器，是真實功能測試，不假稱 Pester。42 項涵蓋檔案字面路徑、管線型別、排序邊界、資料型別、參數拒絕、WhatIf 無變更、正常記憶體變更、錯誤捕捉與串流分離。

僅建立一個唯一暫存目錄，結束時清除該目錄並還原位置；不修改真實使用者檔案、服務或雲端帳戶。刻意錯誤被預期捕捉的案例，通過代表「正確拒絕或傳播」，不代表該錯誤操作成功。

`validate.py` 對教材與腳本執行 Parser 語法檢查，不執行未知 Markdown 內容。`verify_artifacts.py` 檢查文件與瀏覽器行為。JSON 證據保存於 progress，重新執行會更新執行時間與結果。

PSScriptAnalyzer 與 Pester 未執行。已取得 PSScriptAnalyzer 官方 nupkg，但此環境尚未具備已驗證的 NuGet 簽章檢查流程，因此沒有載入該下載模組；不關閉簽章或校驗來追求通過。
