{ config
, lib
, pkgs
, inputs
, ...
}:

{
  imports = [
    ./hardware-configuration.nix
    (inputs.self + /modules/distributions/nixos)
    (inputs.self + /modules/platforms/wsl)
  ];

  my.username = "emily";
  my.home.config = ./home.nix;
  my.openssh.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMDk7MyQ+p48rILdmYb9A1VJwvpHrRgJReLpT0LnND5"
  ];

  system.stateVersion = "24.11"; # Did you read the comment?

  networking.hostName = "iris-nixos";

  services.openssh = {
    enable = true;
    ports = [ 2122 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "emily" ];
      PermitRootLogin = "no";
    };
  };

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

  programs.nix-ld.enable = true;

  # Optimize storage
  # You can also manually optimize the store via:
  #    nix-store --optimise
  # Refer to the following link for more details:
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  # Desktop
  services.dbus.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}
