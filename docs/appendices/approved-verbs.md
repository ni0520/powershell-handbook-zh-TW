<a id="approved-verbs"></a>

# PowerShell動詞字典與命名例外

[返回目錄](../README.md)

範圍：PowerShell7.6.8／Debian13的Get-Verb實際列出100項。此清單含Ping保留例外，不可全部稱作新命令建議動詞。另有ForEach、Sort、Tee、Where等既有語言／命令的保留用法，不應任意仿造新名稱。

中文功能與記憶提示為教材重新編寫，範例從本版已查證命令索引挑選；沒有對應條目時明確留空，不臆造命令。列出命令名稱不表示執行或授權。

New與Add、New與Set、Get與Read、Find與Search、Invoke與Start的差異依官方命名指南解釋；每個實際命令的同步／非同步、副作用與輸出仍以自己的契約為準。動詞表中的括號縮寫是命名慣例，不等於當前工作階段存在同名Alias。


## Common（動詞分組）


<a id="verb-add"></a>

### Add（加入）

把項目加入既有容器，與建立新資源的New不同。

命令例子：Add-Content、Add-Member、Add-History。容易混淆：Remove、New。

記憶：往既有容器加一項；New才是做新的。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-clear"></a>

### Clear（清空）

移除內容但保留容器，與移除項目的Remove不同。

命令例子：Clear-Content、Clear-History、Clear-Host。容易混淆：Remove。

記憶：清空內容，容器還在。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-close"></a>

### Close（關閉）

使資源不可使用，通常與Open成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Open。

記憶：把門關起來，對照Open開門。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-copy"></a>

### Copy（複製）

建立另一份資源而保留來源，與Move不同。

命令例子：Copy-Item、Copy-ItemProperty。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：來源留著，再複製一份。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-enter"></a>

### Enter（進入）

進入特定情境或工作階段，與Exit成對。

命令例子：Enter-PSSession、Enter-PSHostProcess。容易混淆：Exit。

記憶：走進情境，Exit再走出來。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-exit"></a>

### Exit（離開）

離開目前情境，不代表刪除底層資源。

命令例子：Exit-PSSession、Exit-PSHostProcess。容易混淆：Enter。

記憶：離開房間，不是拆掉房間。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-find"></a>

### Find（尋找物件）

尋找符合條件的物件，不與Search建立資源參照的命名語意混用。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Search。

記憶：找物件本身，不把口語Search直接套進命名。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-format"></a>

### Format（格式化呈現）

安排物件顯示方式，不是一般資料投影。

命令例子：Format-Table、Format-List、Format-Wide。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：排版給人看，Select才選資料。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-get"></a>

### Get（取得）

讀取資訊或取得資源物件，不直接等於讀取所有內部內容。

命令例子：Get-Command、Get-Help、Get-Location。容易混淆：Read。

記憶：問現在有什麼，Set才改設定。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-hide"></a>

### Hide（隱藏）

讓資源不顯示，與Show成對；隱藏不等於權限保護。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Show。

記憶：藏起來而非刪掉，也不等於保密。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-join"></a>

### Join（結合）

把部分組成一個整體，與Split成對。

命令例子：Join-Path、Join-String。容易混淆：Split。

記憶：零件接起來，Split再拆開。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-lock"></a>

### Lock（鎖定）

限制資源變更或使用，與Unlock成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Unlock。

記憶：先鎖住，Unlock再解鎖。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-move"></a>

### Move（搬移）

移動資源位置，與保留來源的Copy不同。

命令例子：Move-Item、Move-ItemProperty。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：帶走來源，Copy則留下來源。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-new"></a>

### New（建立）

建立新資源，與向既有容器加入項目的Add不同。

命令例子：New-Item、New-ItemProperty、New-CimSession。容易混淆：Set、Add。

記憶：做一個新的，Add是加進既有的。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-open"></a>

### Open（開啟）

讓資源進入可用狀態，與Close成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Close。

記憶：打開可用，Close關閉。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-optimize"></a>

### Optimize（最佳化）

調整資源以改善效率，仍需實際量測結果。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Measure。

記憶：目標是更有效率；要用Measure驗結果。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-push"></a>

### Push（推入）

把項目加入堆疊頂端，與Pop成對。

命令例子：Push-Location。容易混淆：Pop。

記憶：推上堆疊頂端，Pop從頂端拿走。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-pop"></a>

### Pop（彈出）

