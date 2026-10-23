"""Package verified local deliverables; this does not publish a GitHub Release."""
from pathlib import Path
import hashlib
import json
import shutil
import zipfile
from book_config import CHAPTER_COUNT, VERSION, STEM, scope_text

ROOT = Path(__file__).resolve().parents[1]
DIST = ROOT/'dist'


def main():
    verification = json.loads((ROOT/'progress/artifact-results.json').read_text())
    assert verification['status'] == 'passed'
    verified = {entry['name']:entry['sha256'] for entry in verification['files']}
    names = [STEM+suffix for suffix in ('.md','.html','.docx','.pdf','_手機版.pdf')]
    names += ['PowerShell_常用指令速查表_2026'+suffix for suffix in ('.md','.html','.pdf')]
    names += ['PowerShell_參考資料與來源_2026.md']
    for name in names:
        assert hashlib.sha256((DIST/name).read_bytes()).hexdigest() == verified[name], f'Unverified or changed artifact: {name}'
    shutil.copyfile(ROOT/'progress/REPORT.md',DIST/'PowerShell_教材製作報告_2026.md')
    shutil.copyfile(ROOT/'assets/fonts/OFL.txt',DIST/'OFL.txt')
    (DIST/'README_交付.md').write_text(f'''# PowerShell 2026 {VERSION} 交付說明

{scope_text()}

主手冊 HTML 可離線搜尋；手機版 PDF 為獨立 105×185 mm 尺寸。Word 已做結構與重新開啟檢查，尚未用桌面 Microsoft Word 逐頁驗收。Markdown 使用 Pandoc 章節錨點，原始 GitHub 閱讀版另存儲存庫 docs。

本版包含 Pester 5.7.1 功能測試、PSScriptAnalyzer 1.25.0 範例靜態分析及文件檢查。平台驗證僅限 PowerShell 7.6.8 / Debian 13。工具簽章撤銷查詢限制詳見製作報告與儲存庫 progress/tooling。

字型遵循隨附 OFL.txt。SHA256SUMS.txt 用於內容完整性核對，不是發布者簽章。GitHub 原稿與本機交付 ZIP 分開保存；此腳本不發布網站或 Release。
''')
    names += ['PowerShell_教材製作報告_2026.md','OFL.txt','README_交付.md']
    checksums = ''.join(f'{hashlib.sha256((DIST/name).read_bytes()).hexdigest()}  {name}\n' for name in names)
    (DIST/'SHA256SUMS.txt').write_text(checksums)
    names.append('SHA256SUMS.txt')
    output = DIST/f'PowerShell_2026_{VERSION}_前{CHAPTER_COUNT}章交付.zip'
    with zipfile.ZipFile(output,'w',zipfile.ZIP_DEFLATED) as package:
        for name in names:
            package.write(DIST/name,name)
    with zipfile.ZipFile(output) as package:
        assert package.testzip() is None
        for line in package.read('SHA256SUMS.txt').decode().splitlines():
            expected, name = line.split('  ',1)
            assert hashlib.sha256(package.read(name)).hexdigest() == expected,name
    print(f'Verified ZIP: {output.name}; {output.stat().st_size} bytes; {len(names)} files')


if __name__ == '__main__':
    main()
