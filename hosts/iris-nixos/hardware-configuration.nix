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
  };

  # Fix for d3d12. the windows radeon driver requires openssl
  # Source: https://github.com/nix-community/NixOS-WSL/issues/454
  environment.sessionVariables = {
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      "/usr/lib/wsl" # or "/run/opengl-driver"
      pkgs.openssl # AMD driver needs this
    ];
    GALLIUM_DRIVER = "d3d12";
  };
}
