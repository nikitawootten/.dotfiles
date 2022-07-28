{ inputs, config, pkgs, ... }: {
  # imports = [
  #   inputs.home-manager.nixosModules.home-manager
  # ];

  users.users.nikita = {
    isNormalUser = true;
    description = "Nikita Wootten";
    extraGroups = [ "wheel" "docker" ];
    packages = with pkgs; [
      firefox
    ];
  };
}
