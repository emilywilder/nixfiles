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
    inputs.home-manager.nixosModules.home-manager
    (inputs.self + /modules/home-manager)
  ];

  users = {
    users.${config.my.username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
    defaultUserShell = pkgs.zsh;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
