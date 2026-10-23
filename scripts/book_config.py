"""Shared export naming and scope derived from authored data."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]
BOOK = json.loads((ROOT / 'data/book.json').read_text())
CHAPTER_COUNT = BOOK['chapter_count']
VERSION = BOOK['version']
STEM = f'PowerShell_學習手冊_2026_前{CHAPTER_COUNT}章{BOOK["stage"]}'
TITLE = f'PowerShell 完整繁體中文版學習手冊（2026）｜前 {CHAPTER_COUNT} 章{BOOK["stage"]} {VERSION}'


def scope_text():
    entries = json.loads((ROOT / 'data/cmdlet-index.json').read_text())
    tutorial_count = sum(entry['entry_type'] == 'tutorial' for entry in entries)
    counts = {name: len(json.loads((ROOT / f'data/{name}.json').read_text()))
              for name in ('glossary', 'parameter-index', 'sources')}
    return (f'本版是前 {CHAPTER_COUNT} 章初稿，含 {CHAPTER_COUNT * 20} 題與解答、'
            f'{len(entries)} 個命令索引（{tutorial_count} 個十四項教學、{len(entries)-tutorial_count} 個速查）、'
            f'{counts["glossary"]} 個術語、{counts["parameter-index"]} 個參數、{counts["sources"]} 筆技術來源。'
            f'第 {CHAPTER_COUNT+1}–{BOOK["planned_chapters"]} 章、500+ 指令索引及企業案例尚未完成，並非全書定稿。')
