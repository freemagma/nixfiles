{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }@inputs:
    let mylib = import ./lib { inherit (nixpkgs) lib; };
    in {
      nixosConfigurations.jane = import ./jane (inputs // { inherit mylib; });
      nixosConfigurations.orchid = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./orchid
          home-manager.nixosModules.home-manager
          mylib.flakes.useFlakes
          (mylib.flakes.pinFlakes { inherit nixpkgs home-manager; })
        ];
      };

    };
}
