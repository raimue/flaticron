.PHONY: all install check

INSTALL=install

PREFIX=/usr/local
SYSCONFDIR=/etc
SBINDIR=$(PREFIX)/sbin
SYSTEMDLIBDIR=$(PREFIX)/lib/systemd
SYSTEMDSYSTEMDIR=$(SYSTEMDLIBDIR)/system
SYSTEMDUSERDIR=$(SYSTEMDLIBDIR)/user
DATADIR=$(PREFIX)/share
DOCDIR=$(DATADIR)/doc

all:

install:
	$(INSTALL) -d -m 0755 $(DESTDIR)$(SBINDIR)
	$(INSTALL) -m 0755 flaticron $(DESTDIR)$(SBINDIR)/
	$(INSTALL) -d -m 0755 $(DESTDIR)$(SYSCONFDIR)/flaticron
	$(INSTALL) -m 0644 flaticron.conf $(DESTDIR)$(SYSCONFDIR)/flaticron
	$(INSTALL) -d -m 0755 $(DESTDIR)$(SYSTEMDSYSTEMDIR)
	$(INSTALL) -m 0644 \
		systemd/system/flaticron.service \
		systemd/system/flaticron.timer \
		$(DESTDIR)$(SYSTEMDSYSTEMDIR)/
	$(INSTALL) -d -m 0755 $(DESTDIR)$(SYSTEMDUSERDIR)
	$(INSTALL) -m 0644 \
		systemd/user/flaticron.service \
		systemd/user/flaticron.timer \
		$(DESTDIR)$(SYSTEMDUSERDIR)/
	$(INSTALL) -m 0644 \
		systemd/system/flaticron@.service \
		systemd/system/flaticron@.timer \
		$(DESTDIR)$(SYSTEMDSYSTEMDIR)/
	$(INSTALL) -d -m 0755 $(DESTDIR)$(DOCDIR)/flaticron
	$(INSTALL) -m 0644 \
		README.md \
		COPYING \
		$(DESTDIR)$(DOCDIR)/flaticron/

check:
	shellcheck flaticron flaticron.conf
