#!/usr/bin/env bash

export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
STATE_FILE="$HOME/.config/waybar/scripts/idle_state"

# Ensure state file exists
if [ ! -f "$STATE_FILE" ]; then
    echo "off" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "off" ]; then
    # Enable idle (start swayidle)
    swayidle -w \
        timeout 300 'swaylock -f -c 000000' \
        timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
        before-sleep 'swaylock -f -c 000000' &
    echo "on" > "$STATE_FILE"
	notify-send 'idle inhibiting turned on'
else
    # Disable idle (kill swayidle)
    pkill swayidle
    echo "off" > "$STATE_FILE"
	exec notify-send 'idle inhibiting turned off'
fi
