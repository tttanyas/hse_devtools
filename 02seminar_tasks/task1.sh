#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/_lib.sh"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

DIR="${1:-}"
EXT="${2:-}"
MIN_SIZE="${3:-}"
if [[ -z "$DIR" && -d "$ROOT_DIR/testdata/01/files" ]]; then
  DIR="$ROOT_DIR/testdata/01/files"
  EXT="${EXT:-txt}"
  MIN_SIZE="${MIN_SIZE:-1k}"
fi

[[ -n "$DIR" && -n "$EXT" && -n "$MIN_SIZE" ]] || {
  echo "Usage: $0 <dir> <ext_without_dot> <min_size_for_find (e.g. 10k|100c|2M)>" >&2
  exit 2
}

[[ -d "$DIR" ]] || die "Not a directory: $DIR"

find_cmd="find"
if have gfind; then find_cmd="gfind"; fi

$find_cmd "$DIR" -type f -name "*.${EXT}" -size "+${MIN_SIZE}" -print0 2>/dev/null |
  while IFS= read -r -d '' f; do
    s="$(stat_size "$f")"
    m="$(stat_mtime_human "$f")"
    printf "%s\t%s\t%s\n" "$s" "$m" "$f"
  done |
  sort -nr -k1,1
