{ self, nixpkgs, home-manager, mylib, ... }@inputs:

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = let
    passArgs = {
      config._module.args = {
        machine.netInterface = "enp6s0";
        machine.hasBattery = false;
        custom.pkgs = import ../pkgs { inherit (nixpkgs) pkgs; };
      };
    };
    mainModule = import ./configuration.nix { };
  in [
    passArgs
    mainModule
    home-manager.nixosModules.home-manager
    mylib.flakes.useFlakes
    (mylib.flakes.pinFlakes { inherit nixpkgs home-manager; })
  ];
}
