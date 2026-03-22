{
  config,
  lib,
  pkgs,
  inputs,
  my,
  ...
}:

{
  imports = [
    (inputs.self + /modules/home)
  ];

  home.username = my.username;
  home.homeDirectory = "/home/${my.username}";
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.python313
    pkgs.python313Packages.pip
  ];
}
