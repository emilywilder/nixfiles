{
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        users.emily = ./home.nix;
      };
    }
  ];
}
