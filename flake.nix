{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        jane = import ./hosts/jane inputs;
        orchid = import ./hosts/orchid inputs;
      };

      nixosModules = import ./modules;

      lib = import ./lib { inherit (nixpkgs) lib; };

    } // (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        legacyPackages = import ./pkgs { inherit pkgs; };
        packages = flake-utils.lib.flattenTree self.legacyPackages.${system};
      })
    );
}
