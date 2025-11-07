#!/usr/bin/env -S nix shell nixpkgs#nixfmt --command bash
nixfmt $*
# From Idea's nix plugin
# nix --extra-experimental-features "nix-command flakes" run nixpkgs#nixpkgs-fmt
