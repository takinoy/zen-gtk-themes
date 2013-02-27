#!/bin/sh

set -e

LANG=C

# force
opt=$1
case $opt in
-f|-pf|-fp) force="-f"; f="+" ;;
-u|-p|"") f="" ;;
*)	echo "use -f|-pf to force update PKGBUILD"
	echo "    -u to update package source without pushing it"
	echo "    -p to push the package without updating it"
	exit 1
esac

cd cache

# package name
pkgname=$(grep -m 1 "pkgname=" PKGBUILD | cut -d= -f2)
name=${pkgname%%-*}

# check old package version
lastpkgver=$(git tag -l xv* | sort -V | tail -n 1 | cut -dv -f2)

# check new package version
pkgver=$(head -1 ../README.md |  cut -d' ' -f3)
#pkgver=$(grep -m 1 "pkgver=" PKGBUILD | cut -d= -f2)
pkgrel=$(grep -m 1 "pkgrel=" PKGBUILD | cut -d= -f2)

# current date
cntdate=$(date +%B' '%d,' '%Y)

update_readme() {
	# update readme
	readme=$(ls -1 README*)
	
	set $readme
	until [ $# = 0 ]
	do
		sed -i "1 s/^.*$/$pkgname version $pkgver/" $1
		sed -i "s/Date :.*$/Date : $cntdate/" $1
	shift
	done
}

	commit() {
		git status -s
		if git status -s | grep '^[A-Z]'
		then
		echo "files staged for commit, aborded"
		exit 1
		fi
		git add $@
		if git status -s | grep '^M' > /dev/null
		then
		git commit -m "$message"
		fi
	}

push() {
	# update package version to PKGBUILD
	sed -i "s/^pkgver=.*$/pkgver=$pkgver/" PKGBUILD
	if [ "$pkgver" == "$lastpkgver" ] && [ "$f" == "" ]
	then
	(( pkgrel += 1 ))
	sed -i "s/pkgrel=.*$/pkgrel=$pkgrel/" PKGBUILD
	else
	# make and push a tag
		if [ "$f" == "+" ]
		then
		set +e; git tag -d "${name:3}v$pkgver"; set  -e
		fi
	git tag "${name:3}v$pkgver"
	git push origin $f${name:3}v$pkgver
	sed -i "s/pkgrel=.*$/pkgrel=1/" PKGBUILD
	fi
	# update PKGBUILD checksum
	echo "update PKGBUILD to v$pkgver-$pkgrel..."
	rm -f $pkgname-$pkgver.tar.gz
	sha=$(makepkg -g)
	echo $sha
	sed -i "s/^sha256sums.*$/$sha/" PKGBUILD
	makepkg $force --source
	files=PKGBUILD
	message="update PKGBUILD to v$pkgver-$pkgrel"
	commit PKGBUILD
	git push origin $f'zenx'
}

case $opt in
-f|-u|"")
	if [ "$pkgver" == "$lastpkgver" ]
	then
	echo "enter new version number (last package version =  $lastpkgver) :"
	read pkgver
	else
	echo "update README to v$pkgver ? Y/n/<package_version>"
	read answer
		case $answer in
		Y|y|"") ;;
		N|n) exit 0 ;;
		*) pkgver=$answer;;
		esac
	fi
	echo "update $readme to version $pkgver..."
	cd ..
	update_readme
	message="update README* to v$pkgver"
	commit $readme
	cd cache
	;;
esac

case $opt in
-p|-pf|-fp|-f|"")
	push
	;;
esac
