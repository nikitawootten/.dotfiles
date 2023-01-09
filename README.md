# dotfiles

My .files, feel free to poke around!

## Structure

I manage my dotfiles in Ansible using a system of _plays_ and _roles_.

- I use _plays_ to manage device specific configuration.
  These _plays_ act as "entrypoint" of my configuration.
- I use _roles_ to manage some discrete piece of my configuration.
- A _play_ is composed of multiple _roles_, with some extra configuration on top.

## Play Index

- [`yukon`](./yukon.yaml): My framework laptop running Arch Linux.
- [`defiant`](./defiant.yaml): My desktop PC running Fedora.

## Role Index

_NOTE: Most of these roles will only work on Arch Linux. Some are configured to support Arch and Fedora_

_SECOND NOTE: some roles inherit other roles, ensuring roles are run in the right order._

### Base Roles

These roles should generally be present on any machine that I manage.

- [`base-git`](./roles/base-git): A simple role that initializes my git configuration. Do not copy copy verbatim unless you would like to inherit my name.
- [`base-ssh-client`](./roles/base-ssh-client): Installs and configures SSH with a special config dir `~/.ssh/config.d/` where additional SSH configurations can be injected.
- [`base-zsh`](./roles/base-zsh): Installs and configures ZSH with a special config dir `~/.config/zshrc.d/` where additional ZSH configurations can be injected.

### Application Roles

These roles manage the installation and configuration of a specific application.

- [`application-kitty`](./roles/application-kitty): A very simple role that installs the [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator and tricks applications attempting to open XTerm into opening Kitty instead.
- [`application-helix`](./roles/application-helix/): Installs and configures the [Helix](https://helix-editor.com/) editor.

### Desktop Roles

These roles manage a Window Manager installation.

- [`desktop-hyprland`](./roles/desktop-hyprland): A _WIP_ role that installs and configures [Hyprland](https://hyprland.org/)
- [`desktop-sway`](./roles/desktop-sway): Installs and configures [SwayWM](https://swaywm.org/) as well as a suite of other Wayland applications.

### Development Stack Roles

These roles install sets of applications relating to one topic, such as tools for a specific language.

- [`stack-containers`](./roles/stack-containers): A role that installs `Docker` and `docker-compose`.
- [`stack-security`](./roles/stack-security): A role that installs several security related apps.

### Utility Roles

These roles can be invoked more then once and provide utility functions for the other roles in this playbook.

- [`util-dotfiles`](./roles/util-dotfiles): A **utility** role that scratches that itch left by [GNU Stow](https://www.gnu.org/software/stow/).
  This role is used by some of the other roles in this list to symlink configuration data to the correct location.
- [`util-yay`](./roles/util-yay): A **utility** role that _possibly_ installs an AUR package via `yay`. `yay` must be installed separately at the moment.

### Other Roles

- [`gnome-keyring`](./roles/gnome-keyring): Installs the gnome keyring along with some PAM configuration.
- [`pywal`](./roles/pywal): [PyWal](https://github.com/dylanaraps/pywal) generates color schemes on the fly off of a wallpaper. This role installs and configures PyWal and configures some applications to use the generated color schemes.
- [`update-script`](./roles/update-script): Creates a script `dotfiles-update`, which can be used to rerun the Ansible play.
- [`yubikey`](./roles/yubikey): Installs GPG and Yubikey related utilities, and configures SSH and Git to use Yubikey for authorization and commit signing. Do not use verbatim unless you have ambitions of stealing my identity.

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
