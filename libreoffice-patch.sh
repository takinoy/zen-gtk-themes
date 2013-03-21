#!/bin/sh

set -e

# patch for libre-office
# This script will add customs application launchers for libreoffice in .local/share/applications to run the patch "libreoffice.rc" when libreoffice is launched.
# The folowing command will be added in the application lancher :
# bash -c 'GTK2_RC_FILES=$HOME/.themes/Zen/gtk-2.0/apps/libreoffice.rc application-command'
# You can remove the generated files libreoffice-* safely.
#see also :
#http://urukrama.wordpress.com/2008/07/13/setting-a-custom-gtk-theme-for-specific-applications/

# applications to patch
lo_exec='calc.desktop draw.desktop startcenter.desktop writer.desktop'

install() {
# find the installation directory of the theme.
theme_dir=""
cd /usr/share/themes
if ls -1 | grep 'Zen' > /dev/null
then
theme_dir=$(pwd)/$(ls -1 | grep 'Zen' | head -1)
else
cd $HOME/.themes
	if ls -1 | grep 'Zen' > /dev/null
	then
	theme_dir=$(pwd)/$(ls -1 | grep 'Zen' | head -1)
	else
	echo "Theme Zen* not installed, aborded"
	exit 1
	fi
fi

set $lo_exec
until [ $# = 0 ]
do
	exec=$(echo $1 | cut -f1 -d.)
	# Backup existing libreoffice-*.desktop files to libreoffice-*.desktop.orig
	if [ -f $HOME/.local/share/applications/libreoffice-$1 ]
	then
	mv -v $HOME/.local/share/applications/libreoffice-$1 $HOME/.local/share/applications/libreoffice-$1.orig
	fi

	if [ -f /usr/lib/libreoffice/share/xdg/$1 ]
	then
	# copy libreoffice exec to .local/share/applications
	cp -v /usr/lib/libreoffice/share/xdg/$1 $HOME/.local/share/applications/libreoffice-$1
	else
	echo "libreoffice-$1 is not installed, aborded" | exit 0
	fi

	# replace exec lines in files
	if [ "$1" == "startcenter.desktop" ]
	then
	sed -i "s|Exec=libreoffice %U|Exec=bash -c \"GTK2_RC_FILES=$theme_dir/gtk-2.0/apps/libreoffice.rc libreoffice %U\"|g" "$HOME/.local/share/applications/libreoffice-$1"
	else
	sed -i "s|Exec=libreoffice --$exec %U|Exec=bash -c \"GTK2_RC_FILES=$theme_dir/gtk-2.0/apps/libreoffice.rc libreoffice --$exec %U\"|g" "$HOME/.local/share/applications/libreoffice-$1"
	fi
shift
done
}

uninstall() {
set $lo_exec
until [ $# = 0 ]
do
	if [ -f $HOME/.local/share/applications/libreoffice-$1.orig ]
	then
	mv -v $HOME/.local/share/applications/libreoffice-$1.orig $HOME/.local/share/applications/libreoffice-$1
	elif [ -f $HOME/.local/share/applications/libreoffice-$1 ]
	then
	rm -v $HOME/.local/share/applications/libreoffice-$1
	fi
shift
done
}

case $1 in
--install|"") install ;;
--uninstall) uninstall ;;
*)	echo "options : --install to install the patch (default) "
	echo "          --uninstall to uninstall the patch and restore original files (if exist)"
	;;
esac