從堆疊頂端取出項目，與Push成對。

命令例子：Pop-Location。容易混淆：Push。

記憶：從頂端彈出，不是任意挑一項。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-redo"></a>

### Redo（重做）

重新套用先前復原的動作，與Undo成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Undo。

記憶：把Undo復原的動作再做一次。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-remove"></a>

### Remove（移除）

從容器或情境移除資源，不等同只清內容的Clear。

命令例子：Remove-Item、Remove-ItemProperty、Remove-CimSession。容易混淆：Add、Clear。

記憶：資源離開，Clear只清內容。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-rename"></a>

### Rename（重新命名）

改變資源名稱，不直接代表搬移內容。

命令例子：Rename-Item、Rename-ItemProperty。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：換名字，不先假設搬了位置。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-reset"></a>

### Reset（重設）

讓資源回到預先定義的狀態，不保證等同復原上一個動作。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：回到預設，不一定回到上一步。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-resize"></a>

### Resize（調整大小）

改變資源容量或尺寸，需確認資料與服務影響。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：改大小，先想容量與資料影響。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-search"></a>

### Search（建立搜尋參照）

依官方命名指南指在容器中建立資源參照，不以一般口語搜尋取代Find。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Find。

記憶：官方命名重點在資源參照，與Find尋物區分。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-select"></a>

### Select（選取）

從集合選出物件或屬性，不等同格式化呈現。

命令例子：Select-Object、Select-String、Select-Xml。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：挑物件或欄位，Format才安排畫面。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-set"></a>

### Set（設定）

修改資源狀態或屬性，部分命令也可能建立不存在項目。

命令例子：Set-Location、Set-Content、Set-ItemProperty。容易混淆：New。

記憶：改現有設定；命令仍可能建立不存在的項目。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-show"></a>

### Show（顯示）

讓資源可見，與Hide成對；顯示不代表可修改。

命令例子：Show-Markdown。容易混淆：Hide。

記憶：給人看見，Hide則藏起來。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-skip"></a>

### Skip（略過）

跳過序列中的項目或位置，不直接視為錯誤處理。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：跳過這一站，不代表已解決錯誤。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-split"></a>

### Split（拆分）

把資源分成部分，與Join成對。

命令例子：Split-Path。容易混淆：Join。

記憶：拆成部分，Join再接起來。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-step"></a>

### Step（步進）

前進到序列中的下一點，常用於逐步處理情境。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：一次走一步，不是一口氣跑完。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-switch"></a>

### Switch（切換）

在兩種資源、狀態或責任間切換，不等於新建資源。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：在狀態間切換，不是新增一個。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-undo"></a>

### Undo（復原）

回到先前狀態，與Redo成對；是否可回滾仍看命令契約。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Redo。

記憶：撤回到先前狀態；能否回滾仍看實作。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-unlock"></a>

### Unlock（解除鎖定）

釋放既有鎖定，與Lock成對；需適當權限。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Lock。

記憶：解開先前的Lock。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-watch"></a>

### Watch（監看）

持續觀察資源變化，不等同一次Get查詢。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：持續看變化，Get通常只問一次。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


## Communications（動詞分組）


<a id="verb-connect"></a>

### Connect（連接）

建立資源間連接，與Disconnect成對。

命令例子：Connect-WSMan。容易混淆：Disconnect。

記憶：接上連線，Disconnect再斷開。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-disconnect"></a>

### Disconnect（中斷連接）

解除連接，不自動撤銷帳戶權限或刪除資源。

命令例子：Disconnect-WSMan。容易混淆：Connect。

記憶：斷線不等於刪帳號或撤權。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-read"></a>

### Read（讀取內容）

打開資源並取出內容，與Get取得資訊或存取物件區分。

命令例子：Read-Host。容易混淆：Get。

記憶：往裡讀內容；Get可先拿到資源物件。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-receive"></a>

### Receive（接收）

取得由其他來源傳來的資料，是否消耗緩衝依命令而定。

命令例子：Receive-Job。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：領取送來的結果，工作本身要另查。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-send"></a>

### Send（傳送）

把資料送到目的地，送出不保證對方業務處理成功。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：送出去，不保證對方辦完。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-write"></a>

### Write（寫出）

將資料寫入目的地或串流，不限實體檔案。

命令例子：Write-Output、Write-Error、Write-Warning。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：寫到某個目的地，不只寫檔。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


