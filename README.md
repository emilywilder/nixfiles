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
#### Structure
Modules are categorized into distributions and platforms.
- distributions: projects which combine `nix` the language and `nixpkgs`. 
    - So far there are only `NixOS` and `nix-dawrin`.
- platforms: machine configurations which allow for the installation of distributions.
    - These would be things such as containers or VMs.

#### Platforms
- `wsl`: common configuration items for Windows hosts using `WSL`.

#### Distributions
- `common.nix`: common configuration items for all platforms.
- `nixos`: common configuration items for hosts running `NixOS`.
- `nix-darwin`: common configuration items for `macOS` hosts using `nix-darwin`.

#### Other
- `config-revision.nix`: set `system.configurationRevision` based on git revision.

### User Environment
My user environment is managed by `home-manager` as a module of both `NixOS` and `nix-darwin`.
