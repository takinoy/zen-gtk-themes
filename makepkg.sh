#!/bin/sh

# To update README, PKGBUILD and push tag into the remote repository. 
# dependencies : git, burp, base-devel group, yaourt.

set -e

LANG=C

# package variables
source cache/PKGBUILD
name=${pkgname%%-*}

# check old package version
lastpkgver=$(git tag -l xv* | sort -V | tail -n 1 | cut -dv -f2)

# check new package version
pkgrel=$(grep -m 1 "pkgrel=" cache/PKGBUILD | cut -d= -f2)

headpkg() {
# use -f to force update
git archive --prefix=zen-gtk-themes-xv$pkgver/ \
-o cache/$pkgname-$pkgver.tar.gz HEAD

cd cache
rm -rf src
makepkg $force --source --skipchecksums
makepkg $force -c --skipchecksums
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
	# update package relase to PKGBUILD
	if [ "$pkgver" == "$lastpkgver" ] && [ "$f" == "" ]
	then
	(( pkgrel += 1 ))
	sed -i "s/pkgrel=.*$/pkgrel=$pkgrel/" PKGBUILD
	else
	# make and push a tag
		if [ "$f" == "+" ]
		then
		set +e; git tag -d "xv$pkgver"; set  -e
		fi
	git tag "xv$pkgver"
	git push origin $f'xv'$pkgver
	sed -i "s/pkgrel=.*$/pkgrel=1/" PKGBUILD
	fi
	# update PKGBUILD checksum
	echo "update PKGBUILD to xv$pkgver-$pkgrel..."
	rm -f $pkgname-$pkgver.tar.gz
	sha=$(makepkg -g)
	rm $pkgname-$pkgver.tar.gz
	echo $sha
	sed -i "s/^sha256sums.*$/$sha/" PKGBUILD
	# create package source
	makepkg $force -c --source
}

install() {
	# update aur package and install it 
	burp --category=xfce $pkgname-$pkgver-$pkgrel.src.tar.gz
	yaourt -S $pkgname
	# commit PKGBUILD and push the repository
	files=PKGBUILD
	message="update PKGBUILD to xv$pkgver-$pkgrel"
	commit PKGBUILD
	git push origin $f'zenx'
}


# options
f=''; force=''; arg=''
while  getopts fhpu opt
do
	case $opt in
	f)	force="-f"; f="+" ;;
	h)	arg=h ;;
	p)	arg=p ;;
	u)	arg=u ;;
	\?)	echo "use -f to force update PKGBUILD"
		echo "    -h build head package localy"
		echo "    -p to push the package without updating it"
		echo "    -u to update package source without pushing it"
		exit 1
	esac
done

case $arg in
u|'')
	if [ "$pkgver" == "$lastpkgver" ] && [ "$f" == "" ]
	then
	echo "enter new version number (last package version =  $lastpkgver) :"
	read pkgver
	else
	echo "update README to xv$pkgver ? Y/n/<package_version>"
	read answer
		case $answer in
		Y|y|"") ;;
		N|n) exit 0 ;;
		*) pkgver=$answer;;
		esac
	fi

	# update configure
	subst='AC_INIT(\[[a-z-]*\],.*\[[0-9.]*\]'
	sed -i "s/AC_INIT(\[[a-z-]*\],.*\[[0-9.]*\] \
	/AC_INIT([$pkgname], [$pkgver]/" configure.ac

	# update readme
	echo "update $readme to version $pkgver..."
	./configure
	;;
h)	headpkg ;;
esac

case $arg in
p|'')
	cd cache
	push; install
	;;
esac
