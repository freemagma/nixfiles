{ self, ... }:
with self.homeModules;

{
  cgunn = self.lib.makeUser {
    username = "cgunn";
    privileged = true;

    style.color = style.gruvbox-dark;
    modules = [
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

  guest = self.lib.makeUser {
    username = "guest";
    privileged = false;

    style.color = style.gruvbox-dark;
    modules = [
      kitty
      shell
      xserver
      userdirs
      scripts
      neovim
    ];
  };
}
