# Install oh-my-fish
# omf install fzf
# omf install bass

if status is-interactive
end

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# Update Path
set -x PATH $PATH $HOME/.local/bin /opt/intelFPGA/20.1/modelsim_ase/bin

# set editor
set -x EDITOR nvim

# FZF Default Options
set -x FZF_DEFAULT_OPTS '--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# This requires bass
# omg install bass
function vivado_activate
    bass source /home/vignesh/Data/Xilinx/Vivado/2021.1/settings64.sh
end

# Disable the unncecessary welcome message we get at the start
set fish_greeting

