# Updating Raspberry Pi OS Bookworm to Trixie

Debian Trixie has been out for a while, but Raspberry Pi OS finally updated to it. 
It is recommended by Raspberry Pi to do a fresh reinstall, but I would rather try to upgrade my existing OS.

__NOTE: This guide is for the LITE varient of Raspberry Pi OS. If you have Raspberry Pi OS normal (with a desktop enviornment) refer to the Raspberry Pi OS updating guide in the Other resources section!__

## Finalizing Bookworm

First you should update the remaining bookworm packages you have. Run `sudo apt update` and `sudo apt full-upgrade -y`. Run `sudo apt autoremove -y` to remove any unneeded packages.

## Updating apt sources

The next step is to update the apt sources.



## Other resources

[Raspberry Pi OS updating guide](https://forums.raspberrypi.com/viewtopic.php?t=392376)

[Debian offical updating guide](https://www.debian.org/releases/trixie/release-notes/upgrading.en.html)
