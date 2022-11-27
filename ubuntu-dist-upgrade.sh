#!/bin/bash

echo -e $TEXT_YELLOW
greeting="Welcome"
user=$(whoami)
day=$(date +%A)
echo -e $TEXT_RESET

echo -e $TEXT_YELLOW
echo "$greeting back $user! Today is $day, which is the best day of the entire week!"
echo "Your Bash shell version is: $BASH_VERSION. Enjoy!"
echo -e $TEXT_RESET

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

sudo apt-get update -y
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET

sudo apt-get upgrade -y
echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET

sudo apt dist-upgrade -y
echo -e $TEXT_YELLOW
echo 'APT distributive upgrade finished...'
echo -e $TEXT_RESET

sudo apt-get autoremove -y
echo -e $TEXT_YELLOW
echo 'APT auto remove finished...'
echo -e $TEXT_RESET

sudo sudo apt install update-manager-core -y
echo -e $TEXT_YELLOW
echo 'APT auto install update-manager finished...'
echo -e $TEXT_RESET

sudo do-release-upgrade 
echo -e $TEXT_YELLOW
echo 'APT release upgrade finished...'
echo -e $TEXT_RESET

if [ -f /var/run/reboot-required ]; then
    echo -e $TEXT_RED_B
    echo 'Reboot required!'
    echo -e $TEXT_RESET
fi

echo -e $TEXT_RED_B
echo "Update Complete! Press Y/N to reboot."
echo -e $TEXT_RESET

while true; do
    read -p "Would you like to reboot now? " yn
    case $yn in
	[Yy]* ) reboot; break;;
	[Nn]* ) exit;;
	* ) echo "Please answer yes or no!";;
    esac
done
