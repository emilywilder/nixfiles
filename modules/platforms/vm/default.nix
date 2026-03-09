{
  config,
  lib,
  inputs,
  ...
}:
{
  imports = [
    (inputs.self + /modules/platforms/virtualized)
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Show IP addresses on tty
  services.getty.helpLine = "\nenp0s1:\n\tIPv4:\t\\4{enp0s1}\n\tIPv6:\t\\6{enp0s1}";
}
