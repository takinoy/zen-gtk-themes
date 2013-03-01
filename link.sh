#!/bin/sh

# link themes into theme directory

# package name
pkgname=$(grep -m 1 'pkgname=' cache/PKGBUILD | cut -d= -f2)
name=${pkgname%%-*}
# first letter in uppercase
name=$(echo ${name:0:1}|tr a-z A-Z)${name:1}

# directory
theme_dir="$HOME/.themes"
path=$(ls -1 | grep "$name")

# link files to directory
set $path
until [ $# = 0 ]
do
	if [ -e "$theme_dir/$1-dev" ]
	then
		if [ -h !"$theme_dir/$1-dev" ]
		then
		echo "$theme_dir/$1-dev is not a link"
		fi
	else
	ln -s -r -v $1 $theme_dir/$1-dev
	fi
shift
done
