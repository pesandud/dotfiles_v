#!/bin/sh
# 1. slurp lets you select the region
# 2. grim grabs that region
# 3. satty opens the editor with the 'raw' pipe
grim -g "$(slurp)" - | satty --filename -
