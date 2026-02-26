{ config, lib, pkgs, ... }:
{
  options.my.username = lib.mkOption {
    type = lib.types.str;
    default = "emily";
    description = "The username of the main user.";
  };
}