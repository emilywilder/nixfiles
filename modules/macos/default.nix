{
  ...
}:
{
  # Optionally, use a variable for username.
  # https://github.com/nix-community/home-manager/issues/6036#issuecomment-2661394278

  imports = [
    ./overlays.nix
    ./configuration.nix
    ./macos.nix
    ./home-manager.nix
  ];
}
