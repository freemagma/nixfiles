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
        jane = import ./nixos/configs/jane inputs;
        orchid = import ./nixos/configs/orchid inputs;
      };

      nixosModules = import ./nixos/modules inputs;
      homeModules = import ./home/modules inputs;

      lib = import ./lib inputs;

    } // (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        legacyPackages = import ./pkgs { inherit pkgs; };
        packages = flake-utils.lib.flattenTree self.legacyPackages.${system};
      })
    );
}
