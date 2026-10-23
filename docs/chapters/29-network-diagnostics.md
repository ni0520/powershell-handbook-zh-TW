<a id="chapter-29"></a>

# 第 29 章：網路、DNS 與連線診斷

[返回目錄](../README.md)

## 學習目標

把名稱解析、IP可達性、TCP連線、TLS與應用程式回應分開判斷；理解跨平台與Windows網路命令的差異，選擇明確核准的目標與連接埠，不因單一False就宣稱伺服器故障。

## 依層次縮小問題

DNS（網域名稱系統）回答名稱如何對應位址。ICMP（網際網路控制訊息協定）回應測試與TCP（傳輸控制協定）連接埠建立測試不同。TCP成功之後，TLS（傳輸層安全協定）、HTTP與應用程式登入仍可能失敗。

| 觀察 | 可支持的結論 | 不能直接推論 |
|---|---|---|
| DNS解析成功 | 此查詢取得名稱紀錄 | TCP服務可用 |
| ICMP成功 | 該路徑允許回應 | 所有連接埠開放 |
| TCP建立成功 | 特定目標／埠能建立連線 | TLS憑證或登入正確 |
| ICMP失敗 | 本次回應測試未成功 | 主機一定關機 |

防火牆、代理、VPN、路由與主機原則都會影響結果。測試要記錄來源環境；雲端的網路結果不能代替讀者桌面或企業VPN內的結果。

## 先檢查輸入，不產生網路流量

```powershell
$parsedAddress = $null
$valid = [Net.IPAddress]::TryParse('127.0.0.1', [ref]$parsedAddress)
[pscustomobject]@{
    Valid = $valid
    Loopback = if ($valid) { [Net.IPAddress]::IsLoopback($parsedAddress) } else { $false }
}
```

預期兩欄均True。TryParse只驗證位址表示法，不代表目標存在或可連線。127.0.0.1與::1是回送位址，指目前執行環境本身；在容器裡通常不是讀者電腦。

## PowerShell7：限定一次回送測試

```powershell
Test-Connection -TargetName '127.0.0.1' -Count 1 -TimeoutSeconds 1 -Quiet
```

成功時回傳True；失敗原因可能是工具缺少、權限、ICMP限制或其他環境條件。本雲端實際嘗試回報「找不到系統ping工具」，因此本輪ICMP連線測試未完成，不能把它寫成False或已通過。沒有為此變更網路原則或提升權限。

PowerShell7的TargetName、TimeoutSeconds、TcpPort與回傳物件不同於某些Windows PowerShell5.1教學。先用 `Get-Command Test-Connection -Syntax` 查本機；Quiet適合布林結果，預設回傳更完整的PingStatus資訊。多個目標的結果不應不加辨識地混成一個布林值。

以下只展示7.6的TCP語法，`$approvedHost`須先由呼叫端提供已核准的單一目標；此片段本輪未執行。

```powershell
Test-Connection -TargetName $approvedHost -TcpPort 443 -Count 1 -TimeoutSeconds 3
```

沒有測試授權時，不要把整段IP範圍或大量連接埠帶入迴圈。這裡的443只是常見HTTPS連接埠，不保證目標在該埠提供HTTPS。

## Windows：分開查DNS與TCP

Resolve-DnsName屬於DnsClient，Test-NetConnection屬於NetTCPIP；不是所有PowerShell7安裝的跨平台內建命令。以下需要Windows及相應模組，example.test是示意名稱，請改成已核准目標後才執行。

```powershell
if ($env:OS -ne 'Windows_NT') { throw '此範例需要 Windows 模組' }
$approvedHost = 'server01.example.test'
Resolve-DnsName -Name $approvedHost -Type A -DnsOnly -ErrorAction Stop |
    Select-Object Name, Type, IPAddress
Test-NetConnection -ComputerName $approvedHost -Port 443 -InformationLevel Detailed
```

A紀錄是IPv4，AAAA是IPv6；實際回應也可能包含別名或其他紀錄。DnsOnly只使用DNS，不回退到LLMNR／NetBIOS。指定Server會改變查詢對象，不能隨意繞過組織DNS。CacheOnly看到快取內容，不等於重新向權威伺服器查詢。

查看Test-NetConnection的TcpTestSucceeded，而不是只看PingSucceeded。此命令不帶ComputerName時可能測試預設外部目標，本教材一律明確指定目標，避免讀者以為只查本機。DNS解析結果不同時，記錄實際測到的IP與位址家族。

## 介面與代理的脈絡

```powershell
# Windows唯讀；分享輸出前檢查內部位址與網路名稱
Get-NetIPConfiguration | Select-Object InterfaceAlias, IPv4Address, IPv4DefaultGateway
```

