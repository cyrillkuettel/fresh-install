
# install i3 version which supports gaps
# from here basically https://lottalinuxlinks.com/how-to-build-and-install-i3-gaps-on-debian/
sudo apt install meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev

git clone https://github.com/i3/i3.git
cd i3
mkdir -p build && cd build
meson --prefix /usr/local
ninja
sudo ninja install



sudo ln -s $(which alacritty) /usr/bin/alacritty


git clone https://github.com/yshui/picom ~/picom && cd ~/picom
git checkout tags/v12
# picom dependencies
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev

after installing like described in the associated readme, run:

# build:
meson setup --buildtype=release build
ninja -C build


sudo cp build/src/picom /usr/local/bin
sudo chmod 755 /usr/local/bin/picom
