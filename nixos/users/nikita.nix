{ config, pkgs, ... }: {
  imports = [
    <home-manager/nixos>
  ];

  users.users.nikita = {
    isNormalUser = true;
    description = "Nikita Wootten";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };
}
