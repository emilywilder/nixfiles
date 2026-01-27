#!/usr/bin/env just --justfile

mod nix-darwin 'nix-darwin'
mod nixos
mod wsl

[private]
default:
    @just --list

show-versions:
    @nix profile diff-closures --profile /nix/var/nix/profiles/system
