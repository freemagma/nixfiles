{ self, nixpkgs, home-manager, ... }@inputs:

self.lib.makeSystem rec {
  inherit self nixpkgs;

  system = "x86_64-linux";
  args = {
    inherit self system inputs;
    # machine.netInterface = "enp6s0";
    machine.netInterface = "wlan0";
    machine.hasBattery = false;
  };
  modules =
    [
      home-manager.nixosModules.home-manager

      ./configuration.nix
      ./hardware-configuration.nix

    ] ++ (with self.nixosModules;
    [
      base
      nvidia
      desktop.xserver

      users.cgunn
    ]);
}
