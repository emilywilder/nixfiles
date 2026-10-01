{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
# Common to both nixos and nix-darwin.
{
  imports = [
    (inputs.self + /modules/options.nix)
    (inputs.self + /modules/config-revision.nix)
  ];

  nixpkgs.overlays = [
    inputs.self.overlays.stable-packages
    inputs.self.overlays.pins
  ];

  nixpkgs.config.allowUnfree = true;

  users.users.${config.my.username} = {
    openssh.authorizedKeys.keys = config.my.openssh.keys;
  };

  time.timeZone = "America/New_York";

  nix = {
    package = pkgs.lix;
    settings.experimental-features = [ "nix-command flakes" ];
    channel.enable = false;
    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      nixpkgs-nixos.flake = inputs.nixpkgs-nixos;
      nixpkgs-nixos-unstable.flake = inputs.nixpkgs-nixos-unstable;
      nixpkgs-darwin.flake = inputs.nixpkgs-darwin;
    };
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    zsh
    git
    just
    stow
  ];
}
