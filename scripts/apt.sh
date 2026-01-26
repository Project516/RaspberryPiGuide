#!/bin/sh
# Update and upgrade the system

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
