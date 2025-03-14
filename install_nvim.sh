#!/bin/bash

# install_nvim.sh - Script to install Neovim from a tarball
# Usage: sudo ./install_nvim.sh ~/Downloads/nvim-linux-x86_64.tar.gz
#
set -e  # Exit immediately if a command exits with a non-zero status

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo"
  exit 1
fi

# Check if tarball path is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 /path/to/nvim-linux-x86_64.tar.gz"
  exit 1
fi

TARBALL="$1"
INSTALL_DIR="/opt/nvim-linux64"
SYMLINK_PATH="/usr/local/bin/nvim"

# Check if tarball exists
if [ ! -f "$TARBALL" ]; then
  echo "Error: Tarball not found at $TARBALL"
  exit 1
fi

echo "Installing Neovim from $TARBALL to $INSTALL_DIR..."

# Create temporary directory for extraction
TEMP_DIR=$(mktemp -d)
echo "Extracting tarball to temporary directory: $TEMP_DIR"

# Extract tarball
tar -xzf "$TARBALL" -C "$TEMP_DIR"

# Get the name of the extracted directory
EXTRACTED_DIR=$(ls "$TEMP_DIR")

# Remove existing installation if it exists
if [ -d "$INSTALL_DIR" ]; then
  echo "Removing existing installation at $INSTALL_DIR"
  rm -rf "$INSTALL_DIR"
fi

# Move extracted directory to installation directory
echo "Moving Neovim to $INSTALL_DIR"
mv "$TEMP_DIR/$EXTRACTED_DIR" "$INSTALL_DIR"

# Clean up temporary directory
rm -rf "$TEMP_DIR"

# Create symlink
echo "Creating symlink: $SYMLINK_PATH -> $INSTALL_DIR/bin/nvim"
ln -sf "$INSTALL_DIR/bin/nvim" "$SYMLINK_PATH"

# Verify installation
echo "Verifying installation..."
if [ -x "$INSTALL_DIR/bin/nvim" ]; then
  echo "Neovim version: $($INSTALL_DIR/bin/nvim --version | head -n 1)"
  echo "Installation successful!"
  echo "You can now run Neovim using the 'nvim' command"
else
  echo "Installation failed. Executable not found at $INSTALL_DIR/bin/nvim"
  exit 1
fi
