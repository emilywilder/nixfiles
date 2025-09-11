#!/usr/bin/env just --justfile

mod nix-darwin 'nix-darwin'

[private]
default:
    @just --list
