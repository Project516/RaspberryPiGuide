#!/bin/sh

# Install jq
sudo apt update && sudo apt install jq -y
# Kill server.jar if running
pkill -f 'server.jar'
# Remove server.jar file
rm -f server.jar
# Download the server.jar file
curl -s "https://project516.github.io/RaspberryPiGuide/scripts/installpaper.sh" | bash
mkdir -p plugins
# Remove Geyser
rm -f plugins/geyser.jar
# Redownload Geyser
curl -s -L -o plugins/geyser.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot
# Remove Floodgate
rm -f plugins/floodgate.jar
# Redownload Floodgate
curl -s -L -o plugins/floodgate.jar https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot
rm -f plugins/viaversion.jar
curl -s -L -o plugins/viaversion.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.5.1/PAPER/ViaVersion-5.5.1.jar
rm -f plugins/viabackwards.jar
curl -s -L -o plugins/viabackwards.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaBackwards/versions/5.5.1/PAPER/ViaBackwards-5.5.1.jar
rm -f plugins/viarewind.jar
curl -s -L -o plugins/viarewind.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaRewind/versions/4.0.11/PAPER/ViaRewind-4.0.11.jar
