{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    (inputs.self + /modules/distributions/nix-darwin)
    ./macos.nix
  ];

  nixpkgs.overlays = [
    inputs.self.overlays.stable-darwin
    inputs.self.overlays.nixpkgs-25_05-darwin
  ];

  my.username = "emily";
  my.home.config = ./home.nix;

  networking.hostName = "athena";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
