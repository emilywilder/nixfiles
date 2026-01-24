{ config, lib, pkgs, ... }:

{
   home-manager.nixosModules.home-manager = {
     home-manager = {
       useGlobalPkgs = true;
       useUserPackages = true;
       users.emily = ./home.nix;
     };
   };
}
