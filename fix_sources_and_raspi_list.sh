#!/bin/bash
# Fix Script for /etc/apt/sources.list and /etc/apt/sources.list.d/raspi.list
# Created on Thu Apr 10 17:54:18 PDT 2025
# Updates repository configurations for Debian Bookworm.

echo "Backing up current configuration files..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.bak

echo "Updating /etc/apt/sources.list for Bookworm..."
cat <<EOL | sudo tee /etc/apt/sources.list
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://deb.debian.org/debian-security bookworm-security main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main contrib non-free
# Uncomment the line below to enable source packages
# deb-src http://deb.debian.org/debian bookworm main contrib non-free
EOL

echo "Updating /etc/apt/sources.list.d/raspi.list for Bookworm..."
cat <<EOL | sudo tee /etc/apt/sources.list.d/raspi.list
deb http://archive.raspberrypi.org/debian/ bookworm main
# Uncomment the line below to enable source packages
# deb-src http://archive.raspberrypi.org/debian/ bookworm main
EOL

echo "Clearing APT cache..."
sudo rm -rf /var/lib/apt/lists/*

echo "Updating package list..."
sudo apt update

echo "Fix completed successfully!"
