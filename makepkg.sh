#!/bin/sh

# To update README, PKGBUILD and push tag into the remote repository. 
# dependencies : git, burp, base-devel group, yaourt.

set -e

LANG=C

# package variables
source arch/PKGBUILD
name=${pkgname%%-*}

# check old package version
lastpkgver=$(git tag -l v* | sort -V | tail -n 1 | cut -dv -f2)

# check new package version
pkgrel=$(grep -m 1 "pkgrel=" arch/PKGBUILD | cut -d= -f2)

headpkg() {
# use -f to force update

cd arch
rm -rf src
mkdir src
ln -sr ".." "src/${pkgname}-$pkgver"
makepkg $force --source --skipchecksums
makepkg $force --noextract --clean --skipchecksums
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
}


# options
f=''; force=''; h=false; p=false; i=false;
while  getopts fhpi opt
do
	case $opt in
	f)	force="-f"; f="+" ;;
	h)	h=true ;;
	p)	p=true ;;
	i)	i=true ;;
	\?)	echo "use -f to force update PKGBUILD"
		echo "    -h build head package localy"
		echo "    -p push a tag and create package source without installing it"
		echo "    -i update aur package and install it"
		exit 1
	esac
done

if !($h) && !($p) && !($i) ; then
h=false; p=true; i=true;
fi

if $h; then
	p=i=false;
	headpkg
	exit 0;
fi

if $p; then
	if [ "$pkgver" == "$lastpkgver" ] && [ "$f" == "" ]
	then
		echo "tag v$pkgver already exist, aborded"
		exit 1;
	else
		echo "push package v$pkgver ? Y/n/<package_version>"
		read answer
		case $answer in
		Y|y|"") ;;
		*) exit 0 ;;
		esac
		cd arch
		push
		cd ..
	fi
fi

if $i; then
	cd arch
	install
	cd ..
	# push the repository
	git push $force
fi


