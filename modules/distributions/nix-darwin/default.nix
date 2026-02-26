{ config
, lib
, pkgs
, ...
}:
{
  imports = [ ../common.nix ];

  nix.gc.automatic = true;
}
