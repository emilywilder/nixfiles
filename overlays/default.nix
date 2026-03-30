{ inputs, ... }:
{
  # As according to:
  # https://nixos.wiki/wiki/flakes#Importing_packages_from_multiple_channels
  # https://discourse.nixos.org/t/how-to-fix-evaluation-warning-system-has-been-renamed-to-replaced-by-stdenv-hostplatform-system/72120

  nixpkgs-darwin = final: prev: {
    nixpkgs-darwin =
      inputs.nixpkgs-darwin.legacyPackages.${prev.stdenv.hostPlatform.system};
  };
}
