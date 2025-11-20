{
  description = "NixOS + Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";

    # Make home-manager use the same nixpkgs
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./hosts/nixos-vm/default.nix

        # Home Manager as a NixOS module, but flake-managed
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Attach the HM config for testuser
          home-manager.users.testuser = import ./home/testuser.nix;
        }
      ];
    };

    # Optional: allow running `home-manager switch --flake .#testuser`
    homeConfigurations.testuser = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      modules = [
        ./home/testuser.nix
      ];
    };
  };
}

