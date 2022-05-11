{ self, system, machine, inputs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.cgunn = {

    _module.args = {
      inherit self system machine inputs;
      style = import ./style;
    };
    imports = [
      ./pkglist
      ./neofetch
      ./kitty
      ./shell
      ./xserver
      ./userdirs
      ./scripts
      ./doom-emacs
      ./neovim
      ./chess
    ];

  };
}
