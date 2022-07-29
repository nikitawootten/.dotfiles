{ config, pkgs, ... }: {
  virtualisation = {
    docker = {
      enable = true;
      rootless.enable = true;
    };
  };

  users.users.nikita.extraGroups = [
    "docker"
  ];
}
