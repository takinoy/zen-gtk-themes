#!/bin/sh

set -e

# script to refresh hard links before committing changes

# package name
pkgname=$(grep -m 1 'pkgname=' cache/PKGBUILD | cut -d= -f2)
name=${pkgname%%-*}
# first letter in uppercase
name=$(echo ${name:0:1}|tr a-z A-Z)${name:1}

target_dir=$(ls -1 | grep "$name-")
# files or dir to copy
path='
gtk-2.0/gtk-widgets.rc
gtk-2.0/apps/libreoffice.rc
gtk-3.0/gtk-widgets.css
gtk-3.0/panel.css
'

echo "path hard links = $path"

function copy {
	if [ "$1" == "" ]
	then echo 'No files to copy, aborded.'
	else
		until [ $# = 0 ]
		do
			cp -f -l -r -v  $1 $(dirname "../$var/$1")
			shift
		done
	fi
	}

function make {
if [ "$1" != "" ]
then
until [ $# = 0 ]
do
	# target directory
	var=$1
	# action
	copy $path
	shift
done
else echo "no target directories for copying, aborded."
fi
}

cd $name
make $target_dir
