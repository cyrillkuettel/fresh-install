#!/bin/bash

# Rofi Installation Script for Ubuntu
# This script installs Rofi and all its dependencies from source

set -e # Exit on error

echo "=== Rofi Installation Script ==="
echo "This script will install Rofi and its dependencies."

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install packages if they're not already installed
install_if_needed() {
    for pkg in "$@"; do
        if ! dpkg -l | grep -q "^ii  $pkg "; then
            PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $pkg"
        fi
    done
}

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Initialize package list
PACKAGES_TO_INSTALL=""

# Check and mark required build dependencies
echo "Checking build dependencies..."
install_if_needed build-essential
install_if_needed git
install_if_needed autoconf
install_if_needed automake
install_if_needed pkg-config
install_if_needed flex
install_if_needed bison
install_if_needed check
install_if_needed libglib2.0-dev-bin # for glib-compile-resources

# Check and mark required library dependencies
echo "Checking library dependencies..."
install_if_needed libpango1.0-dev
install_if_needed libpangocairo-1.0-0
install_if_needed libgdk-pixbuf2.0-dev
install_if_needed libstartup-notification0-dev
install_if_needed libxkbcommon-dev
install_if_needed libxkbcommon-x11-dev
install_if_needed libxcb1-dev
install_if_needed libxcb-xkb-dev
install_if_needed libxcb-randr0-dev
install_if_needed libxcb-xinerama0-dev
install_if_needed libxcb-util-dev
install_if_needed libxcb-ewmh-dev
install_if_needed libxcb-icccm4-dev
install_if_needed libxcb-cursor-dev
install_if_needed libxcb-imdkit-dev

# Install required packages
if [ ! -z "$PACKAGES_TO_INSTALL" ]; then
    echo "Installing required packages:$PACKAGES_TO_INSTALL"
    sudo apt-get install -y $PACKAGES_TO_INSTALL
else
    echo "All required packages are already installed."
fi

# Create temporary build directory
BUILD_DIR=$(mktemp -d)
echo "Created temporary build directory: $BUILD_DIR"
cd "$BUILD_DIR"

# Clone Rofi repository
echo "Cloning Rofi repository..."
git clone --recursive https://github.com/DaveDavenport/rofi
cd rofi

# Generate build system
echo "Generating build system..."
autoreconf -i

# Create and enter build directory
mkdir build && cd build

# Configure
echo "Configuring build..."
../configure --prefix=/usr/local

# Build
echo "Building Rofi..."
make -j$(nproc)

# Install
echo "Installing Rofi..."
sudo make install

# Clean up
cd
rm -rf "$BUILD_DIR"

# Update library cache
sudo ldconfig

echo "=== Installation Complete ==="
echo "Rofi has been installed to /usr/local/"
echo "You can now run 'rofi' from the command line."

# Verify installation
if command_exists rofi; then
    echo "Verification: rofi command is available"
    rofi -v
else
    echo "Warning: rofi command not found in PATH"
    echo "You may need to log out and log back in or restart your system"
fi
