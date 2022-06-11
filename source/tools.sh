#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

echo -e "${blue}Installing tools...${reset}"

# Cryptex
echo -e "${blue}Installing Cryptex...${reset}"
cd /home/$SUDO_USER
git clone https://github.com/AlexKollar/Cryptex
cd Cryptex
sh install.sh
cd /home/$SUDO_USER
echo -e "${green}Cryptex Installed!${reset}"

# RustScan
echo -e "${blue}Installing RustScan...${reset}"
cd /home/$SUDO_USER
sudo -u $SUDO_USER git clone curl https://sh.rustup.rs -sSf | sh
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
dpkg -i rustscan_2.0.1_amd64.deb
rm -f rustscan_2.0.1_amd64.deb
echo -e "${green}RustScan Installed!${reset}"


# BREACH
echo -e "${blue}Installing BREACH...${reset}"
cd /home/$SUDO_USER
git clone https://github.com/ItsJustShepherd/BREACH
cd BREACH
pip install -r ./requirements.txt
echo "alias breach=\"python3 ~/BREACH/breach.py\"" >> /home/$SUDO_USER/.bashrc
echo "alias breach=\"python3 ~/BREACH/breach.py\"" >> /home/$SUDO_USER/.zshrc
echo -e "${green}BREACH Toolkit Installed!${reset}"

echo -e "${green}Tool installation successful${reset}"