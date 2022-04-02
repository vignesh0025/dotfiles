#!/usr/bin/env bash

dir="$HOME/.config/polybar"

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
	OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

	# Launch the bar
	if [[ "$style" == "hack" || "$style" == "cuts" ]]; then
		MONITOR=$PRIMARY polybar -q main -c "$dir/$style/config.ini" &
		#MONITOR=$PRIMARY polybar -q bottom -c "$dir/$style/config.ini" &

		for m in $OTHERS; do
			MONITOR=$m polybar -q top -c "$dir/$style/config.ini" &
		done
	elif [[ "$style" == "pwidgets" ]]; then
		bash "$dir"/pwidgets/launch.sh --main
	else
		polybar -q main -c "$dir/$style/config.ini" &
	fi
}

if [[ "$1" == "--new" ]]; then
	style="new"
	launch_bar

# elif [[ "$1" == "--material" ]]; then
# 	style="material"
# 	launch_bar

else
	cat <<- EOF
	Usage : launch.sh --theme

	Available Themes :
	--new
	EOF
fi
