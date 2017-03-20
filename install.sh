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

if confirm "This script will overwrite any files your home folder in the same structure as user-home/! Continue? [y/N] "?
then
	echo "Continuing"
else
	echo "Stopping"
	exit 0
fi

echo "Thanks for using my script!"
