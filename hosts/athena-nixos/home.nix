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

  home.packages = [
    pkgs.kitty
  ];

  home.stateVersion = "25.05";

}
