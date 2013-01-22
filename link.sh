#!/bin/sh

# links

# package.name
pkgname=${PWD##*/}
name=${pkgname%%-*}

# directory
theme_dir="$HOME/.themes"
path=$(ls -1 | grep "$name")

# link files to directory
set $path
until [ $# = 0 ]
do
ln -s -r -v $1 $theme_dir/$1-dev
shift
done
