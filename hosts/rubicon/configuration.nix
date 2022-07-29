{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../system-common/gnome.nix
    ../system-common/sound.nix
    ../system-common/tailscale.nix
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
    lidSwitchExternalPower = "lock";
    extraConfig = ''
      HandlePowerKey=suspend-then-hibernate
      IdleAction=suspend-then-hibernate
      IdleActionSec=10m
    '';
  };
  systemd.sleep.extraConfig = "HibernateDelaySec=2h";
  networking.hostName = "rubicon";

    # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

    # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    autoOptimiseStore = true;
  };

  # Auto upgrade
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;

  virtualisation = {
    docker = {
      enable = true;
      rootless.enable = true;
    };
  };

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
      "docker"
      "video"
      "audio"
      "disk"
      "networkmanager"
    ];
    home = "/home/nikita";
    uid = 1000;
  };

  system.stateVersion = "22.05";
}
