#!/usr/bin/env bash

# Really handy confirm script found at http://stackoverflow.com/a/3232082
confirm() {
	read -r -p "${1:-Are you sure? [y/N]} " response
	case "$response" in
		[yY][eE][sS]|[yY]) 
			true
			;;
		*)
			false
			;;
	esac
}

echo "Nikita's dotfiles!\n"

echo "I run Arch Linux on my machine. You can find a list of required packages in the readme, but this script can install all of them for you."

if confirm "Would you like this script to do so? [y/N] "?
then
	sudo pacman -Sy i3-wm i3lock i3status dunst compton feh vim rxvt-unicode scrot ttf-symbola ttf-dejavu arc-gtk-theme arc-icon-theme elementary-icon-theme
fi

echo "\nThis script will overwrite any files for you home folder in the same structure as user-home/!"

if confirm "Please make sure you're running the script from the root of the git repo.  Continue? [y/N] "?
then
	echo "Continuing...\n"
	# Save to do anything dangerous
	echo "Creating symbolic links to configuration files..."
	cp -rfs "$(pwd)/user-home/." ~/
else
	echo "Stopping!"
	exit 0
fi

echo "Merging xrdb entries..."
xrdb -merge ~/.Xdefaults

echo "Thanks for using my script! Remember: Deleting this directory will invalidate all the symlinks! Be careful."
