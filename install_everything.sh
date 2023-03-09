#!/bin/bash
set -e

# Provides a script to install most basic utilities assuming 
# a new debian based linux system.

# Aims be non-interactively

git clone https://github.com/cyrillkuettel/fresh-install.git ~/

sudo apt update
sudo apt install ripgrep
sudo apt install ffmpeg x264 x265 


# vim
sudo apt install vim-gtk # I want with clipboard compiled
cp ~/fresh-install/vim/vimrc ~/.vimrc

# vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# theme
mkdir -p ~/.vim/colors
cp ~/fresh-install/monokai.vim ~/.vim/colors

ssh-keygen -t ed25519 -C "cyrillkuettel@gmail.com"
cat ~/.ssh/id_ed25519.pub

# Add the ssh key to github manually. (This can't be automated unfortunately.)


