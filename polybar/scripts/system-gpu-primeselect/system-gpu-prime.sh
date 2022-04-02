#!/bin/sh

icon_intel="INTEL"
icon_nvidia="NVIDIA"
icon_hybrid="HYBRID"

hybrid_switching=0


gpu_current() {
	if ! command -v optimus-manager &> /dev/null
	then
		echo "NO OPTIMUS"
	else
		mode=$(optimus-manager --print-mode)
		echo $mode | awk -F" " '{print $5}'
	fi

    #echo "$mode" | head -n1 | cut -d ' ' -f 3
}

gpu_switch() {
    mode=$(gpu_current)

	if [ "$mode" = "intel" ]; then
		next="nvidia"
	elif [ "$mode" = "nvidia" ]; then
		if [ "$hybrid_switching" = 1 ]; then
			next="hybrid"
		else
			next="intel"
		fi
	elif [ "$mode" = "hybrid" ]; then
		next="nvidia"
	fi

	optimus-manager --switch $next --no-confirm
}

gpu_display(){
    mode=$(gpu_current)

    if [ "$mode" = "intel" ]; then
		echo "$icon_intel"
    elif [ "$mode" = "integrated" ]; then
		echo "$icon_intel"
	elif [ "$mode" = "nvidia" ]; then
		echo "$icon_nvidia"
	elif [ "$mode" = "offload" ]; then
		echo "$icon_hybrid"
	fi
}

case "$1" in
	--switch)
        gpu_switch
        ;;
    *)
        gpu_display
        ;;
esac
