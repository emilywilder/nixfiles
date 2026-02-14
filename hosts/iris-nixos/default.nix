{ inputs, ... }:

{
  imports =
    [
      (inputs.self + /modules/wsl)
    ];

  networking.hostName = "iris-nixos";
  services.openssh.ports = [ 2122 ];
}
