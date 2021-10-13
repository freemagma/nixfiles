{ self, nixpkgs, home-manager, mylib, ... }@inputs:

nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";
  modules = let
    args = {
      inherit inputs;
      machine.netInterface = "enp6s0";
      machine.hasBattery = false;
      custom.pkgs = import ../pkgs { pkgs = nixpkgs.legacyPackages.${system}; };
    };
    mainModule = import ./configuration.nix;
    addOverlays = {
      nixpkgs.overlays = [
        (final: prev: {
          mgba = prev.mgba.overrideAttrs (old: rec {
            version = "0.8.4";
            src = prev.fetchFromGitHub {
              owner = "mgba-emu";
              repo = "mgba";
              rev = version;
              sha256 = "0nqj4bnn5c2z1bq4bnbw1wznc0wpmq4sy3w8pipd6n6620b9m4qq";
            };
          });
        })
      ];
    };
  in [
    (mylib.flakes.passArgs args)
    mainModule
    home-manager.nixosModules.home-manager
    mylib.flakes.useFlakes
    addOverlays
    (mylib.flakes.pinFlakes { inherit nixpkgs home-manager; })
  ];
}
