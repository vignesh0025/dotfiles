#!/usr/bin/env bash

#rofi_command="rofi -theme $dir/powermenu.rasi"
rofi_command="rofi"

connected_ssid=$(nmcli -f active,ssid | grep " connected" | awk '{print $4}')
ifaces=$(nmcli -f SSID device wifi list --rescan yes | tail -n +2)

connected_ssid_index=$(echo "$ifaces" | nl | grep "$connected_ssid" | awk -F " " '{print $1}')
selected_ssid=$(echo "$ifaces" | $rofi_command -p "醙 " -dmenu | tr -d " ")
[[ ! -z "$selected_ssid" ]] && nmcli device wifi connect "$selected_ssid"
