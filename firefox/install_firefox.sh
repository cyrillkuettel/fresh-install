#!/bin/bash

# Warning: Assumes /opt is used for installation dir
# Installs the dev edition of firefox, potentially removes previous version 

cd ~/Downloads

curl --location -o firefox.tar.gz "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"

tar --extract --verbose --preserve-permissions -f firefox.tar.gz --use-compress-program=xz

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

DESKTOP_FILE="/usr/share/applications/firefox-developer.desktop"
# Check if desktop entry exists and create if it doesn't
if [ ! -f "$DESKTOP_FILE" ]; then
    echo "Creating desktop entry file..."
    sudo tee "$DESKTOP_FILE" > /dev/null << EOL
[Desktop Entry]
Name=Firefox Developer Edition
GenericName=Web Browser
Comment=Browse the Web
Exec=/opt/firefox/firefox %u
Terminal=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
EOL
    echo "Desktop entry file created."
else
    echo "Desktop entry file already exists."
fi

# Update desktop database
sudo update-desktop-database

echo "Firefox Developer Edition installation completed and added to application menu."
