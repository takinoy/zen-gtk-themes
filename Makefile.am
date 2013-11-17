
maindir = Zen
darkdir = $(maindir)-nokto

light_color_dirs =				\
	$(maindir)-bicolor \
	$(maindir)-blua \
	$(maindir)-griza \
	$(maindir)-papero \
	$(maindir)-verda 

dark_color_dirs =				\
	$(maindir)-nigra

vardirs =				\
	$(darkdir) \
	$(light_color_dirs) \
	$(dark_color_dirs)

themedirs =				\
	$(maindir) \
	$(vardirs) 

mainpaths = 				\
	gtk-2.0/gtk-widgets.rc \
	gtk-2.0/xfce.rc \
	gtk-2.0/apps/libreoffice.rc \
	gtk-3.0/gtk-widgets.css \
	gtk-3.0/lightdm-gtk-greeter.css \
	gtk-3.0/panel.css

EXTRA_DIST = $(themedirs)

all-am: Makefile refresh

refresh:
	for vardir in $(vardirs); do \
		for path in $(mainpaths); do \
			dir=`dirname $$path`; \
			mkdir -p $$vardir/$$dir; \
			cp -flrv $(maindir)/$$path $$vardir/$$path; \
		done; \
	done;
	for vardir in $(maindir) $(light_color_dirs); do \
		cp -flrv $(darkdir)/gtk-3.0/gtk.css \
		$$vardir/gtk-3.0/gtk-dark.css; \
	done;
	cp -flrv $(maindir)/gtk-2.0/resize-grip.png \
	$(maindir)/gtk-3.0/resize-grip.png; \
	for vardir in $(light_color_dirs); do \
		for dir in gtk-2.0 gtk-3.0; do \
			mkdir -p $$vardir/$$dir; \
			cp -flrv $(maindir)/$$dir/resize-grip.png \
			$$vardir/$$dir/resize-grip.png; \
		done; \
	done;
	cp -flrv $(darkdir)/gtk-2.0/resize-grip.png \
	$(darkdir)/gtk-3.0/resize-grip.png; \
	for dir in gtk-2.0 gtk-3.0; do \
		mkdir -p $(dark_color_dirs)/$$dir; \
		cp -flrv $(darkdir)/$$dir/resize-grip.png \
		$(dark_color_dirs)/$$dir/resize-grip.png; \
	done;

install-data-am :
	for themedir in $(themedirs); do \
		echo -e "Copying files for $$themedir..."; \
		cd $$themedir; \
		for gtkdir in $(GTK_SUBDIRS) xfce-notify-4.0; do \
			$(mkdir_p) $(DESTDIR)$(datadir)/themes/$$themedir/$$gtkdir; \
			cd $$gtkdir; \
			for dir in `find * -type d`; do \
				$(mkdir_p) \
				$(DESTDIR)$(datadir)/themes/$$themedir/$$gtkdir/$$dir; \
			done; \
			for file in `find * -type f`; do \
				$(install_sh_DATA) $$file $(DESTDIR)$(datadir)/themes/$$themedir/$$gtkdir/$$file; \
			done; \
			cd ..; \
		done; \
		$(install_sh_DATA) index.theme \
		$(DESTDIR)$(datadir)/themes/$$themedir/index.theme; \
		cd ..; \
	done; 

uninstall-am :
	for themedir in $(themedirs); do \
		rm -rf  $(DESTDIR)$(datadir)/themes/$$themedir; \
	done; 

distclean-local:
	rm -rf *.cache *~

.PHONY: ChangeLog

ChangeLog: Makefile
	(GIT_DIR=$(top_srcdir)/.git git log > .changelog.tmp \
	&& mv .changelog.tmp ChangeLog; rm -f .changelog.tmp) \
	|| (touch ChangeLog; echo 'Git directory not found: installing possibly empty changelog.' >&2)

dist-hook: ChangeLog
