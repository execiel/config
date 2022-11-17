#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /home/wspon/.config/polybar/bar1.log
polybar --config=$HOME/.config/polybar/config.ini topbar | tee -a /home/wspon/.config/polybar/bar1.log/ & disown

echo "Bar launched"
