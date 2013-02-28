#!/bin/sh

# workaround for ZenX merge...

path="Zen Zen-verda Zen-papero"
git add $path/

set $path
until [ $# = 0 ]
do
if [ $# != 3 ]; then file="${1%%-*}X-${1#*-}"; else file=ZenX; fi
cp -f ZenX-blua/gtk-3.0/gtk-widgets.css $1/gtk-3.0/gtk-widgets.css
cp -f ZenX-blua/gtk-2.0/gtk-widgets.rc $1/gtk-2.0/gtk-widgets.rc
git mv -f $1/gtk-3.0/gtk-widgets.css $file/gtk-3.0/gtk-widgets.css
git mv -f $1/gtk-2.0/gtk-widgets.rc $file/gtk-2.0/gtk-widgets.rc
shift
done

rm -r $path
./autogen.sh
