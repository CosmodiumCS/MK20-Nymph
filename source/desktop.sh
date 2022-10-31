#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

# packages
apt-get install -y kde-plasma-desktop
apt-get install -y feh
apt-get install -y git

# install kde theme
echo -e "${blue}Installing KDE theme...${reset}"
cd $HOME_DIR
git clone https://github.com/yeyushengfan258/LyraS-kde
cd LyraS-kde/
cat AUTHORS
chmod +x install.sh
./install.sh
cd ..
rm -rf LyraS-kde/

# copy kde configuration to home directory
echo -e "${blue}Copying configuration files..."
sleep 2
cp -r -f $WORKING_DIR/assets/.kde4 $HOME_DIR/
mv -f $HOME_DIR/.kde4 $HOME_DIR/.kde
mkdir $HOME_DIR/.local/share/icons
cp -r -f $WORKING_DIR/assets/candy-icons $HOME_DIR/.local/share/icons/
cp -r -f $WORKING_DIR/assets/plasma $HOME_DIR/.local/share

# finish installation
echo -e "${green}Desktop installation successful. Log out and select Plasma from your respective display manager. See the README for post-installation instructions.${reset}"
