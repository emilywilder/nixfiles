#!/usr/bin/env just --justfile

mod nix-darwin 'nix-darwin'

[private]
default:
    @just --list

show-versions:
    @nix profile diff-closures --profile /nix/var/nix/profiles/system

[doc("switch based on local changes")]
switch:
    sudo nixos-rebuild switch --flake '.#'

[doc("switch based on global config")]
switch-global:
    sudo nixos-rebuild switch

[doc("update flake lock")]
update:
    nix flake update