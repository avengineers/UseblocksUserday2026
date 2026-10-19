# /// script
# requires-python = ">=3.10"
# dependencies = ["segno==1.6.6"]
# ///
"""Make the QR code of the "Questions?" slide for each deck.

Each folder docs/<name>/ with an index.html is a deck. The QR code points to the
published deck and goes to docs/images/qr_<name>.png.

Run from the repository root: uv run scripts/make_qr.py
"""

from pathlib import Path

import segno

BASE_URL = "https://avengineers.github.io/UseblocksUserday2026/docs"
ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"


def main() -> None:
    for deck in sorted(p.parent for p in DOCS.glob("*/index.html")):
        url = f"{BASE_URL}/{deck.name}/"
        target = DOCS / "images" / f"qr_{deck.name}.png"
        segno.make(url, error="m").save(target, scale=10, border=2)
        print(f"{target.relative_to(ROOT)} -> {url}")


if __name__ == "__main__":
    main()
