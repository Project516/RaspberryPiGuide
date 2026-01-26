#!/bin/sh
# Note: neofetch is no longer being developed; try fastfetch!

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
sudo apt install neofetch -y
neofetch
