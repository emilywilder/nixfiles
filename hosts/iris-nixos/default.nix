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
    (inputs.self + /modules/platforms/wsl)
  ];

  my.username = "emily";
  my.home.config = ./home.nix;
  my.openssh = {
    keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMDk7MyQ+p48rILdmYb9A1VJwvpHrRgJReLpT0LnND5"
    ];
    ports = [ 2122 ];
  };

  networking.hostName = "iris-nixos";

  system.stateVersion = "24.11"; # Did you read the comment?

  # Desktop
  services.dbus.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;

  # Gnome
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}
