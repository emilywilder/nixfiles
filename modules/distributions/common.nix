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

  time.timeZone = "America/New_York";

  nix = {
    package = pkgs.lix;
    settings.experimental-features = [ "nix-command flakes" ];
    channel.enable = false;
  };

  nixpkgs.config.allowUnfree = true;

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
