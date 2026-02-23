{ inputs, ... }:

{
  imports =
    [
      ./configuration.nix
      ./home-manager.nix
      ./hardware-configuration.nix
      (inputs.self + /modules/config-revision.nix)
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "athena-nixos";

  # allow vscode to connect to VM
  programs.nix-ld.enable = true;

  #boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  services.getty.helpLine = "\nenp0s1:\n\tIPv4:\t\\4{enp0s1}\n\tIPv6:\t\\6{enp0s1}";

}
