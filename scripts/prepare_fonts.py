"""Prepare licensed, pinned TrueType subsets for reliable CJK PDF text mappings."""
from pathlib import Path
from urllib.request import urlopen
import hashlib
from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont
from fontTools import subset

ROOT=Path(__file__).resolve().parents[1]
CACHE=Path('/workspace/handbook-tools/fonts')
EXPECTED='864727d210d54f2537bbe23b3a839436c3992af72de9322af5270897246bd44f'


def main():
    CACHE.mkdir(parents=True,exist_ok=True)
    original=CACHE/'NotoSansTC[wght].ttf'
    if not original.exists():
        url='https://raw.githubusercontent.com/google/fonts/e7db6ca603fd4862010383ff17ffd6cc4ffac1c0/ofl/notosanstc/NotoSansTC%5Bwght%5D.ttf'
        with urlopen(url,timeout=90) as response:
            data=response.read()
        if hashlib.sha256(data).hexdigest()!=EXPECTED:
            raise SystemExit('Font checksum mismatch; review upstream change before updating')
        original.write_bytes(data)
    assert hashlib.sha256(original.read_bytes()).hexdigest()==EXPECTED
    output=ROOT/'assets/fonts';output.mkdir(exist_ok=True)
    # Only used Unicode characters remain, avoiding alternate radical mappings.
    texts=''.join(p.read_text() for p in (ROOT/'docs').rglob('*.md'))
    texts+=''.join(p.read_text() for p in (ROOT/'data').glob('*.json'))
    texts+=''.join(p.read_text() for p in (ROOT/'scripts').glob('*.py'))
    chars=set(map(ord,texts))|set(range(32,127))
    for label,weight in [('Regular',400),('Bold',700)]:
        font=instantiateVariableFont(TTFont(original),{'wght':weight},inplace=True)
        opts=subset.Options();opts.recalc_timestamp=False
        opts.name_IDs=[0,1,2,3,4,5,6,13,14]
        sub=subset.Subsetter(options=opts);sub.populate(unicodes=chars);sub.subset(font)
        for record in font['name'].names:
            replacement={1:'Handbook CJK',2:label,4:'Handbook CJK '+label,6:'HandbookCJK-'+label}.get(record.nameID)
            if replacement:
                record.string=replacement.encode(record.getEncoding())
        font.save(output/f'HandbookCJK-{label}.ttf')
    print('Prepared licensed TrueType CJK subsets')


if __name__=='__main__':
    main()
