# dotfiles
My .files, feel free to poke around!

## Structure
I manage my dotfiles in Ansible using a system of *plays* and *roles*.
- I use *plays* to manage device specific configuration.
These *plays* act as "entrypoint" of my configuration.
- I use *roles* to manage application configurations.
- A *play* is composed of multiple *roles*, with some extra configuration on top.

### Play Index
- [`yukon`](./yukon.yaml): My framework laptop running Arch Linux.

### Role Index
*NOTE: Most of these roles will only work on Arch Linux.*

*SECOND NOTE: some roles inherit other roles, ensuring roles are run in the right order.*

- [`alacritty`](./roles/alacritty): A very simple role that ensures that Alacritty (a nice terminal emulator) is installed and tricks applications attempting to open XTerm into opening Alacritty instead.
- [`docker`](./roles/docker): A role that installs `Docker` and `docker-compose` on Arch or Debian based distros.
- [`git`](./roles/git): A simple role that initializes my git configuration. Do not copy copy verbatim unless you would like to inherit my name.
- [`gnome-keyring`](./roles/gnome-keyring): Installs the gnome keyring along with some configuration.
- [`hyprland`](./roles/hyprland): A *WIP* role that installs and configures [Hyprland](https://hyprland.org/)
- [`ssh-client`](./roles/ssh-client): Installs and configures SSH with a special config dir `~/.ssh/config.d/` where additional SSH configurations can be injected. 
- [`sway`](./roles/sway): Installs and configures [SwayWM](https://swaywm.org/) as well as a suite of other Wayland applications.
- [`update-script`](./roles/update-script): Creates a script `dotfiles-update`, which can be used to rerun the Ansible play.
- [`yubikey`](./roles/yubikey): Installs GPG and Yubikey related utilities, and configures SSH and Git to use Yubikey for authorization and commit signing. Do not use verbatim unless you have ambitions of stealing my identity.
- [`zsh`](./roles/zsh): Installs and configures ZSH with a special config dir `~/.config/zshrc.d/` where additional ZSH configurations can be injected.

#### Utility Roles

These roles can be invoked more then once and provide utility functions for the other roles in this playbook.

- [`util-dotfiles`](./roles/util-dotfiles): A **utility** role that scratches that itch left by [GNU Stow](https://www.gnu.org/software/stow/).
    This role is used by some of the other roles in this list to symlink configuration data to the correct location.
- [`util-yay`](./roles/util-yay): A **utility** role that *possibly* installs an AUR package via `yay`. `yay` must be installed separately at the moment.

## Running
I manage my dotfiles using Ansible.
I have a play for each machine (or group of machines).

```bash
# Install Ansible Galaxy dependencies
ansible-galaxy install -r requirements.yaml
# Warning: unless you are me you probably want to take a moment to understand what you're about to run.
# Do not run this unless you know what you are doing!
ansible-playbook -i hosts -K <host>.yaml
```

For subsequent runs, I can run the helper script `dotfiles-update`.