## Data（動詞分組）


<a id="verb-backup"></a>

### Backup（備份）

建立可供還原的資源副本，需另驗收還原能力。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Restore、Checkpoint。

記憶：留一份可還原副本；別忘了驗Restore。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-checkpoint"></a>

### Checkpoint（建立檢查點）

保存特定時點狀態，不直接取代完整備份。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Backup。

記憶：記住這一刻，不直接當完整備份。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-compare"></a>

### Compare（比較）

檢查兩組資源的差異，結果契約需明確定義。

命令例子：Compare-Object。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：左右比差異，先定義比較規則。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-compress"></a>

### Compress（壓縮）

以壓縮表示保存資料，與Expand成對。

命令例子：Compress-Archive。容易混淆：Expand。

記憶：收緊成壓縮表示，Expand再展開。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-convert"></a>

### Convert（轉換）

同時描述來源與目的的轉換動作；具方向時考慮ConvertTo或ConvertFrom。

命令例子：Convert-Path。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：說清楚來源與目的，別只說變格式。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-convertfrom"></a>

### ConvertFrom（從格式轉入）

由指定來源格式轉成目前可處理的表示。

命令例子：ConvertFrom-Json、ConvertFrom-Csv、ConvertFrom-StringData。容易混淆：ConvertTo。

記憶：從某種格式讀進來。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-convertto"></a>

### ConvertTo（轉成格式）

將目前資料轉為指定目的格式。

命令例子：ConvertTo-Json、ConvertTo-Csv、ConvertTo-Xml。容易混淆：ConvertFrom。

記憶：轉成某種格式送出去。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-dismount"></a>

### Dismount（卸載掛接）

解除資源掛接，不等於刪除資源，與Mount成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Mount。

記憶：解除掛接，不刪底層資料。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-edit"></a>

### Edit（編輯）

以編輯方式修改資源；不是單純查詢。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：進入修改情境，先確認影響。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-expand"></a>

### Expand（展開）

解開壓縮或擴充表示，與Compress成對。

命令例子：Expand-Archive。容易混淆：Compress。

記憶：把壓縮表示展開，不代表內容可信。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-export"></a>

### Export（匯出）

把資源保存或送到另一環境／格式，與Import成對。

命令例子：Export-Csv、Export-Clixml、Export-ModuleMember。容易混淆：Import、Save。

記憶：帶出目前環境，Import再帶進來。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-group"></a>

### Group（分組）

依條件將物件分群，分組物件不等於原始列。

命令例子：Group-Object。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：分群後看到的是群組，不是原始列。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-import"></a>

### Import（匯入）

把外部資源帶入目前環境，可能涉及程式載入。

命令例子：Import-Csv、Import-Clixml、Import-Module。容易混淆：Export。

記憶：帶進來，可能連程式都載入。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-initialize"></a>

### Initialize（初始化）

準備資源的起始狀態，可能清除既有設定或資料。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：準備起始狀態，小心既有內容。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-limit"></a>

### Limit（限制）

設定資源或使用量的上限，不直接等同安全授權。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：設定上限，不是授予權限。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-merge"></a>

### Merge（合併）

把多個資源合成一個，需明確處理衝突與重複。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：多份合一份，先處理衝突。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-mount"></a>

### Mount（掛接）

使資源以可存取方式連入環境，與Dismount成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Dismount。

記憶：掛進來可存取，Dismount再卸載。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-out"></a>

### Out（輸出到目的地）

將呈現或資料送到輸出端，不保證保留原始物件。

命令例子：Out-String、Out-File、Out-Null。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：送往輸出端，先想是否仍是物件。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-publish"></a>

### Publish（發布）

使資源可供其他人使用，與Unpublish成對；需發布授權。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Unpublish。

記憶：讓別人能用，先有發布授權。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-restore"></a>

### Restore（還原）

從備份或已保存狀態恢復資源，不同於重跑原始工作。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Backup。

記憶：從保存狀態回來，不是重新跑原工作。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-save"></a>

### Save（保存）

將目前資源狀態持久保存，與匯出到另一表示的Export區分。

命令例子：Save-Help。容易混淆：Export。

記憶：保存目前狀態，Export另談外部表示。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-sync"></a>

### Sync（同步）

讓兩端資源達到指定一致狀態，需定義衝突與方向。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：讓兩端一致，先定方向與衝突規則。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-unpublish"></a>

### Unpublish（取消發布）

