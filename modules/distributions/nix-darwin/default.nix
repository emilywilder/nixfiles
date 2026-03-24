{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../common.nix
    inputs.home-manager.darwinModules.home-manager
    (inputs.self + /modules/home-manager)
  ];

  # nix-darwin now needs to utilize a primary user as part of the
  # transition from gloabl to user config
  system.primaryUser = config.my.username;

  users = {
    users.${config.my.username} = {
      home = "/Users/${config.my.username}";
      name = config.my.username;
    };
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };
}
