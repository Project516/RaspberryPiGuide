# Servarr Install Guide

Servarr is a suite of tools designed to index and download torrents. 

## Sonarr Install Guide

[Sonarr](https://sonarr.tv ) has a install script. Run 

`curl -o- https://raw.githubusercontent.com/Sonarr/Sonarr/develop/distribution/debian/install.sh | sudo bash` 

or 

`wget -qO- https://raw.githubusercontent.com/Sonarr/Sonarr/develop/distribution/debian/install.sh | sudo bash` 

depending if you want to use curl or wget. That's all! The script will walk you through the installation.

## Radarr Install Guide
Unlike Sonarr, [Radarr](https://radarr.video) has no "offical" installation script. There is a community install script for Radarr and other tools in the [Servarr](https://wiki.servarr.com) suite. Run 

`curl -o servarr-install-script.sh https://raw.githubusercontent.com/Servarr/Wiki/master/servarr/servarr-install-script.sh` 

and then 

`sudo bash servarr-install-script.sh` 

to install and run the script. Then follow the instructions to install Radarr.

## Prowlarr Install Guide
Just like Radarr, [Prowlarr](https://prowlarr.com) can be installed via the community installation script. Follow the same instructions in the Radarr section and select Prowlarr instead. 

### Thats it!

## Setting up Prowlarr
Prowlarr should be set up before Radarr and Sonarr, since Radarr and Sonarr rely on Prowlarr to find content. Setting up is pretty easy - add indexers and in the connections page add Radarr and Sonarr. You will need their API keys, found in each's settings page.
