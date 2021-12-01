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
