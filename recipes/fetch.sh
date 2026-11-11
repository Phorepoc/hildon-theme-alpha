#!/usr/bin/env bash
# Copyright The Phorepoc Authors
# SPDX-License-Identifier: BSD-2-Clause
# fetch.sh -- clone the pinned theme into dl/ (never copied into this repository)
set -eu
. "$(dirname "$0")/pins.sh"
# DL: where the clone goes (sis.sh: the build tree; the repository is a read-only mount in CI)
D="${DL:-$(cd "$(dirname "$0")/.." && pwd)/dl}/hildon-theme-alpha"
[ -d "$D" ] || git clone -q https://github.com/maemo-leste/hildon-theme-alpha.git "$D"
git -C "$D" checkout -q "$THEME_ALPHA"
echo "hildon-theme-alpha at $THEME_ALPHA in $D"
