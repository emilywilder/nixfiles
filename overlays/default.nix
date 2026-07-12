{ inputs, ... }:
{
  # As according to:
  # https://nixos.wiki/wiki/flakes#Importing_packages_from_multiple_channels
  # https://discourse.nixos.org/t/how-to-fix-evaluation-warning-system-has-been-renamed-to-replaced-by-stdenv-hostplatform-system/72120
  # https://www.aalbacetef.io/blog/nix-pinning-a-specific-package-version-in-a-flake-using-overlays/

  nixpkgs-darwin = final: prev: {
    nixpkgs-darwin =
      inputs.nixpkgs-darwin.legacyPackages.${prev.stdenv.hostPlatform.system};
  };

  # set of packages pinned to specific nixpkgs hashes
  pinnedPackages = final: prev: {
    # For each pkgName, add attribute as such:
    # pkgName = inputs.pkgNameUrl.legacyPackages.${prev.stdenv.hostPlatform.system}.pkgName;
    zed-editor =
      inputs.nixpkgs-darwin.legacyPackages.${prev.stdenv.hostPlatform.system}.zed-editor;
    R =
      inputs.nixpkgs-darwin.legacyPackages.${prev.stdenv.hostPlatform.system}.R;
    rstudio =
      inputs.nixpkgs-darwin.legacyPackages.${prev.stdenv.hostPlatform.system}.rstudio;
  };
}
