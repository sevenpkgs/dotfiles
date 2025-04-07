#!/usr/bin/env bash

export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 30 \
  'xrandr --output "$PRIMARY_DISPLAY" --brightness .3' \
  'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  --timer 10 \
  'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; slock' \
  '' \
  --timer 60 \
  'systemctl suspend' \
  ''
