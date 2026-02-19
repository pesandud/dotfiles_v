#!/bin/bash
# left click drag = region, no args = full screen
STAMP=$(date +%Y-%m-%d_%H-%M-%S)
SAVE=~/Pictures/screenshots
grim -g "$(slurp)" "$SAVE/$STAMP.png" && \
	notify-send "Screenshot saved" "$SAVE/$STAMP.png"
