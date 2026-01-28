{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
          modules = [ ./UTM/vm-configuration.nix ];
          specialArgs = { inherit inputs; };
        };
        nixos-macbook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./MacBookPro14_2/macbook-configuration.nix ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
