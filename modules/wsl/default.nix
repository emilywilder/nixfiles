{
  inputs,
  ...
}:
{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    ./configuration.nix
    ./home-manager.nix
    ./system-version.nix
  ];
}
