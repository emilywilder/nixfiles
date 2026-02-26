{ inputs, config, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${config.my.username} = ./home.nix;
      };
    }
  ];
}
