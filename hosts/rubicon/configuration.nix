{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/environments/gnome.nix
    # ../common/environments/sway.nix
    ../common/optional/power.nix
    ../common/optional/networkmanager.nix
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

  networking.hostName = "rubicon";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  services.flatpak.enable = true;
  services.pcscd.enable = true;
}
