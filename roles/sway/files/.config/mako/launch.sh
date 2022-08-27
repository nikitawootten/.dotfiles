#!/usr/bin/env
# adapted from https://github.com/cyberrumor/SwayEcosystem/blob/master/home/cyberrumor/.config/mako/launch.sh
# this file is here to make sure mako gets new pywal themes

# Terminate already running mako instances
killall -q mako

# Wait until the processes have been shut down
while pgrep -u $UID -x mako >/dev/null; do sleep 1; done

# Launch mako
mako & disown
