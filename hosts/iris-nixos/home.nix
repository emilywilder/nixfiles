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
    pkgs.pciutils
    pkgs.graphviz
    pkgs._1password-cli
    pkgs.entr # run program on file change
    pkgs.exiftool # edit metadata
    pkgs.fdupes # handle duplicate files

    # networking utilities
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
