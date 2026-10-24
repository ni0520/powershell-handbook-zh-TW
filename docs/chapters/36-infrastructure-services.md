<a id="chapter-36"></a>

# 第 36 章：Hyper-V、Docker、IIS 與 SQL Server

[返回目錄](../README.md)

## 學習目標

辨認虛擬機、容器、網站、應用程式集區與資料庫的不同管理邊界；先查詢、再驗收，避免把平台、服務、模組與帳戶權限混為一談。本章只提供核准環境的唯讀範本，不部署或停止任何服務。

## 先確認管理平面

Hyper-V管理虛擬機；Docker CLI（命令列介面）向容器引擎送出請求；IIS是Windows網站伺服器；SQL Server是資料庫服務。PowerShell可以協調它們，但安裝PowerShell不會自動取得這些服務、模組或管理權。

| 技術 | 管理工具 | 驗證前置條件 |
|---|---|---|
| Hyper-V | Hyper-V模組 | Windows管理工具、核准主機、讀取權 |
| Docker | 原生docker命令 | CLI、核准context、可達引擎與權限 |
| IIS | WebAdministration等適當模組 | Windows、IIS角色、相容管理環境 |
| SQL Server | SqlServer模組或核准驅動 | 版本、端點、TLS、登入與資料庫讀取權 |

Hyper-V的Windows管理模組不能在本Linux環境假裝可用；IIS模組的PowerShell版本支援也需在實際Windows環境確認。不要因為能查到命令名稱就省略服務與權限驗收。

## 主要指令教學

<a id="get-vm"></a>

### 1. 名稱

Get-VM（取得虛擬機），Hyper-V模組。

### 2. 重要程度

★★★☆☆ 建議掌握；適用於負責Hyper-V的管理者。

### 3. 功能

取得一個或多個Hyper-V主機上的虛擬機資訊。這是Hyper-V命令，不是所有虛擬化產品共用的Get-VM；第三方模組可能有同名命令。

### 4. 使用情境

核准主機的VM（Virtual Machine，虛擬機）狀態盤點；先確認模組來源，必要時以Hyper-V\\Get-VM限定命令。

### 5. 英文拆解

VM是Virtual Machine；記成「查虛擬機，不碰啟停」。

### 6. 語法

本章使用Get-VM -Name 名稱 -ComputerName 核准主機，或Get-VM -Id 識別碼；不同參數組不可任意混合。完整語法與平台依官方文件及實際模組版本。

### 7. 主要參數

| 參數 | 功能 | 注意 |
|---|---|---|
| -Name | 依名稱查詢 | 名稱不應當跨主機唯一鍵 |
| -Id | VM識別碼 | 先確認對應主機 |
| -ComputerName | 目標主機 | 未指定時預設本機 |
| -CimSession | 使用工作階段 | 不等於任意遠端PSSession |

### 8. 五類範例

前三例是**未執行的Windows Hyper-V範本**，名稱與主機都是示意值，需先核准。沒有建立、啟動、快照或停止VM。

**基本：指定單一VM。**

```powershell
Hyper-V\Get-VM -Name 'LearningVM' -ErrorAction Stop |
    Select-Object VMId, Name, State
```

**參數化：指定核准主機。**

```powershell
$approvedHost = 'hv01.example.test'
Hyper-V\Get-VM -ComputerName $approvedHost -Name 'LearningVM' -ErrorAction Stop |
    Select-Object ComputerName, VMId, Name, State
```

**實務：有限範圍取得資料再整理欄位。**

```powershell
$inventory = @(Hyper-V\Get-VM -ComputerName 'hv01.example.test' -Name 'LearningVM' -ErrorAction Stop)
$inventory | Sort-Object VMId | Select-Object ComputerName, VMId, Name, State
```

輸出以實機為準，查詢失敗不等於沒有VM。State是查詢時的狀態，不是服務可用性監控的完整結果。

**錯誤示範與修正：只按名稱去重。** 以下僅使用本機合成資料：

