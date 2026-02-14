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
    ./home-manager.nix
  ];
}
