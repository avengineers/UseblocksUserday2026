# /// script
# requires-python = ">=3.10"
# dependencies = ["segno==1.6.6"]
# ///
"""Make the QR code of the "Questions?" slide.

The QR code points to the published deck and goes to images/qr.png.

Run from the repository root: uv run scripts/make_qr.py
"""

from pathlib import Path

import segno

URL = "https://avengineers.github.io/UseblocksUserday2026/"
ROOT = Path(__file__).resolve().parent.parent


def main() -> None:
    target = ROOT / "images" / "qr.png"
    segno.make(URL, error="m").save(target, scale=10, border=2)
    print(f"{target.relative_to(ROOT)} -> {URL}")


if __name__ == "__main__":
    main()
