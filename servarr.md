# Servarr Install Guide

Servarr is a suite of tools designed to index and download torrents. 

The official Servarr suite consists of 

- Lidarr 
- Radarr
- Readarr
- Sonarr
- Whisparr
- Prowlarr

### This guide will only be about Radarr, Sonarr, and Prowlarr.

## Sonarr Install Guide

[Sonarr](https://sonarr.tv ) has an official install script. Run 

`curl -o- https://raw.githubusercontent.com/Sonarr/Sonarr/develop/distribution/debian/install.sh | sudo bash` 

or 

`wget -qO- https://raw.githubusercontent.com/Sonarr/Sonarr/develop/distribution/debian/install.sh | sudo bash` 

depending if you want to use curl or wget. That's all! The script will walk you through the installation.

### Make sure to verify the scripts before running them!

## Radarr Install Guide
Unlike Sonarr, [Radarr](https://radarr.video) has no "official" installation script. There is a community install script for Radarr and other tools in the [Servarr](https://wiki.servarr.com) suite. Run 

`curl -o servarr-install-script.sh https://raw.githubusercontent.com/Servarr/Wiki/master/servarr/servarr-install-script.sh` 

and then 

`sudo bash servarr-install-script.sh` 

to install and run the script. Then follow the instructions to install Radarr.

## Prowlarr Install Guide
Just like Radarr, [Prowlarr](https://prowlarr.com) can be installed via the community installation script. Follow the same instructions in the Radarr section and select Prowlarr instead. 

### That's it!

#### Q: What's the difference between the Sonarr and community installation scripts?

A: The Sonarr installation script was made and maintained by the official developers, while the community installation script is made and maintained by the community. I use both, and they work great.

## Accessing Your Services

After installation, each service will be available on specific ports:

- **Sonarr**: `http://<your-pi-ip>:8989`
- **Radarr**: `http://<your-pi-ip>:7878`
- **Prowlarr**: `http://<your-pi-ip>:9696`

Find your Pi's IP address:
```bash
hostname -I
```

## Setting up Prowlarr

Prowlarr should be set up **first** before Radarr and Sonarr, since they rely on Prowlarr to find content.

### Initial Setup

1. Navigate to `http://<your-pi-ip>:9696`
2. Complete the authentication setup (recommended for security)
3. Add indexers
4. Configure connections to Radarr and Sonarr

### Adding Indexers

1. Go to **Indexers** → **Add Indexer**
2. Choose from supported indexers (both public and private)
3. Configure each indexer with required settings
4. Test the connection
5. Save

Popular indexers include:
- **Public**: 1337x, RARBG, The Pirate Bay
- **Private**: Requires membership and API keys

### Connecting to Radarr and Sonarr

1. In Prowlarr, go to **Settings** → **Apps**
2. Click **+** to add a new application
3. Select either **Radarr** or **Sonarr**
4. Configure the connection:
   - **Prowlarr Server**: `http://localhost:9696`
   - **Radarr/Sonarr Server**: `http://localhost:7878` or `http://localhost:8989`
   - **API Key**: Found in Radarr/Sonarr Settings → General → Security
5. Test and Save

Prowlarr will automatically sync all your indexers to Radarr and Sonarr!

## Setting up Radarr

Radarr is for managing and downloading movies.

### Initial Configuration

1. Navigate to `http://<your-pi-ip>:7878`
2. Set up authentication (Settings → General → Security)
3. Add a root folder for movies
4. Configure quality profiles

### Adding a Root Folder

1. Go to **Settings** → **Media Management**
2. Click **Add Root Folder**
3. Choose a directory where movies will be stored (e.g., `/media/Movies`)
4. Save

### Adding Movies

1. Click **Add New** on the main page
2. Search for a movie
3. Select quality profile
4. Choose root folder
5. Click **Add Movie**

Radarr will automatically search for and download the movie!

### Download Clients

You need a download client (like qBittorrent or Transmission):

1. Go to **Settings** → **Download Clients**
2. Click **+** to add a client
3. Configure connection details
4. Test and Save

## Setting up Sonarr

Sonarr is for managing and downloading TV shows.

### Initial Configuration

1. Navigate to `http://<your-pi-ip>:8989`
2. Set up authentication (Settings → General → Security)
3. Add a root folder for TV shows
4. Configure quality profiles

### Adding a Root Folder

1. Go to **Settings** → **Media Management**
2. Click **Add Root Folder**
3. Choose a directory where TV shows will be stored (e.g., `/media/TV Shows`)
4. Save

### Adding TV Shows

1. Click **Add New** on the main page
2. Search for a TV show
3. Select:
   - Monitor: Which episodes to download (all, future, latest season, etc.)
   - Quality Profile: Preferred quality
   - Root Folder: Where to save
   - Series Type: Standard, Daily, or Anime
4. Click **Add Series**

Sonarr will monitor for new episodes and download them automatically!

### Download Clients

Configure the same way as in Radarr:

1. Go to **Settings** → **Download Clients**
2. Add your torrent/usenet client
3. Test and Save

## Download Client Setup

### Installing qBittorrent

qBittorrent is a popular, lightweight torrent client:

```bash
sudo apt update
sudo apt install qbittorrent-nox -y
```

Run qBittorrent as a service:

```bash
sudo nano /etc/systemd/system/qbittorrent.service
```

Add:

```ini
[Unit]
Description=qBittorrent Daemon Service
After=network.target

[Service]
Type=simple
User=pi
ExecStart=/usr/bin/qbittorrent-nox
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Enable and start:

```bash
sudo systemctl daemon-reload
sudo systemctl enable qbittorrent
sudo systemctl start qbittorrent
```

Access at: `http://<your-pi-ip>:8080`
- Default username: `admin`
- Default password: `adminadmin`

**Change the default password immediately!**

### Installing Transmission

Alternatively, use Transmission:

```bash
sudo apt update
sudo apt install transmission-daemon -y
```

Stop to configure:

```bash
sudo systemctl stop transmission-daemon
```

Edit config:

```bash
sudo nano /etc/transmission-daemon/settings.json
```

Change these settings:

```json
"rpc-whitelist-enabled": false,
"rpc-authentication-required": true,
"rpc-username": "your-username",
"rpc-password": "your-password"
```

Start the service:

```bash
sudo systemctl start transmission-daemon
```

Access at: `http://<your-pi-ip>:9091`

## Media Organization

### Recommended Folder Structure

```
/media/
├── Movies/
│   ├── Movie Title (Year)/
│   │   └── Movie Title (Year).mkv
├── TV Shows/
│   ├── Show Name/
│   │   ├── Season 01/
│   │   │   ├── Show Name - S01E01 - Episode.mkv
│   │   │   └── Show Name - S01E02 - Episode.mkv
```

### Permissions

Ensure proper permissions:

```bash
sudo chown -R pi:pi /media/Movies /media/TV\ Shows
sudo chmod -R 755 /media/Movies /media/TV\ Shows
```

## Integration with Jellyfin

Once your media is downloaded and organized, add it to Jellyfin:

1. Open Jellyfin Dashboard
2. Go to **Libraries**
3. Add library for Movies (point to `/media/Movies`)
4. Add library for TV Shows (point to `/media/TV Shows`)
5. Jellyfin will automatically scan and organize your media!

## Quality Profiles

### Radarr Quality Profiles

Define which quality you want:

1. Go to **Settings** → **Profiles**
2. Edit existing or create new profiles
3. Select desired qualities (e.g., 1080p, 720p)
4. Set quality cutoff
5. Save

### Sonarr Quality Profiles

Same process as Radarr:

1. Go to **Settings** → **Profiles**
2. Configure episode qualities
3. Consider disk space vs quality tradeoff

## Automation Features

### Automatic RSS Sync

Both Radarr and Sonarr automatically check RSS feeds from indexers every 15 minutes for new releases.

### Failed Download Handling

If a download fails or is of poor quality:

1. Go to **Settings** → **Download Clients**
2. Enable **Failed Download Handling**
3. The app will automatically blacklist and retry with another release

### List Management

Import movies/shows from lists:

1. Go to **Settings** → **Lists**
2. Add lists from:
   - IMDb
   - Trakt
   - TMDb
   - Custom lists
3. Configure auto-add settings

## Notifications

Set up notifications for completed downloads:

1. Go to **Settings** → **Connect**
2. Add notification services:
   - Discord
   - Telegram
   - Pushover
   - Email
   - And many more!

## Service Management

### Start/Stop Services

For Sonarr:
```bash
sudo systemctl start sonarr
sudo systemctl stop sonarr
sudo systemctl restart sonarr
sudo systemctl status sonarr
```

For Radarr:
```bash
sudo systemctl start radarr
sudo systemctl stop radarr
sudo systemctl restart radarr
sudo systemctl status radarr
```

For Prowlarr:
```bash
sudo systemctl start prowlarr
sudo systemctl stop prowlarr
sudo systemctl restart prowlarr
sudo systemctl status prowlarr
```

### View Logs

Logs are typically located at:
- Sonarr: `/home/pi/.config/Sonarr/logs/`
- Radarr: `/home/pi/.config/Radarr/logs/`
- Prowlarr: `/home/pi/.config/Prowlarr/logs/`

Or view via systemd:
```bash
sudo journalctl -u sonarr -f
```

## Updating

### Update Radarr/Prowlarr

These apps can auto-update:

1. Go to **System** → **Updates**
2. Enable automatic updates or manually trigger updates

### Update Sonarr

Same process - check **System** → **Updates**

## Troubleshooting

### Can't Access Web Interface

Check if service is running:
```bash
sudo systemctl status sonarr
```

Check if port is in use:
```bash
sudo netstat -tulpn | grep 8989
```

### Download Not Starting

1. Check download client connection in Settings
2. Verify indexers are working in Prowlarr
3. Check for errors in **System** → **Logs**

### Disk Space Issues

Monitor disk space:
```bash
df -h
```

Configure automatic deletion:
1. **Settings** → **Media Management**
2. Enable **Unmonitor Deleted Movies/Episodes**

### Permission Errors

Fix permissions:
```bash
sudo chown -R pi:pi /media/Movies /media/TV\ Shows
```

## Best Practices

1. **Regular Backups**: Backup configuration directories regularly
2. **Quality Over Quantity**: Choose reasonable quality profiles for your storage capacity
3. **Monitor Disk Space**: Set up alerts for low disk space
4. **Update Regularly**: Keep all services updated for bug fixes and features
5. **Secure Your Setup**: Use strong passwords and consider HTTPS with reverse proxy
6. **Use VPN**: Consider using a VPN with your download client for privacy

## Additional Resources

- [Servarr Wiki](https://wiki.servarr.com/)
- [Radarr Wiki](https://wiki.servarr.com/radarr)
- [Sonarr Wiki](https://wiki.servarr.com/sonarr)
- [Prowlarr Wiki](https://wiki.servarr.com/prowlarr)
- [TRaSH Guides](https://trash-guides.info/) - Comprehensive quality guides
