{ config
, lib
, pkgs
, ...
}:
{
  time.timeZone = "America/New_York";

  nix.package = pkgs.lix;
  nix.settings.experimental-features = [ "nix-command flakes" ];

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
