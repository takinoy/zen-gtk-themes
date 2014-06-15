dnl Process this file with autoconf to produce a configure script.

dnl *******************************************
dnl *** Debugging support for GIT snapshots ***
dnl *******************************************
m4_define([zen-gtk-themes_debug_default], [ifelse(zen-gtk-themes_version_tag(), [git], [yes], [minimum])])

dnl ***************************
dnl *** Initialize autoconf ***
dnl ***************************
AC_COPYRIGHT([Copyright (c) 2012-2013 Cedric Leporcq. All rights reserved.])
AC_INIT([zen-gtk-themes], [0.10.16.gtk34], [https://github.com/cedl38/zen-gtk-themes])
AC_PREREQ([2.50])
AC_REVISION([zen-gtk-themes_version_build])

dnl ***************************
dnl *** Initialize automake ***
dnl ***************************
AM_INIT_AUTOMAKE([1.8 dist-bzip2 tar-ustar no-dist-gzip])
AM_MAINTAINER_MODE()
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

dnl ********************************
dnl *** Check for basic programs ***
dnl ********************************
AC_PROG_INSTALL()

dnl ***********************************
dnl *** Check for optional packages ***
dnl ***********************************
XDT_CHECK_OPTIONAL_PACKAGE([GTK2], [gtk+-2.0], [2.20.0], [gtk2], [Gtk 2 theme engine])
XDT_CHECK_OPTIONAL_PACKAGE([GTK3], [gtk+-3.0], [3.4.0], [gtk3], [Gtk 3 theme engine])

GTK_SUBDIRS=""
if test x"$GTK2_FOUND" = x"yes"
then
  GTK2_BINARY_VERSION=`$PKG_CONFIG --variable=gtk_binary_version gtk+-2.0`
  AC_SUBST([GTK2_BINARY_VERSION])
  GTK_SUBDIRS="$GTK_SUBDIRS gtk-2.0"
fi
if test x"$GTK3_FOUND" = x"yes"
then
  GTK3_BINARY_VERSION=`$PKG_CONFIG --variable=gtk_binary_version gtk+-3.0`
  AC_SUBST([GTK3_BINARY_VERSION])
  GTK_SUBDIRS="$GTK_SUBDIRS gtk-3.0"
fi
AC_SUBST([GTK_SUBDIRS])

dnl ***********************************
dnl *** Check for debugging support ***
dnl ***********************************
XDT_FEATURE_DEBUG([zen-gtk-themes_debug_default])

dnl *********************************
dnl *** Substitute platform flags ***
dnl *********************************
AC_MSG_CHECKING([PLATFORM_CPPFLAGS])
AC_MSG_RESULT([$PLATFORM_CPPFLAGS])
AC_SUBST([PLATFORM_CPPFLAGS])
AC_MSG_CHECKING([PLATFORM_CFLAGS])
AC_MSG_RESULT([$PLATFORM_CFLAGS])
AC_SUBST([PLATFORM_CFLAGS])
AC_MSG_CHECKING([PLATFORM_LDFLAGS])
AC_MSG_RESULT([$PLATFORM_LDFLAGS])
AC_SUBST([PLATFORM_LDFLAGS])

AC_OUTPUT([
Makefile
README
])

dnl ***************************
dnl *** Print configuration ***
dnl ***************************
echo
echo "Build Configuration:"
echo
echo "* Gtk 2 Engine: $GTK2_FOUND"
echo "* Gtk 3 Engine: $GTK3_FOUND"
echo
echo "* Install Prefix: $prefix"
echo "* Debug Support: $enable_debug"
echo
