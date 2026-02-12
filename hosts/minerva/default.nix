{ ... }:

{
  imports =
    [
      ../../modules/nixos/common.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "minerva";
}
