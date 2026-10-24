# 分層驗證紀錄

最新v0.4見[第31–35章整合紀錄](BATCH31_35.md)：239語法案例、58項Pester通過／5跳過、44教材區塊、5回送HTTP契約檢查通過。下列舊版本數量為歷史基準；最新文件結果見artifact-results.json。

最新v0.3.1增量見[第31章紀錄](CHAPTER31.md)：語法217通過、Pester52通過／5跳過、新教材6個區塊執行通過。下表的v0.3數量為歷史基準；JSON證據與文件雜湊以最新實際執行時間為準。

日期：2026-10-24（Asia/Taipei）。環境：Debian 13 x64、PowerShell 7.6.8 Core、Python 3.12.14、Pandoc 3.1.11.1、Chromium 154.0.8037.57。

| 檢查 | 結果 | 方法與證據 |
|---|---|---|
| 完整需求保存 | 通過 | PROJECT_SPEC.md 保持附件原文；SHA-256 2021d1ea8fbe2bcc2180db2a6e34c15a950b412ab306680289c040b58387357c |
| PowerShell 安裝完整性 | 通過 | 官方 hashes.sha256；tar.gz 59112e38ad83350e4f6dc0195953c66b5926792f300ca2e7691b8242e7a16e7f |
| 基本安裝 | 通過 | v0.1 已多次執行 setup.sh；本輪沿用相同固定工具，未聲稱跨平台安裝 |
| 測試工具安裝 | 通過（保留信任限制） | setup_test_tools.py 從固定來源建置並載入；tooling/setup-results.json |
| PSScriptAnalyzer 簽章 | 通過但撤銷查詢未完成 | dotnet nuget verify --all 回傳0，Microsoft作者與時間戳成功；NU3018／NU3028保留，tooling/pssa-signature.txt |
| Pester 原始碼來源 | 通過 | 固定5.7.1 commit dc45b7481fffc4f6c2ff1a74edebaad03ce1efcb、tar SHA-256、LockedRestore；非已簽章發行模組；tooling/pester-build.txt |
| 技術來源研究 | 通過（使用範圍） | data/sources.json，109筆、固定commit、用途與發布者；不宣稱全文逐行審查 |
| 語法解析 | 通過 | validate.py；210個教材區塊／腳本，0失敗；syntax-results.json |
| 靜態分析 | 通過（examples） | PSScriptAnalyzer 1.25.0預設規則，Warning／Error無診斷；static-analysis-results.json；未套用全書片段 |
| 原有代表性功能 | v0.2通過，實作未改 | Test-Examples.ps1自製斷言；42通過、0失敗；test-results.json |
| Pester功能 | 通過 | 5.7.1，47通過、0失敗、5跳過；pester-results.json；含檔案／Regex／CSV／JSON／XML／ZIP／程序／合成資料；跳過4項Windows與1項ICMP |
| 新增教材獨立區塊 | 通過 | verify_document_examples.py；28個已檢視區塊執行成功；document-execution-results.json；值斷言另見Pester |
| 執行器退出碼 | v0.2通過，實作未改 | 真實Invoke-Checks.ps1：正常0、故意失敗1、零測試1；runner-results.json |
| Discovery／Run | v0.2通過，實作未改 | 僅探索找出1項但不執行BeforeAll；實際執行後才有標記；runner-results.json |
| 30章／600題解／索引 | 通過 | validate.py核對連續章數、題解、行內程式碼、JSON ID、命令教學14節、索引錨點、本機中繼資料及內部連結 |
| HTML | 通過 | 390px與1280px無橫向溢出、無重複ID與失效錨點，舊新命令／Pester／JSON／繁中搜尋成功，零JS錯誤 |
| Word | 通過（結構） | DOCX ZIP/XML、重新開啟、30章、38表格、4627段落、字型及超連結；桌面Word視覺驗收未執行 |
| A4 PDF | 通過 | 273頁；尺寸、中文擷取、無空白頁、書籤、字型嵌入及Unicode對應 |
| 手機 PDF | 通過 | 502頁；105×185mm獨立尺寸、相同內容與字型檢查 |
| 速查 PDF | 通過 | 6頁；文字、書籤、字型與內容檢查 |
| 排版樣本 | 通過 | 第26／30章代表性A4及手機樣本已視覺檢查；非所有頁面人工審閱 |
| 程式碼保留回歸 | 通過 | tests/test_build.py；註解、Markdown形式的字串與連結保持原樣，實際標題仍產生錨點 |
| 平台能力 | 已記錄限制 | platform-capabilities.json；缺Windows命令與Registry provider；實際ICMP因缺系統ping無法執行，未測遠端目標 |
| Windows5.1／Windows／macOS | 未執行 | Linux不替代其他平台結果；ACL／ADS／長路徑等未測 |
| 企業模組／跨版本效能 | 未執行 | 尚無對應平台與帳戶驗證 |
| Pester覆蓋率／壓力測試 | 未執行 | 未量測Coverage、Regex壓力、大檔或不受信任ZIP／XML處理 |
| 正式網站／GitHub Release | 不適用 | 僅原稿與離線文件，不公開部署或發行 |

故意錯誤被捕捉的案例通過，代表正確拒絕或傳播；不是錯誤操作成功。不同層的測試可能重疊，不以總和宣稱獨立功能覆蓋。語法、靜態分析與實際執行分開記錄。

## 本輪與沿用的修正紀錄

- v0.3修正Markdown轉換將程式碼註解誤判為標題的問題：先保護程式碼區塊，轉換標題／連結後原樣還原，加入回歸測試並重新建置全部文件。
- v0.3依官方文件修正Wait-Process平台說明；Linux測試使用自行建立的Process物件WaitForExit。命令存在不代表其平台操作可用。
- v0.3本機命令中繼資料明確記錄Available=false，不替不存在的Windows命令填造語法或參數。

下列工具與字型修正自v0.1／v0.2沿用：

- .NET首次初始化需可寫入的使用者共享記憶體位置；依官方runtime行為設定XDG_RUNTIME_DIR，另設定XDG資料與DOTNET_CLI_HOME，不改HOME。
- NuGet簽章工具回傳成功但撤銷查詢不可用，原始警告保留；沒有將線上信任限制隱藏或改成無條件通過。
- 新增繁中備份腳本被靜態分析指出缺BOM，改存UTF-8 BOM後重驗通過；未關閉規則。
- 測試確認原有總額範例使用整數單價；保留原始契約，不把小數金額當作既有功能。
- 建置與驗證移除固定前20章命名，以data/book.json共享版本／章數；新命令速查頁納入搜尋與錨點驗證。
- 沿用v0.1已修正的TrueType中文字型Unicode對應、短ASCII PDF錨點、直接內嵌HTML排版與速查書籤設定。

證據：[語法](syntax-results.json)、[原有功能](test-results.json)、[Pester](pester-results.json)、[靜態分析](static-analysis-results.json)、[教材執行](document-execution-results.json)、[執行器](runner-results.json)、[文件與雜湊](artifact-results.json)、[平台能力](platform-capabilities.json)。遠端保存以提交後GitHub核對為準，不以設定草稿或本機文件替代。
