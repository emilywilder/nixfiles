{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      hm-module = [
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.emily = ./home.nix;
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        nixos-vm = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = hm-module ++ [
            ./vm-configuration.nix
          ];
        };
        nixos-macbook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = hm-module ++ [
            ./macbook-configuration.nix
          ];
        };
      };
    };
}
