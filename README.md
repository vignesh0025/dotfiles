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

    - Install "nvidia" and "bbswitch" from pacman
    - Install optimus-manager and optimus-manager-qt from yay
    - Using optimus-manager-qt settings, switch mode to offload and boot also to offload
    - Select bbswitch as NVidia turn off method
    - Select `Course` as the switching method
    - Use arandr to enable the second monitor (Even in offload moad lol)

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
