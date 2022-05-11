{ self, nixpkgs, home-manager, mylib, ... }@inputs:

nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";
  modules =
    let
      args = {
        inherit inputs;
        # machine.netInterface = "enp6s0";
        machine.netInterface = "wlp4s0";
        machine.hasBattery = false;
        custom.pkgs = import ../pkgs { pkgs = nixpkgs.legacyPackages.${system}; };
      };
      mainModule = import ./configuration.nix;
      addOverlays = {
        nixpkgs.overlays = [ ];
      };
    in
    [
      (mylib.flakes.passArgs args)
      mainModule
      home-manager.nixosModules.home-manager
      mylib.flakes.useFlakes
      addOverlays
      (mylib.flakes.pinFlakes { inherit nixpkgs home-manager; })
    ];
}
