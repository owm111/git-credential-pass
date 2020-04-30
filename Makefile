PREFIX ?= /usr

all:
	@echo Not really anything to build

install: pass-git-helper
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f pass-git-helper $(DESTDIR)$(PREFIX)/bin/pass-git-helper
	chmod 755 $(DESTDIR)$(PREFIX)/bin/pass-git-helper

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/pass-git-helper

.PHONY: all install uninstall
