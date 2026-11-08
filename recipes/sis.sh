#!/usr/bin/env bash
# sis.sh -- the theme as a SIS (pdk make_sis.py with --file only: no component). Needs the Hildon UI package (sapwood engine) installed first.
set -eu
REPO=$(cd "$(dirname "$0")/.." && pwd); T=$REPO/dl/hildon-theme-alpha/alpha
ARGS=
for f in "$T"/images/*; do ARGS="$ARGS --file $f=!:/resource/gtk/themes/alpha/images/$(basename "$f")"; done
for f in "$REPO"/LICENSES/* "$REPO/LICENSE" "$REPO/LICENSE-RECIPES" "$REPO/NOTICE" "$REPO/SOURCE-OFFER.txt"; do ARGS="$ARGS --file $f=!:/resource/hildon-theme-alpha/licences/$(basename "$f")"; done
python3 "$PHOREPOC_PDK/tools/make_sis.py" --data-only --uid 0xE7015796 --unsigned --version "${PHOREPOC_PACKAGE_VERSION:-1.0.0}" --name "Hildon theme alpha" --vendor Phorepoc \
  --depends 0xE7015786,1.0.0,Hildon --file "$T/gtk-2.0/gtkrc=!:/resource/gtk/themes/alpha/gtk-2.0/gtkrc" $ARGS --out "$PHOREPOC_BUILD/sis/hildon-theme-alpha-${PHOREPOC_ARCH:-x32}.sis"
