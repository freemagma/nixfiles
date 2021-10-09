{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      useFlakes = { pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;
          extraOptions = ''
            experimental-features = nix-command flakes ca-references
          '';
        };
      };
      pinFlakes = {
        nix.registry = {
          nixpkgs.flake = nixpkgs;
          home-manager.flake = home-manager;
        };
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
      };
    in {
      nixosConfigurations.jane = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          [ ./jane home-manager.nixosModules.home-manager useFlakes pinFlakes ];
      };
      nixosConfigurations.orchid = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./orchid
          home-manager.nixosModules.home-manager
          useFlakes
          pinFlakes
        ];
      };

    };
}
