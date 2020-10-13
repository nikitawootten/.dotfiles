#!/bin/sh
# ~/.xinitrc
# Executed when 'startx' is run

# local xinitr.d
if [ -d ~/.xinitrc.d ]; then
	for f in ~/.xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Simple hack to allow mouse scrolling when right click button is held down
xinput --set-prop pointer:"HAILUCK CO.,LTD USB KEYBOARD Mouse" "libinput Middle Emulation Enabled" 1
xinput --set-prop pointer:"HAILUCK CO.,LTD USB KEYBOARD Mouse" "libinput Button Scrolling Button" 3
xinput --set-prop pointer:"HAILUCK CO.,LTD USB KEYBOARD Mouse" "libinput Scroll Method Enabled" 0 0 1

# load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec bspwm
