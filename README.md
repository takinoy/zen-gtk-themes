zenx-gtk-themes version 0.8.0
-----------------------------

Author : Cédric Leporcq
Released under the GPL license
Date : January 23, 2013
Sources : https://github.com/cedl38/zen-gtk-themes/tree/zenx

This is a variant of "zen-gtk-themes" with the xfce engine.
The main goal of this theme is to keep it simple, consistent and being visually appealing.

Features :
 - thin menubar, toolbar and icons
 - gtk2 and gtk3 (version >=3.4)
 - compatibility with Xfce widgets, Xfce notify theme
 - six pre-configured color schemes compatibles with gnome and Xfce : ZenX, ZenX-blua, ZenX-nigra, ZenX-nokto, ZenX-verda, ZenX-papero.

The gtk-3 version is mostly tested on few applications under Xfce. Do not hesitate to try it in full gtk-3 environnement and report any issues.

Install : extract the archive and copy the theme folders you want into ~/.theme.
Arch users : "zenx-gtk-themes" is available in AUR.

Extras :
 - xfwm4 and metacity-1 windows decorator (see my others artworks)
 - Foxtrox icons. Install the package gnome-themes-extras if available or download the sources. Extract it and copy the folder icon-themes/Foxtrot/ into ~/.icons.

Specific settings for libreoffice :
Using small scrollbars in libreoffice 3.* cause sheet tabs too small. You can fix scrollbar width for LibreOffice two ways :
- run the script libreoffice-patch.sh (use it with care). This script will add customs application launchers for libreoffice in .local/share/applications to run the patch "libreoffice.rc" when libreoffice is launched. The following command will be added in the application launcher :
# bash -c 'GTK2_RC_FILES=$HOME/.themes/ZenX/gtk-2.0/apps/libreoffice.rc application-command'
You can remove the generated files libreoffice-* safely.
- edit ZenX/gtk-2.0/gtkrc and change value of "GtkScrollbar::slider-width" from "11" to "14" for example.
see also :
http://urukrama.wordpress.com/2008/07/13/setting-a-custom-gtk-theme-for-specific-applications/

Suggest for firefox users : install the add-on "GTK+ Native" to forces Firefox applied your theme.

Changelog:
----------

0.8.0 : build "ZenX" from "zen-gtk-themes" v0.8