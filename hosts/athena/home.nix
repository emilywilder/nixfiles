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
  home.homeDirectory = "/Users/${my.username}";
  home.stateVersion = "24.11";

  home.packages = [
    # utilities
    pkgs.coreutils
    pkgs.file
    pkgs.util-linux
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
    #    pkgs.asdf-vm

    # editors
    pkgs.vim
    pkgs.neovim
    pkgs.vscode
    pkgs.rstudio
    pkgs.texstudio

    # terminal emulators and multiplexers
    pkgs.tmux
    pkgs.kitty

    # scm
    pkgs.git

    # languages
    (pkgs.python3.withPackages (ps: with ps; [ pip ]))
    pkgs.perl
    pkgs.nodejs
    pkgs.R
    pkgs.typescript
    pkgs.ghc

    # build tools
    pkgs.bmake
    pkgs.gnumake
    pkgs.cmake
    pkgs.yarn
    pkgs.just
    pkgs.uv

    # networking utilities
    pkgs.wget
    pkgs.socat
    pkgs.openssh
    pkgs.nmap
    pkgs.iproute2mac

    # databases
    pkgs.sqlite
    pkgs.postgresql

    # emulators / virtualization
    pkgs.qemu
    pkgs.utm
    pkgs.podman
    pkgs.podman-compose
    pkgs.podman-desktop

    # graphically enabled cli tools
    pkgs.fastfetch # generate system info
    pkgs.tdf # view pdfs
    pkgs.yazi # split file manager
    pkgs.presenterm # view markdown

    # GUI programs
    pkgs.zotero
  ];
}
