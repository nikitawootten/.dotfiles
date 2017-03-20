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

echo "This script will overwrite any files for you home folder in the same structure as user-home/!"

if confirm "Please make sure you're running the script from the root of the git repo.  Continue? [y/N] "?
then
	echo "Continuing..."
	# Save to do anything dangerous
	cp -rfs "$(pwd)/user-home/." ~/
else
	echo "Stopping!"
	exit 0
fi

echo "Thanks for using my script!"
