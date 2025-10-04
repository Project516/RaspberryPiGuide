# Updating Raspberry Pi OS Bookworm to Trixie

Debian Trixie has been out for a while, but Raspberry Pi OS finally updated to it. 
It is recommended by Raspberry Pi to do a fresh reinstall, but I would rather try to upgrade my existing OS.

## Before You Begin

**Important:** Back up your important data before proceeding! While this process generally works well, there's always a risk when performing major system upgrades.

### Prerequisites

- A working Raspberry Pi running Raspberry Pi OS Bookworm
- Stable internet connection
- At least 2GB of free disk space
- Sudo privileges

## Step-by-Step Upgrade Process

### 1. Update Your Current System

First, make sure your Bookworm installation is fully up to date:

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo reboot
```

Wait for your system to reboot before continuing.

### 2. Backup Your Sources List

Create a backup of your current apt sources:

```bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bookworm.backup
sudo cp -r /etc/apt/sources.list.d /etc/apt/sources.list.d.bookworm.backup
```

### 3. Update APT Sources to Trixie

Replace 'bookworm' with 'trixie' in your sources list:

```bash
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list.d/*.list
```

### 4. Update Package Lists

Refresh the package lists with the new Trixie repositories:

```bash
sudo apt update
```

### 5. Perform the Upgrade

Now perform the distribution upgrade:

```bash
sudo apt full-upgrade -y
```

This process may take a while depending on your internet connection and the number of packages that need to be upgraded. The upgrade may ask you questions about configuration files - generally choosing to keep your current version is safe.

### 6. Clean Up

Remove any packages that are no longer needed:

```bash
sudo apt autoremove -y
sudo apt autoclean
```

### 7. Reboot

Reboot your system to complete the upgrade:

```bash
sudo reboot
```

### 8. Verify the Upgrade

After rebooting, verify your system is running Trixie:

```bash
cat /etc/os-release
```

Look for `VERSION_CODENAME=trixie` in the output.

You can also check your kernel version:

```bash
uname -a
```

## Troubleshooting

### Package Conflicts

If you encounter package conflicts during the upgrade, try:

```bash
sudo apt --fix-broken install
sudo dpkg --configure -a
```

### Held Packages

If some packages are being held back:

```bash
sudo apt list --upgradable
sudo apt install <package-name>
```

### Out of Space

If you run out of disk space during the upgrade:

```bash
sudo apt clean
sudo apt autoremove
```

## Rolling Back

If you need to roll back to Bookworm (only possible if you haven't rebooted after the upgrade):

```bash
sudo cp /etc/apt/sources.list.bookworm.backup /etc/apt/sources.list
sudo cp -r /etc/apt/sources.list.d.bookworm.backup/* /etc/apt/sources.list.d/
sudo apt update
sudo apt full-upgrade -y
```

## Additional Resources

[Debian official updating guide](https://www.debian.org/releases/trixie/release-notes/upgrading.en.html)

[Raspberry Pi OS updating guide](https://forums.raspberrypi.com/viewtopic.php?t=392376)
