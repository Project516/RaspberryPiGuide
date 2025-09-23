#!/bin/sh

# Install jq
sudo apt update && sudo apt install jq -y
# Kill server.jar if running
pkill -f 'server.jar'
# Remove server.jar file
rm -f server.jar
# Download the server.jar file
curl -s "https://project516.github.io/RaspberryPiGuide/scripts/installpaper.sh" | bash
# Remove Geyser
rm -f plugins/geyser.jar
# Redownload Geyser
curl -s -L -o plugins/geyser.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot
