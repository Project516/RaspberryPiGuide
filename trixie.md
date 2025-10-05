---
title: "Updating Raspberry Pi OS from Bookworm to Trixie"
description: "Step-by-step guide to upgrade Raspberry Pi OS from Bookworm to Trixie (Debian 13). Learn how to safely update your Raspberry Pi system."
keywords: "raspberry pi, debian trixie, bookworm, upgrade, update, raspberry pi os, debian 13"
---

# Updating Raspberry Pi OS Bookworm to Trixie

Debian Trixie has been out for a while, and Raspberry Pi OS finally updated to it. 
It is recommended by Raspberry Pi to do a fresh reinstall, but you can also try to upgrade your existing OS.

## Before You Begin

⚠️ **Important**: Back up your data before proceeding. While the upgrade process is generally safe, having a backup ensures you won't lose important files.

## Upgrade Resources

### Official Documentation

- [Debian Official Updating Guide](https://www.debian.org/releases/trixie/release-notes/upgrading.en.html) - Comprehensive guide from Debian
- [Raspberry Pi OS Updating Guide](https://forums.raspberrypi.com/viewtopic.php?t=392376) - Community discussion and official guidance
- [Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/computers/os.html) - Official Raspberry Pi OS documentation

### Quick Steps

__NOTE: This guide is for the LITE varient of Raspberry Pi OS. If you have Raspberry Pi OS normal (with a desktop enviornment) refer to the Raspberry Pi OS updating guide in the Other resources section!__

## Finalizing Bookworm

First you should update the remaining bookworm packages you have. Run `sudo apt update` and `sudo apt full-upgrade -y`. Run `sudo apt autoremove -y` to remove any unneeded packages.

## Updating apt sources

The next step is to update the apt sources.



## Other resources

[Raspberry Pi OS updating guide](https://forums.raspberrypi.com/viewtopic.php?t=392376)

[Debian offical updating guide](https://www.debian.org/releases/trixie/release-notes/upgrading.en.html)
