{ inputs, ... }:

{
  imports =
    [
      (inputs.self + /modules/nixos)
      ./hardware-configuration.nix
    ];

  networking.hostName = "minerva";
}
