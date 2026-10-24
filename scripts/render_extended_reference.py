"""Render reviewed index additions and the runtime-scoped verb dictionary."""
from pathlib import Path
import json
import re
ROOT = Path(__file__).resolve().parents[1]

def replace_tail(path, marker, content):
    text = path.read_text()
    text = text.split(marker, 1)[0].rstrip()
    path.write_text(text + '\n\n' + marker + '\n\n' + content.rstrip() + '\n')

def main():
    entries = json.loads((ROOT/'data/cmdlet-index.json').read_text())
    reviews = json.loads((ROOT/'data/command-review-v0.6.json').read_text())
    reviewed = {row['name'] for row in reviews}
    count = len(entries)
    tutorial = sum(row['entry_type'] == 'tutorial' for row in entries)
    quick_count = count - tutorial
    quick = ROOT/'docs/appendices/cmdlet-quick-index.md'
    text = re.sub(r'本版\d+筆僅速查條目', f'本版{quick_count}筆僅速查條目', quick.read_text())
    quick.write_text(text)
    blocks = [f'## v0.6新增速查\n\n本節{len(reviews)}筆為用途與限制查讀，未逐命令功能實測；查不到的命令與Windows能力另行記錄。']
    for row in entries:
        if row['name'] not in reviewed:
            continue
        blocks.append(f'''<a id="{row['id']}"></a>

## {row['name']}（{row['zh_name']}）

{row['description']}

模組：{row['module']}。平台：{'、'.join(row['platform'])}。版本：{row['version']}。類型：僅速查。

[查詢與驗證方法](../chapters/39-command-index.md)；[官方來源]({row['official_source']})。查閱{row['verified_at']}；本機命令發現不等於服務、權限或功能已通過。''')
    replace_tail(quick, '<!-- reviewed-v06-commands -->', '\n\n'.join(blocks))
    master = ROOT/'docs/appendices/master-index.md'
    text = re.sub(r'\d+個命令索引：\d+個十四項教學、\d+個速查', f'{count}個命令索引：{tutorial}個十四項教學、{quick_count}個速查', master.read_text())
    master.write_text(text)
    blocks = ['## v0.6新增命令索引\n']
    for row in sorted(entries, key=lambda row: row['name']):
        if row['name'] in reviewed:
            blocks.append(f'- [{row["name"]}（{row["zh_name"]}）](../../{row["tutorial"]})：{row["description"]}')
    blocks.append('\n[100項動詞參考](approved-verbs.md)包含保留例外，不能由Get-Verb出現就推定適合新命令命名。')
    replace_tail(master, '<!-- reviewed-v06-index -->', '\n'.join(blocks))
    verbs = json.loads((ROOT/'data/approved-verbs.json').read_text())
    blocks = ['''<a id="approved-verbs"></a>

# PowerShell動詞字典與命名例外

[返回目錄](../README.md)

範圍：PowerShell7.6.8／Debian13的Get-Verb實際列出100項。此清單含Ping保留例外，不可全部稱作新命令建議動詞。另有ForEach、Sort、Tee、Where等既有語言／命令的保留用法，不應任意仿造新名稱。

中文功能與記憶提示為教材重新編寫，範例從本版已查證命令索引挑選；沒有對應條目時明確留空，不臆造命令。列出命令名稱不表示執行或授權。

New與Add、New與Set、Get與Read、Find與Search、Invoke與Start的差異依官方命名指南解釋；每個實際命令的同步／非同步、副作用與輸出仍以自己的契約為準。動詞表中的括號縮寫是命名慣例，不等於當前工作階段存在同名Alias。
''']
    for group in dict.fromkeys(row['group'] for row in verbs):
        blocks.append(f'## {group}（動詞分組）\n')
        for row in (row for row in verbs if row['group'] == group):
            examples = '、'.join(row['examples']) or '本版尚未收錄對應命令；不臆造範例'
            confused = '、'.join(row['confusable']) or '以本動詞的動作對象與結果辨識，不借用同義字替代'
            status = '保留例外，避免為新命令使用，優先Test' if row['verb'] == 'Ping' else '本版Get-Verb列出；仍依官方命名規範使用'
            blocks.append(f'''<a id="verb-{row['verb'].lower()}"></a>

### {row['verb']}（{row['chinese']}）

{row['description']}

命令例子：{examples}。容易混淆：{confused}。

記憶：{row['memory']} 狀態：{status}。
''')
    blocks.append(f"## 官方來源與驗證\n\n[Approved verbs]({verbs[0]['official_source']}) — Microsoft固定快照，查閱2026-10-24。清單以本機Get-Verb比對，並非對應所有產品命令的功能測試；資料在data/approved-verbs.json，實際比對證據在progress/verb-runtime-results.json。\n\n[版本與附錄導讀](../chapters/40-reference-appendices.md)；[參考來源](sources.md)。")
    (ROOT/'docs/appendices/approved-verbs.md').write_text('\n\n'.join(blocks)+'\n')
    print(f'Rendered {len(reviews)} additions; {len(verbs)} verb entries; {count} unique commands')

if __name__ == '__main__':
    main()
