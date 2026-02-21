{
  inputs,
  ...
}:
let
  # As according to:
  # https://nixos.wiki/wiki/flakes#Importing_packages_from_multiple_channels
  # https://discourse.nixos.org/t/how-to-fix-evaluation-warning-system-has-been-renamed-to-replaced-by-stdenv-hostplatform-system/72120
  overlay-stable = final: prev: {
    stable = inputs.nixpkgs-stable.legacyPackages.${prev.stdenv.hostPlatform.system};
  };
  overlay-r2505 = final: prev: {
    r2505 = inputs.nixpkgs-r2505.legacyPackages.${prev.stdenv.hostPlatform.system};
  };
in
# Build darwin flake using:
# $ darwin-rebuild build --flake .#athena
{
  imports = [
    (
      { config, pkgs, ... }:
      {
        nixpkgs.overlays = [
          overlay-stable
          overlay-r2505
        ];
      }
    )
    ./configuration.nix
    ./macos.nix
    ./home-manager.nix
  ];
}
