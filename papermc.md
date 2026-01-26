---
title: "PaperMC Minecraft Server Setup on Raspberry Pi"
description: "Complete guide to setting up a PaperMC Minecraft server on Raspberry Pi. Includes Java installation, server configuration, and Geyser for Bedrock cross-play."
keywords: "papermc, minecraft server, raspberry pi, minecraft, java, geyser, bedrock, minecraft raspberry pi, paper minecraft"
---

# PaperMC Guide

![PaperMC logo](https://assets.papermc.io/brand/papermc_combination_mark_dark.min.svg)

[PaperMC](https://papermc.io) is a high-performance Minecraft server software for administrating Minecraft Java Edition servers. 

### Note: With [Geyser](https://geysermc.org), Bedrock players can join your Java server!

## Prerequisites

You'll need Java 21 or higher to run modern Minecraft servers.

## Installing Java with SDKMAN!

First, install Java. I recommend using [SDKMAN!](https://sdkman.io) for managing Java installations. 

Install dependencies:

```bash
sudo apt update && sudo apt install zip unzip -y
```

Install SDKMAN!:

```bash
curl -s "https://get.sdkman.io" | bash
```

Install Java 21:

```bash
sdk install java 21.0.8-tem
```

Verify the installation:

```bash
java -version
```

## Downloading the PaperMC Server

PaperMC has a [downloads API](https://docs.papermc.io/misc/downloads-api/) for downloading their software. Run:

```bash
curl -s "https://project516.github.io/RaspberryPiGuide/scripts/updatepaper.sh" | bash
```

This downloads the server.jar in your current directory.

**Note**: This script can also be used to update your server.jar to the latest version!

## Running the Server

Start your server with:

```bash
curl -s "https://project516.github.io/RaspberryPiGuide/scripts/startpaper.sh" | bash
```

## Official Documentation

- [PaperMC Documentation](https://docs.papermc.io/paper) - Complete server documentation
- [PaperMC Downloads](https://papermc.io/downloads) - Official download page
- [PaperMC GitHub](https://github.com/PaperMC/Paper) - Source code and issues
- [Geyser Documentation](https://wiki.geysermc.org/) - Cross-play setup guide
- [Aikars Flags](https://docs.papermc.io/paper/aikars-flags) - Optimized JVM flags for Minecraft

## Community Resources

- [PaperMC Discord](https://discord.gg/papermc) - Official community support
- [r/admincraft](https://reddit.com/r/admincraft) - Minecraft server administration community