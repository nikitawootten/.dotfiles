{ config, pkgs, ...}:
let
  username = import ../users/username.nix;
in {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "Nikita Wootten";
      userEmail = "nikita.wootten@gmail.com";
      extraConfig = {
        fetch = {
          prune = true;
        };
        pull = {
          rebase = false;
        };
      };
    };
  };

}