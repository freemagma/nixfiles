{ self, nixpkgs, home-manager, ... }@inputs:

nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";
  modules =
    let
      args = {
        inherit inputs system self;
        # machine.netInterface = "enp6s0";
        machine.netInterface = "wlan0";
        machine.hasBattery = false;
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
      nvidia
      desktop.xserver

      cgunn.base
      cgunn.home
    ]);
}
