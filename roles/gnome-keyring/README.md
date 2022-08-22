# `gnome-keyring` Role

This role installs `gnome-keyring` and `seahorse`, creates a SystemD user service, and adds the relevant PAM configuration as described in [this Arch Wiki article](https://wiki.archlinux.org/title/GNOME/Keyring#PAM_step).

## Post-install

Using seahorse, create a password keyring called `login` sharing the same password with your login account.

## Notes

Subsequent user password changes will automatically update the keyring password via [this `passwd` PAM configuration](https://wiki.archlinux.org/title/GNOME/Keyring#Automatically_change_keyring_password_with_user_password).

