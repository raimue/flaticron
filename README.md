# flaticron

flaticron sends daily mail reminders about pending updates for applications and runtimes installed by [flatpak](https://flatpak.org/). It is similar to the tools apticron[^apticron] for apt on Debian and porticron[^porticron] for portage on Gentoo.

# Prerequisites

flaticron uses [mail(1)](https://manpages.debian.org/stable/bsd-mailx/mail.1.en.html) and assumes you have setup an MTA such as exim4 or postfix to send mail. The recommended setup is a satellite system with an external smarthost as mail relay.

# Installation

## Manual installation from git repository

Install dependencies:
```
# Build dependencies
sudo apt install git meson
# Runtime dependencies
sudo apt install flatpak bash
```

Install flaticron:
```
git clone https://github.com/raimue/flaticron.git
cd flaticron
meson setup build
meson install -C build
```

# Quick start

## System installation

If you use the recommended system-wide installation, no special setup is necessary. Make sure you receive mail for the user *root* by configuring your address in /etc/aliases accordingly. As an alternative, set the mail address for your user in the config file at `/etc/flaticron/flaticron.conf`.

## User installation

If you prefer `flatpak --user`, you can configure the email address for your user in the config file in ~/.config/flaticron/flaticron.conf. Otherwise it will be delivered to the local mailbox,

```
EMAIL="you@example.org"
```

Then enable the systemd timer unit for your user session:
```
systemctl --user enable --now flaticron.timer
```

# Detailed usage

If you prefer classic cron over systemd, you can also add a manual command to the crontab:

```
flaticron
  --config <file>      Read this additional config file
  --user               Show only pending updates for user installation
  --system             Show only pending updates for system installation
  --installation=NAME  Show only pending updates for a non-default system-wide installation
  --help               Show this help text
```

By default, flaticron operates the same as flatpak and reports pending updates for both the system and user installation. If you install applications and runtimes to the flatpak user installation, simply run the command as your own user. If you use the recommended system-wide installation, you can run the flaticron command from your crontab or use the provided systemd units.

flaticron is configured with builtin defaults, which can be overriden from the following configuration files. They are read in this order, in which later files may override earlier options:

  - /etc/flaticron/flaticron.conf
  - ${XDG\_CONFIG\_HOME}/flaticron/flaticron.conf (by default $HOME/.config/flaticron/flaticron.conf)

Look at the system-wide file for the detailed description of available options.

# License

flaticron is published under the same license as the flatpak framework. See COPYING for the full license text.

SPDX-License-Identifier: LGPL-2.1-or-later

# References

[^apticron]: https://salsa.debian.org/debian/apticron
[^porticron]: https://github.com/gentoo/porticron

[modeline]: # ( vim: set et sw=2 ts=2 tw=0 wrap: )
