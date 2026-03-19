{
  config,
  lib,
  pkgs,
  inputs,
  my,
  ...
}:

{
  imports = [
    (inputs.self + /modules/home)
  ];

  home.username = my.username;
  home.homeDirectory = "/home/${my.username}";
  home.stateVersion = "25.05";

  home.packages = [
    # utilities
    pkgs.coreutils
    pkgs.pciutils
    pkgs.file
    pkgs.sourceHighlight
    pkgs.bat
    pkgs.tree
    pkgs.pdfgrep
    pkgs.xz
    pkgs._7zz
    pkgs.jq
    pkgs.shfmt
    pkgs.graphviz
    pkgs.shellcheck
    pkgs.ripgrep
    pkgs.eza
    pkgs._1password-cli
    pkgs.stow
    pkgs.wipe
    pkgs.fzf
    pkgs.atuin
    pkgs.glow # cli markdown viewer
    pkgs.entr # run program on file change
    pkgs.exiftool # edit metadata
    pkgs.fdupes # handle duplicate files
    # editors
    pkgs.vim
    pkgs.neovim
    # terminal emulators and multiplexers
    pkgs.tmux
    # scm
    pkgs.git
    # languages
    pkgs.python313
    pkgs.python313Packages.pip
    pkgs.perl
    pkgs.nodejs
    pkgs.R
    pkgs.typescript
    pkgs.racket
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
    pkgs.net-tools
    # databases
    pkgs.sqlite
    pkgs.postgresql
    # emulators / virtualization
    pkgs.qemu
    pkgs.podman
    pkgs.podman-compose
    # graphically enabled cli tools
    pkgs.fastfetch # generate system info
    pkgs.tdf # view pdfs
    pkgs.yazi # split file manager
    pkgs.presenterm # view markdown
    # GUI apps
    # pkgs.jetbrains.idea-oss
    # pkgs.firefox
  ];
}
