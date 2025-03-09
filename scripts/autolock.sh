#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 60 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 25%' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  --timer 10 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; slock' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 3600 \
    'systemctl suspend' \
    ''
