PREFIX ?= /usr
LIBDIR ?= $(PREFIX)/lib
SYSTEM_EXTENSION_DIR ?= $(LIBDIR)/password-store/extensions

all: git-helper.bash

git-helper.bash:
	@echo no build

check: git-helper.bash
	./test.sh

install: git-helper.bash
	install -Dm755 -t $(SYSTEM_EXTENSION_DIR) git-helper.bash

uninstall:
	rm -f $(SYSTEM_EXENSION_DIR)/git-helper.bash

.PHONY: all install uninstall check