# dotfiles
My .files, feel free to poke around!

## Running
I manage my dotfiles using Ansible.
I have a play for each machine (or group of machines).

```bash
# warning this WILL overwrite anything you have set up!
# do not run this unless you know what you are doing!
ansible-playbook -K <host>.yaml
```

For subsequent runs, I can run the helper script `dotfiles-update`.