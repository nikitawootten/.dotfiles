{ config, pkgs, ... }: {
  users.users.nikita = {
    isNormalUser = true;
    description = "Nikita Wootten";
    createHome = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "disk"
    ];
    home = "/home/nikita";
    uid = 1000;
  };
}