#!/usr/bin/env just --justfile

set shell := ["zsh", "-cu"]

rebuild := if os() == "macos" { "darwin-rebuild" } else { "nixos-rebuild" }
flake_path := ".#"

[private]
default:
    @just --list

[group("flake")]
[doc("check flake consistency")]
check:
    @nix flake check

[group("flake")]
[doc("update flake lock")]
update:
    @nix flake update

[group("rebuild")]
[private]
rebuild ARG *OPTS:
    {{ if ARG == "switch" { "sudo " + rebuild } else { rebuild } }} {{ARG}} --flake '{{flake_path}}' {{OPTS}}

[group("rebuild")]
[doc("build flake")]
build *OPTS: (rebuild "build" OPTS)

[group("rebuild")]
[doc("switch based on local changes")]
switch: (rebuild "switch")

[group("rebuild")]
[doc("test by building as a dry run")]
test: (build "--offline --dry-run --show-trace")

[macos]
[group("nix-darwin")]
[doc("run uninstaller")]
uninstall:
    sudo darwin-uninstaller

[macos]
[group("nix-darwin")]
[doc("run latest uninstaller")]
uninstall-latest:
    sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin#darwin-uninstaller

show-versions:
    @nix profile diff-closures --profile /nix/var/nix/profiles/system

clean:
    @find . -maxdepth 1 -type l -name result -print -delete
