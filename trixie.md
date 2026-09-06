---
title: "Updating Raspberry Pi OS from Bookworm to Trixie"
description: "Step-by-step guide to upgrade Raspberry Pi OS from Bookworm to Trixie (Debian 13). Learn how to safely update your Raspberry Pi system."
keywords: "raspberry pi, debian trixie, bookworm, upgrade, update, raspberry pi os, debian 13"
---

# Updating Raspberry Pi OS Bookworm to Trixie

Debian Trixie has been out for a while, and Raspberry Pi OS finally updated to it. 
It is recommended by Raspberry Pi to do a fresh reinstall, but you can also try to upgrade your existing OS.

__NOTE: This guide is for the LITE variant of Raspberry Pi OS. If you have Raspberry Pi OS normal (with a desktop environment) refer to the Raspberry Pi OS updating guide in the Other resources section!__

## Finalizing Bookworm

First you should update the remaining bookworm packages you have. Run `sudo apt update` and `sudo apt full-upgrade -y`. Run `sudo apt autoremove -y` to remove any unneeded packages.

## Updating apt sources

The next step is to update the apt sources.

Open `/etc/apt/sources.list` and change every instance of `bookworm` to `trixie`. Do the same for the files in `/etc/apt/sources.list.d/`. On a clean install this will just be `raspi.list`, but if you have added any other repositories, update those too.

You can also do this in one shot with the following command:

```bash
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list /etc/apt/sources.list.d/*.list
```

Then refresh the package lists:

```bash
sudo apt update
```

## Upgrading to Trixie

Now run the upgrade. This upgrades all of your packages to their trixie versions, keeping your current config files instead of the packaged defaults so you don't get prompted for every changed config:

```bash
sudo apt full-upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" --purge --auto-remove
```

__NOTE: Enter this command exactly as shown. The punctuation matters!__

During the upgrade you may be asked if you want to restart services. Answer yes! If you get any other questions, yes is usually the right answer.

On a Pi 5 with a fast internet connection the upgrade takes around 15-20 minutes, expect it to take longer on older Pis.

## Finishing up

Once the upgrade finishes without errors, clean up unneeded packages, flush any pending writes to the SD card, and reboot:

```bash
sudo apt autoremove -y
sync
sudo reboot
```

After the Pi comes back up, check that you are running trixie:

```bash
lsb_release -c
```

You should see `Codename:       trixie`.

## Other resources

[Raspberry Pi OS updating guide](https://forums.raspberrypi.com/viewtopic.php?t=392376)

[Debian official updating guide](https://www.debian.org/releases/trixie/release-notes/upgrading.en.html)
