{ config, lib, pkgs, inputs, ... }:

{
  # Optionally, use a variable for username.
  # https://github.com/nix-community/home-manager/issues/6036#issuecomment-2661394278

  imports = [
    ./overlays.nix
    (inputs.self + /modules/distributions/nix-darwin)
    ./macos.nix
    ./home-manager.nix
    (inputs.self + /modules/config-revision.nix)
  ];

  networking.hostName = "athena";

  # nix-darwin now needs to utilize a primary user as part of the
  # transition from gloabl to user config
  system.primaryUser = "emily";

  users = {
    users.emily = {
      home = "/Users/emily";
      name = "emily";
    };
  };
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
