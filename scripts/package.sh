#!/usr/bin/env bash
# Packages skills as ZIP files for upload in the Claude app (Customize > Skills).
# Usage: scripts/package.sh            # all skills
#        scripts/package.sh idea-to-spec
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$root/dist"

if [ "$#" -gt 0 ]; then
  names=("$@")
else
  names=()
  for dir in "$root"/skills/*/; do names+=("$(basename "$dir")"); done
fi

for name in "${names[@]}"; do
  if [ ! -f "$root/skills/$name/SKILL.md" ]; then
    echo "skip: skills/$name has no SKILL.md" >&2
    continue
  fi
  out="$root/dist/$name.zip"
  rm -f "$out"
  (cd "$root/skills" && zip -rq "$out" "$name" -x '*.DS_Store')
  echo "built dist/$name.zip"
done
