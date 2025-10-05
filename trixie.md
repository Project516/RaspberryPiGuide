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

1. **Update current system**: `sudo apt update && sudo apt full-upgrade -y`
2. **Backup sources**: `sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup`
3. **Update sources**: Replace `bookworm` with `trixie` in `/etc/apt/sources.list`
4. **Upgrade**: `sudo apt update && sudo apt full-upgrade -y`
5. **Reboot**: `sudo reboot`

For detailed instructions, follow the official Debian guide linked above.
