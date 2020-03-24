#!/bin/zsh

# zprofile. Runs on login if zsh is the default shell (it is in LARBS).

# Load environmental variables.
[ -f "$HOME/.config/env" ] && source "$HOME/.config/env"

# Create autogenerated shortcuts if needed.
[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

# Or, switch escape and caps if tty and no passwd required:
sudo -n loadkeys ~/.local/share/larbs/ttymaps.kmap 2>/dev/null
