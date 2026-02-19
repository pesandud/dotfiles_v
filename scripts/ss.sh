#!/bin/sh
grim -g "$(slurp)" - | wl-copy
notify-send "Screenshot captured!"
