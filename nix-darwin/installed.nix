# inspired from https://www.reddit.com/r/NixOS/comments/fsummx/how_to_list_all_installed_packages_on_nixos/

# can be invoked as such for system packages:
#   nix eval -f installed.nix --json | jq .system
# or home-manager packages:
#   nix eval -f installed.nix --json | jq .home

let
  flake = builtins.getFlake "/Users/emily/src/nixfiles/nix-darwin";
  config = flake.darwinConfigurations.athena.config;
  pkgs = flake.inputs.nixpkgs;
  getPackageNames = builtins.map (p: "${p.name}");
  sortUnique = n: builtins.sort builtins.lessThan (pkgs.lib.lists.unique n);
  packageNameList = pl: sortUnique (getPackageNames pl);
in
{
  "system" = packageNameList config.environment.systemPackages;
  "home" = packageNameList config.home-manager.users.emily.home.packages;
}