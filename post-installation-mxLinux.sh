#!/bin/bash

sudo setxkbmap ch

wget https://drive.switch.ch/index.php/s/nz0UdWDlSQ9ogDX/download?path=%2F01_jdk_11.0&files=jdk-11.0.13_linux-x64_bin.tar.gz
tar -xzf jdk-11.0.13_linux-x64_bin.tar.gz
sudo mv jdk-11.0.13 /usr/lib/jvm


# TODO: Add JAVA_HOME stuff: copy from my computer
# Maven
wget https://drive.switch.ch/index.php/s/nz0UdWDlSQ9ogDX/download?path=%2F10_maven&files=apache-maven-3.8.4-bin.tar.gz



# Pycharm
wget -O pycharm.tar.gz https://drive.switch.ch/index.php/s/nz0UdWDlSQ9ogDX/download?path=%2F73_pycharm&files=pycharm-community-2021.2.3.tar.gz
tar -xzf pycharm.tar.gz
sudo mv pycharm-2021.3  /opt/
bash /opt/pycharm-2021.3/bin/pycharm.sh

#Docker
wget -O docker.gpg  https://download.docker.com/linux/debian/gpg
gpg   --keyid-format 0xlong docker.gpg 2>/dev/null
gpg  --keyid-format 0xlong docker.gpg 2>/dev/null | grep -sq 0x8D81803C0EBFCD88 && sudo apt-key add docker.gpg
CODENAME=buster
# for mx Linux
echo "deb [arch=amd64] https://download.docker.com/linux/debian $CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list

# forUbuntu 22.04
CODENAME=jammy
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update
sudo apt install docker-ce
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.10.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t ed25519 -C "cyrillkuettel@gmail.com"
ssh-add /home/demo/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
# Add the key to github programmatically

git config --global user.email "cyrillkuettel@gmail.com"
git config --global user.name "Cyrill"

sudo apt install fonts-font-awesome
sudo apt install fonts-powerline
cd ~/Downloads
wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb
sudo dpkg -i lsd_0.20.1_amd64.deb
# TODO: add to bashrc: alias ls='lsd -Fl'


sudo apt install vim
sudo apt install ffmpeg x264 x265 # this is used for example so that youtube-dl can produce mp3s
# install conda
cd
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
# don't activate conda by defaut
conda config --set auto_activate_base false

# if you want to debug native process in android studio. If this is not installed it will result in a crash when running the debugger on a ndk project.
sudo apt install libncurses5

# git large file storage
cd ~/Downloads
wget -O git-lfs.tar.gz https://github.com/git-lfs/git-lfs/releases/download/v3.0.2/git-lfs-linux-amd64-v3.0.2.tar.gz
https://github.com/git-lfs/git-lfs/releases/download/v3.0.2/git-lfs-linux-amd64-v3.0.2.tar.gz


# yt-dlp
conda create -y --name yt-dlp python=3.9
conda activate yt-dlp
conda install pip
pip install -U yt-dlp


# Android Studio
# TODO: Android studio installation

sudo chown -R $USER:$USER /opt/android-studio

# tlp for battery
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw
sudo tlp start

# LSDeluxe
# Download latest release and install the .deb form https://github.com/Peltoche/lsd/releases
# put this in your ~/.bashrc or ~/.zshrc
alias ls='lsd -Fl'
