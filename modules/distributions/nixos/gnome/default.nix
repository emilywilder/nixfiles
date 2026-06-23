{
  config,
  lib,
  pkgs,
  ...
}:

{
  # GNOME https://wiki.nixos.org/wiki/GNOME

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = true;
      games.enable = false;
    };
  };

  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
}
