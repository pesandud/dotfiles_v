#!/bin/bash

options="  Power Off\n  Reboot\n  Suspend\n  Lock\n  Logout"

chosen=$(echo -e "$options" | wofi --dmenu -i -p "System")

case "$chosen" in
    *Power*)
        systemctl poweroff
        ;;
    *Reboot*)
        systemctl reboot
        ;;
    *Suspend*)
        systemctl suspend
        ;;
    *Lock*)
			swaylock
        ;;
    *Logout*)
        loginctl terminate-user $USER
        ;;
    *)
        exit 1
        ;;
esac
