#!/usr/bin/env bash
CONTROLS_CONFIG="$HOME/.config/waybar/config-controls.jsonc"
STYLE="$HOME/.config/waybar/style.css"

if pgrep -f "config-controls.jsonc" > /dev/null 2>&1; then
    pkill -f "config-controls.jsonc"
else
    waybar -c "$CONTROLS_CONFIG" -s "$STYLE" &
fi
