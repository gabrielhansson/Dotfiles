[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ ! $DISPLAY && XDG_VTNR -eq 1 ]] && exec startx 
# if wayland with sway as window manager is preferred 
# [[ ! $DISPLAY && XDG_VTNR -eq 1 ]] && exec sway --my-next-gpu-wont-be-nvidia 

# If using rust
export PATH="$HOME/.cargo/bin:$PATH"
# autohide polybar, did not work in i3 config
hideIt.sh -N 'polybar-top-bar_eDP1' -p 3 -d top -H
