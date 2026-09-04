.PHONY: all install clean check

INSTALL=install
SCDOC=scdoc

PREFIX=/usr/local
SYSCONFDIR=/etc
SBINDIR=$(PREFIX)/sbin
SYSTEMDLIBDIR=$(PREFIX)/lib/systemd
SYSTEMDSYSTEMDIR=$(SYSTEMDLIBDIR)/system
SYSTEMDUSERDIR=$(SYSTEMDLIBDIR)/user
DATADIR=$(PREFIX)/share
MANDIR=$(PREFIX)/share/man
DOCDIR=$(DATADIR)/doc

all: flaticron.8

flaticron.8: flaticron.8.scd
	$(SCDOC) < $< > $@

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
	$(INSTALL) -d -m 0755 $(DESTDIR)$(MANDIR)
	$(INSTALL) -d -m 0755 $(DESTDIR)$(MANDIR)/man8
	$(INSTALL) -m 0644 flaticron.8 $(DESTDIR)$(MANDIR)/man8/
	$(INSTALL) -d -m 0755 $(DESTDIR)$(DOCDIR)/flaticron
	$(INSTALL) -m 0644 \
		README.md \
		$(DESTDIR)$(DOCDIR)/flaticron/

clean:
	$(RM) flaticron.8

check:
	shellcheck flaticron flaticron.conf
