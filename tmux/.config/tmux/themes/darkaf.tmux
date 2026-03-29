#!/usr/bin/env bash

# Selection and Messages
# Using a deep charcoal for selection background
set -g mode-style "fg=#eeeeee,bg=#262626"
set -g message-style "fg=#eeeeee,bg=#262626"
set -g message-command-style "fg=#eeeeee,bg=#262626"

# Pane Borders
# Subtle borders so they don't distract
set -g pane-border-style "fg=#1c1c1c"
set -g pane-active-border-style "fg=#444444"

# Status Bar
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#808080,bg=#080808"

set -g status-right-length "50"
set -g status-right "#[fg=#444444,bg=#080808] %H:%M "

# Window Status (Inactive)
setw -g window-status-separator ""
setw -g window-status-style "fg=#444444,bg=#080808"
setw -g window-status-format " #I:#W "

# Active Window
# High contrast for the active tab against the dark background
setw -g window-status-current-style "fg=#ffffff,bg=#1c1c1c,bold"
setw -g window-status-current-format " #I:#W "
