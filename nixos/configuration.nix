# Main configuration file
{ config, pkgs, ... }:
let
  # Define the machine in ./local-machine.nix
  # Machine should have a corresponding folder in machines/
  machine = import ./local-machine.nix;
in {
  imports = [
    ./machines/${machine}/configuration.nix
  ];

  system.stateVersion = "22.05";
  
  # Auto upgrade
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

    # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
