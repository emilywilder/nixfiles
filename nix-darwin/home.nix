{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  # These are managed by the nix-darwin module
  # home.username = "emily";
  # home.homeDirectory = "/Users/emily";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

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
    pkgs.stable.rstudio
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
    pkgs.neofetch # generate system info
    pkgs.tdf # view pdfs
    pkgs.yazi # split file manager
    pkgs.presenterm # view markdown

    # GUI programs
    pkgs.zotero
    pkgs.r2505.xquartz
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/emily/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Enable direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
