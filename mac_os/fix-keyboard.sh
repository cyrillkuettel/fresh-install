#!/bin/bash

# anyoying issue where the key '><' is swapped with '§°' on german layout

sudo cp mac_os/brackets_like_swiss_layout.keylayout /Library/Keyboard\ Layouts
sudo rm /Library/Preferences/com.apple.keyboardtype.plist # I think this one did it
sudo reboot

# sudo touch /Library/Keyboard\ Layouts

