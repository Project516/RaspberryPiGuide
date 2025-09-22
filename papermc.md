# PaperMC Guide

![PaperMC logo](https://assets.papermc.io/brand/papermc_combination_mark_dark.min.svg)

[PaperMC](https://papermc.io) is a collection of software for administrating Minecraft Java servers. 

### Note: With [Geyser](https://geysermc.org), Bedrock players can join!

## Installing Java with SDKMAN!

First install Java. I recommend using [SDKMAN!](https://sdkman.io) for installing Java. To do so, run

`sudo apt update && sudo apt install zip unzip -y`

to install dependencies and then

`curl -s "https://get.sdkman.io" | bash`

to install. Run

`sdk install java 21.0.8-tem` to install Java 21.

Run 

`java -version` 

to verify the installation.

## Downloading the PaperMC Jar

PaperMC has a [downloads API](https://docs.papermc.io/misc/downloads-api/) for downloading their software. Run 

`curl -s "https://project516.github.io/RaspberryPiGuide/scripts/updatepaper.sh" | bash`

to download the server.jar in your current directory! 

#### This script can be use to update your server.jar too!

## Run server.jar

Run

`curl -s "https://project516.github.io/RaspberryPiGuide/scripts/startpaper.sh" | bash`
