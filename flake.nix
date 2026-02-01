{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    suyu = {
      url = "github:Noodlez1232/suyu-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, suyu, ... }@inputs:
    {
      nixosConfigurations = {
        jane = import ./nixos/configs/jane inputs;
        orchid = import ./nixos/configs/orchid inputs;
      };

      nixosModules = import ./nixos/modules inputs;
      homeModules = import ./home/modules inputs;

      lib = import ./lib inputs;

    } // (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowAliases = false;
        };
      in
      {
        legacyPackages = import ./pkgs { inherit pkgs; };
        packages = flake-utils.lib.flattenTree self.legacyPackages.${system};
      })
    );
}
