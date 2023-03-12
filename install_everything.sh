#!/bin/bash
set -e

# Provides a script to install most basic utilities assuming 
# a new debian based linux system.

# Aims be non-interactively

git clone https://github.com/cyrillkuettel/fresh-install.git ~/

sudo apt update
sudo apt install ffmpeg x264 x265 

sudo apt install ripgrep xsel keepassxc build-essential curl file 

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

# Git
mv ~/.gitconfig ~/.old_gitconfig
cp ~/fresh-install/git/gitconfig ~/.gitconfig


# Oh-my
sudo apt install zsh -y
# oh-my-zsh
sudo apt install git-core curl fonts-powerline -y

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# plugins:
sudo apt install python3-dev python3-pip python3-setuptools -y

cp ~/fresh-install/shell/zsh/zshrc  ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# vim mode
git clone https://github.com/softmoth/zsh-vim-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vim-mode

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


## diff-so-fancy
# https://github.com/so-fancy/diff-so-fancy
mkdir -p ~/zsh-plugins
git clone https://github.com/so-fancy/diff-so-fancy.git ~/zsh-plugins
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# Add default environment variables
cp ~/fresh-install/shell/bash_profile ~/.bash_profile

# run the install script install_diff_so_fancy.sh, this modifies the global git config

## fzf: A command-line fuzzy finder

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
printf 'yes\nyes\nyes\nyes' | ~/.fzf/install
# yes yes yes

source ~/.zshrc


