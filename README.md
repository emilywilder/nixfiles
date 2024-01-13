# nixfiles
My personal configuration files for [Nix](https://github.com/NixOS/nix) and [home-manager](https://github.com/nix-community/home-manager). Also includes scripts to deploy home-manager and my configuration.
 
## Usage
Included is a GNUmakefile that allows for linking the git directory to my home-manager configuration location, installing home-manager, and adding the nixpkgs channel for home-manager.

To install, just run `make`.
To clean up, run `make clean`.
Refer to the makefile for other targets.