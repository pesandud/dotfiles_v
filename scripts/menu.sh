#!/bin/bash

options="󰀻 Launch Application\n Power Menu"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "" -l 2 -theme ~/.config/rofi/theme.rasi)

case "$chosen" in
    *Launch*)
        rofi -show drun -theme ~/.config/rofi/theme.rasi
        ;;
    *Power*)
        bash ~/dotfiles/scripts/powermenu.sh
        ;;
    *)
        exit 1
        ;;
esac
