{ ... }:

{
  imports =
    [
      ../../nixos/common.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "nixos-macbook";
}
