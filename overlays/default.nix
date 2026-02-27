{ inputs, ... }:
{
  # As according to:
  # https://nixos.wiki/wiki/flakes#Importing_packages_from_multiple_channels
  # https://discourse.nixos.org/t/how-to-fix-evaluation-warning-system-has-been-renamed-to-replaced-by-stdenv-hostplatform-system/72120

  stable-darwin = final: prev: {
    stable-darwin = inputs.nixpkgs-25_11-darwin.legacyPackages.${prev.stdenv.hostPlatform.system};
  };

  nixpkgs-25_05-darwin = final: prev: {
    nixpkgs-25_05-darwin =
      inputs.nixpkgs-25_05-darwin.legacyPackages.${prev.stdenv.hostPlatform.system};
  };

}
