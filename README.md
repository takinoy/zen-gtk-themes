zen-gtk-themes version 0.3.14
-----------------------------

Author : Cédric Leporcq
Released under the GPL license
Date : May 5, 2013
Sources : https://github.com/cedl38/zen-gtk-themes

The main goal of this theme is to keep it simple, consistent and being visually appealing.

Features :
 - thin menubar, toolbar and icons
 - compatibility with Xfce widgets, Xfce notify theme
 - seven pre-configured color schemes compatibles with gnome and Xfce : Zen, Zen-blua, Zen-griza, Zen-nigra, Zen-nokto, Zen-verda, Zen-papero.

This version use only the clearlook engine.

Install : extract the archive and copy the theme folders you want into ~/.theme.

Extra : xfwm4 and metacity-1 windows decorator (see my others artworks)

Specific settings for libreoffice :
Using small scrollbars in libreoffice 3.* cause sheet tabs too small. You can fix scrollbar width for LibreOffice two ways :
- run the script libreoffice-patch.sh. This script will add customs application launchers for libreoffice in .local/share/applications. The following command will be added in the application launcher :
# bash -c "GTK2_RC_FILES=$HOME/.themes/Zen/gtk-2.0/apps/libreoffice.rc application-command"
to uninstall and restore original files (if exist) run :
# ./libreoffice-patch.sh --uninstall
- edit Zen/gtk-2.0/gtkrc and change value of "GtkScrollbar::trough-border" from "2" to "3" for example.
see also :
http://urukrama.wordpress.com/2008/07/13/setting-a-custom-gtk-theme-for-specific-applications/

Suggest for firefox users : install the add-on "GTK+ Native" to forces Firefox applied your theme.

Changelog:
----------

0.3.14
 - Last gtk2 version with the clearlook engine.
 - Updates from 0.10 branch (gtk2).

0.3.2
 - New color schemes and preconfigured settings.
 - Add notify theme for xfce.

0.2.2
 - Panels, menu and treeviews settings can be edited in a separate GtkRC file.
 - Adjustments of color setting and widget proprieties for light and dark color schemes.

0.1.1
 - Patch to set scrollbars width in libreoffice.

note : versions 0.2 to 0.3 uses the clearlooks engine
