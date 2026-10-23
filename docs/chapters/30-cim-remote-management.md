<a id="chapter-30"></a>

# 第 30 章：WMI、CIM 與遠端管理

[返回目錄](../README.md)

## 學習目標

區分管理資料模型、Windows實作、傳輸與工作階段；使用唯讀CIM查詢選取必要屬性，理解本機與遠端預設差異，建立可清理的工作階段，避免把物件查詢與任意遠端指令執行混為一談。

## 四個不同層次

CIM（通用資訊模型）描述管理資料的類別與實例；WMI（Windows管理規範）是Windows管理基礎設施。WSMan（Web服務管理協定）與DCOM（分散式元件物件模型）是可能的傳輸／通訊方式。PowerShell Remoting（遠端處理）則提供遠端命令與工作階段機制。

Get-CimInstance回傳CIM實例的快照；建立CimSession不等於建立可執行任意PowerShell指令的PSSession。Windows PowerShell5.1的Get-WmiObject仍常出現在舊文件，但它在PowerShell7已移除；移轉需要檢查參數與回傳型別，不能只替換命令名稱。

CimCmdlets在本版官方7.6文件標示Windows專用，Linux安裝PowerShell不會因此自動取得本機Windows WMI。CIM是一個標準，不表示每個平台都有同樣的PowerShell命令或Win32類別。

## Windows本機唯讀查詢

```powershell
if ($env:OS -ne 'Windows_NT') { throw '本例使用 Windows CimCmdlets' }
Get-CimInstance -ClassName Win32_OperatingSystem -Property Caption, Version, BuildNumber |
    Select-Object Caption, Version, BuildNumber
```

Caption通常是作業系統名稱，Version與BuildNumber以實機為準。不要把一份示意輸出當所有Windows版本的結果。Get-CimInstance未指定ComputerName或CimSession時查本機WMI，和指定遠端名稱的路徑不同。

```powershell
# Windows唯讀：只查目前PowerShell程序，不列全機命令列
$filter = 'ProcessId = {0}' -f $PID
Get-CimInstance -ClassName Win32_Process -Filter $filter -Property ProcessId, Name |
    Select-Object ProcessId, Name
```

Filter使用WQL（WMI查詢語言）的條件語法，不是PowerShell指令碼區塊；用`{ $_.ProcessId -eq ... }`不能直接當WQL字串。範例只插入已知整數PID。若條件來自使用者文字，需要適當驗證與引用，不用直接串接任意輸入。

## Property與Filter回答不同問題

Property限制需要取得的屬性，Filter縮小實例範圍。Select-Object在資料回到PowerShell後整理顯示，不一定減少遠端傳輸。類別可能仍附帶鍵或必要屬性，不能把Property清單當成嚴格的資料遮蔽機制。

查無實例、類別不存在、命名空間不存在、驗證失敗與拒絕存取是不同情況。報表應保留目標、查詢、時間與錯誤種類，不把它們全部變成空集合。

## 一個有清理責任的遠端工作階段

下列是**未執行的遠端範本**。server01.example.test須換成已核准主機，使用組織設定的驗證方式、連線能力與必要權限。它不會替你開啟WinRM、防火牆或調整信任。

