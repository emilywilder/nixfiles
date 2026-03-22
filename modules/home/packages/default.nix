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
    # editors
    pkgs.vim
    pkgs.neovim
    # terminal emulators and multiplexers
    pkgs.tmux
    # scm
    pkgs.git
    # languages
    pkgs.perl
    pkgs.nodejs
    pkgs.typescript
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
