#!/usr/bin/env bash

$HOME/.fehbg

if [ "$1" = "notify" ]; then
	wallpaper=$(cat $HOME/.cache/.lockscreen)
	dunstify --timeout 5000 "Wallpaper changed." "$wallpaper"
fi

output=$(betterlockscreen --update $HOME/.wallpaper)
lockscreen=$(echo "$output" | grep "Original" | sed -r 's/^.*: //')
echo $lockscreen > $HOME/.cache/.lockscreen

if [ "$1" = "notify" ]; then
	dunstify --timeout 5000 "Lockscreen changed." "$lockscreen"
fi


