{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let mylib = import ./lib { inherit (nixpkgs) lib; };
    in {
      nixosConfigurations.jane = import ./jane (inputs // { inherit mylib; });
      nixosConfigurations.orchid =
        import ./orchid (inputs // { inherit mylib; });
    };
}
