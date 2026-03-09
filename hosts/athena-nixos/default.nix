{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    (inputs.self + /modules/distributions/nixos)
    (inputs.self + /modules/platforms/vm)
  ];

  my.username = "emily";
  my.home.config = ./home.nix;
  my.openssh.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMDk7MyQ+p48rILdmYb9A1VJwvpHrRgJReLpT0LnND5"
  ];

  networking.hostName = "athena-nixos";

  system.stateVersion = "24.11"; # Did you read the comment?
}
