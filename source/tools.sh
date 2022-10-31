#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

echo -e "${blue}Installing tools...${reset}"
sleep 2

# tools to install
apt-get install -y nmap
apt-get install -y wireshark
apt-get install -y macchanger
apt-get install -y tor
apt-get install -y terminator

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME_DIR/.cargo/env"
cargo install rustscan
cargo install feroxbuster

echo -e "${green}Tool installation successful${reset}"