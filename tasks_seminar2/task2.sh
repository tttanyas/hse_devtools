#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/_lib.sh"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

TARGET_DIR="${1:-}"
if [[ -z "$TARGET_DIR" && -d "$ROOT_DIR/testdata/02/downloads" ]]; then
  TARGET_DIR="$ROOT_DIR/testdata/02/downloads"
fi
TARGET_DIR="${TARGET_DIR:-$HOME/Downloads}"

[[ -d "$TARGET_DIR" ]] || die "Not a directory: $TARGET_DIR"

cd "$TARGET_DIR"
mkdir -p images archives documents other

unique_path() {
  local dst="$1"
  [[ ! -e "$dst" ]] && { echo "$dst"; return; }
  local base ext n cand
  base="${dst%.*}"
  ext=""
  [[ "$dst" == *.* ]] && ext=".${dst##*.}"
  n=1
  while :; do
    cand="${base}_${n}${ext}"
    [[ ! -e "$cand" ]] && { echo "$cand"; return; }
    n=$((n + 1))
  done
}

for f in *; do
  [[ -f "$f" ]] || continue
  ext="${f##*.}"
  lower="$(_py -c 'import sys;print(sys.argv[1].lower())' "$ext")"

  dest="other"
  case "$lower" in
    jpg|jpeg|png|gif|webp|bmp|tiff) dest="images" ;;
    zip|rar|7z|tar|gz|tgz|bz2|xz) dest="archives" ;;
    pdf|doc|docx|xls|xlsx|ppt|pptx|txt|rtf|csv) dest="documents" ;;
  esac

  dst="$(unique_path "$dest/$f")"
  mv -- "$f" "$dst"
done

echo "Done: $TARGET_DIR"
