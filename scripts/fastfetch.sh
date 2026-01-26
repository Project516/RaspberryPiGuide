#!/bin/sh
# Note: Your apt sources must point to 'trixie' to install fastfetch!

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
sudo apt install fastfetch -y
fastfetch -c all
