#!/bin/bash
activewidgets="$(~/Applications/eww/target/release/eww windows)"

for w in $activewidgets
do
  if [ "$w" = "*shutdown_window" ]
  then
    ~/Applications/eww/target/release/eww close shutdown_window
  elif [ "$w" = "shutdown_window" ] 
  then
    ~/Applications/eww/target/release/eww open shutdown_window
  fi
done
