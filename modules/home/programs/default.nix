{
  config,
  pkgs,
  lib,
  my,
  ...
}:
{
  # Enable direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
