{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.my.username} = config.my.home.config;
  };
}
