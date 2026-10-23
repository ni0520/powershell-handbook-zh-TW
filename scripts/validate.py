"""Validate authored data, local links and PowerShell syntax without executing docs."""
from pathlib import Path
import json
import re
import subprocess
import tempfile
from book_config import CHAPTER_COUNT

ROOT = Path(__file__).resolve().parents[1]


def main():
    chapters = sorted((ROOT / 'docs/chapters').glob('*.md'))
    assert chapters, 'No chapters'
    assert [int(p.name[:2]) for p in chapters] == list(range(1, CHAPTER_COUNT+1)), 'Scope/chapter numbering mismatch'
    for p in chapters:
        text = p.read_text(encoding='utf-8')
        for heading in ['學習目標', '練習題', '參考答案與解題思路', '速查表', '參考資料與延伸閱讀', '驗證狀態']:
            assert f'## {heading}' in text, (p, heading)
        questions = text.split('## 練習題\n', 1)[1].split('## 參考答案', 1)[0]
        answers = text.split('## 參考答案與解題思路\n', 1)[1].split('## 參考資料', 1)[0]
        q = re.findall(r'^\d+\. ', questions, re.M)
        a = re.findall(r'^\d+\. ', answers, re.M)
        assert len(q) >= 20 and len(q) == len(a), (p, len(q), len(a))
        for line in (questions + '\n' + answers).splitlines():
            assert line.count('`') % 2 == 0, (p, 'Broken inline-code delimiter', line)
        assert text.count('```') % 2 == 0, p
    for name in ['sources', 'cmdlet-index', 'parameter-index', 'glossary']:
        data = json.loads((ROOT / f'data/{name}.json').read_text())
        assert isinstance(data, list) and data, name
        assert len({x['id'] for x in data}) == len(data), name
    entries = json.loads((ROOT/'data/cmdlet-index.json').read_text())
    assert len({x['name'] for x in entries}) == len(entries), 'Duplicate command'
    for entry in entries:
        assert entry['entry_type'] in ('tutorial', 'quick-reference'), entry
        assert (ROOT/entry['chapter']).exists(), entry['name']
        path, anchor = entry['tutorial'].split('#')
        contents = (ROOT/path).read_text()
        assert f'<a id="{anchor}"></a>' in contents, entry['name']
        if entry['entry_type'] == 'tutorial':
            section = contents.split(f'<a id="{anchor}"></a>',1)[1].split('<a id=',1)[0]
            for n in range(1,15):
                assert re.search(rf'^### {n}\. ', section, re.M), (entry['name'],n)
    metadata = json.loads((ROOT/'data/runtime-command-metadata.json').read_text(encoding='utf-8-sig'))
    assert {x['Name'] for x in metadata} == {x['name'] for x in entries}, 'Runtime metadata out of date'
    cases = []
    # PROJECT_SPEC preserves user requirements verbatim; it is not authored teaching code.
    docs = list((ROOT/'docs').rglob('*.md'))
    for p in docs:
        text = p.read_text()
        for i, code in enumerate(re.findall(r'```powershell\s*\n(.*?)```', text, re.S), 1):
            cases.append({'name': f'{p.relative_to(ROOT)}:block-{i}', 'code': code})
        for link in re.findall(r'\]\(([^)]+)\)', text):
            if '://' in link or link.startswith('mailto:'):
                continue
            path, _, anchor = link.partition('#')
            target = (p.parent / path).resolve() if path else p
            assert target.exists(), (p, link)
            assert target.is_relative_to(ROOT), (p, link)
            if anchor:
                assert f'<a id="{anchor}"></a>' in target.read_text(), (p, link)
    for directory in ['examples', 'tests', 'scripts']:
        for p in (ROOT/directory).rglob('*'):
            if p.suffix in ('.ps1', '.psm1'):
                cases.append({'name': str(p.relative_to(ROOT)), 'code': p.read_text(encoding='utf-8-sig')})
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', encoding='utf-8') as stream:
        json.dump(cases, stream, ensure_ascii=False)
        stream.flush()
        subprocess.run(['bash', 'scripts/pwsh.sh', '-NoProfile', '-File', 'scripts/Test-Syntax.ps1', '-InputJson', stream.name], cwd=ROOT, check=True)
    print(f'Validated {len(chapters)} chapters, >= {20*len(chapters)} question/answer pairs, JSON, local links, and syntax')


if __name__ == '__main__':
    main()
