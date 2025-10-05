---
title: "Servarr Suite Installation Guide - Radarr, Sonarr & Prowlarr on Raspberry Pi"
description: "Install and configure the Servarr suite (Radarr, Sonarr, Prowlarr) on Raspberry Pi for automated media management and downloads."
keywords: "servarr, radarr, sonarr, prowlarr, raspberry pi, media automation, plex, jellyfin, torrent, usenet"
---

# Servarr Install Guide

The Servarr suite is a collection of tools designed to automate media management and acquisition. 

The official Servarr suite consists of:

- **Lidarr** - Music collection manager
- **Radarr** - Movie collection manager
- **Readarr** - Book collection manager (Retired)
- **Sonarr** - TV show collection manager
- **Whisparr** - Adult content manager
- **Prowlarr** - Indexer manager for all *arr apps

### This guide covers Radarr, Sonarr, and Prowlarr.

## Sonarr Install Guide

[Sonarr](https://sonarr.tv) manages and downloads TV shows automatically. It has an official installation script:

Using curl:
```bash
curl -o- https://raw.githubusercontent.com/Sonarr/Sonarr/develop/distribution/debian/install.sh | sudo bash
```

Or using wget:
```bash
wget -qO- https://raw.githubusercontent.com/Sonarr/Sonarr/develop/distribution/debian/install.sh | sudo bash
```

The script will walk you through the installation. Access Sonarr at `http://your-pi-ip:8989`

**Important**: Always verify scripts before running them!

## Radarr Install Guide

[Radarr](https://radarr.video) manages and downloads movies automatically. Unlike Sonarr, it uses a community installation script from the [Servarr Wiki](https://wiki.servarr.com).

Download the installation script:
```bash
curl -o servarr-install-script.sh https://raw.githubusercontent.com/Servarr/Wiki/master/servarr/servarr-install-script.sh
```

Run the script:
```bash
sudo bash servarr-install-script.sh
```

Follow the instructions to install Radarr. Access Radarr at `http://your-pi-ip:7878`

## Prowlarr Install Guide

[Prowlarr](https://prowlarr.com) manages indexers for all your *arr applications. Install it using the same community script as Radarr.

Follow the same instructions as the Radarr section above, but select Prowlarr when prompted. Access Prowlarr at `http://your-pi-ip:9696`

## Setting up Prowlarr

**Important**: Set up Prowlarr **first** before configuring Radarr and Sonarr, as they rely on Prowlarr to find content.

Setup steps:
1. Add indexers in Prowlarr
2. In Settings → Apps, add Radarr and Sonarr connections
3. You'll need their API keys (found in Settings → General → Security in each app)
4. Prowlarr will automatically sync indexers to all connected apps

## Official Documentation

- [Servarr Wiki](https://wiki.servarr.com/) - Comprehensive documentation for all *arr apps
- [Sonarr Documentation](https://wiki.servarr.com/sonarr) - Official Sonarr docs
- [Radarr Documentation](https://wiki.servarr.com/radarr) - Official Radarr docs
- [Prowlarr Documentation](https://wiki.servarr.com/prowlarr) - Official Prowlarr docs
- [TRaSH Guides](https://trash-guides.info/) - Community quality guides and recommended settings

## Community Support

- [Servarr Discord](https://discord.gg/servarr) - Official community support
- [r/sonarr](https://reddit.com/r/sonarr), [r/radarr](https://reddit.com/r/radarr), [r/prowlarr](https://reddit.com/r/prowlarr) - Community subreddits

#### Q: What's the difference between the Sonarr and community installation scripts?

**A**: The Sonarr installation script is maintained by the official Sonarr developers, while the community script is maintained by the broader Servarr community. Both work reliably and are well-maintained.