多張網卡可能有多個來源位址與路由，VPN也會改變路徑。HTTP代理能影響網頁請求，但不代表一般TCP或ICMP都經過相同代理。不要因為瀏覽器能開網站就認定任何程式能直接連到同一主機。

## 常見錯誤、安全與最佳實踐

「逾時」是觀察，不是根因；「連線被拒」與「名稱解析失敗」也應分開記錄。先固定目標、埠、協定、逾時與來源，再變更一個條件比較。不要把停用TLS憑證驗證、關閉防火牆或任意加TrustedHosts當一般診斷步驟。

本章不掃描網段、不修改DNS／路由／防火牆，也沒有對企業主機做連線測試。需要測試真實服務時，仍要依使用者授權與網路政策進行。

## 速查表

| 需求 | 方法 | 平台／限制 |
|---|---|---|
| 位址字面格式 | IPAddress.TryParse | 不產生網路查詢 |
| ICMP | Test-Connection -Count 1 | Linux可能需要系統ping工具 |
| 指定TCP埠 | Test-Connection -TcpPort | 查本機版本語法 |
| DNS紀錄 | Resolve-DnsName -DnsOnly | Windows DnsClient |
| TCP詳細診斷 | Test-NetConnection -Port | Windows NetTCPIP，指定目標 |

## 練習題

1. DNS成功代表TCP一定成功嗎？
2. ICMP成功代表所有服務正常嗎？
3. TCP443成功能證明TLS憑證正確嗎？
4. ICMP失敗代表主機一定關機嗎？
5. TryParse會查網路嗎？
6. 127.0.0.1指向什麼？
7. IPv6回送位址是什麼？
8. 本輪Test-Connection實際遇到什麼限制？
9. 為何Count與TimeoutSeconds要明確？
10. Quiet主要用途？
11. PowerShell5.1語法能原封不動套7嗎？
12. Resolve-DnsName屬於哪個模組？
13. Test-NetConnection屬於哪個模組？
14. A與AAAA紀錄差異？
15. DnsOnly會做LLMNR回退嗎？
16. CacheOnly是否等於重新詢問權威伺服器？
17. TCP診斷應讀哪個欄位？
18. 為何一律指定ComputerName？
19. HTTP代理可用代表直接TCP可用嗎？
20. 遇TLS錯誤應先關閉驗證嗎？

## 參考答案與解題思路

1. 不代表，名稱解析與連線建立是不同層。

2. 不代表，只觀察到該回應測試成功。

3. 不能，還要驗證TLS與應用程式回應。

4. 不代表，可能被封鎖、工具缺少或環境不支援。

5. 不會，只解析位址表示法。

6. 目前執行環境的回送位址，不一定是讀者實體電腦。

7. ::1。

8. 系統ping工具缺少，ICMP測試未完成。

9. 限制測試次數與等待時間，使操作範圍可預期。

10. 以布林結果表示測試，不提供完整診斷物件。

11. 不能假設，需查本機語法與版本差異。

12. Windows的DnsClient。

13. Windows的NetTCPIP。

14. A對應IPv4，AAAA對應IPv6。

15. 不會，只使用DNS協定。

16. 不是，只查本機快取。

17. TcpTestSucceeded，不能以PingSucceeded替代。

18. 避免使用命令預設外部目標，讓測試範圍明確。

19. 不代表，不同協定可能有不同路由與政策。

20. 不應，應檢查名稱、憑證鏈、時間與核准信任設定。

## 參考資料與延伸閱讀

- [Test-Connection](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/7.6/Microsoft.PowerShell.Management/Test-Connection.md) — Microsoft；PowerShell 7.6；Windows專用性見命令文件；查閱2026-10-24。
- [Resolve-DnsName](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/DnsClient/Resolve-DnsName.md) — Microsoft；Windows Server 2025 模組文件；用戶端與PowerShell相容性需查本機；查閱2026-10-24。
- [Test-NetConnection](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/NetTCPIP/Test-NetConnection.md) — Microsoft；Windows Server 2025 模組文件；用戶端與PowerShell相容性需查本機；查閱2026-10-24。
- [Get-NetIPConfiguration](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/b7645dd8c687139b28e845119da30ec670526507/docset/winserver2025-ps/NetTCPIP/Get-NetIPConfiguration.md) — Microsoft；Windows Server 2025 模組文件；用戶端與PowerShell相容性需查本機；查閱2026-10-24。

## 驗證狀態

位址解析與回送辨識做Linux實測；ICMP因缺少ping工具未完成。Windows DNS／TCP模組與外部目標測試未執行。 詳見[驗證紀錄](../../progress/VALIDATION.md)。
