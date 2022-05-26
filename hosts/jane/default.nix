{ self, home-manager, ... }:

self.lib.makeSystem {
  system = "x86_64-linux";

  machine = {
    netInterface = "wlan0";
    hasBattery = false;
  };

  modules = [
    home-manager.nixosModules.home-manager

    ./configuration.nix
    ./hardware-configuration.nix

  ] ++ (with self.nixosModules; [
    base
    nvidia
    desktop.xserver

    users.cgunn
    users.guest

  ]);
}
