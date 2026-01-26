#!/bin/sh

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
sudo apt install cmatrix -y
cmatrix -s -a
