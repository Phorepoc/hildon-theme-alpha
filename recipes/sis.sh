#!/usr/bin/env bash
# Copyright The Phorepoc Authors
# SPDX-License-Identifier: BSD-2-Clause
# sis.sh -- the theme as a SIS (pdk make_sis.py --data-only: files, no component). Needs the Hildon UI package (sapwood engine) installed first.
set -eu
REPO=$(cd "$(dirname "$0")/.." && pwd); export DL=${DL:-$PHOREPOC_BUILD/hildon-stack/dl/hildon-theme-alpha}; T=$DL/hildon-theme-alpha/alpha
[ -d "$T" ] || bash "$REPO/recipes/fetch.sh"
ARGS="--dir $T/images=!:/resource/gtk/themes/alpha/images"
# the wallpapers too: Home draws the theme's first one as its background
for f in "$T"/backgrounds/wallpaper*.png; do ARGS="$ARGS --file $f=!:/resource/gtk/themes/alpha/backgrounds/$(basename "$f")"; done
for f in "$REPO"/LICENSES/* "$REPO/LICENSE" "$REPO/LICENSE-RECIPES" "$REPO/NOTICE" "$REPO/SOURCE-OFFER.txt"; do ARGS="$ARGS --file $f=!:/resource/hildon-theme-alpha/licences/$(basename "$f")"; done
python3 "$PHOREPOC_PDK/tools/make_sis.py" --data-only --uid 0xE7015796 --unsigned --version "${PHOREPOC_PACKAGE_VERSION:-1.0.0}" --name "Hildon theme alpha" --vendor Phorepoc \
  --depends 0xE7015786,0.1.0,Hildon --file "$T/gtk-2.0/gtkrc=!:/resource/gtk/themes/alpha/gtk-2.0/gtkrc" $ARGS --out "$PHOREPOC_BUILD/sis/hildon-theme-alpha-${PHOREPOC_ARCH:-x32}.sis"
