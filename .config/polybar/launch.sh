#!/usr/bin/env bash

# Terminate already running bar instances since polybar does not restart when X11 is reloaded.
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch
polybar main-bar && hideIt.sh -N '^polybar' -p 3 -d bottom -H
