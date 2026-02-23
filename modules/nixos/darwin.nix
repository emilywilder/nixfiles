{ config
, lib
, pkgs
, ...
}:
{
  # common to both nixos and nix-darwin
  imports = [ ./common.nix ];

  nix.gc.automatic = true;
}
