#!/bin/sh
xrandr --output HDMI-0 --off --output DP-0 --primary --mode 1920x1200 --pos 1920x0 --rotate normal --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off --output DP-3 --off
$HOME/.config/polybar/launch_new.sh --new | tee /tmp/poly.log
