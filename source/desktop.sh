#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

apt-get install -y kde-plasma-desktop
apt-get install -y feh
apt-get install -y git

# install kde theme
echo -e "${blue}Installing KDE theme..."
cd ~
git clone https://github.com/yeyushengfan258/LyraS-kde
cd LyraS-kde
cat AUTHORS
chmod +x install.sh
./install.sh

# copy kde configuration to home directory
echo -e "${blue}Copying configuration files..."
sleep 2
cp -r -f /home/$SUDO_USER/Nymph/nymph/assets/.kde4 ~
cp -r -f /home/$SUDO_USER/Nymph/assets/LyraS-dark ~/.local/share/plasma/desktoptheme
cp -r -f /home/$SUDO_USER/Nymph/assets/color-schemes ~/.local/share

# change wallpaper
cp /home/$SUDO_USER/Nymph/assets/wallpapers /home/$SUDO_USER/Pictures
feh -bg --scale /home/$SUDO_USER/Pictures/wallpapers/saints-name.png
sed -i "$ a feh -bg --scale ~/Pictures/saints-name.png" .xinitrc

# finish installation
echo -e "${green}Desktop installation successful${reset}"