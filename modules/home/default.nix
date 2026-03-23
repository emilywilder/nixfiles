{
  config,
  pkgs,
  lib,
  my,
  ...
}:
{
  # Add commonly used packages
  imports = [
    ./packages
    ./programs
  ];

  # User details
  home.username = my.username;
  home.homeDirectory =
    if pkgs.stdenv.isDarwin then
      "/Users/${my.username}"
    else
      "/home/${my.username}";

  xdg.enable = true;
}
