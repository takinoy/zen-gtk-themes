#!/bin/sh

# link themes into theme directory

# options
opt=$1

# package name
pkgname=$(grep -m 1 'pkgname=' cache/PKGBUILD | cut -d= -f2)
name=${pkgname%%-*}
# first letter in uppercase
name=$(echo ${name:0:1}|tr a-z A-Z)${name:1}

# directory
theme_dir="$HOME/.themes"

# link files to directory
links() {
for path in $(ls -1 | grep "$name")
do
	if [ -e "$theme_dir/${path}-dev" ]
	then
		if [ -h !"$theme_dir/${path}-dev" ]
		then
		echo "$theme_dir/${path}-dev is not a link"
		fi
	else
	ln -s -r -v ${path} $theme_dir/${path}-dev
	fi
done
}

# remove links from theme directory
remove_links() {
cd $theme_dir
rm -v $(ls -1 | grep "^$name-.*dev")
}

case $opt in
-r) remove_links;;
*) links;;
esac
