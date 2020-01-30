#!/bin/sh

# this file is run when calling startx

# default arch init scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*.sh; do
        [ -x "$f" ] && . "$f"
    done
fi

# user init scripts and settings
[ -r /etc/X11/xinit/.Xmodmap ] && xmodmap /etc/X11/xinit/.Xmodmap
[ -r ~/.config/X11/.Xmodmap ] && xmodmap ~/.config/X11/.Xmodmap
[ -r ~/.config/X11/.Xresources ] && xrdb -merge ~/.config/X11/.Xresources
[ -r ~/.config/X11/.xprofile ] && . ~/.config/X11/.xprofile

# launch i3 with debug, commands below this line will be ignored
exec i3 --shmlog-size=26214400
