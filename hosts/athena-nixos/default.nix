{ ... }:

{
  imports =
    [
      ../../nixos/common.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "nixos-vm";

  # allow vscode to connect to VM
  programs.nix-ld.enable = true;

  #boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  services.getty.helpLine = "\nenp0s1:\n\tIPv4:\t\\4{enp0s1}\n\tIPv6:\t\\6{enp0s1}";

}
