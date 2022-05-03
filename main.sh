#!/bin/bash

# declare variables
red="\e[0;91m"
green="\e[0;92m"
blue="\e[0;94m"
bold="\e[1m"
reset="\e[0m"

desktop=false
tools=false

install-false


# check for arguments
while [ -n "$1" ]
do
case "$1" in

-h) 
  cat help.txt

  art=false
  exit
;;

-d) 
  
  desktop=true
;;

-t) 
  
  tools=true
;;



*) echo -e "$1 is not an option" ;;
esac
shift
done

# check if run with sudo
if [ "$EUID" -ne 0 ]
    then echo -e "Please run as root/sudo permissions"
    exit
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
echo -e "Be sure to read the -h before starting."
#sleep 2

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