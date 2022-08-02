{ config, pkgs, ... }: {
  networking.networkmanager.enable = true;
  users.users.nikita.extraGroups = [
    "networkmanager"
  ];
}