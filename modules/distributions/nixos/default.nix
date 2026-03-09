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
    (inputs.self + /modules/home)
  ];

  users = {
    users.${config.my.username} = {
      # /home/user
      isNormalUser = true;
      # sudo
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = config.my.openssh.keys;
    };
    defaultUserShell = pkgs.zsh;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
