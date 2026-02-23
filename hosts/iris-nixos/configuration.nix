# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Set hardware specific settings.
    ./hardware-configuration.nix
  ];

  # WSL
  # Docs: https://nix-community.github.io/NixOS-WSL/options.html

  # Whether to enable support for running NixOS as a WSL distribution.
  wsl.enable = true;
  # The name of the default user.
  wsl.defaultUser = "emily";
  # Whether to enable OpenGL driver from the Windows host.
  wsl.useWindowsDriver = true;
  # A command to run when the distro is started.
  #wsl.wslConf.boot.command = "ip address flush dev eth0";
  # Generate /etc/resolv.conf through WSL.
  #wsl.wslConf.network.generateResolvConf = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  environment.systemPackages = with pkgs; [
    vim
    wget
    zsh
  ];

  time.timeZone = "America/New_York";
  networking.firewall.enable = false;
  # Disable wpa_supplicant
  networking.wireless.enable = lib.mkForce false;
  #networking.useDHCP = false;
  #systemd.network = {
  #  enable = true;
  #  networks."10-eth0" = {
  #    matchConfig.Name = "eth0";
  #    networkConfig.DHCP = "yes";
  #  };
  #};
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "emily" ];
      PermitRootLogin = "no";
    };
  };
  
  users.users.emily = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMDk7MyQ+p48rILdmYb9A1VJwvpHrRgJReLpT0LnND5"
    ];
  };
  users.defaultUserShell = pkgs.zsh;
  nix.package = pkgs.lix;
  nix.settings.experimental-features = [ "nix-command flakes" ];
  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Optimize storage
  # You can also manually optimize the store via:
  #    nix-store --optimise
  # Refer to the following link for more details:
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;
}
