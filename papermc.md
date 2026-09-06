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

You'll need Java 25 or higher to run modern Minecraft servers. Java 25 is only available for 64-bit systems, so make sure you are running the 64-bit version of Raspberry Pi OS.

## Installing Java

First, ensure your system has all required tools to successfully install Java.

```bash
sudo apt-get update
sudo apt-get install ca-certificates apt-transport-https gnupg wget
```

Second, import the Amazon Corretto public key and apt repository.

```bash
wget -O - https://apt.corretto.aws/corretto.key | sudo gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | sudo tee /etc/apt/sources.list.d/corretto.list
```

Then, install Java 25 and other dependencies using the following command:

```bash
sudo apt-get update
sudo apt-get install -y java-25-amazon-corretto-jdk libxi6 libxtst6 libxrender1
```

Verify the installation:

```bash
java -version
```

## Downloading the PaperMC Server

PaperMC has a [downloads API](https://docs.papermc.io/misc/downloads-api/) for downloading their software. Run:

```bash
curl -s "https://project516.dev/RaspberryPiGuide/scripts/updatepaper.sh" | bash
```

This downloads the server.jar in your current directory.

**Note**: This script can also be used to update your server.jar to the latest version!

## Running the Server

Start your server with:

```bash
curl -s "https://project516.dev/RaspberryPiGuide/scripts/startpaper.sh" | bash
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
