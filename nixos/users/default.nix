{ self, system, machine, inputs, ... }:

{
  cgunn = self.lib.makeUser {
    username = "cgunn";

    inherit self system machine inputs;
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
  };
}
