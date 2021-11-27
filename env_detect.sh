#!/usr/bin/env sh

if grep -iq Microsoft /proc/version; then
    export ENV_WSL=1
else
    export ENV_WSL=0
fi

# This requires the following
# sudo visudo -f /etc/sudoers.d/dbus
# `vignesh ALL = (root) NOPASSWD: /etc/init.d/dbus`
#

if [ "$ENV_WSL" -eq "1" ]; then
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):1.0
    unset LIBGL_ALWAYS_INDIRECT
    sudo /etc/init.d/dbus start &> /dev/null
    # Remove all paths excluding from windows folder
    export PATH=$(echo "$PATH"  | perl -p -e 's/:\/mnt\/[cg]\/(?i)(?!Windows)(?!tools)[A-Za-z\/ 0-9-.()_]+(?=:)//g')
    export XDG_RUNTIME_DIR=~/.config/xdg
    export RUNLEVEL=3
fi

alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""
