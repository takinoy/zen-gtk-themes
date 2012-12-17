#!/bin/sh

# links

# package.name
pkgname=${PWD##*/}
name=${pkgname%%-*}

# directory
theme_dir="$HOME/.themes"
path=$(ls -1 | grep "$name")

# link files to directory
ln -s -r -v $path $theme_dir
