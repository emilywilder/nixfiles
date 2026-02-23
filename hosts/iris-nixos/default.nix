{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    ./configuration.nix
    ./hardware-configuration.nix
    ./home-manager.nix
    ./system-version.nix
  ];

  networking.hostName = "iris-nixos";
  services.openssh.ports = [ 2122 ];
}
