#!/bin/bash

nunlockx on &
xset s off &
xset -dpms &

# Update screens
autorandr --change
xrandr --output HDMI1 --mode 1920x1080 &

# Set keymaps
setxkbmap -model pc104 -layout us,br -option grp:win_space_toggle &

# Send welcome notification
notify-send "Welcome, Foschiera"

# Set wallpaper
nitrogen --restore &

#picom -CGb &
picom &
