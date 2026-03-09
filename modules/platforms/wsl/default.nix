{
  config,
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    (inputs.self + /modules/platforms/virtualized)
  ];

  # WSL
  # Docs: https://nix-community.github.io/NixOS-WSL/options.html

  # Whether to enable support for running NixOS as a WSL distribution.
  wsl.enable = true;
  # The name of the default user for WSL.
  wsl.defaultUser = config.my.username;
  # Whether to enable OpenGL driver from the Windows host.
  wsl.useWindowsDriver = true;
  # A command to run when the distro is started.
  #wsl.wslConf.boot.command = "ip address flush dev eth0";
  # Generate /etc/resolv.conf through WSL.
  #wsl.wslConf.network.generateResolvConf = false;

  # Let windows handle firewall in mirrored mode.
  networking.firewall.enable = false;
  # Disable wpa_supplicant
  networking.wireless.enable = lib.mkForce false;
}
