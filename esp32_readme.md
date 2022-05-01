Installed Arduiuno IDE from source.

sudo ./install.sh

# python was not in the path
sudo apt update && sudo apt upgrade -y     python-is-python3     python3-serial

# then I had to give permission for the usb port
sudo chmod a+rw /dev/ttyS4



