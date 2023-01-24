{ self, home-manager, ... }:

self.lib.makeSystem {
  system = "x86_64-linux";

  machine = {
    netInterface = "enp6s0";
    hasBattery = false;
  };

  modules = [
    home-manager.nixosModules.home-manager

    ./configuration.nix
    ./hardware-configuration.nix

  ] ++ (with self.nixosModules; [
    base
    nvidia
    desktop.i3

    overlays.conda
    overlays.catppuccin-gtk-macchiato-pink

    users.cgunn
  ]);
}
