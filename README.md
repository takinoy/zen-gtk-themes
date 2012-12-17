Zen version 0.3.4
-----------------

Author : Cédric Leporcq
Released under the GPL license
Date : december 10, 2012

The main goal of this theme is to keep it simple, consistent and to be visually appealing.

Features :
 - thin menubar, toolbar and icons
 - compatibility with Xfce widgets, Xfce notify theme
 - six pre-configured color schemes compatibles with gnome and Xfce : Zen, Zen-blua, Zen-nigra, Zen-nokto, Zen-verda, Zen-papero.

This version use only the clearlook engine.

Install :
 - extract the archive and copy the theme folders you want into ~/.theme.
 - switch to the gtk theme in your theme manager.

Extras :
 - xfwm4 and metacity-1 windows decorator (see my others artworks)
 - Foxtrox icons. Install the package gnome-themes-extras if available. 
Alternatively you can download it from the source : http://ftp.gnome.org/pub/GNOME/sources/gnome-themes-extras/2.22/
Extract it and copy the folder icon-themes/Foxtrot/ into ~/.icons.

Specific settings for libreoffice :
Using small scrollbars in libreoffice 3.* cause sheet Tabs too small.
To fix the scrollbar width for libreoffice you have two options :
 - Run the script "libreoffice.rc"
add the following command in the application launcher :
# bash -c 'GTK2_RC_FILES=$HOME/.themes/Zen/gtk-2.0/apps/libreoffice.rc application-command'
 - edit Zen/gtk-2.0/gtkrc and change value of "GtkScrollbar::slider-width" from "12" to "14"
see also :
http://urukrama.wordpress.com/2008/07/13/setting-a-custom-gtk-theme-for-specific-applications/

Suggest for firefox users : to forces Firefox applied your theme install the add-on "GTK+ Native".

Changelog:
----------

0.3.4
- last gtk2 version with the clearlook engine
- updates from 0.6.0 branch (gtk2)

0.3.2
- new color schemes and preconfigured settings
- add notify theme for xfce

0.2.2 :
- panels, menu and treeviews settings can be edited in a separate GtkRC file
- adjustments of color setting and widget proprieties for light and dark color schemes

0.1.1 :
- patch to set scrollbars width in libreoffice

note : versions 0.2 to 0.3 uses the clearlooks engine
