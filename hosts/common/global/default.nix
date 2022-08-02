{ config, pkgs, ... }: {
  imports = [
    ./nikita.nix
    ./docker.nix
    ./locale.nix
    ./nix.nix
    ./sound.nix
    ./tailscale.nix
  ];
}