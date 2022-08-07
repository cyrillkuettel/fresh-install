A convenience script for switching kernels on Ubuntu, more ![here](https://github.com/pimlie/ubuntu-mainline-kernel.sh)


Commands are from here: https://www.how2shout.com/linux/how-to-change-default-kernel-in-ubuntu-22-04-20-04-lts/
```bash
wget https://raw.githubusercontent.com/pimlie/ubuntu-mainline-kernel.sh/master/ubuntu-mainline-kernel.sh

chmod +x ubuntu-mainline-kernel.sh

sudo mv ubuntu-mainline-kernel.sh /usr/local/bin/

# to install latest available:
sudo ubuntu-mainline-kernel.sh -i

# To install any specific or old version:
sudo ubuntu-mainline-kernel.sh -i v5.15.1

# Once the installation is completed, we can use the same script to list what are the available versions of Kernel on our system:

sudo ubuntu-mainline-kernel.sh -l
```
