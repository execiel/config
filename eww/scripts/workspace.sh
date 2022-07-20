#!/bin/bash
workspaces="$(hyprctl workspaces)"

if [ $workspaces | grep "ID $1" ]
then
  echo "hello"
fi

echo "oh no"
