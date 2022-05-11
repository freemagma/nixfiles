{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let mylib = import ./lib { inherit (nixpkgs) lib; };
    in {
      nixosConfigurations.jane = import ./hosts/jane (inputs // { inherit mylib; });
      nixosConfigurations.orchid =
        import ./hosts/orchid (inputs // { inherit mylib; });
    };
}
