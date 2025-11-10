# nixfiles
My personal configuration files for [Nix](https://github.com/NixOS/nix) and [home-manager](https://github.com/nix-community/home-manager).

## Details
Everything is managed by flakes now.
`home-manager` is managed by `nix` directly.

## Layout
Currently, each system has its own directory of configs. This will be consolidated to a single flake in the main directory at some point.

- `nix-darwin`:  contains the configs for my macOS laptop.
- `nixos`: contains the configs for my old macOS laptop running `NixOS`.
- `wsl`: contains the configs for my PC `wsl` instance of `NixOS`.
