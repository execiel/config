#!/bin/bash
picom --config $HOME/.config/qtile/picom.conf -b &
nitrogen --restore &
xinput set-prop 13 318 1 &
xinput set-prop 13 310 1 &
