"""Render reference appendices from reviewed JSON; do not invent index records."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]


def main():
    sources = json.loads((ROOT / 'data/sources.json').read_text())
    output = ['<a id="sources"></a>\n\n# 參考資料與來源\n\n[返回目錄](../README.md)\n\n查閱日期：2026-10-24（臺灣）。來源固定於引用的 Git commit；只查讀教材使用段落，未宣稱全文或所有平台驗證。教材為重新編寫，未大量轉載原文。Pester 的發布者為專案維護者，與 Microsoft 來源分開標示。工具取得與簽章紀錄另見 data/test-tool-sources.json。']
    for entry in sources:
        output.append(f'<a id="source-{entry["id"]}"></a>\n\n## {entry["title"]}\n\n- 發布者：{entry["publisher"]}\n- [原始網址]({entry["url"]})\n- 適用版本：{entry["version"]}\n- 查閱日期：{entry["accessed_at"]}\n- 使用章節：{", ".join(map(str, entry["chapters"]))}\n- 用途：{entry["purpose"]}')
    (ROOT / 'docs/appendices/sources.md').write_text('\n\n'.join(output) + '\n')
    glossary = json.loads((ROOT / 'data/glossary.json').read_text())
    output = ['<a id="glossary"></a>\n\n# 中英文術語表\n\n[返回目錄](../README.md)\n\n依英文排序；HTML 搜尋可輸入中文或英文。條目列出情境、相關命令與來源，對照版本限制請讀對應章節。']
    for entry in sorted(glossary, key=lambda entry: entry['english']):
        output.append(f'<a id="{entry["id"]}"></a>\n\n## {entry["english"]}（{entry["chinese"]}）\n\n{entry["description"]}\n\n情境：{entry["usage"]}。相關命令：{", ".join(entry["related_commands"])}。[對應章節](../../{entry["chapter"]})；[官方來源]({entry["official_source"]})。')
    (ROOT / 'docs/appendices/glossary.md').write_text('\n\n'.join(output) + '\n')
    parameters = json.loads((ROOT / 'data/parameter-index.json').read_text())
    output = ['<a id="parameter-reference"></a>\n\n# 常用參數索引\n\n[返回目錄](../README.md)\n\n同名參數不保證跨命令同義；必要性、型別與是否變更系統必須依具體命令確認。']
    for entry in parameters:
        kind = {'common': '通用參數', 'specific': '命令專屬參數', 'should-process': '支援 ShouldProcess 的風險管理參數'}[entry['kind']]
        output.append(f'<a id="{entry["id"]}"></a>\n\n## {entry["name"]}（{entry["chinese"]}）\n\n類型：{kind}。{entry["description"]}\n\n適用：{", ".join(entry["commands"])}。版本：{entry["version"]}。[對應章節](../../{entry["chapter"]})；[官方來源]({entry["official_source"]})，查閱 {entry["verified_at"]}。')
    (ROOT / 'docs/appendices/parameter-reference.md').write_text('\n\n'.join(output) + '\n')
    print(f'Rendered {len(sources)} sources, {len(glossary)} terms, {len(parameters)} parameters')


if __name__ == '__main__':
    main()
