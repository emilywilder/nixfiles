{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./home-manager.nix
      ./hardware-configuration.nix
      (inputs.self + /modules/distributions/nixos)
      (inputs.self + /modules/config-revision.nix)
    ];

  options.custom.username = lib.mkOption {
    type = lib.types.str;
    default = "emily";
    description = "The username of the main user.";
  };

  config = {
    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "athena-nixos";

    # allow vscode to connect to VM
    programs.nix-ld.enable = true;

    #boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

    services.getty.helpLine = "\nenp0s1:\n\tIPv4:\t\\4{enp0s1}\n\tIPv6:\t\\6{enp0s1}";

    users.users.${config.custom.username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        tree
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMDk7MyQ+p48rILdmYb9A1VJwvpHrRgJReLpT0LnND5"
      ];
    };

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    system.stateVersion = "24.11"; # Did you read the comment?
  };
}
