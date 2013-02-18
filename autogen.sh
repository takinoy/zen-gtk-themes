#!/bin/sh

set -e

# How to build :

# merge shared stuff
# git merge shared

# replace symbolic links with source file :

###### CONFIG########
# Create directories
#target directories

# package name
pkgname=$(grep -m 1 'pkgname=' cache/PKGBUILD | cut -d= -f2)
name=ZenX

target_dir=$(ls -1 | grep "$name-")

cp_source=$name
# files or dir to copy
path_copy='
gtk-2.0/gtk-widgets.rc
gtk-2.0/apps/libreoffice.rc
gtk-3.0/gtk-widgets.css
'

echo "path copy = $path_copy"

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
	copy $path_copy
	shift
done
else echo "no target directories for copying, aborded."
fi
}

cd $cp_source
make $target_dir

# make a commit
# git commit -a -m "vx.x.x"
# git tag vx.x.x
# git push origin vx.x.x

# Update pkgbuild
