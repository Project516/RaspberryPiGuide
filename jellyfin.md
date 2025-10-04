# Jellyfin Install Guide

![Jellyfin logo](https://jellyfin.org/images/logo.svg)

[Jellyfin](https://jellyfin.org) is a free, open-source media server that lets you manage and stream your media library. Unlike Plex or Emby, Jellyfin has no premium features, tracking, or central servers - it's completely free and private.

## Prerequisites

- Raspberry Pi running Raspberry Pi OS (Bookworm or Trixie recommended)
- Stable internet connection
- External storage (optional, but recommended for large media libraries)

## Installation

### Quick Install

The easiest way to install Jellyfin is using the official installation script:

```bash
curl -s https://repo.jellyfin.org/install-debuntu.sh | sudo bash
```

This script will:
- Add the Jellyfin repository to your system
- Install Jellyfin server and web interface
- Set up Jellyfin as a system service
- Start Jellyfin automatically

### Manual Install

If you prefer to install manually:

```bash
# Install dependencies
sudo apt update
sudo apt install curl gnupg -y

# Add Jellyfin repository
curl -fsSL https://repo.jellyfin.org/debian/jellyfin_team.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/jellyfin.gpg

echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/debian $( lsb_release -c -s ) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list

# Update and install
sudo apt update
sudo apt install jellyfin -y
```

## Initial Setup

### Accessing Jellyfin

Jellyfin will be installed on port 8096 by default. Access it by navigating to:

```
http://<your-pi-ip-address>:8096
```

You can find your Pi's IP address with:

```bash
hostname -I
```

### Setup Wizard

On first access, you'll be greeted with a setup wizard:

1. **Language Selection**: Choose your preferred language

2. **Create Admin Account**: 
   - Enter a username (e.g., admin)
   - Create a strong password
   - Confirm the password

3. **Add Media Libraries**:
   - Click "Add Media Library"
   - Select content type (Movies, TV Shows, Music, etc.)
   - Add folders where your media is stored
   - Configure metadata settings (recommended to leave defaults)
   - Repeat for each type of media you have

4. **Preferred Metadata Language**: Select your language for movie/show information

5. **Remote Access**: Configure if you want to access Jellyfin from outside your home network (optional)

6. **Finish**: Complete the setup and start using Jellyfin!

## Configuration

### Media Organization

It's recommended to organize your media following these conventions:

**Movies:**
```
/media/Movies/
  Movie Name (Year)/
    Movie Name (Year).mkv
```

**TV Shows:**
```
/media/TV Shows/
  Show Name/
    Season 01/
      Show Name - S01E01 - Episode Name.mkv
      Show Name - S01E02 - Episode Name.mkv
```

**Music:**
```
/media/Music/
  Artist Name/
    Album Name/
      01 - Track Name.mp3
```

### Hardware Acceleration

For better performance on Raspberry Pi 4 or 5, enable hardware acceleration:

1. Go to Dashboard → Playback → Transcoding
2. Select "Video4Linux2 (V4L2)" as the hardware acceleration type
3. Enable "Enable hardware encoding"
4. Save changes

### External Access

To access Jellyfin from outside your network:

1. Set up port forwarding on your router (forward port 8096)
2. Consider using a reverse proxy with HTTPS (recommended for security)
3. Use a dynamic DNS service if you don't have a static IP

## Managing Jellyfin

### Service Commands

Start Jellyfin:
```bash
sudo systemctl start jellyfin
```

Stop Jellyfin:
```bash
sudo systemctl stop jellyfin
```

Restart Jellyfin:
```bash
sudo systemctl restart jellyfin
```

Check status:
```bash
sudo systemctl status jellyfin
```

Enable auto-start on boot:
```bash
sudo systemctl enable jellyfin
```

### Updating Jellyfin

To update Jellyfin to the latest version:

```bash
sudo apt update
sudo apt upgrade jellyfin -y
```

### Logs

View Jellyfin logs:
```bash
sudo journalctl -u jellyfin -f
```

Or check the log files directly:
```bash
sudo tail -f /var/log/jellyfin/jellyfin.log
```

## Mounting External Storage

If you're using an external drive for media:

### Find Your Drive

```bash
lsblk
```

### Create Mount Point

```bash
sudo mkdir -p /media/external
```

### Mount the Drive

```bash
sudo mount /dev/sda1 /media/external
```

Replace `/dev/sda1` with your actual drive identifier.

### Auto-Mount on Boot

Edit `/etc/fstab`:

```bash
sudo nano /etc/fstab
```

Add a line (replace UUID with your drive's UUID from `blkid`):

```
UUID=your-drive-uuid /media/external ext4 defaults 0 2
```

## Recommended Plugins

Access plugins from Dashboard → Plugins → Catalog:

- **TMDb** - Enhanced movie metadata
- **TVDb** - Enhanced TV show metadata
- **Playback Reporting** - Track what's being watched
- **Trakt** - Sync your watch history
- **Kodi Sync Queue** - If you use Kodi clients

## Troubleshooting

### Jellyfin Won't Start

Check the service status:
```bash
sudo systemctl status jellyfin
```

Check for port conflicts:
```bash
sudo netstat -tulpn | grep 8096
```

### Playback Issues

- Ensure your media files are in a supported format
- Check if transcoding is needed (some formats may not play directly)
- Enable hardware acceleration for better performance
- Check network bandwidth if streaming remotely

### Permission Issues

If Jellyfin can't access your media files:

```bash
sudo chown -R jellyfin:jellyfin /path/to/media
sudo chmod -R 755 /path/to/media
```

### High CPU Usage

- Enable hardware acceleration
- Reduce the number of simultaneous streams
- Lower transcoding quality settings
- Consider upgrading to a Raspberry Pi 5 for better performance

## Tips and Best Practices

1. **Use Ethernet**: For best streaming performance, connect your Pi via Ethernet rather than WiFi
2. **Regular Backups**: Backup your Jellyfin configuration located at `/etc/jellyfin` and `/var/lib/jellyfin`
3. **Proper Cooling**: Ensure your Pi has adequate cooling, especially during transcoding
4. **Quality Settings**: Adjust streaming quality based on your network capabilities
5. **Metadata**: Let Jellyfin download metadata during off-peak hours to avoid slowdowns

## Additional Resources

- [Jellyfin Documentation](https://jellyfin.org/docs/)
- [Jellyfin Community Forum](https://forum.jellyfin.org/)
- [Jellyfin GitHub](https://github.com/jellyfin/jellyfin)
