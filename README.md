# dotfiles
My .files, feel free to poke around!

## Running
I manage my dotfiles using Ansible.
I have one playbook for each machine (or group of machines).

```bash
# warning this WILL overwrite anything you have set up!
ansible-playbook -K <host>.yaml
```