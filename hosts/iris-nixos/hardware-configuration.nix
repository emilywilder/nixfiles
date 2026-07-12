{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [ ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [
      pkgs.rocmPackages.clr.icd
    ];
  };

  # Fix for d3d12. the windows radeon driver requires openssl
  # Source: https://github.com/nix-community/NixOS-WSL/issues/454#issuecomment-3802332145
  environment.sessionVariables = {
    LD_LIBRARY_PATH = [
      "/run/opengl-driver/lib"
      "${pkgs.openssl.out}/lib"
    ];
    GALLIUM_DRIVER = "d3d12";
    };
}
