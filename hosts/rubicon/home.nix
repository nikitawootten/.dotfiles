{ config, lib, pkgs, ... }: {
  imports = [
    ../../programs/git.nix
    ../../programs/gpg.nix
    # ../../programs/sway.nix
  ];

  home.username = "nikita";
  home.homeDirectory = "/home/nikita";

  home.packages = with pkgs; [
    firefox
  ];
}
