#!/usr/bin/env just --justfile

set shell := ["zsh", "-cu"]

rebuild := if os() == "macos" { "darwin-rebuild" } else { "nixos-rebuild" }
flake_path := ".#"

[private]
default:
    @just --list

[doc("check flake consistency")]
check:
    @nix flake check

[private]
rebuild ARG *OPTS:
    {{ if ARG == "switch" { "sudo " + rebuild } else { rebuild } }} {{ARG}} --flake '{{flake_path}}' {{OPTS}}

[doc("build flake")]
build: (rebuild "build")

[doc("switch based on local changes")]
switch: (rebuild "switch")

[doc("switch based on global config")]
switch-global:
    sudo {{rebuild}} switch

[doc("test by building as a dry run")]
test: (rebuild "build" "--offline --dry-run --show-trace")

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
