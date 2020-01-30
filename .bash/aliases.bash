#!/bin/bash

# Better stdout
alias la='ls -Ah'
alias ls='ls -1 --color=auto'
alias links='find . -maxdepth 1 -type l -ls'
alias open='xdg-open'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias du='du -kh'
alias df='df -kTh'
alias xp='xprop | awk -F\"'" '/CLASS/ {printf \"NAME = %s\nCLASS = %s\n\", \$2, \$4}'"
alias tree='tree -a'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dd="sudo dd status=progress if=input_file_name of=output_file_name"

alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
alias rsync='rsync -v --progress'
alias calc='python -qi -c "from math import *"'
alias timer='time read -p "Press enter to stop"'
alias network='nmtui'

alias recordScreen='ffmpeg -f x11-grab -s 1920x1080 -i :0.0'
alias recordWebcam='ffmpeg -i /dev/video0'
# Git
alias gp='git pull'
alias gf='git fetch'
alias gc='git clone'
alias gs='git stash'
alias gb='git branch'
alias gm='git merge'
alias gch='git checkout'
alias gcm='git commit -m'
alias glg='git log --stat'
alias gpo='git push origin HEAD'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gu='git add * && git commit -m "" && git push'

alias update='sudo pacman -Syyu --noconfirm'
alias install='yay -S --noconfirm --needed'
alias remove='yay -Rs'
alias removeOrphans='pacman -Rns $(pacman -Qtdq)'
# aliases inside tmux session
if [[ $TERM == *tmux* ]]; then
    alias :sp='tmux split-window'
    alias :vs='tmux split-window -h'
fi

alias screenshot="sudo scrot -s -e 'mv $f $HOME/Pictures/Screenshots'"
alias battery="upower -i `upower -e | grep 'BAT'`"
alias webapp="google-chrome-stable --app=https://"
alias hide="hideIt.sh -N '^polybar' -p 3 -d bottom  -H"
