#!/usr/bin/env bash
xautolock -time 2 -locker slock&
dwmblocks &
xset r rate 300 50
feh --bg-fill /home/seven/.dotfiles/.wall
