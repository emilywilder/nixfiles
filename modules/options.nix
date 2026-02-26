{ config, lib, pkgs, ... }:
{
  options.my.username = lib.mkOption {
    type = lib.types.str;
    description = "The username of the main user.";
  };

  options.my.openssh.keys = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    description = "List of authorized SSH keys.";
  };
}