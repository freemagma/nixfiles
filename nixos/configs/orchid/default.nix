{ self, home-manager, ... }:

self.lib.makeSystem {
  system = "x86_64-linux";

  machine = {
    netInterface = "wlan0";
    hasBattery = true;
  };

  modules = [
    home-manager.nixosModules.home-manager

    ./configuration.nix
    ./hardware-configuration.nix

  ] ++ (with self.nixosModules; [
    base
    desktop.i3

    overlays.catppuccin-gtk-macchiato-pink

    users.cgunn
  ]);
}
