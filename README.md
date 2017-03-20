# dotfiles
My .files, feel free to poke around!

## Using the script

### Installation
To install my dotfiles, just clone the repository and run `install.sh`! Keep in mind this **will** overwrite any of your current files with the same relative path (user-home/.Xdefaults -> ~/.Xdefaults)

### Updating
As long as new configuration files are not added, pulling new changes should be all you need to do. Updates to .Xdefaults must be followed up with `xrdb -merge ~/.Xdefaults`. If any new files are added, the installer must be re-run (or the proper simlinks must be created manually).

In any case, the install script can be run again!
