# ConfigFiles

## Contains Configuration for the following:
    * ZSH
    * Tmux
    * Kitty
    * Cava
    * Batt
    * Neovim/Vim
    * Git

## Arch Synaptics Driver Configuration

    - Install xorg-xinput (This installs xinput tool)
    - xinput list
        - This gives us list of all input devices.
        - Look for Touchpad and get its id
    - xinput list-props <id>
        - This will give all the properties for Touchpad
        - Find Tapping Enabled and get prop_idd (ie values in bracket)
```
libinput Tapping Enabled (*314*): 0
```
    - xinput set-prop <id> <prop_id> 1
        - The above dynamically sets value of TappingEnabled to 1
        - Verify it works as expected
    - Make it persistent using
```
sudo nvim /etc/X11/xorg.conf.d/40-libinput.conf
```
    - In 40-libinput, add *MatchIsTouchpad "on"* to *touchpad catchall* setion
    - logout and login

## NVidia Drivers

### Laptop
    - Install "nvidia" and "bbswitch" from pacman
    - Install optimus-manager and optimus-manager-qt from yay
    - Using optimus-manager-qt settings, switch mode to offload and boot also to offload
    - Select bbswitch as NVidia turn off method
    - Select `Course` as the switching method
    - Use arandr to enable the second monitor (Even in offload mode lol)

### Desktop
    - Install "nvidia" from pacman
    - You are already done :-)

## Cuda

    - Check [Cuda & tensorflow Table](https://www.tensorflow.org/install/source#gpu)
    - Check [Cuda & NVidia Driver Table](https://docs.nvidia.com/deploy/cuda-compatibility/index.html)
    - Install "cuda" and "cudnn" using pacman accordingly
    - Use venv -> `python -m venv PY3`
    - Install tensorflow-gpu
    - Freeze Package `IgnorePkg   = nvidia cuda cudnn opencl-nvidia` in `/etc/pacman.conf`
    - Tadaa!

## Laptop Lid and suspend button

    - In `/etc/systemd/logind.conf`, enable the following:
        - HandleSuspendKey=suspend
        - HandleLidSwitch=suspend

## Brightness (Desktop)
    - Install `ddcutil` from pacman/paru
    - Run `sudo modprobe i2c-dev` as `Moniter Brightness` is in i2c bus
    - Run `sudo ddcutil capabilities | grep "Feature: 10"`
        - If we get `Feature: 10 (Brightness)`, we are able to access the i2c bus
    - Run `ddcutil getvcp 10` to get current Brightness.
    - If above is working, use `ddcutil setvcp 10 <brighness_val>` to set.

    - To make this permanent:
        - `echo "i2c-dev" > /etc/modules-load.d/i2c-dev.conf`
        - Add `KERNEL=="i2c-[0-9]*", GROUP="i2c"` in `/etc/udev/rules.d/10-local_i2c_group.rules`
        - `groupadd i2c`
        - `usermod -aG i2c vignesh`
        - Reboot
        - Use ddcutil getvcp/setvcp to adjust brighness
    - Polybar: TBD
