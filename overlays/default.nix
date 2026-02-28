{ inputs, ... }:
{
  # As according to:
  # https://nixos.wiki/wiki/flakes#Importing_packages_from_multiple_channels
  # https://discourse.nixos.org/t/how-to-fix-evaluation-warning-system-has-been-renamed-to-replaced-by-stdenv-hostplatform-system/72120

  nixpkgs-d1c15b7d5806 = final: prev: {
    nixpkgs-d1c15b7d5806 =
      inputs.nixpkgs-d1c15b7d5806.legacyPackages.${prev.stdenv.hostPlatform.system};
  };

  nixpkgs-5a0711127cd8 = final: prev: {
      nixpkgs-5a0711127cd8 =
        inputs.nixpkgs-5a0711127cd8.legacyPackages.${prev.stdenv.hostPlatform.system};
    };
}
