{ self, nixpkgs, home-manager, ... }@inputs:

self.lib.makeSystem rec {
  inherit self nixpkgs;

  system = "x86_64-linux";
  args = {
    inherit self system inputs;
    machine.netInterface = "wlan0";
    machine.hasBattery = true;
  };
  modules =
    [
      home-manager.nixosModules.home-manager

      ./configuration.nix
      ./hardware-configuration.nix

    ] ++ (with self.nixosModules;
    [
      base
      desktop.xserver

      users.cgunn.base
      users.cgunn.home
    ]);
}
