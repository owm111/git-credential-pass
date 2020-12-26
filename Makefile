PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin

all: git-credential-pass

git-credential-pass:
	@echo no build

install: git-credential-pass
	install -Dm755 -t $(BINDIR) git-credential-pass

uninstall:
	rm -f $(BINDIR)/git-credential-pass

.PHONY: all install uninstall
