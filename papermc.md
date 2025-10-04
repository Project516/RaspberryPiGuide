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

to start your server!

## Server Configuration

### First Time Setup

On first run, the server will generate configuration files and stop. This is normal! The server needs you to accept the EULA (End User License Agreement).

### Server Properties

Edit the `server.properties` file to configure your server:

```bash
nano server.properties
```

Important settings to consider:

- `server-port=25565` - The port your server runs on
- `max-players=20` - Maximum number of players
- `view-distance=10` - How far players can see (lower for better performance)
- `difficulty=easy` - Game difficulty (peaceful, easy, normal, hard)
- `gamemode=survival` - Default game mode
- `pvp=true` - Enable/disable player vs player combat
- `spawn-protection=16` - Radius around spawn that's protected

### Performance Optimization

For Raspberry Pi, consider these settings in `server.properties`:

```properties
view-distance=6
simulation-distance=6
max-tick-time=60000
```

And in `spigot.yml`:

```yaml
entity-tracking-range:
  players: 48
  animals: 32
  monsters: 32
```

## Managing Your Server

### Stopping the Server

To safely stop the server, type `stop` in the server console.

### Restarting the Server

After stopping, run the start script again:

```bash
curl -s "https://project516.github.io/RaspberryPiGuide/scripts/startpaper.sh" | bash
```

### Running as a Service

For a production server, consider running PaperMC as a systemd service:

Create a service file:

```bash
sudo nano /etc/systemd/system/minecraft.service
```

Add this content (adjust paths as needed):

```ini
[Unit]
Description=Minecraft Server
After=network.target

[Service]
Type=simple
User=pi
WorkingDirectory=/home/pi/minecraft
ExecStart=/usr/bin/java -Xms2048M -Xmx2048M -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1HeapRegionSize=8M -XX:G1HeapWastePercent=5 -XX:G1MaxNewSizePercent=40 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1NewSizePercent=30 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -XX:MaxGCPauseMillis=200 -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Enable and start the service:

```bash
sudo systemctl daemon-reload
sudo systemctl enable minecraft
sudo systemctl start minecraft
```

Check status:

```bash
sudo systemctl status minecraft
```

View logs:

```bash
sudo journalctl -u minecraft -f
```

## Plugins

PaperMC supports Spigot and Paper plugins. Place plugin JAR files in the `plugins/` directory.

### Recommended Plugins

The setup script automatically downloads these plugins:

- **Geyser** - Allows Bedrock players to join your Java server
- **Floodgate** - Works with Geyser for authentication
- **ViaVersion** - Allows players on different Minecraft versions to join
- **ViaBackwards** - Adds support for older client versions
- **ViaRewind** - Adds support for very old client versions

### Installing Additional Plugins

1. Download the plugin JAR file
2. Place it in the `plugins/` directory
3. Restart the server

Popular plugins:

- **EssentialsX** - Essential commands and features
- **WorldEdit** - In-game world editor
- **WorldGuard** - Region protection
- **LuckPerms** - Permission management

## Backups

Regular backups are essential! Create a backup script:

```bash
nano backup.sh
```

Add:

```bash
#!/bin/bash
BACKUP_DIR="/home/pi/minecraft-backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/minecraft-backup-$DATE.tar.gz -C /home/pi/minecraft .

# Keep only last 7 backups
ls -t $BACKUP_DIR/minecraft-backup-*.tar.gz | tail -n +8 | xargs rm -f
```

Make it executable:

```bash
chmod +x backup.sh
```

Set up automatic daily backups with cron:

```bash
crontab -e
```

Add this line (runs daily at 3 AM):

```
0 3 * * * /home/pi/backup.sh
```

## Updating Your Server

To update PaperMC to the latest version:

```bash
curl -s "https://project516.github.io/RaspberryPiGuide/scripts/updatepaper.sh" | bash
```

This script will:
- Stop the server if running
- Download the latest PaperMC version
- Update Geyser, Floodgate, and Via plugins

## Troubleshooting

### Server Won't Start

Check Java version:
```bash
java -version
```

Should be Java 21 or higher.

### Out of Memory Errors

Reduce allocated memory in the start script or reduce view distance.

### Poor Performance

- Lower view-distance and simulation-distance
- Reduce entity counts
- Remove unnecessary plugins
- Ensure your Pi has adequate cooling

### Can't Connect

- Check firewall settings
- Verify port forwarding if accessing from outside your network
- Confirm server is running: `ps aux | grep server.jar`

## Port Forwarding

To allow players outside your network to connect:

1. Log into your router
2. Forward port 25565 (TCP) to your Pi's local IP
3. Share your public IP address with players

Find your public IP:
```bash
curl ifconfig.me
```

## Additional Resources

- [PaperMC Documentation](https://docs.papermc.io/)
- [Geyser Wiki](https://wiki.geysermc.org/)
- [Minecraft Server Properties](https://minecraft.wiki/w/Server.properties)
- [Aikar's Flags Explained](https://docs.papermc.io/paper/aikars-flags)