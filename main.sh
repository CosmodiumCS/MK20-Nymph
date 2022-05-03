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
    .''.                                     
      .''..                                   
      ......                                 
        .......                               
        ........                            
      ..............                         
      ...............                       
        ................                     
        ................                   
          ...............                   
        .................   ______  ______  __  __   __  ______  ______       _____   ______  ______  __  __   ______  ______  ______  
          ...............  /\  ___\/\  __ \/\ \/\ "-.\ \/\__  _\/\  ___\     /\  __-./\  ___\/\  ___\/\ \/ /  /\__  _\/\  __ \/\  == \ 
            .............  \ \___  \ \  __ \ \ \ \ \-.  \/_/\ \/\ \___  \    \ \ \/\ \ \  __\\ \___  \ \  _"-.\ /_/\ \/\ \ \/\ \ \  _-/ 
                ..........   \/\_____\ \_\ \_\ \_\ \_\\"\_\ \ \_\ \/\_____\     \ \____-\ \_____\/\_____\ \_\ \_\  \ \_\ \ \_____\ \_\   
              ...  ...  ..    \/_____/\/_/\/_/\/_/\/_/ \/_/  \/_/ \/_____/     \/____/ \/_____/\/_____/\/_/\/_/   \/_/  \/_____/\/_/                                                                                                                            
                ....  ...                   
                .    ....                                          '${reset}${bold}'Welcome to the Team'${red}'
                    ...                                    saintssec.com         github.com/soulsender      
                      ....
                      '${reset}''

#sleep 5

if [ "$tools" = true ]
  then
  echo -e "${blue}Found tools${reset}"
fi

if [ "$desktop" = true ]
  then
  echo -e "${blue}Found desktop${reset}"
fi

while true
do
  read -r -p "Would you like to continue with the installation? [Y/n]" input
  case $input in
    [yY][eE][sS]|[yY])
      echo -e "${green}Beginning Installation..."
      sleep 2
      install=true
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