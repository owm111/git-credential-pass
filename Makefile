PREFIX ?= /usr
LIBDIR ?= $(PREFIX)/lib
BINDIR ?= $(PREFIX)/bin
SYSTEM_EXTENSION_DIR ?= $(LIBDIR)/password-store/extensions

all: git-helper.bash

git-helper.bash:
	@echo no build

git-credential-pass:
	@echo no build

check: git-helper.bash
	./test.sh

install: git-helper.bash git-credential-pass
	install -Dm755 -t $(SYSTEM_EXTENSION_DIR) git-helper.bash
	install -Dm755 -t $(BINDIR) git-credential-pass

uninstall:
	rm -f $(SYSTEM_EXENSION_DIR)/git-helper.bash
	rm -f $(BINDIR)/git-credential-pass

.PHONY: all install uninstall check
