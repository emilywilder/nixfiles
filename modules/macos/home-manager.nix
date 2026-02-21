{
  inputs,
  ...
}:
let
  # followed method found from
  # https://github.com/nix-community/home-manager/issues/6036#issuecomment-2661394278
  username = "emily";
in
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${username} = ./home.nix;
      };

      # Optionally, use home-manager.extraSpecialArgs to pass
      # arguments to home.nix
    }
  ];
}
