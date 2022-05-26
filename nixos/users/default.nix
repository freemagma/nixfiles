{ self, ... }:

{
  cgunn = { system, machine, ... }:
    self.lib.makeUser {
      inherit system machine;

      username = "cgunn";
      privileged = true;

      style = self.homeModules.style;
      modules = with self.homeModules; [
        pkglist
        neofetch
        kitty
        shell
        xserver
        userdirs
        scripts
        neovim
        chess
      ];
    };

  guest = { system, machine, ... }:
    self.lib.makeUser {
      inherit system machine;

      username = "guest";
      privileged = false;

      style = self.homeModules.style;
      modules = with self.homeModules; [
        kitty
        shell
        xserver
        userdirs
        scripts
        neovim
      ];
    };
}
