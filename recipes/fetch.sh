#!/usr/bin/env bash
# fetch.sh -- clone the pinned theme into dl/ (never copied into this repository)
set -eu
. "$(dirname "$0")/pins.sh"
D="$(cd "$(dirname "$0")/.." && pwd)/dl/hildon-theme-alpha"
[ -d "$D" ] || git clone -q https://github.com/maemo-leste/hildon-theme-alpha.git "$D"
git -C "$D" checkout -q "$THEME_ALPHA"
echo "hildon-theme-alpha at $THEME_ALPHA in $D"
