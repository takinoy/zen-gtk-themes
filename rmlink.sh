#!/bin/sh

# remove links

# package name
name=ZenX

# directory
theme_dir="$HOME/.themes"
cd $theme_dir
path=$(ls -1 | grep "^$name-.*dev")

# rm link files to directory
rm -v $path
