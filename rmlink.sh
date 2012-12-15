#!/bin/sh

# remove links

# directory
theme_dir="$HOME/.themes"

# link files to directory
while read path
do
	if [ "$path" != "readme" ]
	then
		rm $theme_dir/$path
	fi
done < pkglist

