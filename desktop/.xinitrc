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

# load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec bspwm
