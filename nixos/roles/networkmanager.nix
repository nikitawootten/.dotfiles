{ config, pkgs, ... }: 
let
  username = import ../users/username.nix;
in {
  networking.networkmanager.enable = true;
  users.users.${username}.extraGroups = [
    "networkmanager"
  ];
}