{ config, pkgs, ... }: {
  imports = [
    ./docker.nix
    ./locale.nix
    ./nix.nix
    ./sound.nix
    ./tailscale.nix
  ];
}