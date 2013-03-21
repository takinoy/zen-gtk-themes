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
execs='calc.desktop draw.desktop startcenter.desktop writer.desktop'
opt=$1

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

set $execs
for exec
do
	exec_=$(echo $exec | cut -f1 -d.)
	# Backup existing libreoffice-*.desktop files to libreoffice-*.desktop.orig
	if [ -f $HOME/.local/share/applications/libreoffice-$exec ]
	then
	mv -v $HOME/.local/share/applications/libreoffice-$exec $HOME/.local/share/applications/libreoffice-$exec.orig
	fi

	if [ -f /usr/lib/libreoffice/share/xdg/$exec ]
	then
	# copy libreoffice exec to .local/share/applications
	cp -v /usr/lib/libreoffice/share/xdg/$exec $HOME/.local/share/applications/libreoffice-$exec
	else
	echo "libreoffice-$exec is not installed, aborded" | exit 0
	fi

	# replace exec lines in files
	if [ "$exec" == "startcenter.desktop" ]
	then
	sed -i "s|Exec=libreoffice %U|Exec=bash -c \"GTK2_RC_FILES=$theme_dir/gtk-2.0/apps/libreoffice.rc libreoffice %U\"|g" "$HOME/.local/share/applications/libreoffice-$exec"
	else
	sed -i "s|Exec=libreoffice --$exec_ %U|Exec=bash -c \"GTK2_RC_FILES=$theme_dir/gtk-2.0/apps/libreoffice.rc libreoffice --$exec_ %U\"|g" "$HOME/.local/share/applications/libreoffice-$exec"
	fi
done
}

uninstall() {
set $execs
for exec
do
	if [ -f $HOME/.local/share/applications/libreoffice-$exec.orig ]
	then
	mv -v $HOME/.local/share/applications/libreoffice-$exec.orig $HOME/.local/share/applications/libreoffice-$exec
	elif [ -f $HOME/.local/share/applications/libreoffice-$exec ]
	then
	rm -v $HOME/.local/share/applications/libreoffice-$exec
	fi
done
}

case $opt in
--install|"") install ;;
--uninstall) uninstall ;;
*)	echo "options : --install to install the patch (default) "
	echo "          --uninstall to uninstall the patch and restore original files (if exist)"
	;;
esac
