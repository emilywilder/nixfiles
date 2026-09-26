{
  inputs,
  ...
}:
{
  # channels
  # each `channel` is in the form:
  #   name = <channel>
  # e.g.:
  #   stable = inputs.nixpkgs-nixos.legacyPackages."x86_64-linux"
  # would allow pkgs.stable.<pkg> to reference <pkg> from nixpkgs-nixos.
  stable-packages =
    final: prev:
    let
      system = prev.stdenv.system;
      channel = if prev.stdenv.hostPlatform.isDarwin then inputs.nixpkgs-darwin else inputs.nixpkgs-nixos;
    in
    {
      stable = channel.legacyPackages.${system};
    };

  # packages
  # each `pin` is in the form:
  #   <pkg> = <channel>.<pkg>;
  # e.g.:
  #   R = inputs.nixpkgs-nixos.legacyPackages."x86_64-linux".R
  # would map pkgs.R to the R package from nixpkgs-nixos
  pins =
    final: prev:
    # all platforms
    {
    }
    # darwin specific
    // prev.lib.attrsets.optionalAttrs prev.stdenv.hostPlatform.isDarwin {
    };
}
