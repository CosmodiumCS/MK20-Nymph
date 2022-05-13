#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

version="v0.2"

desktop=false
tools=false

install=false


# check for arguments
if [[ $# -eq 0 ]] ; then
    echo -e "${red}No arguments specified. Use -h to see a list of possible arguments.${reset}"
    exit 0
fi

# arguments
while [ -n "$1" ]
do
case "$1" in
-h) 
  cat assets/help.txt
  exit 0
;;
-d) 
  desktop=true
;;
-t) 
  tools=true
;;
*) 
  echo -e "${red}$1 is not an option. See -h for a list of arguments. ${reset}" 
  exit 0
;;
esac
shift
done

# check if run with sudo
if [ "$EUID" -ne 0 ]
    then echo -e "${red}Please run as root${reset}"
    exit 0
fi

# FORCE THEM TO SEE THE ASCII ART BECAUSE ITS COOL
echo -e ''${red}${bold}'
 ..                          
  ...                        
  ....                      
    .....                    
    ........                 
    ..........         __                           _                      
    ............    /\ \ \ _   _  _ __ ___   _ __  | |__                 
     ...........   /  \/ /| | | || `_ ` _ \ | `_ \ | `_ \      
      ..........  / /\  / | |_| || | | | | || |_) || | | |              
        ........  \_\ \/   \__, ||_| |_| |_|| .__/ |_| |_|                
            ....      '$version' |___/            |_|          
           .. ..                             
             ..             '${reset}${bold}'Welcome to the Team'${reset}${red}'
                     saintssec.com      'By Soulsender'
                      '${reset}''
sleep 5


echo -e "Detecting System and Preferences..."
sleep 1
echo -e ""

# install components = true
if [ "$tools" = true ]
  then
  echo -e "${green}[!] Found tools${reset}"
  sleep 1
fi

if [ "$desktop" = true ]
  then
  echo -e "${green}[!] Found desktop${reset}"
  sleep 1
fi

# install components = false
if [ "$tools" = false ]
  then 
  echo -e "${red}[!] Skipping tool installation${reset}"
  sleep 1
fi

if [ "$desktop" = false ]
  then 
  echo -e "${red}[!] Skipping desktop installation${reset}"
  sleep 1
fi
echo -e "${blue}================================================================"
echo -e "Please make sure you cloned this script in your HOME directory."
echo -e "================================================================${reset}"
sleep 3

# continue prompt
while true
do
  read -r -p "Is the selection correct, and would you like to begin the install? [Y/n]" input
  case $input in
    [yY][eE][sS]|[yY])
      echo -e "${green}Beginning Installation...${reset}"
      sleep 2
      install=true
      break
      ;;

    [nN][oO]|[nN])
      echo -e "${red}Operation canceled.${reset}"
      break
      exit 0
      ;;

    *)
      echo -e "${red}Invalid input...${reset}"
      ;;

  esac
done

# sourcing
if [ "$install" = true ]
  then
  cd ~
  apt-get update

  if [ "$desktop" = true ]
    then
    chmod +x /home/$SUDO_USER/Nymph/source/desktop.sh
    exec /home/$SUDO_USER/Nymph/source/desktop.sh
  fi

  if [ "$tools" = true ]
    then
    chmod +x /home/$SUDO_USER/Nymph/source/tools.sh
    exec /home/$SUDO_USER/Nymph/source/tools.sh
  fi
fi
