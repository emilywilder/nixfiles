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
    pkgs.graphviz
    pkgs._1password-cli

    # editors
    pkgs.vscode
    pkgs.rstudio
    pkgs.texstudio

    # terminal emulators and multiplexers
    pkgs.kitty

    # build tools
    pkgs.uv

    # networking utilities
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
