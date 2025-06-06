#!/bin/bash

# Check release
if [ ! -f /etc/arch-release ] ; then
    exit 0
fi


# Check for updates
aur=`yay -Qua | wc -l`
ofc=`checkupdates | wc -l`

# Calculate total available updates
upd=$(( ofc + aur ))

# Show tooltip
if [ $upd -eq 0 ] ; then
    echo "{\"text\":\"$upd\", \"tooltip\":\" Packages are up to date\"}"
else
    echo "{\"text\":\"$upd\", \"tooltip\":\"󱓽 Official $ofc\n󱓾 AUR $aur\"}"
fi

# Trigger upgrade
if [ "$1" == "up" ] ; then
    alacritty -e bash -c "yay -Syu && bash ~/.config/waybar/scripts/systemupdates.sh"
fi
