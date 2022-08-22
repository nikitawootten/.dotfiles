# Dotfiles Utility Role

This utility (dynamic) role crawls a source directory (defaulting to the calling role's `files` directory) and symlinks each file to the corresponding location in the target directory (defaults to the user home).
The source and destination directories can be overridden with the `dotfiles_src` and `dotfiles_dest` variables.
