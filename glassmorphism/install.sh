
# install i3 version which supports gaps
# from here basically https://lottalinuxlinks.com/how-to-build-and-install-i3-gaps-on-debian/
sudo apt install meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev
cd i3
mkdir -p build && cd build
meson --prefix /usr/local
ninja
sudo ninja install



sudo ln -s $(which alacritty) /usr/bin/alacritty



install picom (https://github.com/yshui/picom)

after installing like described in the associated readme, run:

sudo mv build/src /usr/local/bin
sudo chmod 755 /usr/local/bin/picom
