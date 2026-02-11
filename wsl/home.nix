{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "emily";
  home.homeDirectory = "/home/emily";

  # Packages that should be installed to the user profile.
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
    pkgs.neofetch # generate system info
    pkgs.tdf # view pdfs
    pkgs.yazi # split file manager
    pkgs.presenterm # view markdown
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  xdg.enable = true;
}
