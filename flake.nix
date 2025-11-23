{
  description = "NixOS + Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";

    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Make home-manager use the same nixpkgs
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... }:
  let
    system = "x86_64-linux";

    pkgsFor = system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    ########################################
    ## NixOS hosts
    ########################################

    nixosConfigurations = {
      # VM you’ve been using to prototype
      nixos-vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nixos-vm/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Automatically back up conflicting files as *.backup
            home-manager.backupFileExtension = "backup";
            
            #Plasma Manager
            home-manager.sharedModules = [
            plasma-manager.homeManagerModules.plasma-manager
            ];

            home-manager.users.testuser = import ./home/testuser.nix;
          }
        ];
      };

      # Framework 13 laptop (legatvs, user: spablo)
      legatvs = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/legatvs/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Automatically back up conflicting files as *.backup
            home-manager.backupFileExtension = "backup";

            #Plasma Manager
            home-manager.sharedModules = [
            plasma-manager.homeManagerModules.plasma-manager
            ];

            home-manager.users.spablo = import ./home/spablo.nix;
          }
        ];
      };

      # Desktop (euche, user: euche) – you’ll create these files next
      euche = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/euche/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Automatically back up conflicting files as *.backup
            home-manager.backupFileExtension = "backup";

            #Plasma Manager
            home-manager.sharedModules = [
            plasma-manager.homeManagerModules.plasma-manager
            ];

            home-manager.users.euche = import ./home/euche.nix;
          }
        ];
      };
    };

    ########################################
    ## Standalone Home Manager configs
    ########################################

    homeConfigurations = {
      testuser = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor system;
        modules = [ ./home/testuser.nix ];
      };

      spablo = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor system;
        modules = [ ./home/spablo.nix ];
      };

      euche = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor system;
        modules = [ ./home/euche.nix ];
      };
    };
  };
}
