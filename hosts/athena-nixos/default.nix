{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      (inputs.self + /modules/distributions/nixos)
    ];

  my.username = "emily";
  my.home.config = ./home.nix;
  my.openssh.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMDk7MyQ+p48rILdmYb9A1VJwvpHrRgJReLpT0LnND5"
  ];
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "athena-nixos";

  # allow vscode to connect to VM
  programs.nix-ld.enable = true;

  #boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  services.getty.helpLine = "\nenp0s1:\n\tIPv4:\t\\4{enp0s1}\n\tIPv6:\t\\6{enp0s1}";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
