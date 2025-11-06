# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "emily";
  #wsl.wslConf.boot.command = "ip address flush dev eth0";
  #wsl.wslConf.network.generateResolvConf = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  system.hostPlatform = "x86_64-linux";

  environment.systemPackages = with pkgs; [
    vim
    wget
    zsh
  ];

  time.timeZone = "America/New_York";
  networking.hostName = "iris-nixos";
  networking.firewall.enable = false;
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
    ports = [ 2122 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "emily" ];
      PermitRootLogin = "no";
    };
  };
#  services.openssh.enable = true;
  users.users.emily = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      _1password-cli
      _7zz
      atuin
      bat
      bmake
      coreutils
      direnv
      duf
      eza
      file
      fzf
      git
      jq
      just
      neovim
      pciutils
      pdfgrep
      ripgrep
      shellcheck
      shfmt
      sourceHighlight
      stow
      tree
      vim
      wipe
      xz
    ];
    openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMDk7MyQ+p48rILdmYb9A1VJwvpHrRgJReLpT0LnND5"
      ];
    };
    users.defaultUserShell = pkgs.zsh;
    nix.package = pkgs.lix;
    nix.settings.experimental-features = [ "nix-command flakes" ];
    programs.zsh.enable = true;
    nixpkgs.config.allowUnfree = true;

    hardware.graphics = {
      enable = true;
    };
}
