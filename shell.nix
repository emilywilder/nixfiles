{
  pkgs ? import <nixpkgs> {}
}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    just
    nixfmt
  ];
}
