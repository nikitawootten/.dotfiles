# dotfiles
My .files, feel free to poke around!

## Using the script

The dotfiles rely on the following packages to work correctly: 
* i3wm - default window manager, NOTE THAT THIS SCRIPT ACTUALLY USES i3gaps. The links to i3gaps can be found at https://github.com/Airblader/i3
* i3lock
* i3status
* dunst - for notifications
* compton - compositor for transparent windows
* feh - for setting the desktop background
* vim - default editor
* rxvt-unicode - terminal
* scrot - screenshots
* ttf-symbola, ttf-dejavu - fonts
* arc-gtk-theme arc-icon-theme gtk-theme-elementary
The script will optionally try to install the packages!

Note that this is **not** an Arch linux install script! I assume that users running this script have the basics (sound, x, networking) done beforehand.

### Installation
To install my dotfiles, just clone the repository and run `install.sh`! Keep in mind this **will** overwrite any of your current files with the same relative path (user-home/.Xdefaults -> ~/.Xdefaults)

### Updating
As long as new configuration files are not added, pulling new changes should be all you need to do. Updates to .Xdefaults must be followed up with `xrdb -merge ~/.Xdefaults`. If any new files are added, the installer must be re-run (or the proper simlinks must be created manually).

In any case, the install script can be run again!
