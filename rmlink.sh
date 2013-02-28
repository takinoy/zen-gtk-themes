#!/bin/sh

# remove links from theme directory

# package name
pkgname=$(grep -m 1 'pkgname=' cache/PKGBUILD | cut -d= -f2)
name=${pkgname%%-*}
# first letter in uppercase
name=$(echo ${name:0:1}|tr a-z A-Z)${name:1}

# directory
theme_dir="$HOME/.themes"
cd $theme_dir
path=$(ls -1 | grep "^$name-.*dev")

# rm link files to directory
rm -v $path
