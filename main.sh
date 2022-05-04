#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

desktop=false
tools=false

install=false


# check for arguments
if [[ $# -eq 0 ]] ; then
    echo -e "${red}No arguments specified. Use -h to see a list of possible arguments.${reset}"
    exit 0
fi

while [ -n "$1" ]
do
case "$1" in
-h) 
  cat help.txt
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
    then echo -e "Please run as root/sudo permissions"
    exit 0
fi

# FORCE THEM TO SEE THE ASCII ART
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
            ....           |___/            |_|          
           .. ..                             
             ..             '${reset}${bold}'Welcome to the Team'${reset}${red}'
                     saintssec.com      'By Soulsender'
                      '${reset}''
sleep 5

if [ "$tools" = true ]
  then
  echo -e "${blue}Found tools${reset}"
  sleep 2
fi

if [ "$desktop" = true ]
  then
  echo -e "${blue}Found desktop${reset}"
  sleep 2
fi

while true
do
  read -r -p "Would you like to continue with the installation? [Y/n]" input
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
      exit
      ;;

    *)
      echo -e "${red}Invalid input...${reset}"
      ;;

  esac
done

if [ "$install" = true ]
  then

  if [ "$desktop" = true ]
    then
    chmod +x runoffs/desktop.sh
    ./runoffs/desktop.sh

  fi

  if [ "$tools" = true ]
    then
    chmod +x runoffs/tools.sh
    ./runoffs/tools.sh
    
fi