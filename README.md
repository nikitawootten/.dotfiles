# dotfiles
My .files, feel free to poke around!

I use `stow` to manage my dotfiles because it allows me to easily seperate my configuration into different "silos".
Each folder at the root of this repository manages some aspect of my configuration.

`stow` only manages my dotfiles, so I still have to manage packages myself.

## Index
* [`@yukon/`](@yukon/) - Adjustments necessary for my beloved GPD Pocket 2 (it's a bit tiny)
* [`@yukon-sys/`](@yukon-sys) - System adjustments necessary the GPD Pocket 2
* [`desktop/`](desktop/) - Config for my BSPWM desktop with SXHKD & Polybar
* [`zsh/`](zsh/) - Base ZSH config

## A note on naming
* Directories with a `@` prefix are specific to a *machine*
* Directories with a `-sys` prefix must be stowed with the target set to `/`
