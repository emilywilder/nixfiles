{
      self,
      nixpkgs,
      home-manager,
      nixos-wsl,
      ...
    }:
    {
      
        
          modules = [
            # Set Git commit hash for version.
            { system.configurationRevision = self.rev or self.dirtyRev or null; }
            nixos-wsl.nixosModules.wsl
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.emily = ./home.nix;
              };
              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
          ];
        
      
    }