使已發布資源不再對外提供，不等同刪除所有副本。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Publish。

記憶：停止提供，不保證收回所有副本。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-update"></a>

### Update（更新）

把既有資源帶到較新狀態，與建立新資源的New不同。

命令例子：Update-Help、Update-FormatData、Update-TypeData。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：更新已有資源，不只是建立新的。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


## Diagnostic（動詞分組）


<a id="verb-debug"></a>

### Debug（偵錯）

觀察與控制程式執行以定位問題，可能暫停工作。

命令例子：Debug-Job、Debug-Runspace。容易混淆：Trace。

記憶：停下來看問題，Trace留下過程。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-measure"></a>

### Measure（量測）

取得數量、耗時或其他觀察值，不代表已最佳化。

命令例子：Measure-Command、Measure-Object。容易混淆：Optimize。

記憶：先量再談Optimize，別只憑感覺。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-ping"></a>

### Ping（保留動詞）

Get-Verb可能列出，但官方不建議新命令使用；連線驗證使用Test命名。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Test。

記憶：看見名字不代表建議使用；新命名用Test。 狀態：保留例外，避免為新命令使用，優先Test。


<a id="verb-repair"></a>

### Repair（修復）

把損壞資源恢復至可用狀態，仍可能修改系統。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：修好資源，通常會改動狀態。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-resolve"></a>

### Resolve（解析）

把表示轉為可用的資源或完整資訊，不是任意目標安全檢查。

命令例子：Resolve-DnsName、Resolve-Path。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：把表示解成資源，不保證目標安全。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-test"></a>

### Test（測試）

檢查條件或能力，結果範圍依命令契約，不保證完整健康。

命令例子：Test-Path、Test-Connection、Test-NetConnection。容易混淆：Ping。

記憶：驗某個條件，不自動代表全面健康。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-trace"></a>

### Trace（追蹤）

收集執行或通訊過程的資料，需管控敏感日誌。

命令例子：Trace-Command。容易混淆：Debug。

記憶：記過程，別把秘密一起留下。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


## Lifecycle（動詞分組）


<a id="verb-approve"></a>

### Approve（核准）

允許待處理動作進行，與Deny成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Deny。

記憶：批准可以做，Deny拒絕做。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-assert"></a>

### Assert（斷言）

明確要求條件成立，不成立時按契約回報失敗。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：要求條件成立，不成立就回報。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-build"></a>

### Build（建置）

由輸入組成可用產物，需另驗證依賴與產物。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：把輸入組成產物，還要驗產物。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-complete"></a>

### Complete（完成）

將操作標記或推進到完成狀態，不只顯示進度。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：走到流程終點，不只把進度畫到滿。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-confirm"></a>

### Confirm（確認）

明確確認條件或操作，與一般資料查詢不同。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：明確確認，不只是讀取資料。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-deny"></a>

### Deny（拒絕）

不允許待處理動作，與Approve成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Approve。

記憶：拒絕請求，與Approve核准相對。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-deploy"></a>

### Deploy（部署）

把產物安置到目標環境，涉及授權與回復策略。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：把產物放到目標，先想回復方式。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-disable"></a>

### Disable（停用）

讓功能不可使用但保留其定義，與Enable成對。

命令例子：Disable-PSBreakpoint、Disable-RunspaceDebug。容易混淆：Enable。

記憶：先不能用，定義通常還在。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-enable"></a>

### Enable（啟用）

讓既有功能可使用，與Disable成對。

命令例子：Enable-PSBreakpoint、Enable-RunspaceDebug。容易混淆：Disable。

記憶：讓既有功能能用，不代表建立新功能。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-install"></a>

### Install（安裝）

把軟體或資源加入環境，不等於載入目前工作階段。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Uninstall。

記憶：裝進環境，不只是Import到工作階段。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-invoke"></a>

### Invoke（呼叫執行）

執行動作並等待結果的命名語意，與啟動非同步工作的Start區分。

命令例子：Invoke-RestMethod、Invoke-History、Invoke-Command。容易混淆：Start。

記憶：呼叫動作並處理結果，不從名字猜每個命令的生命週期。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-register"></a>

### Register（註冊）

在系統或工作階段登記資源、事件或能力，與Unregister成對。

命令例子：Register-ArgumentCompleter、Register-EngineEvent、Register-ObjectEvent。容易混淆：Unregister。

