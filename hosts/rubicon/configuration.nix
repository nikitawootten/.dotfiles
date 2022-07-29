{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/environments/gnome.nix
    ../common/optional/power.nix
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

  networking.networkmanager.enable = true;

  users.users.nikita = {
    isNormalUser = true;
    description = "Nikita Wootten";
    createHome = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "disk"
      "networkmanager"
    ];
    home = "/home/nikita";
    uid = 1000;
  };

  networking.firewall.enable = false;

  services.pcscd.enable = true;
}
