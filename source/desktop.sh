#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

cd $HOME

# apt-get -y kde-plasma-desktop
# apt-get -y feh

# # copy kde configuration to home directory
# cp -r -f $HOME/nymph/assets/.kde4 $HOME

# # change wallpaper
# feh -bg --scale $HOME/nymph/assets/wallpapers/saints-name.png

echo -e "${green}Desktop installation successful${reset}"