記憶：先登記，Unregister再取消登記。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-request"></a>

### Request（提出要求）

向其他來源要求資源或動作，不保證已被核准。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：提出要求，還不等於拿到核准。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-restart"></a>

### Restart（重新啟動）

先停止再開始資源，可能中斷服務。

命令例子：Restart-Service。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：停過再啟動，可能造成服務中斷。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-resume"></a>

### Resume（繼續）

從暫停處恢復，與Suspend成對，不等於重新開始。

命令例子：Resume-Service。容易混淆：Suspend。

記憶：從暫停處繼續，不是從頭Start。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-start"></a>

### Start（啟動）

開始程序或自主工作，不代表工作已完成。

命令例子：Start-Process、Start-Job、Start-Sleep。容易混淆：Invoke、Stop。

記憶：開始跑，不等於已跑完。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-stop"></a>

### Stop（停止）

停止正在執行的資源，不自動回滾既有副作用。

命令例子：Stop-Process、Stop-Job、Stop-Transcript。容易混淆：Start。

記憶：停止跑，不等於把副作用撤回。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-submit"></a>

### Submit（提交處理）

將資源送入後續工作流程，不代表後端已完成處理。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：交進流程，不等於後端辦完。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-suspend"></a>

### Suspend（暫停）

保留可恢復狀態並停止進行，與Resume成對。

命令例子：Suspend-Service。容易混淆：Resume。

記憶：暫停保留恢復點，Resume再繼續。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-uninstall"></a>

### Uninstall（解除安裝）

移除已安裝軟體或資源，不等同Remove-Module移出工作階段。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Install。

記憶：從環境解除安裝，不是只移出模組工作階段。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-unregister"></a>

### Unregister（取消註冊）

移除登記資訊，不一定刪除底層資源或已產生資料。

命令例子：Unregister-Event。容易混淆：Register。

記憶：取消登記，既有資料可能還在。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-wait"></a>

### Wait（等待）

等待條件或狀態，逾時及取消行為需看具體命令。

命令例子：Wait-Process、Wait-Job、Wait-Event。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：等條件，逾時不一定會取消工作。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


## Other（動詞分組）


<a id="verb-use"></a>

### Use（使用指定資源）

讓後續操作使用指定資源或情境，需明確管理作用範圍。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：以本動詞的動作對象與結果辨識，不借用同義字替代。

記憶：選定後續使用資源，先看作用範圍。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


## Security（動詞分組）


<a id="verb-block"></a>

### Block（封鎖）

阻止存取或進行，與Unblock成對；可能影響其他工作。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Unblock。

記憶：先擋住，Unblock解除阻擋。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-grant"></a>

### Grant（授予）

賦予權限或存取能力，與Revoke成對。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Revoke。

記憶：把權限交出去，Revoke再撤銷。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-protect"></a>

### Protect（保護）

以適當機制限制資源存取或內容暴露，與Unprotect成對。

命令例子：Protect-CmsMessage。容易混淆：Unprotect。

記憶：加上保護，仍需正確機制與金鑰。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-revoke"></a>

### Revoke（撤銷）

移除先前授予的權限，不保證已取得副本被收回。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Grant。

記憶：撤權不代表收回已拿走的資料。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-unblock"></a>

### Unblock（解除封鎖）

移除既有阻擋，需先確認來源與安全政策。

命令例子：本版尚未收錄對應命令；不臆造範例。容易混淆：Block。

記憶：解除既有阻擋，不先假設來源可信。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


<a id="verb-unprotect"></a>

### Unprotect（解除保護）

在適當授權下還原可用內容，可能產生敏感明文。

命令例子：Unprotect-CmsMessage。容易混淆：Protect。

記憶：解除保護後可能成為明文，小心輸出。 狀態：本版Get-Verb列出；仍依官方命名規範使用。


## 官方來源與驗證

[Approved verbs](https://github.com/MicrosoftDocs/PowerShell-Docs/blob/a3de8f22552170e70852470d46cd52cd9ca471ec/reference/docs-conceptual/developer/cmdlet/approved-verbs-for-windows-powershell-commands.md) — Microsoft固定快照，查閱2026-10-24。清單以本機Get-Verb比對，並非對應所有產品命令的功能測試；資料在data/approved-verbs.json，實際比對證據在progress/verb-runtime-results.json。

[版本與附錄導讀](../chapters/40-reference-appendices.md)；[參考來源](sources.md)。
