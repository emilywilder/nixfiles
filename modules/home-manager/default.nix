{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.my.username} = config.my.home.config;
    extraSpecialArgs = { inherit inputs; } // { my = config.my; };
  };
}
