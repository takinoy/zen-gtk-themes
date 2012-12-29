zen-gtk-themes version 0.7
----------------------------

Author : Cédric Leporcq
Released under the GPL license
Date : december 29, 2012
Sources : https://github.com/cedl38/Zen-gtk-themes

The main goal of this theme is to keep it simple, consistent and being visually appealing.

Features :
 - thin menubar, toolbar and icons
 - gtk2 and gtk3 (version >=3.4)
 - compatibility with Xfce widgets, Xfce notify theme
 - six pre-configured color schemes compatibles with gnome and Xfce : Zen, Zen-blua, Zen-nigra, Zen-nokto, Zen-verda, Zen-papero.

The gtk-3 version is mostly tested on few applications under Xfce. Do not hesitate to try it in full gtk-3 environnement and report any issues.
The Murrine engine version >=0.98 is needed for the gtk2 version of this theme. A gtk2 version with the clearlooks engine is available on the Zen-0.3.x package.

Install :
 - extract the archive and copy the theme folders you want into ~/.theme.
 - switch to the gtk theme in your theme manager
 
 Arch users : "zen-gtk-themes" is available in AUR.

Extras :
 - xfwm4 and metacity-1 windows decorator (see my others artworks)
 - Foxtrox icons. Install the package gnome-themes-extras if available. 
Alternatively you can download it from the source : http://ftp.gnome.org/pub/GNOME/sources/gnome-themes-extras/2.22/
Extract it and copy the folder icon-themes/Foxtrot/ into ~/.icons.

Specific settings for libreoffice :
Using small scrollbars in libreoffice 3.* cause sheet Tabs too small.
To fix the scrollbar width for libreoffice you have tree options :
 - add the following command in the application launcher :
# bash -c 'GTK2_RC_FILES=$HOME/.themes/Zen/gtk-2.0/apps/libreoffice.rc application-command' --> run the patch "libreoffice.rc"
 - run the script libreoffice-patch.sh (use it with care) :
 # cd <package-directory>
 # chmod +x libreoffice-patch.sh
 # ./libreoffice-patch.sh
 This script will add customs application launchers for libreoffice in .local/share/applications. You can remove the generated files libreoffice-* safely.
 - edit Zen/gtk-2.0/gtkrc and change value of "GtkScrollbar::slider-width" from "11" to "14".
see also :
http://urukrama.wordpress.com/2008/07/13/setting-a-custom-gtk-theme-for-specific-applications/

Suggest for firefox users : to forces Firefox applied your theme install the add-on "GTK+ Native".

Changelog:
----------

0.7
- Improve gtk2/gtk3 consistency : menubar padding, arrowstyle.
- add libreoffice-patch.sh script.

0.6.2
- Remove shadow on menubar.
- Update color scheme for panel, menu, menubar, scroolbar and prelight state.
- Improve gtk2/gtk3 consistency.
- Sources availables in git repository.
- Package "zen-gtk-themes" in "AUR" for archlinux users.

0.5.0
- Improve theme rendering and consistency for gtk2 and gtk3 versions.
- Themes can be installed independently.

0.4.4
- Use the murrine engine for gtk-2 version.
- Theme ported to gtk3 >=3.4.

0.3.4
- Last gtk2 version with the clearlook engine.
- Updates from 0.6 branch (gtk2).

0.3.2
- New color schemes and preconfigured settings.
- Add notify theme for xfce.

0.2.2 :
- Panels, menu and treeviews settings can be edited in a separate GtkRC file.
- Adjustments of color setting and widget proprieties for light and dark color schemes.

0.1.1 :
- Patch to set scrollbars width in libreoffice.

Note : versions 0.2 to 0.3 uses the clearlooks engine.
