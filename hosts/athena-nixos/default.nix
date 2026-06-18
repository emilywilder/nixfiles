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

  # GNOME https://wiki.nixos.org/wiki/GNOME
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = true;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

  networking.hostName = "athena-nixos";

  system.stateVersion = "24.11"; # Did you read the comment?
}
