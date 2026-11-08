# hildon-theme-alpha

The Maemo Leste default Hildon theme ("Nokia Nseries", from `maemo-leste/hildon-theme-alpha`) as a Catalogue package for Phorepoc OS: the GTK 2 rc file and the images that the
sapwood engine (in hildon-ui) draws widgets with. It is the look of the Hildon UI (`hildon-ui`).

It is a Catalogue package only: no system image carries it. It is **GPL-3.0** (the Leste repository's licence); its rc file and artwork are Nokia's, licensed Creative Commons
Attribution-ShareAlike 2.5 (`LICENSES/CC-BY-SA-2.5.txt`). The package installs the licence texts and the source offer in `\resource\hildon-theme-alpha\licences\`.
It needs the Hildon UI package (the sapwood engine).

Nothing of the theme is copied into this repository: `recipes/fetch.sh` clones the pinned commit of `maemo-leste/hildon-theme-alpha`; `recipes/sis.sh` packages it
(`\resource\gtk\themes\alpha\gtk-2.0\gtkrc`, `\resource\gtk\themes\alpha\images\*`). The programs read the rc file, point its `pixmap_path` at the install location and name the engine
by absolute path (hildon-ui `phehildonwin_demo.c` shows how).

Our files (recipes) are BSD-2-Clause (`LICENSE-RECIPES`); the theme is GPL-3.0 (`LICENSE`).
