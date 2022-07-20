#!/bin/bash
activewidgets="$(~/Applications/eww/target/release/eww windows)"

for w in $activewidgets
do
  if [ "$w" = "*$1" ]
  then
    ~/Applications/eww/target/release/eww close $1
  elif [ "$w" = "$1" ] 
  then
    ~/Applications/eww/target/release/eww open $1
  fi
done
