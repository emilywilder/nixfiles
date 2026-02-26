{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.my = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "The username of the main user.";
    };
    openssh.keys = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "List of authorized SSH keys.";
    };
    home.config = lib.mkOption {
      type = lib.types.path;
      description = "Path to the home-manager configuration for the main user.";
    };
  };
}
