{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # Latest channel statuses can be found here: https://status.nixos.org
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
    }:
    let
      # followed method found from
      # https://github.com/nix-community/home-manager/issues/6036#issuecomment-2661394278
      username = "emily";

      # As according to:
      # https://nixos.wiki/wiki/flakes#Importing_packages_from_multiple_channels
      # https://discourse.nixos.org/t/how-to-fix-evaluation-warning-system-has-been-renamed-to-replaced-by-stdenv-hostplatform-system/72120
      overlay-stable = final: prev: {
        stable = nixpkgs-stable.legacyPackages.${prev.stdenv.hostPlatform.system};
      };

      configuration =
        { pkgs, ... }:
        {
          users = {
            users.${username} = {
              home = "/Users/${username}";
              name = "${username}";
            };
          };

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.vim
            pkgs.tmux
            #pkgs.nvim
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Use lix
          nix.package = pkgs.lix;

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          # allow unfree packages
          nixpkgs.config.allowUnfree = true;

          # nix-darwin now needs to utilize a primary user as part of the
          # transition from gloabl to user config
          system.primaryUser = "emily";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#athena
      darwinConfigurations."athena" = nix-darwin.lib.darwinSystem {
        modules = [
          (
            { config, pkgs, ... }:
            {
              nixpkgs.overlays = [ overlay-stable ];
            }
          )
          configuration
          ./macos.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = ./home.nix;
            };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
}
