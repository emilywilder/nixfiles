{
  config,
  pkgs,
  lib,
  my,
  ...
}:
{
  # Add commonly used packages
  imports = [ ./packages ];

  # User details
  home.username = my.username;
  home.homeDirectory =
    if pkgs.stdenv.isDarwin then
      "/Users/${my.username}"
    else
      "/home/${my.username}";

  # Enable direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg.enable = true;
}
