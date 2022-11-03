#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

# packages
apt-get install -y kde-plasma-desktop
apt-get install -y git

# install kde theme
echo -e "${blue}Installing KDE theme...${reset}"
cd $HOME_DIR


# copy kde configuration to home directory
echo -e "${blue}Copying configuration files..."
echo -e "${blue}Installing KDE theme...${reset}"
cd $HOME_DIR
sleep 2
mkdir $HOME_DIR/.local/share/icons/
mkdir $HOME_DIR/.local/share/plasma/
cp -r -f $WORKING_DIR/cosmodium-cs-theme/ $HOME_DIR/.local/share/plasma/desktoptheme/
cp -r -f $WORKING_DIR/ccs-splash/ $HOME_DIR/.local/share/plasma/lookandfeel/
cp -r -f $WORKING_DIR/assets/candy-icons $HOME_DIR/.local/share/icons/

# finish installation
echo -e "${green}Desktop installation successful. Log out and select Plasma from your respective login manager. See the README for post-installation instructions.${reset}"
