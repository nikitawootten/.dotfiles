#!/bin/sh
# ~/.xinitrc
# Executed when 'startx' is run

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# local xinitr.d
if [ -d ~/.xinitrc.d ]; then
	for f in ~/.xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

exec bspwm
