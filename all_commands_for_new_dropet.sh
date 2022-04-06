#!/bin/bash
#All commands for setting up a new Droplet 

# Manually:
adduser your_username
usermod -aG sudo your_username
# add to sudors file
sudo visudo
# alt+6 to copy line in nano, then ctrl+u to paste
# specify your_username under privilege specification

# before re-logging with my username, have to: 
sudo nano /etc/ssh/sshd_config
PasswordAuthentication yes
sudo service sshd restart

# SSH has to be configured. 
mkdir ~/.ssh
vim ~/.ssh/authorized_keys # Paste your ssh public key here
sudo vim /etc/ssh/sshd_config  # Now disable password authentification again:
PasswordAuthentication no
sudo service sshd restart

#if you need a ssh key on the machine 
cd ~/.ssh
ssh-keygen -t ed25519 -C "cyrillkuettel@gmail.com"
# ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub


# Docker
sudo apt-get update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}
su - ${USER}
# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Then there was the issue with HTTPS (Which I resolved by installing the ufw:
# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-18-04
# All issued commands
sudo vim /etc/default/ufw
IPV6=yes
sudo ufw default deny incoming
sudo ufw default allow outgoing
# You can check which profiles are currently registered:
sudo ufw app list
sudo ufw allow OpenSSH
  sudo ufw enable #IMPORTANT
sudo ufw allow 80
sudo ufw allow 443
sudo ufw status verbose

# Output
# Available applications:
  # OpenSSH



# Useful curl commands
curl -I -L https://yourdomain.com


# I have also 'hardened' the sshd_conf
# interesting post regarding this issue https://bastian.rieck.me/blog/posts/2022/server/
# check out the brute force script kiddies:
sudo grep "authentication failure\| Failed password" /var/log/auth.log >> failed_attempts.log
# can pip through wc -l to show the number of lines 

sudo vim /etc/ssh/sshd_config
# add these lines. from the blog post
# notice it is _sshd_ not ssh
LoginGraceTime 30 # reduces the wait time for a login to 30 seconds
MaxAuthTries 3
X11Forwarding no
PrintMotd no

# Install fail2ban for extra layer of security
sudo apt update
sudo apt install fail2ban
sudo systemctl status fail2ban
# check the jail
sudo fail2ban-client status sshd



