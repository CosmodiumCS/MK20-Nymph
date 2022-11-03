#!/bin/bash

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
export WORKING_DIR=`pwd`
export TOOL_DIR=$WORKING_DIR/src/tools.sh
export DESKTOP_DIR=$WORKING_DIR/src/tools.sh

echo $HOME_DIR
echo $WORKING_DIR
echo $TOOL_DIR
echo $DESKTOP_DIR


# check for arguments
if [[ $# -eq 0 ]] ; then
    echo -e "${red}No arguments specified. Use -h to see a list of possible arguments.${reset}"
    exit 0
fi

# arguments
while [ -n "$1" ]
do
case "$1" in
--help)
  cat assets/help.txt
  exit 0
;;
--desktop) 
  DESKTOP=true
;;
--tools) 
  TOOLS=true
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
echo -e ''${blue}${bold}'
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
             ..             '${reset}${bold}'By Soulsender'${reset}${blue}'
                            'soulsender.me'
                      '${reset}''


echo -e "Detecting System and Preferences..."
sleep 5
echo -e ""

# INSTALL components = true
if [ "$TOOLS" = true ]
  then
  echo -e "${green}[!] Found Tools${reset}"
fi

if [ "$DESKTOP" = true ]
  then
  echo -e "${green}[!] Found Desktop${reset}"
fi

# INSTALL components = false
if [ "$TOOLS" = false ]
  then 
  echo -e "${red}[!] Skipping Tools Installation${reset}"
fi

if [ "$DESKTOP" = false ]
  then 
  echo -e "${red}[!] Skipping Desktop Installation${reset}"
fi

# continue prompt
while true
do
  read -r -p "Is the selection correct, and would you like to begin the installation? [Y/n]" input
  case $input in
    [yY][eE][sS]|[yY])
      echo -e "${green}Beginning Installation...${reset}"
      sleep 2
      INSTALL=true
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
if [ "$INSTALL" = true ]
  then
  cd $HOME_DIR
  apt-get update

  if [ "$DESKTOP" = true ]
    then
    chmod +x $DESKTOP_DIR
    exec $DESKTOP_DIR
  fi

  if [ "$TOOLS" = true ]
    then
    chmod +x $TOOL_DIR
    exec $TOOL_DIR
  fi
fi
