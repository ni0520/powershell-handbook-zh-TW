"""Regression: Markdown transforms must leave literal code byte-for-byte intact."""
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'scripts'))
from build import combine
import book_config


class BuildCodePreservation(unittest.TestCase):
    def test_final_chapter_does_not_invent_reversed_remaining_range(self):
        original = book_config.CHAPTER_COUNT
        try:
            book_config.CHAPTER_COUNT = book_config.BOOK['planned_chapters']
            scope = book_config.scope_text()
            self.assertNotIn('第 41–40', scope)
            self.assertIn('500+ 指令索引', scope)
        finally:
            book_config.CHAPTER_COUNT = original

    def test_code_comments_links_and_heading_boundaries(self):
        code = '```powershell\n# Heading-like comment\n# [Literal link](missing.md)\n$x = "[item](missing-too.md)"\n```'
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)/'sample.md'
            path.write_text('# Real heading\n\n' + code + '\n\n## Next heading\n')
            rendered = combine([path])
        self.assertIn(code, rendered)
        self.assertIn('# Real heading {#sample-s1}', rendered)
        self.assertIn('## Next heading {#sample-s2}', rendered)
        self.assertNotIn('Heading-like comment {#', rendered)


if __name__ == '__main__':
    unittest.main()
