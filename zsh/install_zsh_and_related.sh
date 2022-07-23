#!/bin/bash

# Installing Oh-My-Zsh Plugin
sudo apt install build-essential curl file git
sudo apt install zsh

# oh-my-zsh
sudo apt install git-core curl fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# plugins:
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc\nsource ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Add powerful ls aliases to dotfile (https://github.com/Peltoche/lsd)
