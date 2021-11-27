#!/bin/sh

killall -q polybar

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

MONITOR=$PRIMARY polybar --reload primary -config ~/.config/i3/polybar/config 2>&1 | tee "/tmp/polybar-primary-$PRIMARY.log" & disown
sleep 1

for m in $OTHERS; do
    MONITOR=$m polybar --reload secondary -config ~/.config/i3/polybar/config 2>&1 | tee "/tmp/polybar-$m.log" & disown
done

#polybar mybar -config ~/.config/i3/polybar/config
