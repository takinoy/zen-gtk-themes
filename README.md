zen-gtk-themes version 0.10.13.g36
----------------------------

Author : Cédric Leporcq
Released under the GPL license
Date : November 29, 2013
Sources : https://github.com/cedl38/zen-gtk-themes

The main goal of this theme is to keep it simple, consistent and being visually appealing.

Features :
 - thin menubar and toolbar
 - includes both gtk2 and gtk3 themes
 - compatibility with Xfce widgets, Xfce notify theme
 - height pre-configured color schemes : Zen, Zen-bicolor, Zen-blua, Zen-griza, Zen-nigra, Zen-nokto, Zen-verda, Zen-papero.

dependencies :
- Murrine engine version >=0.98 for gtk2. A gtk2 version with the clearlooks engine is available on the Zen-0.3.x package.
- gtk-3.8.x for gtk3. Compatibles versions are available for gtk-3.6.x and gtk-3.4.x (0.10.x.g36 and 0.10.x.g34 respectively).

The gtk-3 version is mostly tested on few applications under Xfce. Do not hesitate to try it in full gtk-3 environnement and report any issues.

Install : extract the archive and copy the theme folders you want into ~/.theme.
Arch users : "zen-gtk-themes" is available in AUR.

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

0.10.13
    Configure gtk3 icon sizes
    Fix buttons borders style
    Fix gtk2 and gtk3 scale colors (fix regressions)
0.10.12
 - Change notebooks and scale style
 - Adjust buttons style
 - Add whiskermenu-plugin theming support
 - Minors others fixes
0.10.11
 - Change gtk3 panel buttons borders for dark themes
 - Fix CheckButton color in XfsmLogoutDialog
 - Disable separators in GtkComboBox
0.10.10
 - Add Zen-bicolor variant.
 - Change zen-nigra menu style to dark.
 - Fix bug in scrollbars for epiphany.
 - Fix gtk3 progressbar text color and fallback mode panel.
 - Adjust xfwm4 titlebar and xfce-headers.
0.10.9 : Fix "add-new-items" window buttons for xfce.
0.10.8 : Fix Zen-papero tooltip background color.
0.10.7
 - change IconTheme to default in index.theme
 - Provide compatibility with lxde panel
0.10.6
 - Workaround for theme rendering in LibreOffice.
 - Fix gtk-2 notebook radio background prelight for Zen-griza.
0.10.5
 - Set xfwm-tabwin and XfsmLogoutDialog.
 - Adjust frame borders color.
0.10.4
 - Fix gtk3 rubberband selection color.
 - Adjust view/treeview background color.
0.10.3
 - Adjust button insensitive and border colors.
 - Adjust gtk3 panel settings (not tested).
 - Fix gtk3 spinbutton fg insensitive color.
 - Fix bug in libreoffice.sh for reading files with spaces.
0.10.2
 - Fix treeview colors for claws-mail.
 - Fix treeview-headers fg color for some widgets with Zen-nigra.
0.10.1 : Workaround to fix scrollbar border color in firefox and thunderbird.
0.10.0
 - Modify column headers to flat style.
 - Improve scrollbar style, scale.
 - Adjust colors, button contrast and shadow for Zen-nigra.
 - Fix CheckButton background, Zen-griza/index.theme, minor others issues.

0.9.1
 - Fix libreoffice.sh script and adjust scrollbar size.
 - Add zen-griza variant
 - Change column headers and scrollbar style
 - Adjust gtk2/3 style and contrast for button and widgets.
 - Workaround to improve rendering in libreoffice

0.8.1
 - Adjust button, notebook, radiocheck colors.
 - Change fg_color and text_color for dark themes.

0.7.3
 - Improve gtk2/gtk3 consistency : menubar, arrows, combobox.
 - Add libreoffice-patch.sh script.

0.6.2
 - Remove shadow on menubar.
 - Update color scheme for panel, menu, menubar, scrollbar and prelight state.
 - Sources availables in git repository.
 - Package "zen-gtk-themes" in "AUR" for archlinux users.

0.5
 - Improve theme rendering and consistency for gtk2 and gtk3 versions.
 - Themes can be installed independently.

0.4.4
 - Use the murrine engine for gtk-2 version.
 - Theme ported to gtk3 >=3.4.

0.3.2
 - New color schemes and preconfigured settings.
 - Add notify theme for xfce.

0.2.2
 - Panels, menu and treeviews settings can be edited in a separate GtkRC file.
 - Adjustments of color setting and widget proprieties for light and dark color schemes.

0.1.1
 - Patch to set scrollbars width in libreoffice.

Note : versions 0.2 to 0.3 uses the clearlooks engine.
