{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    ./configuration.nix
    ./hardware-configuration.nix
    ./home-manager.nix
    (inputs.self + /modules/config-revision.nix)
  ];

  networking.hostName = "iris-nixos";
  services.openssh.ports = [ 2122 ];
}
