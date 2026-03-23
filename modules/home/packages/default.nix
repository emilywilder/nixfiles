{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [
    # utilities
    pkgs.coreutils
    pkgs.util-linux
    pkgs.file
    pkgs.sourceHighlight
    pkgs.bat
    pkgs.tree
    pkgs.pdfgrep
    pkgs.xz
    pkgs._7zz
    pkgs.jq
    pkgs.shfmt
    pkgs.shellcheck
    pkgs.ripgrep
    pkgs.eza
    pkgs.stow
    pkgs.wipe
    pkgs.fzf
    pkgs.atuin
    pkgs.glow # cli markdown viewer

    # editors
    pkgs.vim
    pkgs.neovim

    # terminal emulators and multiplexers
    pkgs.tmux

    # scm
    pkgs.git

    # languages
    (pkgs.python3.withPackages (ps: with ps; [ pip ]))
    pkgs.perl
    pkgs.nodejs
    pkgs.R
    pkgs.ghc

    # build tools
    pkgs.bmake
    pkgs.gnumake
    pkgs.cmake
    pkgs.yarn
    pkgs.just

    # networking utilities
    pkgs.wget
    pkgs.socat
    pkgs.openssh
    pkgs.nmap
  ];
}