```powershell
if ($env:OS -ne 'Windows_NT') { throw '本例需要 Windows' }
$approvedHost = 'server01.example.test'
$session = $null
try {
    $session = New-CimSession -ComputerName $approvedHost -ErrorAction Stop
    Get-CimInstance -CimSession $session -ClassName Win32_OperatingSystem `
        -Property Caption, Version -ErrorAction Stop |
        Select-Object Caption, Version
} finally {
    if ($null -ne $session) { Remove-CimSession -CimSession $session }
}
```

New-CimSession未指定ComputerName時預設建立本機DCOM工作階段，指定ComputerName時預設使用WSMan；明寫localhost也不能任意當成「與完全省略名稱相同」。Remove-CimSession移除本機的CIM工作階段物件，不會刪除遠端主機。

只需要產生DCOM選項物件時可以使用下面語法；選項建立本身不代表連線成功。是否選擇DCOM由環境需求決定，不把它當作繞過被拒連線的方法。

```powershell
# Windows；只建立設定物件，不建立連線
$options = New-CimSessionOption -Protocol Dcom
```

## 遠端管理的診斷順序

先確認命令／模組與目標平台，再確認名稱解析、所需傳輸可達性、伺服器服務與授權，最後檢查類別與查詢。TCP連線成功不代表帳戶已獲WMI權限。Windows遠端處理的預設設定、群組原則與主機角色可能不同，需由管理者依組織標準設定。

若需要憑證，使用組織支援的認證流程與PSCredential，不能把明文密碼放進教材、命令列或Git。不要把TrustedHosts設為星號、忽略憑證錯誤或關閉驗證作為通用修正。本章不處理委派、跨網域與第二次跳躍的完整架構，後續安全章節需補充。

## 合成資料能測什麼

```powershell
$sample = [pscustomobject]@{Caption='Learning OS';Version='1.0';BuildNumber='100'}
$sample | Select-Object Caption, Version | ConvertTo-Json
```

這只驗證欄位選取與JSON輸出；不能證明CIM連線、WMI提供者或帳戶權限可用。實際CimInstance不是任意PSCustomObject，測試替身不應被拿來宣稱Windows整合通過。

## 常見錯誤、版本與安全

不要對查詢結果盲目呼叫方法或改屬性就期待遠端狀態改變；修改管理資料需要專用命令與權限，且影響可能包括服務、程序與系統設定。本章只教唯讀查詢，不執行Invoke-CimMethod、重新開機或刪除實例。

Win32_Product等類別的盤點可能有非預期的產品檢查副作用，不能把「Get開頭」視為任意類別都零副作用的保證；正式查詢應查該類別的產品文件。本章只使用作業系統與目前程序的有限屬性。

## 速查表

| 需求 | 方法 | 限制 |
|---|---|---|
| 本機OS資料 | Get-CimInstance Win32_OperatingSystem | 本版Windows專用 |
| 篩選實例 | -Filter 的WQL條件 | 不是PowerShell ScriptBlock |
| 選取屬性 | -Property後再Select-Object | 查詢與顯示分開 |
| 重用連線 | New-CimSession／-CimSession | 指定主機預設WSMan |
| 清理工作階段 | Remove-CimSession於finally | 不代表遠端資料被刪除 |

## 練習題

1. CIM、WMI各是什麼？
2. WSMan與DCOM是資料類別嗎？
3. CimSession等於PSSession嗎？
4. PowerShell7仍有Get-WmiObject嗎？
5. Linux安裝PowerShell就有Win32_OperatingSystem嗎？
6. Get-CimInstance回傳持續更新的監看嗎？
7. 本機OS範例選哪些屬性？
8. 篩選目前程序的WQL條件？
9. Filter能直接放PowerShell的Where-Object區塊嗎？
10. Property和Filter差異？
11. Select-Object一定減少遠端傳輸嗎？
12. Property清單是嚴格遮蔽保證嗎？
13. New-CimSession不指定ComputerName的預設？
14. 指定ComputerName時預設使用什麼？
15. Remove-CimSession會刪除遠端主機嗎？
16. 為何session預設null並在finally檢查？
17. New-CimSessionOption成功代表連線成功嗎？
18. TCP成功就代表有WMI權限嗎？
19. 合成PSCustomObject可證明CIM整合通過嗎？
20. Get開頭的任意類別查詢都能當零副作用嗎？

## 參考答案與解題思路

1. CIM是管理資訊模型，WMI是Windows管理基礎設施。

2. 不是，是通訊／傳輸相關機制。

3. 不等於，CIM工作階段不是任意PowerShell遠端命令工作階段。

4. 已移除，舊腳本需評估移轉至CimCmdlets。

5. 不能如此假設，本版CimCmdlets文件標示Windows專用。

6. 不是，通常是查詢當下的實例快照。

7. Caption、Version、BuildNumber。

8. ProcessId = 目前PID的整數值。

9. 不能，它使用WQL條件語法。

10. Property選屬性，Filter縮小實例範圍。

11. 不一定，它在資料回到PowerShell後才處理。

12. 不是，可能仍有鍵或必要屬性。

13. 本機DCOM工作階段。

14. WSMan，需符合目標環境設定。

15. 不會，只清理本機CIM工作階段物件。

16. 即使連線或查詢失敗，仍能僅清理已建立的工作階段。

17. 不代表，它只建立選項物件。

18. 不代表，帳戶驗證與授權仍需檢查。

19. 不能，只能測本機資料整理邏輯。

20. 不能，需查類別與產品文件，避免可能觸發修復或昂貴操作的盤點。

## 參考資料與延伸閱讀

- [Get-CimInstance](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Get-CimInstance.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [New-CimSession](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/New-CimSession.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [New-CimSessionOption](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/New-CimSessionOption.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Remove-CimSession](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/CimCmdlets/Remove-CimSession.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [about_WMI](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_WMI.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [about_Remote_Requirements](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Core/About/about_Remote_Requirements.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。

## 驗證狀態

Windows本機／遠端CIM均未執行；完成語法與文件查證，合成資料測試只涵蓋欄位整理，不代表整合通過。 詳見[驗證紀錄](../../progress/VALIDATION.md)。
