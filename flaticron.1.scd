flaticron(1) "v0.2"

; SPDX-License-Identifier: LGPL-2.1-or-later

# NAME

flaticron - mail notifications for pending Flatpak updates

# SYNOPSIS

*flaticron* [*--config* <file>]++
	[*--email* <addr>] [*--stdout*]++
	[*--user*] [*--system*] [*--installation* <name>]++
	[*--version*] [*--help*]

# DESCRIPTION

flaticron sends daily mail reminders about pending updates for applications and
runtimes installed by Flatpak. It is similar to the tools apticron for apt on
Debian and porticron for portage on Gentoo.

flaticron uses _mailx_(1) and assumes you have setup an MTA such as exim4 or
postfix to send mail. The recommended setup is a satellite system with an
external smarthost as mail relay.

# FILES

- _/etc/flaticron/flaticron.conf_
- _${XDG\_CONFIG\_HOME}/flaticron/flaticron.conf_

# SEE ALSO

_apticron_(1)

# AUTHOR

Maintained by Rainer Müller <raimue@codingfarm.de>.

Please file bug reports or feature requests on the project website at
<https://github.com/raimue/flaticron>.
