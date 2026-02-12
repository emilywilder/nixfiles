{ inputs, ... }:

{
  imports =
    [
      (inputs.self + /modules/nixos/common.nix)
      ./hardware-configuration.nix
    ];

  networking.hostName = "minerva";
}
