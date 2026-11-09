"""Egyetlen, önálló HTML fájl készítése: python3 build.py [kimenet.html]"""
import sys, pathlib
root = pathlib.Path(__file__).parent
html = (root / 'index.html').read_text(encoding='utf-8')
lib = (root / 'lib/xlsx.full.min.js').read_text(encoding='utf-8').replace('</script', '<\\/script')
tag = '<script src="lib/xlsx.full.min.js"></script>'
assert tag in html
out = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else root / 'dist/helpdesk-seged.html')
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text(html.replace(tag, '<script>' + lib + '</script>'), encoding='utf-8')
print(out, out.stat().st_size)