```powershell
$sample = @(
    [pscustomobject]@{Host='hv01';Id='V1';Name='demo';State='Running'}
    [pscustomobject]@{Host='hv02';Id='V2';Name='demo';State='Off'}
)
$sample | Select-Object Host, Id, Name, State
```

預期兩列同名但不同Id；修正為保留主機與識別碼，不把不同VM合併。

**進階：狀態彙總。** 仍是合成資料，不代表Hyper-V整合：

```powershell
$sample = @(
    [pscustomobject]@{State='Running'}
    [pscustomobject]@{State='Running'}
    [pscustomobject]@{State='Off'}
)
$sample | Group-Object State | Sort-Object Name | Select-Object Name, Count
```

預期Off=1、Running=2。沒有將樣本數當成真實主機盤點。

### 9. 輸出判讀

保留目標主機、VMId、時間與查詢結果；缺資料與狀態Off是不同事件。VM開機不代表客體作業系統、網站或資料庫已健康。

### 10. 常見錯誤

同名命令先查Get-Command -All與ModuleName；找不到主機先分層檢查名稱、連線與認證；拒絕存取查Hyper-V授權。不要直接賦予所有人管理權。

### 11. 安全提醒

啟停、刪除、檢查點及磁碟操作會影響工作負載、容量與備份，本章不執行。快照或檢查點不是完整備份策略。

### 12. 相關指令

Get-CimInstance處理管理資料模型，但不應用任意類別替代產品命令。不同虛擬化產品的Get-VM不可只靠名稱推定參數與行為。

### 13. 記憶技巧

「模組、主機、Id、狀態」四個欄位先確認。

### 14. 官方來源

使用Windows Server2025 Hyper-V的Get-VM文件；只查讀教材使用部分，未驗證實際Windows模組組合。

## Docker：原生程式也要驗收退出碼

docker不是PowerShell Cmdlet。Docker context可能指向本機或遠端引擎；docker ps成功不代表正在操作預期主機。存取Docker引擎可能具高度系統權限，不能因查詢看似唯讀就忽略連線身分。

下列為未執行範本，只列出符合名稱標籤的容器，不啟動容器。先查docker context show與引擎目標，名稱篩選不當作精確唯一識別。

```powershell
$lines = @(docker container ls --all --filter 'name=learning' --format '{{json .}}')
$code = $LASTEXITCODE
if ($code -ne 0) { throw ('docker查詢失敗，退出碼{0}' -f $code) }
$lines | ForEach-Object { $_ | ConvertFrom-Json } | Select-Object ID, Names, State, Status
```

沒有輸出可能是合法零筆，也可能是錯誤；先驗退出碼再判斷。原生程式參數與PowerShell引數規則不同，不把任何字串交給Invoke-Expression重組執行。

## IIS：設定、程序與HTTP健康分開

Get-Website提供IIS網站設定資訊；網站State=Started不保證應用程式集區、後端資料庫與實際HTTP請求都正常。排查時分別記錄設定、工作程序、繫結、憑證與回應，不一律以重啟服務處理。

未執行的Windows範本：

```powershell
Get-Website -Name 'LearningSite' -ErrorAction Stop |
    Select-Object Name, Id, State, PhysicalPath
```

PhysicalPath可能暴露部署結構，不直接公開整份設定。查詢結果與HTTP探測是不同測試，不在沒有核准網站時任意探測外部端點。

## SQL Server：查詢也需要資料契約

SqlServer模組的Invoke-Sqlcmd可執行T-SQL，並非所有呼叫都是唯讀。即使使用SELECT，也需控制資料範圍、權限、執行成本、逾時與敏感輸出。不得以信任所有憑證、硬編碼密碼作為連線失敗的通用修正。

本章不提供會連線到未知伺服器的可執行範本。先在核准環境確認模組版本、Encrypt等參數支援、憑證信任與資料庫身分，再執行最小唯讀驗證，例如固定SELECT常數。正式依使用者輸入篩選資料時，應使用支援參數化的驅動／查詢介面，而不是直接串接SQL文字。

