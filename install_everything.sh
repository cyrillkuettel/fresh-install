set -e
#!/bin/bash

# Provides a script to install most basic utilities assuming 
# a new debian based linux system.

# Aims be non-interactively, but not 100% at this point.

git clone https://github.com/cyrillkuettel/fresh-install.git

sudo apt update
sudo apt install -y htop ffmpeg x264 x265 ripgrep xsel keepassxc build-essential
curl file xclip bat vlc python3 python3.10-venv fd-find pinta 

sudo apt install mplayer # anki

mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s /usr/bin/batcat ~/.local/bin/bat

# vim
sudo apt install vim-gtk # I want vim with clipboard compiled
cp ~/fresh-install/vim/vimrc ~/.vimrc

# vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# theme
mkdir -p ~/.vim/colors
cp ~/fresh-install/vim/monokai.vim ~/.vim/colors

ssh-keygen -t ed25519 -C "cyrillkuettel@gmail.com"
cat ~/.ssh/id_ed25519.pub

# Add the ssh key to github manually. (This can't be automated unfortunately.)

# Git
mv ~/.gitconfig ~/.old_gitconfig
cp ~/fresh-install/git/gitconfig ~/.gitconfig


# Oh-my
sudo apt install zsh -y
# set the default shell
chsh -s $(which zsh)

# oh-my-zsh
sudo apt install git-core curl fonts-powerline fonts-firacode -y

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

# snap sucks, so use this:
# https://www.omgubuntu.co.uk/2022/04/how-to-install-firefox-deb-apt-ubuntu-22-04

# install 'black as a server' for Blackd plugin globally 
pip install 'black[d]'

mkdir -p ~/.local/bin/ && cp ~/fresh-install/shell/rfv ~/.local/bin

# Set VLC default for all media types forever 
python - <<EOF
import subprocess

def set_default_vlc(file_types):
    for file_type in file_types:
        subprocess.run(["gio", "mime", file_type, "vlc.desktop"], check=True)

file_types = ["audio/mpeg", "video/mp4", "video/x-matroska", "video/quicktime"]
set_default_vlc(file_types)
EOF


# Latex
sudo apt-get install texlive-xetex
# extra stuff one often needs
sudo apt-get install texlive-bibtex-extra
sudo apt-get install texlive-lang-german


# zathura
# this would be better but there is no pre-built package
# sudo apt install zathura-pdf-mupdf

sudo apt install zathura

# Creating ~/.xinitrc for some keyboard remaps
cp ~/fresh-install/.Xmodmap ~/
echo 'xmodmap ~/.Xmodmap' > ~/.xinitrc


sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport


# Early oom daeomon 
# Kill processes faster to prevent potential freezing
# https://github.com/rfjakob/earlyoom

git clone https://github.com/rfjakob/earlyoom.git
cd earlyoom
make
sudo make install
sudo cp /usr/local/etc/systemd/system/earlyoom.service /etc/systemd/system/
sudo make install  # somehow needed to avoid systemd Unit file not found
sudo systemctl enable earlyoom


# install vimium from source
git clone https://github.com/philc/vimium.git
# build from source
# 1. denu
curl -fsSL https://deno.land/install.sh | sh

echo 'export PATH="$HOME/.deno/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
cd vimium/ 
rm deno.lock 2> /dev/null || true
deno run -A ./make.js write-firefox-manifest
# finally create the xpi file
zip -r vimium.xpi * -x "*.git*" -x "tests/*" -x "test_harnesses/*" -x "*.md" -x "deno.*"
# manually go to about:addons and install
# todo: install the addon without user interaction. 

