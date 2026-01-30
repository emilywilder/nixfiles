{
  description = "Minimal NixOS installation media";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  outputs =
    { self, nixpkgs }:
    {
      packages.aarch64-linux.default = self.nixosConfigurations.iso.config.system.build.isoImage;
      nixosConfigurations = {
        iso = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (
              {
                pkgs,
                lib,
                config,
                modulesPath,
                ...
              }:
              {
                imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-graphical-gnome.nix") ];
                environment.systemPackages = [
                  pkgs.git
                  pkgs.vim
                  pkgs.zsh
                ];
                nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
                nixpkgs.config.allowUnfree = true;
                # nixpkgs.config.permittedInsecurePackages = [
                # "broadcom-sta-6.30.223.271-59-6.12.67"
              # ];
                boot.kernelModules = [ "brcmfmac" ];
                boot.kernelParams = [ "brcmfmac.feature_disable=0x82000"];
                # boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
                boot.blacklistedKernelModules = [
                  "b43"
                  "bcma"
                  "wl"
                ];
              }
            )
          ];
        };
      };
    };
}
