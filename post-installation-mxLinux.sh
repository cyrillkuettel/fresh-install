#!/bin/bash

sudo setxkbmap ch

wget https://drive.switch.ch/index.php/s/nz0UdWDlSQ9ogDX/download?path=%2F01_jdk_11.0&files=jdk-11.0.13_linux-x64_bin.tar.gz 
tar -xzf jdk-11.0.13_linux-x64_bin.tar.gz
sudo mv jdk-11.0.13 /usr/lib/jvm

# TODO: Add JAVA_HOME stuff: copy from my computer
wget https://drive.switch.ch/index.php/s/nz0UdWDlSQ9ogDX/download?path=%2F10_maven&files=apache-maven-3.8.4-bin.tar.gz

#Docker
wget -O docker.gpg  https://download.docker.com/linux/debian/gpg
gpg   --keyid-format 0xlong docker.gpg 2>/dev/null
gpg  --keyid-format 0xlong docker.gpg 2>/dev/null | grep -sq 0x8D81803C0EBFCD88 && sudo apt-key add docker.gpg
CODENAME=buster
echo "deb [arch=amd64] https://download.docker.com/linux/debian $CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install docker-ce
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER

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

sudo apt-get install vim-gui-common
sudo apt-get install vim-runtime
sudo apt install vim

