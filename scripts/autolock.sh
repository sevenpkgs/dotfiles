#!/usr/bin/env bash

xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 120\
    'brightnessctl s 25%'\
    'brightnessctl s 50%'\
  --timer 7\
    'slock' \
    '' \
  --timer 600 \
    'systemctl suspend' \
    ''
