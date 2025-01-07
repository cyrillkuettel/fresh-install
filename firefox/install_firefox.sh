#!/bin/bash

# Warning: Assumes /opt is used for installation dir
# Installs the dev edition of firefox, potentially removes previous version 

cd ~/Downloads
curl --location "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" | tar --extract --verbose --preserve-permissions --bzip2

INSTALL_DIR="/opt/firefox"

# Check if the installation directory already exists
if [ -d "$INSTALL_DIR" ]; then
    echo "Removing existing Firefox installation..."
    sudo rm -rf "$INSTALL_DIR"
fi

# Move the new installation with sudo
sudo mv firefox "$INSTALL_DIR"

# Create a symbolic link
sudo ln -sf "$INSTALL_DIR/firefox" /usr/bin/firefox

echo "Firefox installation completed."
