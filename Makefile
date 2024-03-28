.PHONY: all install check

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
	install -d -m 0755 $(DESTDIR)$(SBINDIR)
	install -m 0755 flaticron $(DESTDIR)$(SBINDIR)/
	install -d -m 0755 $(DESTDIR)$(SYSCONFDIR)/flaticron
	install -m 0644 flaticron.conf $(DESTDIR)$(SYSCONFDIR)/flaticron
	install -d -m 0755 $(DESTDIR)$(SYSTEMDSYSTEMDIR)
	install -m 0644 \
		systemd/system/flaticron.service \
		systemd/system/flaticron.timer \
		$(DESTDIR)$(SYSTEMDSYSTEMDIR)/
	install -d -m 0755 $(DESTDIR)$(SYSTEMDUSERDIR)
	install -m 0644 \
		systemd/user/flaticron.service \
		systemd/user/flaticron.timer \
		$(DESTDIR)$(SYSTEMDUSERDIR)/
	install -m 0644 \
		systemd/system/flaticron@.service \
		systemd/system/flaticron@.timer \
		$(DESTDIR)$(SYSTEMDSYSTEMDIR)/
	install -d -m 0755 $(DESTDIR)$(DOCDIR)/flaticron
	install -m 0644 \
		README.md \
		COPYING \
		$(DESTDIR)$(DOCDIR)/flaticron/

check:
	shellcheck flaticron flaticron.conf
