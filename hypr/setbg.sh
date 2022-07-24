#!/bin/bash
killall swaybg
#bgs=("forest.jpg" "river.jpg" "berries.jpg" "dock.jpg" "leaves-3.jpg")
bgs=("arch.jpg")
len=${#bgs[@]}
wallpaper=${bgs[$RANDOM % $len]}

swaybg -m fill -i ~/Pictures/Wallpapers/Gruvbox/$wallpaper &
