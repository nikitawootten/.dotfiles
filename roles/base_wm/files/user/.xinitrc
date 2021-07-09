#!/bin/sh
# ~/.xinitrc
# Executed when 'startx' is run

[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

# local xinitr.d
if [ -d ~/.config/xinitrc.d ]; then
	for f in ~/.config/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi
