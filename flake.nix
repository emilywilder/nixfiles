{
  description = "NixOS configuration";

  inputs = {
    # Latest channel statuses can be found here: https://status.nixos.org
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-nixos.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-26.05-darwin";
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
    inputs@{ nixpkgs, nix-darwin, ... }:
    {
      overlays = import ./overlays { inherit inputs; };

      devShells = builtins.mapAttrs (system: pkgs: {
        datascience = pkgs.mkShell {
          packages = with pkgs; [
            (pkgs.python3.withPackages (ps: with ps; [
              pip numpy pandas matplotlib seaborn scipy statsmodels plotly torch torchvision
            ]))
            pkgs.uv
          ];
        };
      }) nixpkgs.legacyPackages;

      nixosConfigurations = {
        # use specialArgs to pass inputs to the configuration
        athena-nixos = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [ ./hosts/athena-nixos ];
          specialArgs = { inherit inputs; };
        };
        iris-nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/iris-nixos ];
          specialArgs = { inherit inputs; };
        };
      };

      darwinConfigurations = {
        athena = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [ ./hosts/athena ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
