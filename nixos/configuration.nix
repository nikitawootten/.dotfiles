# Main configuration file
{ inputs, lib, config, pkgs, ... }:
let
  # Define the machine in ./local-machine.nix
  # Machine should have a corresponding folder in machines/
  machine = import ./local-machine.nix;
in {
  imports = [
    ./machines/${machine}
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

  # This will add your inputs as registries, making operations with them (such
  # as nix shell nixpkgs#name) consistent with your flake inputs.
  nix.registry = lib.mapAttrs' (n: v: lib.nameValuePair n { flake = v; }) inputs;

  # Will activate home-manager profiles for each user upon login
  # This is useful when using ephemeral installations
  environment.loginShellInit = ''
    [ -d "$HOME/.nix-profile" ] || /nix/var/nix/profiles/per-user/$USER/home-manager/activate &> /dev/null
  '';

  nix = {
    # Make sure we have at least nix 2.4
    # TODO: You can remove me if you're using NixOS 22.05+
    package = pkgs.nixFlakes;
    # Enable flakes and new 'nix' command
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    autoOptimiseStore = true;
  };


}
