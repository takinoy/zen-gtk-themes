#!/bin/sh

#set -xv

set -e

# select actions to do
#action='dir copy hard_link symbolic_link rm_symbolic_link'
action='symbolic_link'

# options : u=update, n=not overwrite, f=force
optcp='-f'
v='-v'
optln=''

case $v in
-v|'' ) ;;
* ) echo Opt verbose indefini; exit 1 ;;
esac

case $optcp in
-u ) optln=''; ;; # -f to overwrite a file with a hard link
-n ) optln=''; ;;
-f ) optln='-f'; ;;
* ) echo Opt indefini; exit 1 ;;
esac

###### CONFIG########
# package.name
pkgname=${PWD##*/}
name=${pkgname%%-*}
# Create directories
#target directories
target_dir=$(ls -1 | grep "$name-")
#target_dir='Zen-test'

#current_dir=$(basename $(pwd))

# Copy
cp_source=$name
# files or dir to copy
path_copy='
gtk-2.0/gtk-widgets.rc
gtk-2.0/apps/libreoffice.rc
gtk-3.0/gtk-widgets.css
'
dir_copy=$target_dir
echo "path copy = $path_copy"
	
# Hard links
#current_dir=$(basename $(pwd))
hard_link_source=$cp_source
dir_hard_link=$target_dir

path_hard_link=$path_copy
echo "path hard links = $path_hard_link"

# Symbolics links
symbolic_link_source=$cp_source
dir_symbolic_link=$target_dir
path_symbolic_link=$path_copy
echo "path symbolic links = $path_symbolic_link"
###################

# made path directories
path=$path_copy' '$path_hard_link
path_dirname=$(dirname $path | grep -v -x "\." | sort | uniq)

function dir {
	until [ $# = 0 ]
	do
		mkdir -p $v $var"/"$1
	shift
	done
	}

function copy {
	if [ "$1" == "" ]
	then echo 'No files to copy, aborded.'
	else 
		if [ "$cp_source" == "" ]
		then cp_source='.'
		else
			until [ $# = 0 ]
			do
				cp $optcp -r $v $cp_source/$1 $(dirname "$var/$1")
			shift
			done
		fi
	fi
	}	

function hard_link {
	if [ "$1" != "" ]
	then
		until [ $# = 0 ]
		do
		set +e
			ln $optln $v $hard_link_source/$1 $(dirname "$var/$1")
		set -e
		shift
		done
	else echo 'No hard link to build, aborded.'
	fi	
}

function symbolic_link {
if [ "$1" != "" ]
then
	until [ $# = 0 ]
	do
		set +e
		ln -s -r $v $optln $symbolic_link_source/$1 $(dirname "$var/$1")
		set -e
	shift
	done
else echo "no symbolic links to build, aborded."
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
	$function $arg
	shift
done
else echo "no target directories for $function function, aborded."
fi
}

function switch {
if [ "$1" != "" ]
then
until [ $# = 0 ]
do
	function=$1
	# action
	case $function in
	dir ) arg=$path_dirname; echo "make directories :"; make $target_dir;;
	copy ) arg=$path_copy ; echo "copy files : "; make $dir_copy ;;
	hard_link ) arg=$path_hard_link; echo "make hard links :"; make $dir_hard_link ;;
	symbolic_link ) arg=$path_symbolic_link; echo "make symbolic links :"; make $dir_symbolic_link ;;
	* ) echo Indefini; exit 1 ;;
	esac
	shift
done
else echo "no target directories for $function function, aborded."
fi
}

switch $action

#unset -f switch
#unset -f make
#unset -f hard_link
#unset -f symbolic_link
#unset -f copy
#unset -f dir

if  [ "$v" == "-v" ] ; then echo End; fi
