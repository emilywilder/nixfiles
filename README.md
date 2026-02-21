# Emily's nixfiles
These are my personal [Nix](https://nixos.org) configuration files.

## Features
- Built utilizing the "experimental" [flakes](https://wiki.nixos.org/wiki/Flakes) feature.
- Monolithic multi-platform configuration supporting:
    - [NixOS](https://nixos.org/)
    - [NixOS-WSL](https://github.com/nix-community/NixOS-WSL)
    - [nix-darwin](https://nix-darwin.org/)
- User environment managed by [home-manager](https://nix-community.github.io/home-manager/).

## Structure

### System Environment
Each system is defined by hostname as either a `nixosSystem` or `darwinSystem` within the root flake.

### Hosts
Each system has its own module within the `hosts` directory, corresponding to its hostname.
This is meant to represent host specific configuration items combined with reusable
[modules](https://nixos.wiki/wiki/NixOS_modules) for a full system configuration definition.

### Modules
Currently, there are modules for each supported platform: `macos`, `nixos`, and `wsl`.
>TODO: This will be separated out into a more granular and reusable layout in the future.

### User Environment
My user environment is managed by `home-manager` as a module of both `NixOS` and `nix-darwin`.

## TODO:
Currently, the modules are not quite living up to their conceptual purpose. Rather than being abstract and reusable,
they contain much of their host specific configurations and redundantly .
