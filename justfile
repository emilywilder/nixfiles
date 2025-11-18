#!/usr/bin/env just --justfile

mod nix-darwin 'nix-darwin'

[private]
default:
    @just --list

show-versions:
    @nix profile diff-closures --profile /nix/var/nix/profiles/system
