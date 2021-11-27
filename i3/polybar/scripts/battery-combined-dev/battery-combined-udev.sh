#!/bin/sh

close_dunstify() {
        if [[ -n "$power_low_dunst" ]]; then
            dunstify -C "$power_low_dunst"
        fi
}

battery_print() {
    PATH_AC="/sys/class/power_supply/ADP0"
    PATH_BATTERY_0="/sys/class/power_supply/BAT0"
    PATH_BATTERY_1="/sys/class/power_supply/BAT1"

    ac=0
    battery_level_0=0
    battery_level_1=0
    battery_max_0=0
    battery_max_1=0

    if [ -f "$PATH_AC/online" ]; then
        ac=$(cat "$PATH_AC/online")
    fi

    if [ -f "$PATH_BATTERY_0/energy_now" ]; then
        battery_level_0=$(cat "$PATH_BATTERY_0/energy_now")
    fi

    if [ -f "$PATH_BATTERY_0/energy_full" ]; then
        battery_max_0=$(cat "$PATH_BATTERY_0/energy_full")
    fi

    if [ -f "$PATH_BATTERY_1/energy_now" ]; then
        battery_level_1=$(cat "$PATH_BATTERY_1/energy_now")
    fi

    if [ -f "$PATH_BATTERY_1/energy_full" ]; then
        battery_max_1=$(cat "$PATH_BATTERY_1/energy_full")
    fi

    battery_level=$(("$battery_level_0 + $battery_level_1"))
    battery_max=$(("$battery_max_0 + $battery_max_1"))

    battery_percent=$(("$battery_level * 100"))
    battery_percent=$(("$battery_percent / $battery_max"))

    if [ "$ac" -eq 1 ]; then
        icon=""

        close_dunstify
        if [ "$battery_percent" -gt 97 ]; then
            echo "$icon"
        else
            echo "$icon $battery_percent %"
        fi
    else
        if [ "$battery_percent" -gt 85 ]; then
            icon=""
        elif [ "$battery_percent" -gt 75 ]; then
            icon=""
        elif [ "$battery_percent" -gt 50 ]; then
            icon=""
        elif [ "$battery_percent" -gt 25 ]; then
            icon=""
        elif [ "$battery_percent" -gt 10 ]; then
            close_dunstify
            dunstify -C $power_low_dunst
            export power_low_dunst=$(dunstify -i "battery-level-10-symbolic.symbolic" -u normal "Battery Low $battery_percent" -p)
            icon=""
        else
            close_dunstify
            RETURN=$(dunstify  --action="default,Suspend" --action="ignore,Ingore" -i "battery-level-10-symbolic.symbolic" -u critical "Battery Warning" "<b>Critically Low $battery_percent Suspending in 20 Seconds</b>" -t 20000 -p)
            dunstify "Information"
            export power_low_dunst=$(echo $RETURN | head -n1)
            ACTION=$(echo $RETURN | tail -n1)
            notify-send "$ACTION"
            case "$ACTION" in
            "*default")
                echo "suspending default" >> /tmp/sus
                systemctl suspend
                ;;
            "1")
                # Suspend after timeout
                echo "suspending timeout" >> /tmp/sus
                systemctl suspend
                ;;
            esac

            icon=""
        fi

        echo "$icon $battery_percent %"
    fi
}

path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
    --update)
        pid=$(cat $path_pid)

        if [ "$pid" != "" ]; then
            kill -10 "$pid"
        fi
        ;;
    *)
        echo $$ > $path_pid

        trap exit INT
        trap "echo" USR1

        while true; do
            battery_print

            sleep 30 &
            wait
        done
        ;;
esac
