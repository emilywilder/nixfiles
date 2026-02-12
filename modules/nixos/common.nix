{ ... }:

{
  imports =
    [
      ./nixos-configuration.nix
      ./home-manager.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
