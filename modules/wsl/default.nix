{
  inputs,
  ...
}:
{
  imports = [
    # Set Git commit hash for version.
    { system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null; }
    inputs.nixos-wsl.nixosModules.wsl
    ./configuration.nix
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.emily = ./home.nix;
      };
      # Optionally, use home-manager.extraSpecialArgs to pass
      # arguments to home.nix
    }
  ];
}
