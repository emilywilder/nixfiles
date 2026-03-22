# inspired from https://www.reddit.com/r/NixOS/comments/fsummx/how_to_list_all_installed_packages_on_nixos/

# can be invoked as such for system packages:
#   nix eval -f installed.nix --json | jq .packages.system
# or home-manager packages:
#   nix eval -f installed.nix --json | jq .packages.home

let
  flake = builtins.getFlake "git+file:///Users/emily/src/nixfiles";
  config = flake.darwinConfigurations.athena.config;
  pkgs = flake.inputs.nixpkgs;
  getPackageNames = builtins.map (p: "${p.name}");
  sortUnique = n: builtins.sort builtins.lessThan (pkgs.lib.lists.unique n);
  packageNameList = pl: sortUnique (getPackageNames pl);
in
{
  "revisions" = {
    "nixpkgs" = config.system.nixpkgsRevision;
    "configuration" = config.system.configurationRevision;
  };
  "packages" = {
    "system" = packageNameList config.environment.systemPackages;
    "home" = packageNameList config.home-manager.users.emily.home.packages;
  };
}
