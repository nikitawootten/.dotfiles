{
  description = "Common Nix config for my dotfiles";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };
  outputs = {nixpkgs, home-manager, nixos-hardware, ...}: let
    homeManagerConfFor = config: { ... }: {
      imports = [ config ];
    };
  in {
    nixosConfigurations.rubicon = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-hardware.nixosModules.framework
        ./hosts/rubicon/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useUserPackages = true;
          home-manager.users.nikita = homeManagerConfFor ./hosts/rubicon/home.nix;
        }
      ];
      specialArgs = { inherit nixpkgs; };
    };
  };
}
