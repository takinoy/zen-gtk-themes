#!/bin/sh

# copy

# package.name
pkgname=${PWD##*/}
name=${pkgname%%-*}

# directory
theme_dir="$HOME/.themes"
path=$(ls -1 | grep "$name")

# copy files to directory
cp -r -f -v $path $theme_dir
