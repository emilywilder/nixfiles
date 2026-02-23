{ config
, lib
, pkgs
, ...
}:
{
  # common to both nixos and nix-darwin
  imports = [ ./common.nix ];

  users.defaultUserShell = pkgs.zsh;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
