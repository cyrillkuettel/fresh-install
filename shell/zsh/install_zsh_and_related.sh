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

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# vim mode
git clone https://github.com/softmoth/zsh-vim-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vim-mode

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add powerful ls aliases to dotfile (https://github.com/Peltoche/lsd)

## diff-so-fancy
mkdir ~/zsh-plugins
cd ~/zsh-plugins
git clone https://github.com/so-fancy/diff-so-fancy.git
# add the diff-so-fancy directory to $PATH (see bash_profile)
# run the install script install_diff_so_fancy.sh, this modifies the global git config

## fzf: A command-line fuzzy finder

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# yes yes yes

# finally, powerlevel10k theme
# https://github.com/romkatv/powerlevel10k

# Yanking to system clipboard
sudo apt-get install xsel 
git clone https://github.com/kutsan/zsh-system-clipboard ${ZSH_CUSTOM:-~/.zsh}/plugins/zsh-system-clipboard
