{ self, nixpkgs, home-manager, ... }@inputs:

self.lib.makeSystem rec {
  inherit self nixpkgs;

  system = "x86_64-linux";
  args = {
    inherit self system inputs;
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

      (
        self.lib.makeUser {
          username = "cgunn";

          inherit self system inputs;
          machine = args.machine;
          modules = with self.homeModules; [
            pkglist
            neofetch
            kitty
            shell
            xserver
            userdirs
            scripts
            doom-emacs
            neovim
            chess
          ];
        }
      )

      # (
      #   { self, system, machine, inputs, ... }:
      #
      #   self.lib.makeUser {
      #     username = "cgunn";
      #
      #     inherit self system machine inputs;
      #     modules = with self.homeModules; [
      #       pkglist
      #       neofetch
      #       kitty
      #       shell
      #       xserver
      #       userdirs
      #       scripts
      #       doom-emacs
      #       neovim
      #       chess
      #     ];
      #   }
      # )

    ]);
}
