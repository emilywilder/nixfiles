{
  inputs,
  ...
}:
{
  # channels
  stable-packages =
    final: prev:
    let
      system = prev.stdenv.system;
      channel = if prev.stdenv.isDarwin then inputs.nixpkgs-darwin else inputs.nixpkgs-nixos;
    in
    {
      stable = channel.legacyPackages.${system};
    };

  # packages
  pins =
    final: prev:
    # all platforms
    {
    }
    # darwin specific
    // prev.lib.attrsets.optionalAttrs prev.stdenv.isDarwin {
      R = final.stable.R;
      rstudio = final.stable.rstudio;
      zed-editor = final.stable.zed-editor;
    };
}
