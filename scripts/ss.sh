#!/bin/sh

DIR="$HOME/pictures/screenshots"
NAME="screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
FILE_PATH="$DIR/$NAME"

grim -g "$(slurp)" - | tee "$FILE_PATH" | wl-copy

notify-send "Screenshot saved"
