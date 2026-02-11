{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    # pass inputs as a named argument
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        # use specialArgs to pass inputs to the configuration
        nixos-vm = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [ ./hosts/athena-nixos ];
          specialArgs = { inherit inputs; };
        };
        nixos-macbook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/minerva ];
          specialArgs = { inherit inputs; };
        };
        iris-nixos = nixpkgs.lib.nixosSystem (import ./hosts/iris-nixos/flake.nix inputs);
      };
    };
}
