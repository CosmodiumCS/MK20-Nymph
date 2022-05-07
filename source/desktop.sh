#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

cd $HOME

apt-get install -y kde-plasma-desktop
apt-get install -y feh
apt-get install -y git

# install kde theme
echo -e "${blue}Installing KDE theme..."
cd $HOME
git clone https://github.com/yeyushengfan258/LyraS-kde
cd LyraS-kde
cat AUTHORS
chmod +x install.sh
./install.sh

# copy kde configuration to home directory
echo -e "${blue}Copying configuration files..."
sleep 2
cp -r -f ~/nymph/nymph/assets/.kde4 ~
cp -r -f ~/nymph/assets/LyraS-dark ~/.local/share/plasma/desktoptheme
cp -r -f ~/nymph/assets/color-schemes ~/.local/share

# change wallpaper
cp $HOME/nymph/assets/wallpapers $HOME/Pictures
feh -bg --scale $HOME/Pictures/wallpapers/saints-name.png
sed -i "$ a feh -bg --scale $HOME/Pictures/saints-name.png" .xinitrc

# finish installation
echo -e "${green}Desktop installation successful${reset}"