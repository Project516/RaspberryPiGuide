---
title: "Jellyfin Media Server Installation Guide for Raspberry Pi"
description: "Install Jellyfin media server on Raspberry Pi. Free, open-source alternative to Plex and Emby. Stream your personal media collection."
keywords: "jellyfin, raspberry pi, media server, streaming, plex alternative, self-hosted media, raspberry pi media center"
---

# Jellyfin Install Guide

![Jellyfin](https://jellyfin.org/images/logo.svg)

[Jellyfin](https://jellyfin.org) is a free, open-source media server that allows you to organize and stream your personal media collection. It's a great alternative to Plex or Emby with no premium features or tracking.

## Installation

To install Jellyfin on your Raspberry Pi, run:

```bash
curl -s https://repo.jellyfin.org/install-debuntu.sh | sudo bash
```

Jellyfin will be installed on port **8096** by default. Access it at `http://your-pi-ip:8096`

A setup wizard will guide you through the initial configuration.

## Official Documentation

- [Jellyfin Official Docs](https://jellyfin.org/docs/) - Complete documentation
- [Jellyfin Installation Guide](https://jellyfin.org/docs/general/installation/linux) - Linux installation instructions
- [Jellyfin Quick Start](https://jellyfin.org/docs/general/quick-start) - Getting started guide
- [Jellyfin GitHub](https://github.com/jellyfin/jellyfin) - Source code and issues

## Next Steps

After installation, configure your media libraries through the web interface and start streaming!