合成SQL回應可以測欄位轉換，但不能證明SQL語法、伺服器連線或權限成功。本章也不測IIS與SQL的整合應用程式健康。

## 速查表

| 技術 | 核對重點 | 不可直接推論 |
|---|---|---|
| Hyper-V | 模組、主機、VMId | 開機等於應用健康 |
| Docker | context、退出碼、容器ID | 零輸出等於成功 |
| IIS | 網站設定、集區、HTTP | Started等於服務可用 |
| SQL | 驅動、TLS、身分、查詢 | SELECT等於任何範圍都安全 |

## 練習題

1. Hyper-V與Docker管理的是相同層次嗎？
2. 安裝PowerShell自動安裝IIS或SQL嗎？
3. Get-VM可能有同名命令嗎？
4. 如何限定Hyper-V模組的Get-VM？
5. Name能當跨主機唯一鍵嗎？
6. ComputerName未指定時預設查哪裡？
7. VM的Running代表網站已正常嗎？
8. 合成狀態範例的Running有幾筆？
9. Hyper-V檢查點能取代完整備份嗎？
10. docker是PowerShell Cmdlet嗎？
11. Docker context為何需要先確認？
12. 如何判斷原生docker命令失敗？
13. docker零輸出必定是零容器嗎？
14. 為何不把任意引數送給Invoke-Expression？
15. IIS網站Started就代表HTTP健康嗎？
16. PhysicalPath可任意公開嗎？
17. Invoke-Sqlcmd一定唯讀嗎？
18. SQL連線憑證失敗應關閉驗證嗎？
19. 使用者輸入可直接串接SQL嗎？
20. 本章哪些服務實際完成連線驗證？

## 參考答案與解題思路

1. 不同；虛擬機與容器的隔離及管理邊界不同。
2. 不會；需另有服務、工具、平台與權限。
3. 可能；不同模組可以提供同名命令。
4. 使用Hyper-V\\Get-VM，並檢查實際ModuleName。
5. 不可；保留主機與VMId，避免同名合併。
6. 本機；遠端目標必須明確核准。
7. 不代表；客體、程序與應用健康分層驗證。
8. 兩筆；這只證明合成資料分組。
9. 不能；需正式備份與還原驗收策略。
10. 不是；它是原生CLI，需另驗退出碼。
11. 可能指向遠端或非預期引擎，避免查錯環境。
12. 立即保存並檢查LASTEXITCODE，不能被後續原生命令覆寫。
13. 不一定；先排除失敗，再依篩選條件判斷。
14. 會把資料當程式執行；應直接傳正式引數。
15. 不代表；繫結、憑證、集區與後端仍可能失敗。
16. 不應；它可能暴露部署路徑與系統結構。
17. 不是；它能執行變更查詢，應審查SQL與權限。
18. 不應；查憑證、信任鏈、主機與版本設定。
19. 不應；採用支援參數化的查詢介面。
20. 無；本環境只驗證本機合成資料，服務範本未執行。

## 參考資料與延伸閱讀

- [Get-VM](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/Hyper-V/Get-VM.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [Get-Website](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/WebAdministration/Get-Website.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [docker-ps](https://github.com/docker/cli/blob/6d274590f2f63276a54da8adf475a455d21c1fdd/docs/reference/commandline/ps.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。
- [sql-module-readme](https://github.com/microsoft/SQLServerPSModule/blob/d36674326183187610f85719554e6a7f630b2db6/README.md) — 固定原始文件快照；查閱2026-10-24；用途與版本限制見本章。

## 驗證狀態

來源使用段落已查證；語法、功能與格式分層結果見[驗證紀錄](../../progress/VALIDATION.md)。企業服務、Windows與跨平台結果不得由本機合成資料替代；500+索引與附錄深度仍未完成。
