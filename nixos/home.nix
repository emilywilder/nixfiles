{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "emily";
  home.homeDirectory = "/home/emily";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

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
    pkgs.python313
    pkgs.python313Packages.pip
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
