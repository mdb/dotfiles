#!/bin/bash

# Copy to clipboard via OSC 52
buf=$(cat)
buf64=$(echo -n "$buf" | base64 | tr -d '\n')

# Find the active terminal device
tty_device=$(tmux list-panes -F "#{pane_active} #{pane_tty}" | grep "^1" | awk '{print $2}')

# For tmux, use DCS passthrough
if [ -n "$TMUX" ]; then
  printf "\033Ptmux;\033\033]52;c;%s\007\033\\" "$buf64" > "$tty_device"
else
  printf "\033]52;c;%s\007" "$buf64"
fi
