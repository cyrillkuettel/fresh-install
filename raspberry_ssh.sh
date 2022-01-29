#!/bin/bash

# This took way longer than expected
# But now I have a receipe for setting up ssh on raspbi

# You have to configure port forwarding on your router

# TODO:
#  change default ssh port. add static ip

sudo apt update
sudo apt upgrade -y

# Unattended upgrades
# logs for this would be here /var/log/unattended-upgrades

sudo apt install unattended-upgrades
sudo vim /etc/apt/apt.conf.d/02periodic



# Paste these lines:
APT::Periodic::Enable "1";
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::AutocleanInterval "1";
APT::Periodic::Verbose "2";


# Change default password
passwd

# create new user 
sudo adduser <username>
sudo adduser <username> sudo
# log in with the new user 

sudo deluser -remove-home pi


# Edit this file

sudo vim /etc/sudoers.d/010_pi-nopasswd

# Find this line

pi ALL=(ALL) NOPASSWD: ALL
# Replace by this
pi ALL=(ALL) PASSWD: ALL



# ssh stuff
mkdir ~/.ssh
chmod 0700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
ssh-keygen -t ed25519 -C "your_email@example.com"


sudo vi /etc/ssh/sshd_config
# Make sure ths is in the sshd config
# Authentication:
 LoginGraceTime 120
 PermitRootLogin no
 StrictModes yes

RSAAuthentication yes
 PubkeyAuthentication yes
 AuthorizedKeysFile %h/.ssh/authorized_keys

# To enable empty passwords, change to yes (NOT RECOMMENDED)
 PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
 # some PAM modules and threads)
 ChallengeResponseAuthentication no

# Change to no to disable tunnelled clear text passwords
 PasswordAuthentication no

UsePAM no


sudo systemctl restart ssh

# The firewall 
sudo vim /etc/default/ufw
# check that IPV6=yes
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable #IMPORTANT
sudo ufw status verbose

# Startup
sudo setxkbmap ch
sudo crontab -e
# Here you can option, for example @reboot     /home/me/myscript.sh
# You have to restart ssh if raspi reboots, This can be done like so:
sudo service ssh restart

