#!/usr/bin/env bash

#rofi_command="rofi -theme $dir/powermenu.rasi"
rofi_command="rofi"
selected_row=$(pactl list sinks | grep State | nl -v 0 | grep RUNNING | awk '{print $1}')
echo $selected_row
sinks=$(pactl list sinks | grep Description | awk -F ":" '{print $2}' | nl -v 0 -w 1 -s " " | tr -d "\t")
chosen="$(echo -e "$sinks" | $rofi_command -p "醙 " -dmenu -selected-row $selected_row | awk '{print $1}')"

[[ ! -z "$chosen" ]] && pactl set-default-sink $chosen
