#!/bin/bash

# Define the name of the script that will be generated
SCRIPT_NAME="preferences-DO_NOT_DELETE.sh"

# Check if the script already exists
if [ ! -f $SCRIPT_NAME ]; then
  
  # Get the current desktop variables
  THEME_NAME=$(gsettings get org.cinnamon.theme name)
  PANELS_ENABLED=$(gsettings get org.cinnamon panels-enabled)
  ICON_THEME=$(gsettings get org.cinnamon.desktop.interface icon-theme)
  WM_THEME=$(gsettings get org.cinnamon.desktop.wm.preferences theme)
  GTK_THEME=$(gsettings get org.cinnamon.desktop.interface gtk-theme)
  BACKGROUND=$(gsettings get org.cinnamon.desktop.background picture-uri)
  
  # Create the script that will set the desktop variables
  echo "#!/bin/bash" > $SCRIPT_NAME
  echo "gsettings set org.cinnamon.theme name $THEME_NAME" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon panels-enabled \"$PANELS_ENABLED"\" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon.desktop.interface icon-theme $ICON_THEME" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon.desktop.wm.preferences theme $WM_THEME" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon.desktop.interface gtk-theme $GTK_THEME" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon.desktop.background picture-uri $BACKGROUND" >> $SCRIPT_NAME
  
  # Make the script executable
  chmod +x $SCRIPT_NAME
else
  echo "Previous Config Detected"
fi

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

version="v0.2"

DESKTOP=false
TOOLS=false
INSTALL=false

# get client variables
export HOME_DIR=/home/$SUDO_USER
export WORKING_DIR=$(dirname "$(readlink -f "$0")") # The directory of the script itself
export TOOL_DIR=$WORKING_DIR/src/tools.sh
export DESKTOP_DIR=$WORKING_DIR/src/desktop.sh


# FORCE THEM TO SEE THE ASCII ART BECAUSE ITS COOL
echo -e ''${blue}${bold}'
                             __                           _
                          /\ \ \ _   _  _ __ ___   _ __  | |__
                         /  \/ /| | | || `_ ` _ \ | `_ \ | `_ \
                        / /\  / | |_| || | | | | || |_) || | | |
                        \_\ \/   \__, ||_| |_| |_|| .__/ |_| |_|
                            '$version' |___/            |_|
           
          
                            '${reset}${bold}'By Soulsender & Hall0wed'${reset}${blue}'
                            'soulsender.me'
                      '${reset}''

echo -e "Detecting System and Preferences..."
sleep 2
echo -e ""

# Command line options
function tools() {
  echo -e "${green}[!] Found Tools${reset}"
}

function desktop() {
  echo -e "${green}[!] Found Desktop${reset}"
}

function undercover() {
  echo -e "${green}[!] Undercover${reset}"

  gsettings set org.cinnamon.theme name 'Windows-10-Dark-3.2.1-dark'
  gsettings set org.cinnamon panels-enabled "['1:0:bottom']" 
  gsettings set org.cinnamon.desktop.interface icon-theme 'Windows-10-Icons'
  gsettings set org.cinnamon.desktop.wm.preferences theme 'Windows-10-Dark-3.2.1-dark'
  gsettings set org.cinnamon.desktop.interface gtk-theme "Windows-10-Dark-3.2.1-dark"
  gsettings set org.cinnamon.desktop.background picture-uri "file://$PWD/assets/undercover/windows/windows10wallpaper.jpg"
  sed -i 's/favicon_dark.svg/windows10logo.png/g' ~/.config/cinnamon/spices/menu@cinnamon.org/0.json

}

function reverse_undercover() {
  echo -e "${green}[!] Reverse Undercover${reset}"
  ./preferences-DO_NOT_DELETE.sh
}

while true; do
  echo -e "Please select an option:"
  echo -e "1. Tools"
  echo -e "2. Desktop"
  echo -e "3. Undercover"
  echo -e "4. Reverse Undercover"
  echo -e "5. Exit"
  read -r -p "Enter the option number: " option

  case $option in
    1)
      tools
      ;;
    2)
      desktop
      ;;
    3)
      undercover
      ;;
    4)
      reverse_undercover
      ;;
    5)
      echo -e "${red}Operation canceled.${reset}"
      exit 0
      ;;
    *)
      echo -e "${red}Invalid option. Please try again.${reset}"
      ;;
  esac
done
