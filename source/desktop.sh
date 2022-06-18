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
echo -e "${blue}Installing KDE theme...${reset}"
cd /home/$SUDO_USER
git clone https://github.com/Soulsender/saints-rice
cd saints-rice
cat AUTHORS
chmod +x install.sh
./install.sh

# copy kde configuration to home directory
echo -e "${blue}Copying configuration files..."
sleep 2
cp -r -f /home/$SUDO_USER/Nymph/assets/.kde4 /home/$SUDO_USER
mv -f /home/$SUDO_USER/.kde4 /home/$SUDO_USER/.kde
cp -r -f /home/$SUDO_USER/Nymph/assets/color-schemes /home/$SUDO_USER/.local/share
mkdir /home/$SUDO_USER/.local/share/icons
cp -r -f /home/$SUDO_USER/Nymph/assets/candy-icons /home/$SUDO_USER/.local/share/icons
cp -r -f /home/$SUDO_USER/Nymph/assets/kdedefaults /home/$SUDO_USER/.config/
cp -r -f /home/$SUDO_USER/Nymph/assets/plasmarc /home/$SUDO_SUER/.config/
cp -r -f /home/$SUDO_USER/Nymph/assets/candy-icons /home/$SUDO_USER/.local/share/icons/
cp -r -f /home/$SUDO_USER/Nymph/assets/plasma /home/$SUDO_USER/.local/share

# change wallpaper
cp -r -f /home/$SUDO_USER/Nymph/assets/wallpapers /usr/share/backgrounds
feh --bg-scale /usr/share/backgrounds/wallpapers/saints-name.png
sed -i "$ a feh --bg-scale $SUDO_USER/Pictures/saints-name.png" .xinitrc

# finish installation
echo -e "${green}Desktop installation successful${reset}"