{ config, pkgs, ... }:
let
  username = import ../../users/username.nix;
in {
  imports = [
    ./hardware-configuration.nix
    <nixos-hardware/framework>
    ../../roles/gnome.nix
    ../../roles/networkmanager.nix
    ../../roles/tailscale.nix
    ../../roles/yubikey.nix
    ../../roles/git.nix
    ../../users/${username}.nix
  ];

  # Firmware updater
  services.fwupd.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Suspend-then-hibernate everywhere
  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    extraConfig = ''
      HandlePowerKey=suspend-then-hibernate
      IdleAction=suspend-then-hibernate
      IdleActionSec=2m
    '';
  };
  systemd.sleep.extraConfig = "HibernateDelaySec=2h";
  networking.hostName = "rubicon";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  services.flatpak.enable = true;
}
