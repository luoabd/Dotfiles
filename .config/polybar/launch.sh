#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar primary -c ~/.config/polybar/config &
sleep 1 &&
# polybar music -c ~/.config/polybar/config &
polybar secondary -c ~/.config/polybar/config
