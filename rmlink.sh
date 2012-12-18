#!/bin/sh

# remove links

# package.name
pkgname=${PWD##*/}
name=${pkgname%%-*}

# directory
theme_dir="$HOME/.themes"
path=$(ls -1 | grep "$name")

# rm link files to directory
cd $theme_dir
rm $path

