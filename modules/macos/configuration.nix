{
  inputs,
  ...
}:
let
  configuration =
    { pkgs, ... }:
    {
      users = {
        users.emily = {
          home = "/Users/emily";
          name = "emily";
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
      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

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
# Build darwin flake using:
# $ darwin-rebuild build --flake .#athena
{
  imports = [
    configuration
  ];
}
