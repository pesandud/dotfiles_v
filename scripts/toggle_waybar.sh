#!/usr/bin/env bash

# if pgrep -x "waybar" > /dev/null; then
#     killall waybar
# else
#     ~/dotfiles/waybar/.config/waybar/scripts/launch.sh > /dev/null 2>&1 &
# fi
systemctl --user restart waybar.service
