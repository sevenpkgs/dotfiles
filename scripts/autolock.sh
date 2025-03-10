#!/usr/bin/env bash

xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 120\
    'brightnessctl s 20%-'\
    'brightnessctl s 20%+'\
  --timer 10\
    'slock' \
    '' \
  --timer 600 \
    'systemctl suspend' \
    ''
