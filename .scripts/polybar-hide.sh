#!/usr/bin/env bash

killall -q hideIt.sh

# Wait until the processes have been shut down
while pgrep -u $UID -x hideIt.sh >/dev/null; do sleep 1; done

hideIt.sh -N '^polybar-top-bar_eDP1$' -p 3 -d top -H
