#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/store-assets/graphics"
OUT="${1:-$ROOT/build/store-assets}"

mkdir -p "$OUT"

command -v rsvg-convert >/dev/null 2>&1 || {
  echo "rsvg-convert is required. On Ubuntu/Debian: sudo apt-get install librsvg2-bin" >&2
  exit 1
}

rsvg-convert \
  --width 512 --height 512 \
  "$SRC/app-icon-512.svg" \
  --output "$OUT/euphoriks-quizzie-app-icon-512.png"

rsvg-convert \
  --width 1024 --height 500 \
  "$SRC/feature-graphic-1024x500.svg" \
  --output "$OUT/euphoriks-quizzie-feature-graphic-1024x500.png"

python3 - "$OUT" <<'PY'
from pathlib import Path
import struct
import sys

out = Path(sys.argv[1])
expected = {
    "euphoriks-quizzie-app-icon-512.png": (512, 512),
    "euphoriks-quizzie-feature-graphic-1024x500.png": (1024, 500),
}

for name, dimensions in expected.items():
    path = out / name
    if not path.exists():
        raise SystemExit(f"Missing generated asset: {path}")
    with path.open("rb") as fh:
        signature = fh.read(24)
    if signature[:8] != b"\x89PNG\r\n\x1a\n":
        raise SystemExit(f"Not a PNG: {path}")
    width, height = struct.unpack(">II", signature[16:24])
    if (width, height) != dimensions:
        raise SystemExit(
            f"Wrong dimensions for {name}: {(width, height)} != {dimensions}"
        )
    print(f"OK {name}: {width}x{height}, {path.stat().st_size} bytes")
PY

echo "Rendered Euphoriks Quizzie store graphics to $OUT"
