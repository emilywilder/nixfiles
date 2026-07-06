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

  # Whether to enable support for running NixOS as a WSL distribution. (Default: false)
  wsl.enable = true;

  # The name of the default user. (Default: "nixos")
  wsl.defaultUser = config.my.username;

  # Whether to enable OpenGL driver from the Windows host. (Default: false)
  wsl.useWindowsDriver = true;

  # Configuration values for /etc/wsl.conf. See
  # https://learn.microsoft.com/en-us/windows/wsl/wsl-config#configuration-settings-for-wslconf
  # for all options supported by WSL.
#  wsl.wslConf = {
#    # A command to run when the distro is started. (Default: "")
#    boot.command = "ip address flush dev eth0";
#    # Generate /etc/resolv.conf through WSL. (Default: false)
#    network.generateResolvConf = false;
#  };

  # Whether to enable shortcuts for GUI applications in the windows start menu. (Default: false)
  wsl.startMenuLaunchers = true;

  # Let windows handle firewall in mirrored mode.
  networking.firewall.enable = false;

  # Disable wpa_supplicant
  networking.wireless.enable = lib.mkForce false;
}
