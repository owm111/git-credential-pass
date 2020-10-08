PREFIX ?= /usr

all: dist/pass-git-helper

dist/pass-git-helper: pass-git-helper
	mkdir dist
	cp -f pass-git-helper dist/pass-git-helper
	chmod 755 dist/pass-git-helper

install: dist/pass-git-helper
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dist/pass-git-helper $(DESTDIR)$(PREFIX)/bin/pass-git-helper
	chmod 755 $(DESTDIR)$(PREFIX)/bin/pass-git-helper

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/pass-git-helper

.PHONY: all install uninstall
