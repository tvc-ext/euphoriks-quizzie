"""Fail when store artwork or bundled policy diverges from release sources."""
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from html.parser import HTMLParser

root = Path(__file__).resolve().parents[1]
android_ns = '{http://schemas.android.com/apk/res/android}'
svg_ns = '{http://www.w3.org/2000/svg}'
launcher = ET.parse(root / 'store-assets/android/quizzie_launcher.xml').getroot()
store = ET.parse(root / 'store-assets/graphics/app-icon-512.svg').getroot()
launcher_paths = [(p.attrib[android_ns + 'fillColor'], p.attrib[android_ns + 'pathData']) for p in launcher]
store_paths = [(p.attrib['fill'], p.attrib['d']) for p in store.findall(svg_ns + 'path')]
assert launcher_paths == store_paths, 'Store icon differs from Android launcher'
assert store.attrib['viewBox'] == '0 0 108 108', 'Store viewport differs from launcher'

class PolicyText(HTMLParser):
    def __init__(self):
        super().__init__()
        self.active = False
        self.parts = []
    def handle_starttag(self, tag, attrs):
        if tag == 'main':
            self.active = True
    def handle_endtag(self, tag):
        if tag == 'main':
            self.active = False
    def handle_data(self, text):
        if self.active:
            self.parts.append(text)

parser = PolicyText()
parser.feed((root / 'site/privacy/index.html').read_text())
normalize = lambda text: re.sub(r'\s+', ' ', text).strip()
bundled = (root / 'assets/privacy-policy.txt').read_text().split('Published policy:')[0]
assert normalize(''.join(parser.parts)) == normalize(bundled), 'Bundled privacy policy differs from website'
print('Store/launcher artwork and bundled/website privacy policy match.')
