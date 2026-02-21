#!/usr/bin/env just --justfile

rebuild := if os() == "macos" { "darwin-rebuild" } else { "nixos-rebuild" }

[private]
default:
    @just --list

[doc("check flake consistency")]
check:
    @nix flake check

[doc("build flake")]
build:
    {{rebuild}} build --flake '.#'

[doc("switch based on local changes")]
switch:
    sudo {{rebuild}} switch --flake '.#'

[doc("switch based on global config")]
switch-global:
    sudo {{rebuild}} switch

[macos]
[doc("run uninstaller")]
uninstall:
    sudo darwin-uninstaller

[macos]
[doc("run latest uninstaller")]
uninstall-latest:
    sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin#darwin-uninstaller

[doc("update flake lock")]
update:
    nix flake update

show-versions:
    @nix profile diff-closures --profile /nix/var/nix/profiles/system

clean:
    @find . -maxdepth 1 -type l -name result -print -delete
