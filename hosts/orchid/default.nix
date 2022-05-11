{ self, nixpkgs, home-manager, ... }@inputs:

nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";
  modules =
    let
      args = {
        inherit inputs system self;
        machine.netInterface = "wlan0";
        machine.hasBattery = true;
      };
    in
    [
      (self.lib.flakes.passArgs args)
      (self.lib.flakes.pinFlakes { inherit nixpkgs home-manager; })
      self.lib.flakes.useFlakes
      home-manager.nixosModules.home-manager

      ./configuration.nix
      ./hardware-configuration.nix

    ] ++ (with self.nixosModules;
    [
      base
      desktop.xserver

      cgunn.base
      cgunn.home
    ]);
}
