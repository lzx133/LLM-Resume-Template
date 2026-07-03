#!/usr/bin/env bash
set -euo pipefail

pdf="resume-autonomous-driving.pdf"
text_file="$(mktemp)"
trap 'rm -f "$text_file"' EXIT

test -s "$pdf"
pdfinfo "$pdf" | grep -Eq '^Pages:[[:space:]]+2$'
pdftotext "$pdf" "$text_file"
python3 - "$text_file" <<'PY'
import pathlib
import sys
import unicodedata

path = pathlib.Path(sys.argv[1])
path.write_text(unicodedata.normalize("NFKC", path.read_text()))
PY

for required in \
  "楼振雄" \
  "自动驾驶算法专家" \
  "决策规划" \
  "轨迹优化" \
  "零阶" \
  "Monte Carlo" \
  "RRT" \
  "华中科技大学" \
  "99.88%"; do
  grep -Fq "$required" "$text_file"
done

if grep -Eq 'XXXX|请补充|清华大学|字节跳动|阿东玩AI' "$text_file"; then
  echo "template placeholder or example content found" >&2
  exit 1
fi

echo "resume verification passed"
