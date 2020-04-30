PREFIX ?= /usr

all: dist/pass-git-helper

cases.txt: cases.def.txt
	cp cases.def.txt cases.txt

dist/pass-git-helper: pass-git-helper cases.txt
	mkdir dist
	./insert-cases cases.txt < pass-git-helper > dist/pass-git-helper
	chmod 755 dist/pass-git-helper

install: dist/pass-git-helper
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dist/pass-git-helper $(DESTDIR)$(PREFIX)/bin/pass-git-helper
	chmod 755 $(DESTDIR)$(PREFIX)/bin/pass-git-helper

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/pass-git-helper

.PHONY: all install uninstall
