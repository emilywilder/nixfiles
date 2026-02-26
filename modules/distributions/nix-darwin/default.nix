{ config
, lib
, pkgs
, inputs
, ...
}:
{
  imports = [
    ../common.nix
    inputs.home-manager.darwinModules.home-manager
    (inputs.self + /modules/home)
  ];

  nix.gc.automatic = true;
}
