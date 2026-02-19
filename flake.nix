{
  description = "NixOS configuration";

  inputs = {
    # Latest channel statuses can be found here: https://status.nixos.org
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nix-darwin overlay channels
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nixpkgs-r2505.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    # wsl
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix-darwin
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    # pass inputs as a named argument
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        # use specialArgs to pass inputs to the configuration
        athena-nixos = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [ ./hosts/athena-nixos ];
          specialArgs = { inherit inputs; };
        };
        minerva = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/minerva ];
          specialArgs = { inherit inputs; };
        };
        iris-nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/iris-nixos ];
          specialArgs = { inherit inputs; };
        };
      };
      darwinConfigurations."athena" = (import ./modules/macos/flake.nix inputs);
    };
}
