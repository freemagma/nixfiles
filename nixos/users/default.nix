{ self, ... }:

{
  cgunn = { system, machine, ... }:
    self.lib.makeUser {
      inherit system machine;

      username = "cgunn";

      style = self.homeModules.style;
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
