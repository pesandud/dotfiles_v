#!/usr/bin/env bash
# Selection and Messages
set -g mode-style "fg=#7aa2f7,bg=#3b4261"
set -g message-style "fg=#7aa2f7,bg=#3b4261"
set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

# Pane Borders
set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=#7aa2f7"

# Status Bar
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#7aa2f7,bg=#16161E"

set -g status-right-length "50"
set -g status-right "#[fg=#565f89,bg=#16161E] %H:%M "

# Window Status (Inactive)
setw -g window-status-separator ""
setw -g window-status-style "fg=#545c7e,bg=#16161E"
setw -g window-status-format " #I:#W "

#
# Active Window
setw -g window-status-current-style "fg=#15161e,bg=#7aa2f7,bold"
setw -g window-status-current-format " #I:#W "

